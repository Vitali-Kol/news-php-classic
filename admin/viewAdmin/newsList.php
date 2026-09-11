<?php ob_start() ?>

<h2>News List </h2>

<div class="container" style="min-height:400px; width: 100%;">
    <div style="margin:20px 0;">
        <a class="btn btn-primary" href="newsAdd" role="button">Добавить новость</a>
    </div>
    <div class="col-md-11" style="padding-left:0; width: 100%;">
        <table class='table table-bordered table-responsive'>
            <tr>
                <th width="10%">ID</th>
                <th width="70%">Header News</th>
                <th width="20%"></th>
            </tr>
            <?php
            if (isset($arr) && is_array($arr)) {
                foreach ($arr as $row) {
                    echo '<tr>';
                    echo '<td>'.$row['id'].'</td>';
                    echo '<td><b>Title:</b> '.$row['title'].'<br>';
                    echo '<b>Категория: </b><i>'.$row['name'].'</i>; ';
                    echo '<br><b>Author: </b><i>'.$row['username'].'</i>';
                    echo '</td>';
                    echo '<td>
                    <a href="newsEdit?id='.$row['id'].'" class="text-primary">Edit <i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> &nbsp;
                    <a href="newsDel?id='.$row['id'].'" class="text-danger">Delete <i class="fa fa-times" aria-hidden="true"></i></a>
                    </td>';
                    echo '</tr>';
                }
            }
            ?>
        </table>
    </div>
</div>
<?php $content = ob_get_clean(); ?>

<?php include "viewAdmin/templates/layout.php"; ?>
