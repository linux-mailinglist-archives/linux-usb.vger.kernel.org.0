Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56C4A5FF9B
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jul 2019 04:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727286AbfGEC50 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 22:57:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42035 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfGEC50 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 22:57:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id a10so7208784wrp.9
        for <linux-usb@vger.kernel.org>; Thu, 04 Jul 2019 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tZVOJctUKP+PhY5vKjCiNLO3/8cdXtGneq+hbss4V48=;
        b=vfD+oqNnHFSPBjoxVBKt7ax5ba/ConevCgTURORN838yxv3nBlQ4cPmcbhvAi71/2E
         YdOFcb+t/Izm7wvvGm1kLq5XUyxwGgTabFqxwImrVGNjP0nKEVyT/NpEKPadXG1paVSQ
         UwEr/BXk6hs0ZjOiLVRqpAef4kn0RYPXJvbAl/DZ2vGb2N8oBgjP8gaVKlHFAmMc/4Rd
         jL5Zp51rodRhyl4yF38oN8vRXXqu3UBGhHlp1RRqACJa1mgQhtU4rfgrCFsC7GFGMjld
         ETW9NxFqlxXwyRsUqK/oQOW4Hoqzr/UFLPpGlR38nUFcAwAfVzx5IDDgjLEU4HcpKqh8
         NDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tZVOJctUKP+PhY5vKjCiNLO3/8cdXtGneq+hbss4V48=;
        b=U7axyeTXdgkIH6O8qhleJnl6RWVoVnjeKn9ilpj3mZV2pbODNMqqe02Sjow86/jLBA
         asDxuKzka+hfBN0dQMv0SggXCCOwz08YaKM4Pc60N9R0toh+ijlbk1IzmCm0hSMJF6NS
         v0j0+/yzVzG+GSc20ItCWNyuReJLK2Y51oD0LM0pgp/nzdMfqFb1cOoTuzouTHlJYZK/
         X4owDBL4Zm3S4n8pt3lECJp7c52yPLRIBnYgIvaHPnwxIVfiCQ+Am/JjxukQOD9A1vpi
         /bF9Jp2CM8M5YpUPbl8tCBkpqkKirxpZnQR5z1ZIIMLR9go6S6Z7sokNHd5NQRC6rCxZ
         Ihvg==
X-Gm-Message-State: APjAAAU1ErGbzrLUMpDxPCkX19dupna2NgouYak7gVbxDMsceVpeRZcp
        ctUVJ9Og7YgeT3o4UKUProq3LIaHwIq1L67o3/E=
X-Google-Smtp-Source: APXvYqzyudcxn5z6/lIl1euNUTaxIopjA5V1hN4WHN10uZ2wHw5wxYRPlgCV7Oo9waVkzDWl1Qxd92Ftn2EN+ccTqLw=
X-Received: by 2002:adf:e292:: with SMTP id v18mr1164481wri.43.1562295441993;
 Thu, 04 Jul 2019 19:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190702123006.11320-1-charlesyeh522@gmail.com>
In-Reply-To: <20190702123006.11320-1-charlesyeh522@gmail.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Fri, 5 Jul 2019 10:57:11 +0800
Message-ID: <CAAZvQQ6pxvhVKsH1oOwToF1n=rYAbShzVnPBGowZhivO2NYPiQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v7] USB: serial: pl2303: Add new PID to support
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

Charles Yeh <charlesyeh522@gmail.com> =E6=96=BC 2019=E5=B9=B47=E6=9C=882=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:30=E5=AF=AB=E9=81=93=EF=BC=9A
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
> v7:
> 1. Add PL2303_HXN_RESET_CONTROL_MASK define.
> 2. In pl2303_open,use PL2303_HXN_RESET_CONTROL_MASK & PL2303_HXN_RESET_CO=
NTROL
>    to reset the upstream and downstream pipe data
> 3. Ignore "WARNING: line over 80 characters" at #776,#782,#790
>
> v6:
> 1. Modify pl2303_update_reg:TYPE_HXN used different register for flow con=
trol.
>    Therefore, we will also execute different instructions here.
> 2. Modify define name: PL2303_HXN_RESET_DOWN_UPSTREAM to
>    PL2303_HXN_RESET_CONTROL
> 3. Re-Sorting flow-control register definition by address.
> 4. Indent continuation lines at least tw tabs.
> 5. In pl2303_open,modify reset the upstream and downstream pipe data: 0x0=
0 to
>    0x03
>
> v5:
> 1. Modify pl2303_update_reg
> 2. add a patch version on subject
> 3. add a space after each colon at subject line
> ---
>  drivers/usb/serial/pl2303.c | 117 +++++++++++++++++++++++++++++-------
>  drivers/usb/serial/pl2303.h |   7 ++-
>  2 files changed, 101 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> index d7abde14b3cf..b6dfddb7a154 100644
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
> @@ -130,9 +136,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
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
> @@ -147,12 +155,23 @@ MODULE_DEVICE_TABLE(usb, id_table);
>  #define UART_CTS                       0x80
>
>  #define PL2303_FLOWCTRL_MASK           0xf0
> +#define PL2303_HXN_FLOWCTRL_MASK       0x1C
> +#define PL2303_HXN_FLOWCTRL            0x0A
> +#define PL2303_READ_TYPE_HX_STATUS     0x8080
> +
> +#define PL2303_HXN_RESET_CONTROL_MASK  0x03
> +#define PL2303_HXN_RESET_CONTROL       0x07
> +#define PL2303_HXN_CTRL_XON_XOFF       0x0C
> +#define PL2303_HXN_CTRL_RTS_CTS                0x18
> +#define PL2303_HXN_CTRL_NONE           0x1C
> +
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
> @@ -184,16 +203,26 @@ static const struct pl2303_type_data pl2303_type_da=
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
> @@ -212,12 +241,19 @@ static int pl2303_vendor_read(struct usb_serial *se=
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
> @@ -232,12 +268,17 @@ static int pl2303_update_reg(struct usb_serial *ser=
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
> @@ -320,6 +361,7 @@ static int pl2303_startup(struct usb_serial *serial)
>         struct pl2303_serial_private *spriv;
>         enum pl2303_type type =3D TYPE_01;
>         unsigned char *buf;
> +       int res;
>
>         spriv =3D kzalloc(sizeof(*spriv), GFP_KERNEL);
>         if (!spriv)
> @@ -341,26 +383,37 @@ static int pl2303_startup(struct usb_serial *serial=
)
>                 type =3D TYPE_01;         /* type 1 */
>         dev_dbg(&serial->interface->dev, "device type: %d\n", type);
>
> +       if (type =3D=3D TYPE_HX) {
> +               res =3D usb_control_msg(serial->dev,
> +                               usb_rcvctrlpipe(serial->dev, 0),
> +                               VENDOR_READ_REQUEST, VENDOR_READ_REQUEST_=
TYPE,
> +                               PL2303_READ_TYPE_HX_STATUS, 0, buf, 1, 10=
0);
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
> @@ -719,14 +772,31 @@ static void pl2303_set_termios(struct tty_struct *t=
ty,
>         }
>
>         if (C_CRTSCTS(tty)) {
> -               if (spriv->quirks & PL2303_QUIRK_LEGACY)
> +               if (spriv->quirks & PL2303_QUIRK_LEGACY) {
>                         pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0x40);
> -               else
> +               } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]=
) {
> +                       pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +                                       PL2303_HXN_FLOWCTRL_MASK,
> +                                       PL2303_HXN_CTRL_RTS_CTS);
> +               } else {
>                         pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0x60);
> +               }
>         } else if (pl2303_enable_xonxoff(tty, spriv->type)) {
> -               pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
> +               if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> +                       pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +                                       PL2303_HXN_FLOWCTRL_MASK,
> +                                       PL2303_HXN_CTRL_XON_XOFF);
> +               } else {
> +                       pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0xc0);
> +               }
>         } else {
> -               pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> +               if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> +                       pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> +                                       PL2303_HXN_FLOWCTRL_MASK,
> +                                       PL2303_HXN_CTRL_NONE);
> +               } else {
> +                       pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0);
> +               }
>         }
>
>         kfree(buf);
> @@ -765,8 +835,11 @@ static int pl2303_open(struct tty_struct *tty, struc=
t usb_serial_port *port)
>         if (spriv->quirks & PL2303_QUIRK_LEGACY) {
>                 usb_clear_halt(serial->dev, port->write_urb->pipe);
>                 usb_clear_halt(serial->dev, port->read_urb->pipe);
> -       } else {
> +       } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
>                 /* reset upstream data pipes */
> +               pl2303_update_reg(serial, PL2303_HXN_RESET_CONTROL,
> +                               PL2303_HXN_RESET_CONTROL_MASK, 0x03);
> +       } else {
>                 pl2303_vendor_write(serial, 8, 0);
>                 pl2303_vendor_write(serial, 9, 0);
>         }
> diff --git a/drivers/usb/serial/pl2303.h b/drivers/usb/serial/pl2303.h
> index b0175f17d1a2..4a4a50586d5c 100644
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
