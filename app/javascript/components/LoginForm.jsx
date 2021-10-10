import React from 'react';
import FormGroup from '@mui/material/FormGroup';
import Input from '@mui/material/Input';
import FormLabel from '@mui/material/FormLabel';
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import { createStyles, makeStyles } from '@mui/styles';
import axios from 'axios';

const useStyles = makeStyles(() => 
  createStyles({
    formContainer: {
      maxWidth: "50%"
    },
  })
)

//   const useStyles = makeStyles((theme: Theme) =>
//   createStyles({
//     root: {
//       backgroundColor: theme.palette.red,
//     },
//   }),
// );



export function LoginForm() {

  function handleSubmit() {
    axios({
      method: 'post',
      url: '/accounts',
      data: {
        email: 'test@email.com',
        password: 'S3cur3!'
      }
    });
  }
  const classes = useStyles();
  return (
    <>
      <Box className={classes.formContainer}>
        <FormGroup>
          <FormLabel>Username</FormLabel>
          <Input/>
          <FormLabel>Email</FormLabel>
          <Input/>
          <Button onClick={() => handleSubmit()}/>
        </FormGroup>
      </Box>
    </>
  )
}