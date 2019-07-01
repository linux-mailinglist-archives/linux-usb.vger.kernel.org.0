Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C930B5BF26
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2019 17:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfGAPLU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Jul 2019 11:11:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35314 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbfGAPLT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Jul 2019 11:11:19 -0400
Received: by mail-wr1-f65.google.com with SMTP id c27so6584425wrb.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Jul 2019 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jsPGJNg+OM3PeA2Y1oM79hRBN6Ttm/bdPMUXwNGWRfs=;
        b=mcUp0dvDnolcBqdevcQzDugGHSXroBgL7OS3bTL2ew5epl/kKgDk/034FvDXqNPZLg
         AQlCzQSxiQ2lzDE9ItzBUZyc6Bc6b2JjE6CGfH2szYVEM4gGxc/mH930sFJIRyL9BNLl
         bIm/iKZYGi5pgtj2Dip9kjCHFkf25XFYAkw405/JVno06In7TE3wQLPlmeRlroTekLPL
         grh4QLJkj2eSXv+qEpmwXks9EE/UsU0WmnHZNU6mNDE/6s310CDgLtpmudhVUato+C+D
         jDGARyoTng3MC4vF0HpWxmo5riYjjH4JAd8qFNwNTFgLShX8QLhsmTZLLgK1jnJAfRDl
         x9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jsPGJNg+OM3PeA2Y1oM79hRBN6Ttm/bdPMUXwNGWRfs=;
        b=n8abUaRK8nB5rWDEtJSFP/nHBW9dhUQTxgeeNGIy8BL3aVfzP1j9VeO+UhAqSfhI4f
         U6xPcEocO3Lbypozb+mi9Ju/iRFXukFpezwLMKN7OkNBgCttQLpX5FHo9h/LwmUXIvZV
         kvaOMPus/OD59RMrUKf5BnWOOGAGWat93hdojuhIdHCt1ZN2AZ/nSHWEBjLvh6gizh9B
         v2/4DtZw1vQO2jn0x7h4hUEgguiHn8U/12GhmgyPOtEtI1/nctq2xGcGRZcs0AR03/Ev
         /jMeQFEVDaP+d6svMxqReFmKdh3NgXQieRQe2mNGtFrIPqJ+7NW6iZejJs+Eq3p2JiX5
         a0tQ==
X-Gm-Message-State: APjAAAUSFd+tfcyiW8eP4TzuEteC5rLOQlkmo90zsJtzmaUD1sIjWcIU
        NMOZ5Uw7UwukHmsnPPBh/sAhqEbN3bXNYI3dXB2LTe44
X-Google-Smtp-Source: APXvYqy+QcdFOzwAGTgu8jz+ll3xjLWYxyhBBtGBCJucvPMhlASE1a3ggvuMsh0uobvLPaG09I9y5G7eyHEvBtFqGWg=
X-Received: by 2002:adf:92a2:: with SMTP id 31mr6640243wrn.43.1561993875455;
 Mon, 01 Jul 2019 08:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190701122114.2952-1-charlesyeh522@gmail.com> <20190701133233.GI27333@localhost>
In-Reply-To: <20190701133233.GI27333@localhost>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 1 Jul 2019 23:11:02 +0800
Message-ID: <CAAZvQQ4Eb8CZbFUG=ZApDyft2ig8mOSj4shbQv_UVCw0pm8p_Q@mail.gmail.com>
Subject: Re: [PATCH] [PATCH v6] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > +             if (spriv->quirks & PL2303_QUIRK_LEGACY) {
> > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
,
> > +                             0x40);
>
> No need to break this line even if you end up with slightly more than 80
> chars.
>
OK. I will ignore "WARNING: line over 80 characters".


> > +             } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]=
) {
> > +                     pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> > +                             PL2303_HXN_FLOWCTRL_MASK,
> > +                             PL2303_HXN_CTRL_RTS_CTS);
>
> Again, continuation lines should be indented at least two tabs further
> (you only use one tab now).
>

I have done it the way you do today...but after checking
./scripts/checkpatch.pl.. I got another warning message...
So I am a little confused now...
Previously before submitting.. must first pass ./scripts/checkpatch.pl
check. No ERROR, or WARRING message...

I will return to the office tomorrow ... I will post another warning
message (according to the way you mentioned)


>         } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
>
> > +                     pl2303_vendor_write(serial, PL2303_HXN_RESET_CONT=
ROL,
> > +                             0);
>
> You again completely ignored my question about why you're wring 0
> instead of 3 here.
>
> I'll ignore your patch until you explain.

3. In pl2303_open: Because TYPE_HXN is different from the instruction of re=
set
   down/up stream used by TYPE_HX.
   Therefore, we will also execute different instructions here.
   The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we will
   write 0x00 to reset down/up stream(TYPE_HXN).

Charles.

Johan Hovold <johan@kernel.org> =E6=96=BC 2019=E5=B9=B47=E6=9C=881=E6=97=A5=
 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=889:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jul 01, 2019 at 08:21:14PM +0800, Charles Yeh wrote:
> > Prolific has developed a new USB to UART chip: PL2303HXN
> > PL2303HXN : PL2303GC/PL2303GS/PL2303GT/PL2303GL/PL2303GE/PL2303GB
> > The Vendor request used by the PL2303HXN (TYPE_HXN) is different from
> > the existing PL2303 series (TYPE_HX & TYPE_01).
> > Therefore, different Vendor requests are used to issue related commands=
.
> >
> > 1. Added a new TYPE_HXN type in pl2303_type_data, and then executes
> >    new Vendor request,new flow control and other related instructions
> >    if TYPE_HXN is recognized.
> >
> > 2. Because the new PL2303HXN only accept the new Vendor request,
> >    the old Vendor request cannot be accepted (the error message
> >    will be returned)
> >    So first determine the TYPE_HX or TYPE_HXN through
> >    PL2303_READ_TYPE_HX_STATUS in pl2303_startup.
> >
> >   2.1 If the return message is "1", then the PL2303 is the existing
> >       TYPE_HX/ TYPE_01 series.
> >       The other settings in pl2303_startup are to continue execution.
> >   2.2 If the return message is "not 1", then the PL2303 is the new
> >       TYPE_HXN series.
> >       The other settings in pl2303_startup are ignored.
> >       (PL2303HXN will directly use the default value in the hardware,
> >        no need to add additional settings through the software)
> >
> > 3. In pl2303_open: Because TYPE_HXN is different from the instruction o=
f reset
> >    down/up stream used by TYPE_HX.
> >    Therefore, we will also execute different instructions here.
> >    The default of chip Reset Control is 0xFF(TYPE_HXN), therefore we wi=
ll
> >    write 0x00 to reset down/up stream(TYPE_HXN).
> >
> > 4. In pl2303_set_termios: The UART flow control instructions used by
> >    TYPE_HXN/TYPE_HX/TYPE_01 are different.
> >    Therefore, we will also execute different instructions here.
> >
> > 5. In pl2303_vendor_read & pl2303_vendor_write, since TYPE_HXN is diffe=
rent
> >    from the vendor request instruction used by TYPE_HX/TYPE_01,
> >    it will also execute different instructions here.
> >
> > 6. In pl2303_update_reg: TYPE_HXN used different register for flow cont=
rol.
> >    Therefore, we will also execute different instructions here.
> >
> > Signed-off-by: Charles Yeh <charlesyeh522@gmail.com>
> > ---
> > changelog:
> > v6:
> > 1. Modify pl2303_update_reg:TYPE_HXN used different register for flow c=
ontrol.
> >    Therefore, we will also execute different instructions here.
> > 2. Modify define name: PL2303_HXN_RESET_DOWN_UPSTREAM to
> >    PL2303_HXN_RESET_CONTROL
> > 3. Re-Sorting flow-control register definition by address.
> > 4. Indent continuation lines at least tw tabs.
> >
> > v5:
> > 1. Modify pl2303_update_reg
> > 2. add a patch version on subject
> > 3. add a space after each colon at subject line
> > ---
> >  drivers/usb/serial/pl2303.c | 127 +++++++++++++++++++++++++++++-------
> >  drivers/usb/serial/pl2303.h |   7 +-
> >  2 files changed, 108 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
> > index d7abde14b3cf..d36d53b234c4 100644
> > --- a/drivers/usb/serial/pl2303.c
> > +++ b/drivers/usb/serial/pl2303.c
> > @@ -47,6 +47,12 @@ static const struct usb_device_id id_table[] =3D {
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_MOTOROLA) },
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_ZTEK) },
> >       { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_TB) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GC) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GB) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GT) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GL) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GE) },
> > +     { USB_DEVICE(PL2303_VENDOR_ID, PL2303_PRODUCT_ID_GS) },
> >       { USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID) },
> >       { USB_DEVICE(IODATA_VENDOR_ID, IODATA_PRODUCT_ID_RSAQ5) },
> >       { USB_DEVICE(ATEN_VENDOR_ID, ATEN_PRODUCT_ID),
> > @@ -130,9 +136,11 @@ MODULE_DEVICE_TABLE(usb, id_table);
> >
> >  #define VENDOR_WRITE_REQUEST_TYPE    0x40
> >  #define VENDOR_WRITE_REQUEST         0x01
> > +#define VENDOR_WRITE_NREQUEST                0x80
> >
> >  #define VENDOR_READ_REQUEST_TYPE     0xc0
> >  #define VENDOR_READ_REQUEST          0x01
> > +#define VENDOR_READ_NREQUEST         0x81
> >
> >  #define UART_STATE_INDEX             8
> >  #define UART_STATE_MSR_MASK          0x8b
> > @@ -147,12 +155,22 @@ MODULE_DEVICE_TABLE(usb, id_table);
> >  #define UART_CTS                     0x80
> >
> >  #define PL2303_FLOWCTRL_MASK         0xf0
> > +#define PL2303_HXN_FLOWCTRL_MASK     0x1C
>
> Move after PL2303_HXN_RESET_CONTROL as I suggested.
>
> > +#define PL2303_READ_TYPE_HX_STATUS   0x8080
> > +
> > +#define PL2303_HXN_RESET_CONTROL     0x07
> > +#define PL2303_HXN_FLOWCTRL          0x0A
> > +#define PL2303_HXN_CTRL_XON_XOFF     0x0C
> > +#define PL2303_HXN_CTRL_RTS_CTS              0x18
> > +#define PL2303_HXN_CTRL_NONE         0x1C
>
> > @@ -719,14 +771,34 @@ static void pl2303_set_termios(struct tty_struct =
*tty,
> >       }
> >
> >       if (C_CRTSCTS(tty)) {
> > -             if (spriv->quirks & PL2303_QUIRK_LEGACY)
> > -                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0x40);
> > -             else
> > -                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0x60);
> > +             if (spriv->quirks & PL2303_QUIRK_LEGACY) {
> > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
,
> > +                             0x40);
>
> No need to break this line even if you end up with slightly more than 80
> chars.
>
> > +             } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]=
) {
> > +                     pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> > +                             PL2303_HXN_FLOWCTRL_MASK,
> > +                             PL2303_HXN_CTRL_RTS_CTS);
>
> Again, continuation lines should be indented at least two tabs further
> (you only use one tab now).
>
> > +             } else {
> > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
,
> > +                             0x60);
>
> No need to break line.
>
> > +             }
> >       } else if (pl2303_enable_xonxoff(tty, spriv->type)) {
> > -             pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0xc0);
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> > +                     pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> > +                             PL2303_HXN_FLOWCTRL_MASK,
> > +                             PL2303_HXN_CTRL_XON_XOFF);
>
> Indentation.
>
> > +             } else {
> > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
,
> > +                             0xc0);
>
> No need to break line.
>
> > +             }
> >       } else {
> > -             pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK, 0);
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
> > +                     pl2303_update_reg(serial, PL2303_HXN_FLOWCTRL,
> > +                             PL2303_HXN_FLOWCTRL_MASK,
> > +                             PL2303_HXN_CTRL_NONE);
>
> Indentation.
>
> > +             } else {
> > +                     pl2303_update_reg(serial, 0, PL2303_FLOWCTRL_MASK=
, 0);
> > +             }
> >       }
> >
> >       kfree(buf);
> > @@ -767,8 +839,13 @@ static int pl2303_open(struct tty_struct *tty, str=
uct usb_serial_port *port)
> >               usb_clear_halt(serial->dev, port->read_urb->pipe);
> >       } else {
> >               /* reset upstream data pipes */
> > -             pl2303_vendor_write(serial, 8, 0);
> > -             pl2303_vendor_write(serial, 9, 0);
> > +             if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
>
> Merge this with else above to reduce indentation, that is
>
>         } else if (spriv->type =3D=3D &pl2303_type_data[TYPE_HXN]) {
>
> > +                     pl2303_vendor_write(serial, PL2303_HXN_RESET_CONT=
ROL,
> > +                             0);
>
> You again completely ignored my question about why you're wring 0
> instead of 3 here.
>
> I'll ignore your patch until you explain.
>
> > +             } else {
> > +                     pl2303_vendor_write(serial, 8, 0);
> > +                     pl2303_vendor_write(serial, 9, 0);
> > +             }
> >       }
>
> Johan
