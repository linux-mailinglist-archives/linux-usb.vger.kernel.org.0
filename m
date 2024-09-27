Return-Path: <linux-usb+bounces-15538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 304E8988679
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 15:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D00531F2339B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Sep 2024 13:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF5019C547;
	Fri, 27 Sep 2024 13:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwM3EbyL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AFF4C98
	for <linux-usb@vger.kernel.org>; Fri, 27 Sep 2024 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727444688; cv=none; b=WfR9+1f2oyqpFS9Wya4WtBa1FPaVXg/uTZoRBmTou8a3TZFjSg5pcXHhGAvjlULETtCy9iutaBWSQmrREQIpijvyvAONqCtj/ed72OsP5UH1FFNP5QKoicCeJ0l0jvKoHj+modwPLZlEYPK8Zk8419z2r5ZJwPGsjzBiQgAKVEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727444688; c=relaxed/simple;
	bh=WnkGvpsF+zPCY8ZNlCqdmbdL1EgaUsJ+FhvjJPry82M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7Z5PQ6D6t2xzrKaEIoQwPue/zZ62JUrchFKlkExYqyrj8LqqNz+3WP6PSL7iZLqZy0x2RT0kvJdBwzW+88Qkka1aklLEDLMLFR0CPbV3OfETawnLUUIF+hIpHcVkxCKFpUmYtMs48GBU7FB5D/EbTMHpBMlZ73+iolfXryOmFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwM3EbyL; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365c512b00so2783302e87.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Sep 2024 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727444685; x=1728049485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hLn8n2gvPTOwqNF3RJ4un+JqcWSbmYXJm2ijPBUa1w=;
        b=IwM3EbyLCJ6J9g0Do2fYIx94C3RsFYALJBGk70Qqv36xTUEa/aRis1wM5D7YGyTRMd
         b95PLAzUv8PaIAbWGjXPL032c/ImQSwdpiI87QaqUx5oyj/6+VX0o1F8HRvDpgXfeaFz
         RYKQc6TKLlGDMO6O+yeVwq8oyW9iI5jhXPNe39JagZp2cmEBfxcCWMrt8G3TuIHhN2X1
         4E0/YyTEwbMcWNu4X1O36LvCMEGVn6GTmrJa8pH1eM6f2iME5YVyvRRU5FtQNM4t8kzG
         f5ic8Uy/mtywVKCDhoipPyrUVL4ljS7eaRsc2tzUrxz6HCJYwi0Ms/dXG5aO3nSUDaLH
         4Yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727444685; x=1728049485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1hLn8n2gvPTOwqNF3RJ4un+JqcWSbmYXJm2ijPBUa1w=;
        b=vesIr2+p2b8qkQjC+fE0kYCh/E85UOpg71hstcrWXWrrV6+mC/bBQzlB+p4UOANor5
         qXxN7wsczCrZ9jYBNUCMS9Oqeh6lnXPppsEA1HXmJxYTkkQox7gDSWySm4qGZW5c2Be0
         FA5RnTJs+QvMWhIFCLifEtgjqJxODZmZFYbRG+j80QkHXdCzugAwVnVF05KboJIN6LA6
         sMCGzFtmDRtkSqPHTzzq4Yl4BrIrVqmPyGX7sL4lnQyoS9oBqFMuePdV5QGIbybJUDap
         Zk7WlV3xriF9Dt/MsNAtDMZGaOgr1ueXr8n/HgmPs1Q+EhnhTa/2iSzU1WFDSHCNe2Oe
         fpog==
X-Gm-Message-State: AOJu0YynGle1DyE3/m9GOnzs3fadmWTsvanCouC+piHI4q0OipUCIgjt
	9rpZkgZr92lughoTo3d+N/VS+mtLfpAbEfesBg1ULzk9isfJz4fRjB/Z6Q==
X-Google-Smtp-Source: AGHT+IH4j0jC/XsZeC4xuWYjHgrq9kYXu+p3c2mxZmFoOvPG8uS2DmtVmBcX/OlejVo//tWKgPT6OQ==
X-Received: by 2002:a05:6512:3c8e:b0:536:54db:ddd0 with SMTP id 2adb3069b0e04-5389fbc6660mr2295659e87.0.1727444684884;
        Fri, 27 Sep 2024 06:44:44 -0700 (PDT)
Received: from fedora.to.infn.it (eduroam.to.infn.it. [192.84.137.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245e763sm1169997a12.50.2024.09.27.06.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 06:44:44 -0700 (PDT)
From: Fabio Luongo <f.langufo.l@gmail.com>
To: linux-usb@vger.kernel.org
Cc: oneukum@suse.com,
	Fabio Luongo <f.langufo.l@gmail.com>
Subject: [PATCH] Add support for JULABO PRESTO to cdc_acm
Date: Fri, 27 Sep 2024 15:44:04 +0200
Message-ID: <20240927134404.110284-1-f.langufo.l@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

JULABO PRESTO chillers on Windows use the usbser.sys driver
for communication, so the same functionality should be achievable
on Linux using the cdc_acm driver.

However, cdc_acm does not accomodate the quirkness of these devices,
as they fail normal probing ("Zero length descriptor references"),
but they also feature a single USB interface instead of two.

This patch extends the effect of the `NO_UNION_NORMAL` quirk
to cover the features of JULABO PRESTO devices.

Signed-off-by: Fabio Luongo <f.langufo.l@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 605fea461102..d77c84c6e878 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1210,6 +1210,8 @@ static int acm_probe(struct usb_interface *intf,
 	if (quirks == NO_UNION_NORMAL) {
 		data_interface = usb_ifnum_to_if(usb_dev, 1);
 		control_interface = usb_ifnum_to_if(usb_dev, 0);
+		if (!data_interface)
+			data_interface = control_interface;
 		/* we would crash */
 		if (!data_interface || !control_interface)
 			return -ENODEV;
@@ -1284,6 +1286,8 @@ static int acm_probe(struct usb_interface *intf,
 	if (data_intf_num != call_intf_num)
 		dev_dbg(&intf->dev, "Separate call control interface. That is not fully supported.\n");
 
+skip_normal_probe:
+
 	if (control_interface == data_interface) {
 		/* some broken devices designed for windows work this way */
 		dev_warn(&intf->dev,"Control and data interfaces are not separated!\n");
@@ -1303,8 +1307,6 @@ static int acm_probe(struct usb_interface *intf,
 		goto made_compressed_probe;
 	}
 
-skip_normal_probe:
-
 	/*workaround for switched interfaces */
 	if (data_interface->cur_altsetting->desc.bInterfaceClass != USB_CLASS_CDC_DATA) {
 		if (control_interface->cur_altsetting->desc.bInterfaceClass == USB_CLASS_CDC_DATA) {
@@ -1787,6 +1789,9 @@ static const struct usb_device_id acm_ids[] = {
 	{ USB_DEVICE(0x0572, 0x1349), /* Hiro (Conexant) USB MODEM H50228 */
 	.driver_info = NO_UNION_NORMAL, /* has no union descriptor */
 	},
+	{ USB_DEVICE(0x233c, 0x7633), /* JULABO PRESTO */
+	.driver_info = NO_UNION_NORMAL,
+	},
 	{ USB_DEVICE(0x20df, 0x0001), /* Simtec Electronics Entropy Key */
 	.driver_info = QUIRK_CONTROL_LINE_STATE, },
 	{ USB_DEVICE(0x2184, 0x001c) },	/* GW Instek AFG-2225 */
-- 
2.46.1


