Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB18CC29BE
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 00:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbfI3Wjf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 18:39:35 -0400
Received: from a27-51.smtp-out.us-west-2.amazonses.com ([54.240.27.51]:43960
        "EHLO a27-51.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731123AbfI3Wje (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 18:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=ude52klaz7ukvnrchdbsicqdl2lnui6h; d=aaront.org; t=1569870369;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
        bh=5wKw4aJWQB6UjLX7Fgfa/tSdWBuvi7EYyl6seWKxYV4=;
        b=jPTuvmF94nV74kR5ORRY4xezAedQ0p8vrCSJX8qqZszBMvFGOPKDBB/mZELW+f4q
        Xz6DqbAIwGOLTNuHtzzGD50myZm4Sl6A/igV4csaUGiDevv+NOcxc2PIg8G/d+wcejg
        zhYpxPYi30lKdNEXInldqpu0VWwh9ePbh4RaTvfw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1569870369;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=5wKw4aJWQB6UjLX7Fgfa/tSdWBuvi7EYyl6seWKxYV4=;
        b=dP7XPrnMr85zvwkvAVBWMuq0gCIOow4irz20dxFi68sG0vERLdp8zXPk3ih4f/g2
        d8ohZbPoPPCd4St6ayoAjMyY72u5PHbc3TjgU32eCXZWyBNe0nL+JswIsR4d+kuVum6
        VjevA5ea18FFCljkJOLdXU+/o+j0E5SGOZmqOAgw=
X-Gm-Message-State: APjAAAXBm7/ZOwgLrD8Ab3Z2nKqaoRz/PB6Js3fONm8EIPG8YvSaSXxP
        emWK/uorIkwilyyIMGzvd0EokaQntaNGkpMP3zs=
X-Google-Smtp-Source: APXvYqztlmsfPuBgRs2T8VvmwSOx7HBolyCHeaxA6byK1qakB1rnu54zIFc+bnmemCrw3/VkCtWeES9WgBnSh68sv7A=
X-Received: by 2002:a81:5082:: with SMTP id e124mr13475210ywb.39.1569870367655;
 Mon, 30 Sep 2019 12:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <0100016d5bc55d05-d2c923f3-a4bb-4ba7-8adc-031b7d933b52-000000@email.amazonses.com>
 <871rw6ch9p.fsf@miraculix.mork.no>
In-Reply-To: <871rw6ch9p.fsf@miraculix.mork.no>
From:   Aaron Thompson <dev@aaront.org>
Date:   Mon, 30 Sep 2019 19:06:09 +0000
X-Gmail-Original-Message-ID: <CABeuQhss-jvs1=s5k7_ZfhkDg+V6xTtp2VqxuDKEpNE+azZWYg@mail.gmail.com>
Message-ID: <0101016d8390d0cb-652b297d-5a47-46ee-8447-72e8f13a30f4-000000@us-west-2.amazonses.com>
Subject: Re: Moschip 7703 USB to serial free to a good home
To:     =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-SES-Outgoing: 2019.09.30-54.240.27.51
Feedback-ID: 1.us-west-2.OwdjDcIoZWY+bZWuVZYzryiuW455iyNkDEZFeL97Dng=:AmazonSES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 23, 2019 at 11:58 PM Bj=C3=B8rn Mork <bjorn@mork.no> wrote:
>
> Aaron Thompson <dev@aaront.org> writes:
>
> > I have a Moschip 7703 USB to single serial port adapter that I'm not
> > using primarily because it doesn't have an in-tree driver, so I'd be
> > happy to send it to anyone who would like to add support for it. It
> > looks like it should be easy to add to the existing mos7720 driver.
> > Anyone interested?
>
> Sorry, not interested.  But did you try the obvious fix, even mentioned
> here under "Moschip MCS7720, MCS7715 driver"?:
> https://www.kernel.org/doc/Documentation/usb/usb-serial.txt
>
> Just add the VID/PID to the device table and see what happens.  Just
> post any error messages or other stuff here, along with the patch you
> are testing, and you will get help interpreting it.
>
> Note that you'll probably have to do a minor change in the
> mos77xx_calc_num_ports() too, since it hardcodes 2 ports. But if you're
> lucky then that's it.
>
>
> Bj=C3=B8rn

I have tinkered with it and unfortunately it's not that simple. The
patch below seems to make it work up to 115200 baud in my very minimal
testing. I have no confidence that it's correct though because I don't
have any information about the device. I only have the old
Moschip-authored 7703 driver to refer to and it's quite a bit
different than the current 7720 driver.

Thanks,
Aaron

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 18110225..3cef30a 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -65,10 +65,12 @@ struct moschip_port {
 #define USB_VENDOR_ID_MOSCHIP 0x9710
 #define MOSCHIP_DEVICE_ID_7720 0x7720
 #define MOSCHIP_DEVICE_ID_7715 0x7715
+#define MOSCHIP_DEVICE_ID_7703 0x7703

 static const struct usb_device_id id_table[] =3D {
  { USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7720) },
  { USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7715) },
+ { USB_DEVICE(USB_VENDOR_ID_MOSCHIP, MOSCHIP_DEVICE_ID_7703) },
  { } /* terminating entry */
 };
 MODULE_DEVICE_TABLE(usb, id_table);
@@ -183,7 +185,7 @@ static inline __u16 get_reg_value(enum mos_regs reg,
  return 0x0100;

  else       /* serial port reg */
- return (serial_portnum + 2) << 8;
+ return (serial_portnum + 3) << 8;
 }

 /*
@@ -988,6 +990,8 @@ static int mos77xx_calc_num_ports(struct usb_serial *se=
rial,
  swap(epds->bulk_out[0], epds->bulk_out[1]);

  return 1;
+        } else if (product =3D=3D MOSCHIP_DEVICE_ID_7703) {
+                return 1;
  }

  return 2;
@@ -1052,7 +1056,7 @@ static int mos7720_open(struct tty_struct *tty,
struct usb_serial_port *port)

  dev_dbg(&port->dev, "SS::%p LSR:%x\n", mos7720_port, data);

- write_mos_reg(serial, dummy, MOS7720_SP1_REG, 0x02);
+ write_mos_reg(serial, dummy, MOS7720_SP1_REG, 0x08);
  write_mos_reg(serial, dummy, MOS7720_SP2_REG, 0x02);

  write_mos_reg(serial, port_number, MOS7720_IER, 0x00);
@@ -1939,8 +1943,8 @@ static struct usb_serial_driver
moschip7720_2port_driver =3D {
  },
  .description =3D "Moschip 2 port adapter",
  .id_table =3D id_table,
- .num_bulk_in =3D 2,
- .num_bulk_out =3D 2,
+ .num_bulk_in =3D 1,
+ .num_bulk_out =3D 1,
  .num_interrupt_in =3D 1,
  .calc_num_ports =3D mos77xx_calc_num_ports,
  .open =3D mos7720_open,
