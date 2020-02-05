Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 654EA153545
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 17:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBEQcv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 11:32:51 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43690 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBEQcv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 11:32:51 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so2922865ljm.10
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2020 08:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=K9/hbQkjG0GeW9Q0lZvivcO/vaymO1PMSo4lQXYJqjQ=;
        b=YZvEh7/41P50ykE8Oi+ebvgFsAb61XNKzkYUNzAOmmkE4ZxkXPfk8uTbMlFxAN0XYl
         lEhIIPvGnyyfC+CZqu63Nfne3+JBTSKkhedSiqNXIYtDyyj4z3aSwKv2pjZoMuFNv9Vh
         pijtOpsvrapUuctGdiMpAFV6h60HPWVgQc/tU2mRLdwC8MZ6BkVAekQCHTidqPSyASbB
         XG7WO4u2nCe630/SEkjd91rrz+p4yODGk4k72IIyBRVgTdmPt5J816OVeXlkRCICOVpj
         m04M1Kqrh7J4a4KKQRcahMVvlQi24ae652LCecoB4opkL90NaaRYZ8y8OMlaDePINdDh
         lIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=K9/hbQkjG0GeW9Q0lZvivcO/vaymO1PMSo4lQXYJqjQ=;
        b=bfkcB1TjtfEmrg87tGPrs0enKdnWaAb01p9Nvp3tMrh0BnufzCnN3CbnVuQkqd+NfX
         KawuSLcFurBXHrtn2pY422D7QZ8mx7tN9l0eYUyx57ptw61fqzaRlKLIBbOpLlswtrcB
         gdobMTlhBt0Kz4fmn0yOZDRiL5JOXl4YNT30twSQiEcj+VMYZz4Sazd4OrSiMXYDlaVJ
         7XnG8HcCpbNHehLFSgFHb0ZyzOazoCpI0nF036D+s5Z8lcC38Klikyf0ikYP5Bo9NkC+
         EKrkmsD6n5qtoKsnWTHdg483W6yTpXrIvTyitn/M3HfVHtrD8lyb0LD7/UtpAo9F5Q3z
         EyQA==
X-Gm-Message-State: APjAAAU2fJberDu7R2IMv6bKkUQwd7VxLV7V2w8YcTNoneUgDDNtazHZ
        59l8B4VWySU0/PJQGgCfbLkQS0Dvdis=
X-Google-Smtp-Source: APXvYqybBYE27HAmubOlDnZgWxI9cRAzDO++JbUL5tg30QNM4d0/aGkh/xfHpG9dMlBZSClwhMllVw==
X-Received: by 2002:a2e:80d9:: with SMTP id r25mr21628247ljg.8.1580920368839;
        Wed, 05 Feb 2020 08:32:48 -0800 (PST)
Received: from saruman ([2001:999:81:d599:3b1e:9c62:de71:2a9d])
        by smtp.gmail.com with ESMTPSA id q26sm12467850lfp.85.2020.02.05.08.32.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 08:32:47 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Roger Quadros <rogerq@ti.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: run stop times out on dra7
In-Reply-To: <70e4f2b0-7f2e-0fc0-1cfb-7479d78760e6@ti.com>
References: <70e4f2b0-7f2e-0fc0-1cfb-7479d78760e6@ti.com>
Date:   Wed, 05 Feb 2020 18:32:31 +0200
Message-ID: <87zhdx571c.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Roger,

Roger Quadros <rogerq@ti.com> writes:
> on v5.5. on dra7 platform connected to PC host.
>
> root@dra7xx-evm:~# uname -a
> Linux dra7xx-evm 5.5.0 #551 SMP Tue Feb 4 17:10:23 EET 2020 armv7l armv7l=
 armv7l GNU/Linux
> root@dra7xx-evm:~# modprobe g_zero
> [   26.176210] zero gadget: Gadget Zero, version: Cinco de Mayo 2008
> [   26.182384] zero gadget: zero ready
> root@dra7xx-evm:~# modprobe -r g_zero
> [   32.250704] ------------[ cut here ]------------
> [   32.255368] WARNING: CPU: 1 PID: 1278 at drivers/usb/gadget/composite.=
c:2024 __composite_unbind+0xc8/0xd8 [libcomposite]
> [   32.266330] Modules linked in: usb_f_ss_lb g_zero(-) libcomposite xhci=
_plat_hcd xhci_hcd usbcore dwc3 udc_core usb_common evdev spi_nor snd_soc_s=
imple_card snd_soc_simple_card_utils leds_gpio led_class gpio_4
> [   32.322121] CPU: 1 PID: 1278 Comm: modprobe Not tainted 5.5.0 #551
> [   32.328330] Hardware name: Generic DRA74X (Flattened Device Tree)
> [   32.334467] [<c0112968>] (unwind_backtrace) from [<c010cb88>] (show_st=
ack+0x10/0x14)
> [   32.342250] [<c010cb88>] (show_stack) from [<c08fee14>] (dump_stack+0x=
c0/0xe0)
> [   32.349509] [<c08fee14>] (dump_stack) from [<c013a3a8>] (__warn+0xd0/0=
xf8)
> [   32.356419] [<c013a3a8>] (__warn) from [<c013a478>] (warn_slowpath_fmt=
+0xa8/0xb8)
> [   32.363951] [<c013a478>] (warn_slowpath_fmt) from [<bf17cafc>] (__comp=
osite_unbind+0xc8/0xd8 [libcomposite])
> [   32.373872] [<bf17cafc>] (__composite_unbind [libcomposite]) from [<bf=
170474>] (usb_gadget_remove_driver+0x48/0x7c [udc_core])
> [   32.385329] [<bf170474>] (usb_gadget_remove_driver [udc_core]) from [<=
bf170540>] (usb_gadget_unregister_driver+0x98/0xd8 [udc_core])
> [   32.397303] [<bf170540>] (usb_gadget_unregister_driver [udc_core]) fro=
m [<c01d8774>] (sys_delete_module+0x1a0/0x248)
> [   32.407875] [<c01d8774>] (sys_delete_module) from [<c01011e0>] (__sys_=
trace_return+0x0/0x20)
> [   32.416348] Exception stack(0xecfdffa8 to 0xecfdfff0)
> [   32.421424] ffa0:                   000363d8 00036414 00036414 0000080=
0 0000006c 00000000
> [   32.429637] ffc0: 000363d8 00036414 00000000 00000081 00000001 0000000=
0 bea71c44 00000000
> [   32.437850] ffe0: b6e732f0 bea708b4 0001b3cf b6e732fc
> [   32.442958] ---[ end trace 17a4fad12463bfc1 ]---
>
> backtrace is because dwc3_gadget_run_stop() times out at pulldown
> and dwc3_gadget_pullup() returns -110
> So,
>
> usb_gadget_disconnect() does not call disconnect().
>
>          ret =3D gadget->ops->pullup(gadget, 0);
>          if (!ret) {
>                  gadget->connected =3D 0;
>                  gadget->udc->driver->disconnect(gadget);
>          }
>
> Any idea why controller stop might time out?

The only thing that comes to mind is that your PHY may be suspended.

Can you check that?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl467h8ACgkQzL64meEa
mQYWPhAAo/oDTgsi5Hu/88dk7sWaHl0bwMZvNMR3U90nExJmJ9fTqszw98ZFDXIA
C372o6+MIYqMe6d6vAWKlZOpa0P3hg58VINVmJffkwcFnKDc9VIBuqlisDxBMmv2
Zw6eBwJrjntn+zkrDNisuP/TjdzAsTHlCQxdJIfgGEdP7KXI9tCIVEDr1pi7kkw2
hM/Akx0TXrhhELbIG4dNy/qteK0ymiWgd92wDeVUhN4JHxtWJTT4/5N2dKCgSWWX
mKvWt5UKu0vcoQAMHGbTx1G4ch8Q5/xi5PaP0OBAlrzVeh+s/R5lONyNW3Ei3mEo
WZ+VO4+Z7ZGeybOjmCSWYo7iyPsCaLnY2k+XsdqDxLFRY7K0xdG5Pr5olSAHRrUo
8eOP50H/KEtd1ek1DHstkNUbDGKF/LhdWJbdcwKq3lhBtCmTURq91JWEmOVncIx4
OHGSc28Xf/nplNpslmDyQhu7n6Y1yVijbpDFBOpIntMDbsQvS3IeVTUWzxq2gCWj
ZxQ4xj1lP/l0eVKjGN9KoYI3HmdXmSAMPGhRm8Ks4EK1or/Kk13GFj+TCnmY4W1m
tPZ98drv5KYOUc89PSl67tIlC/YYjuT1BZLFIiW/Uphapazj8uARA/iPppPYnM8a
rejoa3u9fqsvZZQ+ERDH0THk/6ZlVrCk9rqbVlbnb+daeWZ3G74=
=h9MH
-----END PGP SIGNATURE-----
--=-=-=--
