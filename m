Return-Path: <linux-usb+bounces-3530-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D233800170
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 03:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B4871C20C4D
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 02:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 235001FB6;
	Fri,  1 Dec 2023 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="e1pbDTVg"
X-Original-To: linux-usb@vger.kernel.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E723E13E;
	Thu, 30 Nov 2023 18:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=oV3Mw
	Nn4l5UCMKMMhFzmpSsC7lPc9xb/Zeakfk8Rxt0=; b=e1pbDTVgLfrEgOXK4q1/Q
	dYST1gBg8DFIXD2JXD+5wdAfcd/rIvg8JBDIkLW52d6unS64w39Mt2nuJEN6aQBl
	AX9pmgAaVrfCETHxRinDdA6LPqT64rjzdk6QXp8ftptLy/E3v0zI+Do775EC/Y92
	2j1lTuRkU7mDMO7nPmDEC8=
Received: from test.web.setting (unknown [223.160.225.51])
	by zwqz-smtp-mta-g4-3 (Coremail) with SMTP id _____wD3P3BxQGllZQIzCg--.56146S2;
	Fri, 01 Dec 2023 10:09:55 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	johan@kernel.org
Cc: slark_xiao@163.com
Subject: [PATCH] USB: serial: option: add Foxconn T99W265 with new baseline
Date: Fri,  1 Dec 2023 10:09:50 +0800
Message-Id: <20231201020950.34770-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P3BxQGllZQIzCg--.56146S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy5Jr13Ww15ur4DJw1UJrb_yoW8Aw18pF
	n0yry3ZrZ5XayrWFy0yr4rAF95Wan5K343KasrAw1aqFyfArsrt34xtryFqF1S9rs3KrnF
	vr4DGw4UK3WrArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjfOrUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiMBk5ZFWB2UXL8QAAsG

This ID was added based on latest SDX12 code base line, and we
made some changes with previous 0489:e0db.

Test evidence as below:
T:  Bus=02 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  3 Spd=5000 MxCh= 0
D:  Ver= 3.20 Cls=ef(misc ) Sub=02 Prot=01 MxPS= 9 #Cfgs=  2
P:  Vendor=0489 ProdID=e0da Rev=05.04
S:  Manufacturer=Qualcomm
S:  Product=Qualcomm Snapdragon X12
S:  SerialNumber=2bda65fb
C:  #Ifs= 6 Cfg#= 2 Atr=a0 MxPwr=896mA
I:  If#=0x0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
I:  If#=0x1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
I:  If#=0x2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
I:  If#=0x3 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
I:  If#=0x4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
I:  If#=0x5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)

0&1: MBIM, 2: Modem, 3:GNSS, 4:Diag, 5:ADB

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/usb/serial/option.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 4dffcfefd62d..b46ffe9c8d0d 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2242,6 +2242,8 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
 	{ USB_DEVICE(0x0489, 0xe0b5),						/* Foxconn T77W968 ESIM */
 	  .driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0da, 0xff),                     /* Foxconn T99W265 MBIM variant */
+	  .driver_info = RSVD(3) | RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0db, 0xff),			/* Foxconn T99W265 MBIM */
 	  .driver_info = RSVD(3) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x0489, 0xe0ee, 0xff),			/* Foxconn T99W368 MBIM */
-- 
2.34.1


