Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B421BB12
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2019 18:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730460AbfEMQiD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 May 2019 12:38:03 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46690 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730291AbfEMQiB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 May 2019 12:38:01 -0400
Received: by mail-lf1-f65.google.com with SMTP id l26so3924380lfh.13
        for <linux-usb@vger.kernel.org>; Mon, 13 May 2019 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=pC70XapTPG6ENuyqJFeE4rKztLXg3IEWD+kf0IhpnD8=;
        b=Npr6PRrgvXDQYqgxlPx3iytoq8S6GsqJdQb7gvA+644ca9w7bU0bNX9uouhqSKBfV6
         wiFrS2K2SOs0cNrrEspoB1YHdQGFN+l+CPu7i8lCf8i37/alg3RFg89B8d9LTxVvTJSY
         M7ltNQxrhigUqdBUtlzrDOU2Knlsd6DpL3A62gI5+oWC5ukQeUzMnZ5eESNrJAwwlYr0
         yAL9X2dHZqLRp5Yee313A7e/6FyYaEP/KXaz1hLbXQE6Jtvs4ZHWwwrBpSh+T7jikYYX
         99SkT0A25ONw9OP3HeBykcSIFGXz1pWoutKNgyTDpNy7lWyzjeh6QHypkze44UCNOgLi
         5WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=pC70XapTPG6ENuyqJFeE4rKztLXg3IEWD+kf0IhpnD8=;
        b=VBSUAbKsl9d1QuXegWdiqc7Vrg4sazajD2+UZWBBlfj0O1xraCqU6iO6WgV3JjYOB5
         b+SIdmpbDFs/DA9OiNUGCrRiXOPlHubVEI3le4i8UKRrh5RGBGHDBeb/iYPefOYcv12N
         Ob63tRf7dwr+o3uC23d18dEzBelvSLN11QYZEhO2J2yn4QJSqyhoU2SwpDMSyDej64cQ
         a6Az7svSdyk0n8B0R/rWjZA31YMfLgq93U/GJrGEzkHaoyebhXhna65tgXCCurwA0QVn
         CIA5S46hOC6uo/taFvKueXEat8pGS9xq+CP++49swW+EIcsglwS6gOM91J/wc4x1L3RA
         DdlQ==
X-Gm-Message-State: APjAAAXSO3YxQwjw7sBQwdDEEI4M+/dJX3LE/5Bxh8C0l1JRQwJYwWTj
        M/YyMyjJ2gOACOTsxD81GH3tJZ2XcujhFw==
X-Google-Smtp-Source: APXvYqweSWmEv8+DnGmpkRSw78r/KmU2UYfFkM1DoZLETVv+HT9b3Gd0tULCdawWgg3u+4RqkCXrFw==
X-Received: by 2002:ac2:5214:: with SMTP id a20mr4112769lfl.169.1557765479165;
        Mon, 13 May 2019 09:37:59 -0700 (PDT)
Received: from localhost (h-102-249.A137.corp.bahnhof.se. [79.136.102.249])
        by smtp.gmail.com with ESMTPSA id l15sm3250062lji.5.2019.05.13.09.37.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 09:37:58 -0700 (PDT)
Date:   Mon, 13 May 2019 18:37:52 +0200
From:   =?UTF-8?Q?J=C3=B6rgen?= Storvist <jorgen.storvist@gmail.com>
To:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: [PATCH] USB: serial: option: add support for Simcom SIM7500/SIM7600
 RNDIS mode
Message-ID: <20190513183752.00005ee2@gmail.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Added IDs for Simcom SIM7500/SIM7600 series cellular module in RNDIS
mode. Reserved the interface for ADB.

T:  Bus=3D03 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  7 Spd=3D480 MxC=
h=3D 0
D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D1e0e ProdID=3D9011 Rev=3D03.18
S:  Manufacturer=3DSimTech, Incorporated
S:  Product=3DSimTech, Incorporated
S:  SerialNumber=3D0123456789ABCDEF
C:  #Ifs=3D 8 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA
I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D02(commc) Sub=3D02 Prot=3Dff
Driver=3Drndis_host
I:  If#=3D0x1 Alt=3D 0 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D00
Driver=3Drndis_host
I:  If#=3D0x2 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3Doption
I:  If#=3D0x3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
I:  If#=3D0x4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
I:  If#=3D0x5 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
I:  If#=3D0x6 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
I:  If#=3D0x7 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D42 Prot=3D01 Driver=
=3D(none)

Signed-off-by: J=C3=B6rgen Storvist <jorgen.storvist@gmail.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 83869065b802..3fa253984fe7 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -1772,6 +1772,8 @@ static const struct usb_device_id option_ids[] =3D {
 	{ USB_DEVICE(ALINK_VENDOR_ID, SIMCOM_PRODUCT_SIM7100E),
 	  .driver_info =3D RSVD(5) | RSVD(6) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/S=
IM7600 MBIM mode */
+	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),
+	  .driver_info =3D RSVD(7) },	/* Simcom SIM7500/SIM7600 RNDIS mode */
 	{ USB_DEVICE(ALCATEL_VENDOR_ID, ALCATEL_PRODUCT_X060S_X200),
 	  .driver_info =3D NCTRL(0) | NCTRL(1) | RSVD(4) },
 	{ USB_DEVICE(ALCATEL_VENDOR_ID, ALCATEL_PRODUCT_X220_X500D),
--=20
2.21.0
