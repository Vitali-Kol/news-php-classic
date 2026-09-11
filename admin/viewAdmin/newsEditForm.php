<?php ob_start(); ?>

<div class="container" style="min-height:400px; width: 100%;">
<div class="col-md-11" style="padding-left:0; width: 100%;">

    <h2>News Edit </h2>
    <?php
    if (isset($test)) {
        if ($test == true) {
            ?>
            <div class="alert alert-info">
                <strong>Запись изменена. </strong><a href="newsAdmin">Список новостей</a>
            </div>
            <?php
        }
        else if ($test == false) {
            ?>
            <div class="alert alert-warning">
                <strong>Ошибка изменения записи!</strong> <a href="newsAdmin">Список новостей</a>
            </div>
            <?php
        }
    }
    else {
        ?>
        <form method='POST' action="newsEditResult?id=<?php echo $id; ?>" enctype="multipart/form-data">
            <table class='table table-bordered'>
                <tr>
                    <td style="width:20%; font-weight:bold;">News title</td>
                    <td><input type='text' name='title' class='form-control' required value="<?php echo htmlspecialchars($detail['title']); ?>"></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;">News text</td>
                    <td><textarea rows="5" name="text" class='form-control' required><?php echo htmlspecialchars($detail['text']); ?></textarea></td>
                </tr>
                <tr>
                    <td style="font-weight:bold;">Category</td>
                    <td>
                        <select name="idCategory" class="form-control">
                            <?php
                            if (isset($arr) && is_array($arr)) {
                                foreach ($arr as $row) {
                                    echo '<option value="'.$row['id'].'"';
                                    if ($row['id'] == $detail['category_id']) echo ' selected';
                                    echo '>'.$row['name'].'</option>';
                                }
                            }
                            ?>
                        </select>
                    </td>
                </tr>
                <!-- image -->
                <tr>
                    <td style="font-weight:bold;">OldPicture</td>
                    <td>
                        <div>
                            <?php
                            if (!empty($detail['picture'])) {
                                echo '<img src="data:image/jpeg;base64,'.base64_encode($detail['picture']).'" width=150 /><br>';
                            }
                            ?>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight:bold;">Picture</td>
                    <td>
                        <div>
                            <input type="file" name="picture" style="color:black;">
                        </div>
                    </td>
                </tr>
                <!-- end image -->
                <tr>
                    <td colspan="2">
                        <button type="submit" class="btn btn-primary" name="save">
                            <i class="fa fa-pencil"></i> Изменить
                        </button>
                        <a href="newsAdmin" class="btn btn-success">
                            <i class="fa fa-arrow-left"></i> &nbsp;Назад к списку
                        </a>
                    </td>
                </tr>
            </table>
        </form>
        <?php
    }
    ?>
</div>
</div>
<?php $content = ob_get_clean(); ?>
<?php include "viewAdmin/templates/layout.php"; ?>
