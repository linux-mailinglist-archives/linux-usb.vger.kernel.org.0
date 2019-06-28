Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C96959634
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 10:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfF1Ief (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 04:34:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51918 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfF1Ief (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 04:34:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so8203127wma.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2019 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/s3L7c/xEr7UaGOR01xuFcIrckpVPmvl8Lfa0GRVWIE=;
        b=Sc+x+4HeZHyKsj1vdB8o6LF7i8GUuKrJIimrw/nMVDGbjlLt/WlaayWENGwQnpS9nV
         bURGY49wip42qjCzu+gdSC4RkvDj0Q4vT6KAlN5Ezq3aeuIyhRjOpKprmvE9OIPDMLIA
         i83Z+M/aU3hy+semKgmygqpKIfFvVBXdavywCnCt1JMW+MoguXF9MKe+xqiAwdmXewXB
         QWOWfxYi9b1PqLmhyehuX4bpIZ+AZt+xRI8gbAyBA8uR794sxOQh/VpBbQsTUXZYRlfC
         bZLTzx12tt67o3fay8R172IAB5PP4Du79efLDjcgYL7GxkQXGF93uAsVNI5Taj1/x/1t
         22FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/s3L7c/xEr7UaGOR01xuFcIrckpVPmvl8Lfa0GRVWIE=;
        b=EuwPw7LDwihc/rvqtyvTDfFjqXBcu7TkT+ee/F5qvxL1oeioBtB7H7cxQyQ0K/zUv0
         i1MaJnEgfUqLs5KDr8MMRNXzXvvFgKxo1w8uN4Scv4v9uM9yiQc57N8YtGMwvay/q4KC
         csVYBT6kAHvZX/zL3PHQFXQVq41RIJdop5WLep+3uTiF8xpb8GTWnnkwEl4lz2KLZfph
         g74AKPGJUWqfJiEfwRpfgzngJDL/fyzlCfuJYcOm9EuDkZOKgMaFnVQgMVrXZt3G+dCc
         swWVc65+A/4nNg58VuMfAOmQ1VXGYGLpXlFZ+rC/W/yXUQedTN/ogsalktXIrUC8IIaK
         Fb3g==
X-Gm-Message-State: APjAAAWkMpPTMTiYZ/JIHjK4qOMpa/QebcIMKBZWV0BH105pl2GWvCCR
        zPZpJqeff/imMP7UhQKS4mp2zZyWduqblH3hqvo=
X-Google-Smtp-Source: APXvYqybGgoe7rsew9fUu4S8ga0uvUBtxB0P8jtPTbuH8oqc/QLwThT/vnXZyw+Yzqg8U/C/juw6vUkq16YnFU2bcAg=
X-Received: by 2002:a1c:c305:: with SMTP id t5mr6165050wmf.163.1561710871698;
 Fri, 28 Jun 2019 01:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190613134544.6404-1-charlesyeh522@gmail.com>
In-Reply-To: <20190613134544.6404-1-charlesyeh522@gmail.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Fri, 28 Jun 2019 16:34:17 +0800
Message-ID: <CAAZvQQ7Znh5eTbESRFBPbA-q6_g6dLT4wT=Cfx+pipf0scXeOQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v5] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Greg KH <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc:     =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Is there any need to modify it?
If there is no need to modify, how long does it take to complete REVIEW?

Charles Yeh

Charles Yeh <charlesyeh522@gmail.com> =E6=96=BC 2019=E5=B9=B46=E6=9C=8813=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=889:46=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Prolific has developed a new USB to UART chip: PL2303HXN
> PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> the existing PL2303 series (TYPE_HX & TYPE_01).
> Therefore, different Vendor requests are used to issue related commands.
>
> 1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
>    new Vendor request,new flow control and other related instructions
>    if TYPE_HXN is recognized.
>
> 2. Because the new PL2303HXN only accept the new Vendor request,
>    the old Vendor request cannot be accepted (the error message
>    will be returned)
>    So first determine the TYPE_HX or TYPE_HXN through
>    PL2303_READ_TYPE_HX_STATUS in pl2303_startup.
>
>   2.1 If the return message is "1", then the PL2303 is the existing
>       TYPE_HX/ TYPE_01 series.
>       The other settings in pl2303_startup are to continue execution.
>   2.2 If the return message is "not 1", then the PL2303 is the new
>       TYPE_HXN series.
>       The other settings in pl2303_startup are ignored.
>       (PL2303HXN will directly use the default value in the hardware,
>        no need to add additional settings through the software)
>
> 3. In pl2303_open: Because TYPE_HXN is different from the instruction of =
reset
>    down/up stream used by TYPE_HX.
>    Therefore, we will also execute different instructions here.
>
> 4. In pl2303_set_termios: The UART flow control instructions used by
>    TYPE_HXN/TYPE_HX/TYPE_01 are different.
>    Therefore, we will also execute different instructions here.
>
> 5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is differe=
nt
>    from the vendor request instruction used by TYPE_HX/TYPE_01,
>    it will also execute different instructions here.
>
> 6. In pl2303_update_reg: TYPE_HXN used different register for flow contro=
l.
>    Therefore, we will also execute different instructions here.
>
> Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> ---
> changelog:
> v5:
> 1. Modify pl2303_update_reg
> 2. Add a patch version on subject
> 3. Add a space after each colon at subject line
> ---
>  drivers/usb/serial/pl2303.c | 113 +++++++++++++++++++++++++++++-------
>  drivers/usb/serial/pl2303.h |   7 ++-
>  2 files changed, 97 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index 55122ac84518..22ad82aa3894 100644
> --- a/drivers/usb/serial/pl2303.c
> +++ b/drivers/usb/serial/pl2303.c
> @@ -47,6 +47,12 @@ static const struct usb_device_id id_table[] =3D {
>         { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_MOTOROLA) },
>         { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_ZTEK) },
>         { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_TB) },
> +       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GC) },
> +       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GB) },
> +       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GT) },
> +       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
> +       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
> +       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
>         { USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
>         { USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
>         { USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
> @@ -129,9 +135,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
>
>  #define VENDOR_WRITE_REQUEST_TYPE      0x40
>  #define VENDOR_WRITE_REQUEST           0x01
> +#define VENDOR_WRITE_NREQUEST          0x80
>
>  #define VENDOR_READ_REQUEST_TYPE       0xc0
>  #define VENDOR_READ_REQUEST            0x01
> +#define VENDOR_READ_NREQUEST           0x81
>
>  #define UART_STATE_INDEX               8
>  #define UART_STATE_MSR_MASK            0x8b
> @@ -146,12 +154,20 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define UART_CTS                       0x80
>
>  #define PL2303_FLOWCTRL_MASK           0xf0
> +#define PL2303_HXN_FLOWCTRL_MASK       0x1C
> +#define PL2303_READ_TYPE_HX_STATUS     0x8080
> +#define PL2303_HXN_FLOWCTRL            0x0A
> +#define PL2303_HXN_CTRL_RTS_CTS                0x18
> +#define PL2303_HXN_CTRL_XON_XOFF       0x0C
> +#define PL2303_HXN_CTRL_NONE           0x1C
> +#define PL2303_HXN_RESET_DOWN_UPSTREAM 0x07
>
>  static void pl2303_set_break(struct usb_serial_port *port, bool enable);
>
>  enum pl2303_type {
>         TYPE_01,        /* Type 0 and 1 (difference unknown) */
>         TYPE_HX,        /* HX version of the pl2303 chip */
> +       TYPE_HXN,       /* HXN version of the pl2303 chip */
>         TYPE_COUNT
>  };
>
> @@ -183,16 +199,26 @@ static const struct pl2303_type_data pl2303_type_da=
ta[TYPE_COUNT] =3D {
>         [TYPE_HX] =3D {
>                 .max_baud_rate          =3D 12000000,
>         },
> +       [TYPE_HXN] =3D {
> +               .max_baud_rate          =3D 12000000,
> +       },
>  };
>
>  static int pl2303_vendor_read(struct usb_serial *serial, u16 value,
>                                                         unsigned char buf=
[1])
>  {
>         struct device *dev =3D &serial->interface->dev;
> +       struct pl2303_serial_private *spriv =3D usb_get_serial_data(seria=
l);
>         int res;
> +       u8 request;
> +
> +       if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> +               request =3D VENDOR_READ_NREQUEST;
> +       else
> +               request =3D VENDOR_READ_REQUEST;
>
>         res =3D usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev,=
 0),
> -                       VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> +                       request, VENDOR_READ_REQUEST_TYPE,
>                         value, 0, buf, 1, 100);
>         if (res !=3D 1) {
>                 dev_err(dev, "%s - failed to read [%04x]: %d\n", __func__=
,
> @@ -211,12 +237,19 @@ static int pl2303_vendor_read(struct usb_serial *se=
rial, u16 value,
>  static int pl2303_vendor_write(struct usb_serial *serial, u16 value, u16=
 index)
>  {
>         struct device *dev =3D &serial->interface->dev;
> +       struct pl2303_serial_private *spriv =3D usb_get_serial_data(seria=
l);
>         int res;
> +       u8 request;
>
>         dev_dbg(dev, "%s - [%04x] =3D %02x\n", __func__, value, index);
>
> +       if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> +               request =3D VENDOR_WRITE_NREQUEST;
> +       else
> +               request =3D VENDOR_WRITE_REQUEST;
> +
>         res =3D usb_control_msg(serial->dev, usb_sndctrlpipe(serial->dev,=
 0),
> -                       VENDOR_WRITE_REQUEST, VENDOR_WRITE_REQUEST_TYPE,
> +                       request, VENDOR_WRITE_REQUEST_TYPE,
>                         value, index, NULL, 0, 100);
>         if (res) {
>                 dev_err(dev, "%s - failed to write [%04x]: %d\n", __func_=
_,
> @@ -231,12 +264,17 @@ static int pl2303_update_reg(struct usb_serial *ser=
ial, u8 reg, u8 mask, u8 val)
>  {
>         int ret =3D 0;
>         u8 *buf;
> +       struct pl2303_serial_private *spriv =3D usb_get_serial_data(seria=
l);
>
>         buf =3D kmalloc(1, GFP_KERNEL);
>         if (!buf)
>                 return -ENOMEM;
>
> -       ret =3D pl2303_vendor_read(serial, reg | 0x80, buf);
> +       if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN])
> +               ret =3D pl2303_vendor_read(serial, reg, buf);
> +       else
> +               ret =3D pl2303_vendor_read(serial, reg | 0x80, buf);
> +
>         if (ret)
>                 goto out_free;
>
> @@ -319,6 +357,7 @@ static int pl2303_startup(struct usb_serial *serial)
>         struct pl2303_serial_private *spriv;
>         enum pl2303_type type =3D TYPE_01;
>         unsigned char *buf;
> +       int res;
>
>         spriv =3D kzalloc(sizeof(*spriv), GFP_KERNEL);
>         if (!spriv)
> @@ -340,26 +379,37 @@ static int pl2303_startup(struct usb_serial *serial=
)
>                 type =3D TYPE_01;         /* type 1 */
>         dev_dbg(&serial->interface->dev, "device type: %d\n", type);
>
> +       if (type =3D=3D TYPE_HX) {
> +               res =3D usb_control_msg(serial->dev,
> +                       usb_rcvctrlpipe(serial->dev, 0),
> +                       VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_TYPE,
> +                       PL2303_READ_TYPE_HX_STATUS, 0, buf, 1, 100);
> +               if (res !=3D 1)
> +                       type =3D TYPE_HXN;
> +       }
> +
>         spriv->type =3D &pl2303_type_data[type];
>         spriv->quirks =3D (unsigned long)usb_get_serial_data(serial);
>         spriv->quirks |=3D spriv->type->quirks;
>
>         usb_set_serial_data(serial, spriv);
>
> -       pl2303_vendor_read(serial, 0x8484, buf);
> -       pl2303_vendor_write(serial, 0x0404, 0);
> -       pl2303_vendor_read(serial, 0x8484, buf);
> -       pl2303_vendor_read(serial, 0x8383, buf);
> -       pl2303_vendor_read(serial, 0x8484, buf);
> -       pl2303_vendor_write(serial, 0x0404, 1);
> -       pl2303_vendor_read(serial, 0x8484, buf);
> -       pl2303_vendor_read(serial, 0x8383, buf);
> -       pl2303_vendor_write(serial, 0, 1);
> -       pl2303_vendor_write(serial, 1, 0);
> -       if (spriv->quirks & PL2303_QUIRK_LEGACY)
> -               pl2303_vendor_write(serial, 2, 0x24);
> -       else
> -               pl2303_vendor_write(serial, 2, 0x44);
> +       if (type !=3D TYPE_HXN) {
> +               pl2303_vendor_read(serial, 0x8484, buf);
> +               pl2303_vendor_write(serial, 0x0404, 0);
> +               pl2303_vendor_read(serial, 0x8484, buf);
> +               pl2303_vendor_read(serial, 0x8383, buf);
> +               pl2303_vendor_read(serial, 0x8484, buf);
> +               pl2303_vendor_write(serial, 0x0404, 1);
> +               pl2303_vendor_read(serial, 0x8484, buf);
> +               pl2303_vendor_read(serial, 0x8383, buf);
> +               pl2303_vendor_write(serial, 0, 1);
> +               pl2303_vendor_write(serial, 1, 0);
> +               if (spriv->quirks & PL2303_QUIRK_LEGACY)
> +                       pl2303_vendor_write(serial, 2, 0x24);
> +               else
> +                       pl2303_vendor_write(serial, 2, 0x44);
> +       }
>
>         kfree(buf);
>
> @@ -720,12 +770,26 @@ static void pl2303_set_termios(struct tty_struct *t=
ty,
>         if (C_CRTSCTS(tty)) {
>                 if (spriv->quirks & PL2303_QUIRK_LEGACY)
>                         pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0x40);
> -               else
> +               else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) =
{
> +                       pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +                       PL2303_HXN_FLOWCTRL_MASK, PL2303_HXN_CTRL_RTS_CTS=
);
> +               } else {
>                         pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0x60);
> +               }
>         } else if (pl2303_enable_xonxoff(tty, spriv->type)) {
> -               pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
> +               if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> +                       pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +                       PL2303_HXN_FLOWCTRL_MASK, PL2303_HXN_CTRL_XON_XOF=
F);
> +               } else {
> +                       pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0xc0);
> +               }
>         } else {
> -               pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> +               if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> +                       pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +                       PL2303_HXN_FLOWCTRL_MASK, PL2303_HXN_CTRL_NONE);
> +               } else {
> +                       pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0);
> +               }
>         }
>
>         kfree(buf);
> @@ -766,8 +830,13 @@ static int pl2303_open(struct tty_struct *tty, struc=
t usb_serial_port *port)
>                 usb_clear_halt(serial->dev, port->read_urb->pipe);
>         } else {
>                 /* reset upstream data pipes */
> -               pl2303_vendor_write(serial, 8, 0);
> -               pl2303_vendor_write(serial, 9, 0);
> +               if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> +                       pl2303_vendor_write(serial,
> +                       PL2303_HXN_RESET_DOWN_UPSTREAM, 0);
> +               } else {
> +                       pl2303_vendor_write(serial, 8, 0);
> +                       pl2303_vendor_write(serial, 9, 0);
> +               }
>         }
>
>         /* Setup termios */
> diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
> index 559941ca884d..f1c8b5a36816 100644
> --- a/drivers/usb/serial/pl2303.h
> +++ b/drivers/usb/serial/pl2303.h
> @@ -20,7 +20,12 @@
>  #define PL2303_PRODUCT_ID_HCR331       0x331a
>  #define PL2303_PRODUCT_ID_MOTOROLA     0x0307
>  #define PL2303_PRODUCT_ID_ZTEK         0xe1f1
> -
> +#define PL2303_PRODUCT_ID_GC           0x23A3
> +#define PL2303_PRODUCT_ID_GB           0x23B3
> +#define PL2303_PRODUCT_ID_GT           0x23C3
> +#define PL2303_PRODUCT_ID_GL           0x23D3
> +#define PL2303_PRODUCT_ID_GE           0x23E3
> +#define PL2303_PRODUCT_ID_GS           0x23F3
>
>  #define ATEN_VENDOR_ID         0x0557
>  #define ATEN_VENDOR_ID2                0x0547
> --
> 2.20.1
>
