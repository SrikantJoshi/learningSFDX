public virtual class MyException extends Exception
{

    public MyException(Integer brightreeId )
    {
        this('Invoice with brightreeId:'+ brightreeId +' not found');
    }
}