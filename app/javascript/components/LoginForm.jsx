import React from 'react';
import FormGroup from '@mui/material/FormGroup';
import Input from '@mui/material/Input';
import FormLabel from '@mui/material/FormLabel';
import Box from "@mui/material/Box";
import Button from "@mui/material/Button";
import { createStyles, makeStyles } from '@mui/styles';
import axios from 'axios';
import { routes } from '../domains/authentication/routes';

const useStyles = makeStyles(() => 
  createStyles({
    formContainer: {
      maxWidth: "50%"
    },
    button: {
      height: "100px",
    }
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
  const csrf = document.querySelector("meta[name='csrf-token']").getAttribute("content");

  function handleSubmit() {
    axios({
      method: 'post',
      url: '/accounts/sign_in',
      data: {
        // account: {
        //   email: 'abcdetaaaasdfest@email.com',
        //   password: 'S3cur3asfhkjl!',
        //   password_confirmation: "S3cur3asfhkjl!"
        // },
        account: {
          // signIn: {
            email: "abcdetasdfest@email.com",
            password: "S3cur3asfhkjl!"
          // }
        }
      },
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrf
      },
    }).then(res => {
      console.log(res);
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
          <Button className={classes.button} onClick={() => handleSubmit()}/>
        </FormGroup>
      </Box>
    </>
  )
}