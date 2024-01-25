<div id="modalFile" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title">Subir o crear carpeta</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <div class="d-grid">
                    <button type="button" id="btnNuevaCarpeta" class="btn btn-outline-primary m-r-xs"><i class="material-icons">folder</i>Nueva Carpeta</button>
                    <hr>
                    <input type="file" id="file" class="d-none" name="file">
                    <button type="button" id="btnSubirArchivo" class="btn btn-outline-success m-r-xs"><i class="material-icons">folder_zip</i>Subir Archivo</button>
                </div>

            </div>
        </div>
    </div>
</div>

<div id="modalCarpeta" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title-carpeta">Nueva carpeta</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <form id="frmCarpeta" autocomplete="off">
                <div class="modal-body">
                    <div class="input-group">
                        <span class="input-group-text">
                            <i class="material-icons">folder</i>
                        </span>
                        <input class="form-control" type="text" name="nombre" id="nombre" placeholder="Nombre">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="submit">Crear</button>
                </div>

            </form>
        </div>
    </div>
</div>

<div id="modalCompartir" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title-compartir"></h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" id="id_carpeta">
                <div class="d-grid">
                    <a href="#" id="btnVer" class="btn btn-outline-info m-r-xs"><i class="material-icons">folder_zip</i>Ver</a>
                    <hr>
                    <button type="button" id="btnSubir" class="btn btn-outline-primary m-r-xs"><i class="material-icons">folder_zip</i>Subir Archivo</button>
                    <hr>
                    <button type="button" id="btnCompartir" class="btn btn-outline-success m-r-xs"><i class="material-icons">share</i>Compartir</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="modalUsuarios" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="my-modal-title" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title-usuarios">Agregar Usuarios</h5>
                <button class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                </button>
            </div>
            <form id="frmCompartir">
                <div class="modal-body">
                    <input type="hidden" id="id_archivo" name="id_archivo">
                    <select class="js-states form-control" id="usuarios" name="usuarios[]" tabindex="-1" multiple="multiple" style="display: none; width: 100%">
                    </select>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-danger" type="button" data-bs-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" type="submit">Compartir</button>
                </div>
            </form>
        </div>
    </div>
</div>