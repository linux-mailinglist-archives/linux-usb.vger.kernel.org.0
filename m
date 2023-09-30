Return-Path: <linux-usb+bounces-849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5547B43A2
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 22:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 7CB17282DBD
	for <lists+linux-usb@lfdr.de>; Sat, 30 Sep 2023 20:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F8418C23;
	Sat, 30 Sep 2023 20:39:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6F156DF
	for <linux-usb@vger.kernel.org>; Sat, 30 Sep 2023 20:39:07 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68790EB;
	Sat, 30 Sep 2023 13:39:05 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c12fc235fbso22919201fa.0;
        Sat, 30 Sep 2023 13:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696106343; x=1696711143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5cerKNWvS8XiVyEtmI4Mu62KK5k+ONMdTROPcJPxoeU=;
        b=M0Wo/fLNRePtib6grY1YIO1GJjP/EvB5QOGLsGR2HkrImSRoRHZpTcnPy57/DWisCs
         Kc47X+1zYzfQGgjMMQtmSYc/pviCv5WAQ2T3wvW/WNGBNtdIgglgzrJ5MN/qs6LMjKNv
         L9q+dZdf0QLMG/64GmbGPFUEpPb87rDOCqWMQTmSov1MB/tb49vl+sfPuUMiYVsz18Em
         ro8VOJMymHzYiTaSwL6JrHOK58oox0XHqCz/TX4fnyf+vL6ZOuJjc2+EkG/OwI5eYFwK
         1b0d0VaqzYmZ9+UOItadR6IaG0vBjUtqstMX3/x9YZrAP+DeH+bKfgwSMJxwo5YOn4uv
         2EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696106343; x=1696711143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cerKNWvS8XiVyEtmI4Mu62KK5k+ONMdTROPcJPxoeU=;
        b=jNkGtRSMJKxl2b9l8h0yoJDidrivZ4BsvaIbXz/yXNZOnko2vndtNMnByWkOo7S/0m
         2r7euubC+Klp8ttiwNhpdCOMG/rIBcmGO12aVFdtvFyS33KBLgGnT9fmwJRcUBi5/vcn
         8NYHN/O/KS40zTI6fElJY55pM34UZEQrchE+4F9h/Z1BRI6jeJwLR442O3NC9SSfCqug
         IOgVj9LNgV2JIq2i2HWwN61htJOVv7NAwlcdjgf69DeFr7dXw26S1G1/L/gVK9uJKC+5
         eHhb4RNlABxXDoey3TMwLP2C0pwTUqitq/BEV6fEUyxzjqx/zAqjrpvg3xOey2PbeXl8
         DErg==
X-Gm-Message-State: AOJu0YxqDWalN1OQjfhnbUQwyd1Jp1K9MpPGwq6zJQR3BY2LegT/IZP4
	GXjWZF933EGQ27ioR4SI7Mk=
X-Google-Smtp-Source: AGHT+IGB6KYoBU4XTvyWWjQrE+XbD23Dh0jKU/XIEWPyceNspe4d+02zxdquntYKzL5qCHiOTc35Bg==
X-Received: by 2002:a05:651c:105:b0:2bc:bc6f:e296 with SMTP id a5-20020a05651c010500b002bcbc6fe296mr6645396ljb.13.1696106343408;
        Sat, 30 Sep 2023 13:39:03 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d3-20020a2eb043000000b002c017a56a1asm4579579ljl.70.2023.09.30.13.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 13:39:03 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 3/3] drivers: usb: Remove unnecessary spaces before function pointer arguments
Date: Sat, 30 Sep 2023 22:38:51 +0200
Message-Id: <20230930203851.61914-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Fixed formating error where unnecessary spaces were included before
function pointer arguments and was flagged as a checkpatch issue.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/usb/atm/usbatm.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/atm/usbatm.h b/drivers/usb/atm/usbatm.h
index 500c91b418e4..5b1719a58959 100644
--- a/drivers/usb/atm/usbatm.h
+++ b/drivers/usb/atm/usbatm.h
@@ -74,20 +74,20 @@ struct usbatm_driver {
 	const char *driver_name;
 
 	/* init device ... can sleep, or cause probe() failure */
-	int (*bind) (struct usbatm_data *, struct usb_interface *,
+	int (*bind)(struct usbatm_data *, struct usb_interface *,
 		     const struct usb_device_id *id);
 
 	/* additional device initialization that is too slow to be done in probe() */
-	int (*heavy_init) (struct usbatm_data *, struct usb_interface *);
+	int (*heavy_init)(struct usbatm_data *, struct usb_interface *);
 
 	/* cleanup device ... can sleep, but can't fail */
-	void (*unbind) (struct usbatm_data *, struct usb_interface *);
+	void (*unbind)(struct usbatm_data *, struct usb_interface *);
 
 	/* init ATM device ... can sleep, or cause ATM initialization failure */
-	int (*atm_start) (struct usbatm_data *, struct atm_dev *);
+	int (*atm_start)(struct usbatm_data *, struct atm_dev *);
 
 	/* cleanup ATM device ... can sleep, but can't fail */
-	void (*atm_stop) (struct usbatm_data *, struct atm_dev *);
+	void (*atm_stop)(struct usbatm_data *, struct atm_dev *);
 
 	int bulk_in;	/* bulk rx endpoint */
 	int isoc_in;	/* isochronous rx endpoint */
-- 
2.34.1


