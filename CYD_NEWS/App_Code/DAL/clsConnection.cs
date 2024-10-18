using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public class clsConnection
{
    public clsConnection()
    {

    }

    private SqlCommand cmd = new SqlCommand();
    private SqlConnection sqlCn;

    public SqlConnection getConnection()
    {
        string strcn = clsEncryption.myDescrypt(ConfigurationManager.AppSettings["conString"]);
        //string strcn = "data source=.;initial catalog=CYD_NEWS_DB;integrated security=True;";
        try
        {
            sqlCn = new SqlConnection(strcn);
            if (sqlCn.State == ConnectionState.Closed)
            {
                sqlCn.Open();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return sqlCn;
    }

    protected void closeConnection()
    {
        if (sqlCn.State != ConnectionState.Closed)
        {
            sqlCn.Close();
        }
        cmd.Dispose();
    }

    public DataTable getDataTable(string strSql, CommandType cmdType = CommandType.StoredProcedure)
    {
        DataTable dt = new DataTable();
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return dt;
    }

    public DataTable getDataTable(string strSql, SqlParameter[] par, CommandType cmdType = CommandType.StoredProcedure)
    {
        DataTable dt = new DataTable();
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.Parameters.Clear();
            cmd.Parameters.AddRange(par);
            cmd.CommandType = cmdType;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return dt;
    }

    public DataSet getDataSet(string strSql, CommandType cmdType = CommandType.StoredProcedure)
    {
        DataSet ds = new DataSet();
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return ds;
    }

    public DataSet getDataSet(string strSql, SqlParameter[] par, CommandType cmdType = CommandType.StoredProcedure)
    {
        DataSet ds = new DataSet();
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.Parameters.Clear();
            cmd.Parameters.AddRange(par);
            cmd.CommandType = cmdType;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(ds);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return ds;
    }

    public int excuteNonQuery(string strSql, CommandType cmdType = CommandType.StoredProcedure)
    {
        int result = 0;
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            result = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return result;
    }

    public int excuteNonQuery(string strSql, SqlParameter[] par, CommandType cmdType = CommandType.StoredProcedure)
    {
        int result = 0;
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            cmd.Parameters.Clear();
            cmd.Parameters.AddRange(par);
            result = cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return result;
    }

    public SqlDataReader getDataReader(string strSql, CommandType cmdType = CommandType.StoredProcedure)
    {
        SqlDataReader reader = null;
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cmd.Dispose();
        }
        return reader;
    }

    public SqlDataReader getDataReader(string strSql, SqlParameter[] sqlPar, CommandType cmdType = CommandType.StoredProcedure)
    {
        SqlDataReader reader = null;
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            cmd.Parameters.Clear();
            cmd.Parameters.AddRange(sqlPar);
            reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            cmd.Dispose();
        }
        return reader;
    }

    public object excuteScalar(string strSql, CommandType cmdType = CommandType.StoredProcedure)
    {
        object ob = null;
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            ob = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return ob;
    }

    public object excuteScalar(string strSql, SqlParameter[] par, CommandType cmdType = CommandType.StoredProcedure)
    {
        object ob = null;
        try
        {
            sqlCn = getConnection();
            cmd.Connection = sqlCn;
            cmd.CommandText = strSql;
            cmd.CommandType = cmdType;
            cmd.Parameters.Clear();
            cmd.Parameters.AddRange(par);
            ob = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return ob;
    }

    public int updateTable(string strSql, DataTable tableInput)
    {
        int result = 0;
        try
        {
            sqlCn = getConnection();
            SqlDataAdapter da = new SqlDataAdapter(strSql, sqlCn);
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            result = da.Update(tableInput);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return result;
    }

    public int updateTable_Tran(string strSql, DataTable tableInput)
    {
        int result = 0;
        try
        {
            sqlCn = getConnection();
            SqlTransaction tran = sqlCn.BeginTransaction();
            SqlDataAdapter da = new SqlDataAdapter(new SqlCommand(strSql, sqlCn, tran));
            SqlCommandBuilder builder = new SqlCommandBuilder(da);
            da.InsertCommand = builder.GetInsertCommand();
            da.UpdateCommand = builder.GetUpdateCommand();
            da.DeleteCommand = builder.GetDeleteCommand();
            da.InsertCommand.Transaction = tran;
            da.UpdateCommand.Transaction = tran;
            da.DeleteCommand.Transaction = tran;
            try
            {
                result = da.Update(tableInput);
                tran.Commit();
            }
            catch (Exception)
            {
                tran.Rollback();
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            closeConnection();
        }
        return result;
    }
}