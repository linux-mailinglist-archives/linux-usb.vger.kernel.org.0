Return-Path: <linux-usb+bounces-1646-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B857CA085
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 09:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02013B20ECE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 07:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869DA168C7;
	Mon, 16 Oct 2023 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGNWZ8kH"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A590316407
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 07:26:17 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30789E3;
	Mon, 16 Oct 2023 00:26:15 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53de0d1dc46so7195559a12.3;
        Mon, 16 Oct 2023 00:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697441173; x=1698045973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOSXwcuF+GSDreunSXbhvKj4nQkeji3aVTKc3F8VpKY=;
        b=AGNWZ8kH/UNwTnbPwHIs28mfCtQ6Ad0G0M5MRf94rWAcBGZrL7EpK3jN61XJAkB1Sq
         eIkORgy6ydsE6R3WXV2whihVLGejTnZk7FgSENO6Ki9ZOsfjLBZsTFuM8j0MTqlmrXMP
         gZwOT+eHWJXYHhLWXINFDjNVK/e4o31+K2YlD/7rFtJSJtsZ4mE/EnzZuhT7vmGyoN9Z
         asoEoWqFOj22xmu7PGSCevyNgHJ/3/frIERHs2OyptgdoGBdrByKkRuS5AaDRPzFz7E+
         SuctTyNZayy2UTYqVOSRNYU/6aF9YJzHO+KTRmh9XIuq4OeWjvnFQKL5Nk25lroa5F+T
         4TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697441173; x=1698045973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOSXwcuF+GSDreunSXbhvKj4nQkeji3aVTKc3F8VpKY=;
        b=HAIlu6/+dLIoSMYQYkPboCXpKdngylX5ah2K6WWADkSL9s9QvPqQ+0uspo7EHFLfWB
         CuNzTmilI/o9HHKeexcKC55FVITlL7wfyBu6KHvQPGHc/NBP3dJ8fe2kUgqkA304ilLX
         JgqlVWV6w3piEbjZckQPCHj+ircItFaJHARl6WHJXDx/K91t/7KsfDI/gM/ADkWi8m8F
         ZntwUbKcffYB1FflgmC9JrSKoVbCVAiJOYBbYrdj4EwrXYzNUfrgLGyWOnZ3naw/Qk+z
         kbmshY30j+dCdIJxPLLfDJ/2+1g7rgdNSZ2nTj73NX8Lvc4pPSY8RSZRLHblTPCzmBNB
         tjnA==
X-Gm-Message-State: AOJu0YzMzE1vkT9E0jCbmPfGU5R+a7Re1FMw9n1GHFF4hCA6vA05O5/+
	VYVidLoe7f/ScvUofjxuk8sFjhZroYdaKg==
X-Google-Smtp-Source: AGHT+IHrIgCPnkFV+WXt1uCcBlpFFNAPTJj/iymXR4CrSQnNyTqd5IhaQPVir5ePxZNr4rgqU/rQSw==
X-Received: by 2002:a17:906:3050:b0:9ad:df85:97ae with SMTP id d16-20020a170906305000b009addf8597aemr27905837ejd.66.1697441173435;
        Mon, 16 Oct 2023 00:26:13 -0700 (PDT)
Received: from sauvignon.fi.muni.cz ([2001:718:801:22c:bdcb:518:be8f:6a76])
        by smtp.gmail.com with ESMTPSA id n25-20020a17090673d900b0099297782aa9sm3399980ejl.49.2023.10.16.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:26:13 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: linux-usb@vger.kernel.org
Cc: usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org,
	stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org,
	oneukum@suse.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [PATCH 1/7] usb-storage: remove UNUSUAL_VENDOR_INTF macro
Date: Mon, 16 Oct 2023 09:25:58 +0200
Message-ID: <20231016072604.40179-2-gmazyland@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016072604.40179-1-gmazyland@gmail.com>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

This patch removes macro that was used only
by commit that was reverted in commit ab4b71644a26
("USB: storage: fix Huawei mode switching regression")

Fixes: ab4b71644a26 ("USB: storage: fix Huawei mode switching regression")
Signed-off-by: Milan Broz <gmazyland@gmail.com>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/usb/storage/usb.c          | 12 ------------
 drivers/usb/storage/usual-tables.c | 15 ---------------
 2 files changed, 27 deletions(-)

diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
index 7b36a3334fb3..bb1fbeddc5aa 100644
--- a/drivers/usb/storage/usb.c
+++ b/drivers/usb/storage/usb.c
@@ -110,17 +110,6 @@ MODULE_PARM_DESC(quirks, "supplemental list of device IDs and their quirks");
 	.useTransport = use_transport,	\
 }
 
-#define UNUSUAL_VENDOR_INTF(idVendor, cl, sc, pr, \
-		vendor_name, product_name, use_protocol, use_transport, \
-		init_function, Flags) \
-{ \
-	.vendorName = vendor_name,	\
-	.productName = product_name,	\
-	.useProtocol = use_protocol,	\
-	.useTransport = use_transport,	\
-	.initFunction = init_function,	\
-}
-
 static const struct us_unusual_dev us_unusual_dev_list[] = {
 #	include "unusual_devs.h"
 	{ }		/* Terminating entry */
@@ -132,7 +121,6 @@ static const struct us_unusual_dev for_dynamic_ids =
 #undef UNUSUAL_DEV
 #undef COMPLIANT_DEV
 #undef USUAL_DEV
-#undef UNUSUAL_VENDOR_INTF
 
 #ifdef CONFIG_LOCKDEP
 
diff --git a/drivers/usb/storage/usual-tables.c b/drivers/usb/storage/usual-tables.c
index 529512827d8f..b3c3ea04c11c 100644
--- a/drivers/usb/storage/usual-tables.c
+++ b/drivers/usb/storage/usual-tables.c
@@ -26,20 +26,6 @@
 #define USUAL_DEV(useProto, useTrans) \
 { USB_INTERFACE_INFO(USB_CLASS_MASS_STORAGE, useProto, useTrans) }
 
-/* Define the device is matched with Vendor ID and interface descriptors */
-#define UNUSUAL_VENDOR_INTF(id_vendor, cl, sc, pr, \
-			vendorName, productName, useProtocol, useTransport, \
-			initFunction, flags) \
-{ \
-	.match_flags = USB_DEVICE_ID_MATCH_INT_INFO \
-				| USB_DEVICE_ID_MATCH_VENDOR, \
-	.idVendor    = (id_vendor), \
-	.bInterfaceClass = (cl), \
-	.bInterfaceSubClass = (sc), \
-	.bInterfaceProtocol = (pr), \
-	.driver_info = (flags) \
-}
-
 const struct usb_device_id usb_storage_usb_ids[] = {
 #	include "unusual_devs.h"
 	{ }		/* Terminating entry */
@@ -49,7 +35,6 @@ MODULE_DEVICE_TABLE(usb, usb_storage_usb_ids);
 #undef UNUSUAL_DEV
 #undef COMPLIANT_DEV
 #undef USUAL_DEV
-#undef UNUSUAL_VENDOR_INTF
 
 /*
  * The table of devices to ignore
-- 
2.42.0


