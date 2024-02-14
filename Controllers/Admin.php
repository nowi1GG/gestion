<?php
class Admin extends Controller
{
    private $id_usuario, $correo;
    public function __construct()
    {
        parent::__construct();
        session_start();
        $this->id_usuario = $_SESSION['id'];
        $this->correo = $_SESSION['correo'];
    }
    public function index()
    {
        $data['title'] = 'Panel de administracion';
        $data['script'] = 'files.js';
        $data['active'] = 'recent';
        $data['menu'] = 'admin';
        $carpetas = $this->model->getCarpetas($this->id_usuario);
        $data['archivos'] = $this->model->getArchivosRecientes($this->id_usuario);
        for ($i = 0; $i < count($carpetas); $i++) {
            $carpetas[$i]['color'] = substr(md5($carpetas[$i]['id']), 0, 6);
            $carpetas[$i]['fecha'] = time_ago(strtotime($carpetas[$i]['fecha_create']));
        }
        $data['carpetas'] = $carpetas;
        $data ['shares']= $this->model->verificarEstado($this->correo);
        $this->views->getView('admin', 'home', $data);
    }
    public function crearcarpeta()
    {
        $nombre = $_POST['nombre'];
        if (empty($nombre)) {
            $res = array('tipo' => 'warning', 'mensaje' => 'EL NOMBRE ES REQUERIDO');
        } else {
            ### COMPROBAR NOMBRE
            $verificarNombre = $this->model->getVerificar('nombre', $nombre, $this->id_usuario, 0);
            if (empty($verificarNombre)) {

                $data = $this->model->crearcarpeta($nombre, $this->id_usuario);
                if ($data > 0) {
                    $res = array('tipo' => 'success', 'mensaje' => 'CARPETA CREADA');
                } else {
                    $res = array('tipo' => 'error', 'mensaje' => 'ERROR AL CARPETA');
                }
            } else {
                $res = array('tipo' => 'warning', 'mensaje' => 'LA CARPETA YA EXISTE');
            }
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function subirarchivo()
    {
        $id_carpeta = (empty($_POST['id_carpeta'])) ? 1 : $_POST['id_carpeta'];
        $archivo = $_FILES['file'];
        $name = $archivo['name'];
        $tmp = $archivo['tmp_name'];
        $tipo = $archivo['type'];
        $data = $this->model->subirArchivo($name, $tipo, $id_carpeta, $this->id_usuario);
        // $data['archivos'] = $this->model->getArchivos($this->id_usuario);
        // for ($i = 0; $i < count($data['archivos']); $i++) {
        //     $data['archivos'][$i]['fecha'] = $this->time_ago(strtotime($data['archivos'][$i]['fecha_create']));
        // }

        if ($data > 0) {
            $destino = 'Assets/archivos';
            if (!file_exists($destino)) {
                mkdir($destino);
            }
            $carpeta = $destino . '/' . $id_carpeta;
            if (!file_exists($carpeta)) {
                mkdir($carpeta);
            }
            move_uploaded_file($tmp, $carpeta . '/' . $name);
            $res = array('tipo' => 'success', 'mensaje' => 'ARCHIVO SUBIDO');
        } else {
            $res = array('tipo' => 'error', 'mensaje' => 'ERROR AL SUBIR ARCHIVO');
        }
        echo json_encode($res, JSON_UNESCAPED_UNICODE);
        die();
    }

    public function ver($id_carpeta)
    {
        $data['title'] = 'Listado de archivos';
        $data['active'] = 'detail';
        $data['archivos'] = $this->model->getArchivos($id_carpeta, $this->id_usuario);
        $data['menu'] = 'admin';
        $data ['shares']= $this->model->verificarEstado($this->correo);
        $this->views->getView('admin', 'archivos', $data);
    }

    public function verdetalle($id_carpeta)
    {
        $data['title'] = 'Archivos compartidos';
        $data['id_carpeta'] = $id_carpeta;
        $data['script'] = 'details.js';
        $data['carpeta'] = $this->model->getCarpeta($id_carpeta);
        if (empty($data['carpeta'])) {
            echo 'PAGINA NO ENCONTRADA';
            exit;
        }
        $data['menu'] = 'admin';
        $data ['shares']= $this->model->verificarEstado($this->correo);
        $this->views->getView('admin', 'detalle', $data);
    }

    public function listardetalle($id_carpeta)
    {
        $data = $this->model->getArchivosCompartidos($id_carpeta);
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]['estado'] == 0) {
                $data[$i]['estado'] = '<span class="badge bg-warning">Se elimina ' . $data[$i]['elimina'] . '</span>';
                $data[$i]['acciones'] = '';
            } else {
                $data[$i]['estado'] = '<span class="badge bg-success">Compartido</span>';
                $data[$i]['acciones'] = '<button class="btn btn-danger btn-sm" onclick="eliminarDetalle(' .
                $data[$i]['id'] . ')">Eliminar</button>';
            }
        }
        echo json_encode($data, JSON_UNESCAPED_UNICODE);
        die();
    }
}
