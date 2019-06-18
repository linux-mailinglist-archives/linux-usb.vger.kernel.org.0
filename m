Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8794ADDC
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2019 00:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbfFRWa0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Jun 2019 18:30:26 -0400
Received: from mail-lf1-f52.google.com ([209.85.167.52]:43327 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730196AbfFRWaZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Jun 2019 18:30:25 -0400
Received: by mail-lf1-f52.google.com with SMTP id j29so10479247lfk.10
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2019 15:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=1h8gdoje6+7r0sWsB+RrrhiMhf9yyA6CKW0G7wTEh6g=;
        b=CvZBof05dOUFRMs4Ek9hBYYgO/JRl5DbttKcXc1km+NRe1wcyJRhHKSsoWL62EzyMC
         S43Zt1pYpCCgZZ1IE5xVT6LK9s1FuFPwx2YQktJiQ+AMCxJFKhrshRPUeYvbmzP6DPtN
         GzDB3XIeLgLWYPXeMkNlcEBUM+kc7VAxC3J7Yw1V7+yze7RS7U8Z7lGYXeyk1V2FwGis
         mGZLAPTchcBHkgPYHc9DMPiYS0loWnGRjfdfbdxdUtR+PbuHjuV5NvB6FWfzPWdyjm50
         s8op0v2zpsqa+UIYh2aVqYxKX7Jc8BI4twKSoA3Yie1M42o6VXtgN4R+hXu6eekd1spk
         3uXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=1h8gdoje6+7r0sWsB+RrrhiMhf9yyA6CKW0G7wTEh6g=;
        b=hXUT9Ew24YQBkcQLrPNbWYoL+G8Cyb4ELBis5bVEUO9xTCQvo2a4X2QitRLs4oTxRt
         aEfD1sliZJRE3eeshPg/PY8W6bo/Z3nbyufrKV9GFx0dREhblrXd5FxMB+O+YZA/2+WO
         HGgit0mXj/59lACsndjV/2qazCn+02g0vIAjG0c00qej0Kd+se8VGi7xvcX2KuGKrUUH
         goGQ6Su0VHMNpl4BOP40beAcO1+D0r0/5D4rCvnYNKa2lMVs+cyUVPoiysdR+bZqGbn+
         6AmEHN2tnMIuHQ3Be+o5PaR7AXJi6gyMtd7UiL8RClPQX7dS0fHrDLsPWtIUO/jJgU2P
         wfxA==
X-Gm-Message-State: APjAAAUIrTJHP9ac2d4sv/cTMsfVKX/C9jGTS9RenWv6TXH9fjVtgfjH
        JGYMlljN5PN54ghyqbm+QfdmtlpVZsAKZQ==
X-Google-Smtp-Source: APXvYqxiF614whyssdkcOBNEYHuXfnx+jMlgDSLj1GxjMEYzF+UviSHyJjK75/KQnK0YMFiJuKsABA==
X-Received: by 2002:ac2:4c0b:: with SMTP id t11mr42273880lfq.72.1560897023539;
        Tue, 18 Jun 2019 15:30:23 -0700 (PDT)
Received: from localhost (213-67-189-66-no148.tbcn.telia.com. [213.67.189.66])
        by smtp.gmail.com with ESMTPSA id f16sm2658542lfc.81.2019.06.18.15.30.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 15:30:23 -0700 (PDT)
Date:   Wed, 19 Jun 2019 00:30:19 +0200
From:   =?UTF-8?Q?J=C3=B6rgen?= Storvist <jorgen.storvist@gmail.com>
To:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: [PATCH] USB: serial: option: add support for GosunCn ME3630 RNDIS
 mode
Message-ID: <20190619002812.00006025@gmail.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added USB IDs for GosunCn ME3630 cellular module in RNDIS mode.

T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D01 Cnt=3D03 Dev#=3D 18 Spd=3D480 MxC=
h=3D 0
D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D19d2 ProdID=3D0601 Rev=3D03.18
S:  Manufacturer=3DAndroid
S:  Product=3DAndroid
S:  SerialNumber=3Db950269c
C:  #Ifs=3D 5 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA
I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3De0(wlcon) Sub=3D01 Prot=3D03 Driver=
=3Drndis_host
I:  If#=3D0x1 Alt=3D 0 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D00 Driver=
=3Drndis_host
I:  If#=3D0x2 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3Doption
I:  If#=3D0x3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
I:  If#=3D0x4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption

Signed-off-by: J=C3=B6rgen Storvist <jorgen.storvist@gmail.com>
---
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 83869065b..d449ef172 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1339,6 +1339,7 @@ static const struct usb_device_id option_ids[] =3D {
 	  .driver_info =3D RSVD(4) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0414, 0xff, 0xff, 0xff) =
},
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0417, 0xff, 0xff, 0xff) =
},
+	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x0601, 0xff) },	/* GosunCn Z=
TE WeLink ME3630 (RNDIS mode) */
 	{ USB_DEVICE_INTERFACE_CLASS(ZTE_VENDOR_ID, 0x0602, 0xff) },	/* GosunCn Z=
TE WeLink ME3630 (MBIM mode) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff),
 	  .driver_info =3D RSVD(4) },
