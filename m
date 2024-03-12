Return-Path: <linux-usb+bounces-7848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ABD878E4F
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E821C221C0
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984F5182CF;
	Tue, 12 Mar 2024 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etubsTLo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34603984D
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222978; cv=none; b=k1meBBMwkamuSlEHaSkIc8F8wBNCQrM8cSo7ST4o2t5uPGwyvwVwdlzaLVGETUKCjrYc10R0fTShrefyr+CYjiki+Hjn9AV/k1lDwS4yQMYMjh9GNaj24w30pdSnUa4lzwO+7ywzwnyuEmwBBsnAfur+ki/3crUURR2+MCDr9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222978; c=relaxed/simple;
	bh=NfwcbhR5aa39GTFpbvoYtRIeiLvtfmSJKvhlGGDL/wE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfuzxJc/kQBY+U9hDI/iiHKI/DxugZncAhPsDywZp2xEIiJcZ49FQxTe7cTZLB+n5RX515GG3pML8BhR7QxXo9dulNuHyk9fR29MTzaJbyBE/7adm6fOfL6fX63EedMC25e/+S9HKMz7cefXk++adTJ5mnkjEuGYNStFXv9jTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etubsTLo; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6e0f43074edso3529204a34.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222976; x=1710827776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bipMtOGV/gTPSxHYeSqPV+LKKjbQyn34/0Nkf0Hyhc=;
        b=etubsTLooNEMdOfiEgHoAUeUY9UU3MQT8Ghvv9m8HFowgbJabawTLhvUIILLH5m1nY
         e3CnTehTtf6ZP/tg261MwyezvMKdPYVlaC86zNtSrhVACNuuz1RfQachef4Nn7ZE79Db
         K2DOi/8W4LioTpDgG9aWwRJIOjPk6IY/fSgpRa/VAV1X+YsM0B5jqfD7kaiS9+HFrLfH
         +nHkiOZk58KjER9GxVrwqzT0No4XNRK9XHgSNqtjsbXGTuMferUzkosQXguadedub7+R
         po8FWiCN29DuSQDgxnsYNFRfz6XqNfsXIYXOqQO41bqLk/taC6Q8HCDtKc7d8ddbwcJV
         2RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222976; x=1710827776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bipMtOGV/gTPSxHYeSqPV+LKKjbQyn34/0Nkf0Hyhc=;
        b=d35CioVYLxt+chgkVo5SaYL1gN/DYDCGVijSMTTPTJPooZCdBGFGisltVTu/y93NjT
         HGAWJ/2BfhcBDtFdvGxtItmFVLg8t4JU9paLAhnfpW0aJwYR+Bo4xYi2KktNsA6Mx6oa
         NPRWHL3BM2EEOfrA0k9bW5OCR3tGQK/Rb2vMA4uMXnCKnoNw/Nzys1NLzJXx15LgClPr
         jSKhovkV7npx2QlWpg+5laujM+C24Q1OuBq3LHSPB/ENQwzsO4tgUFWZQ6PEcA/JZ+mH
         XfMK4IiDg14+e1tm1D0q5mWONMPG6o35lyuNuuSB/fmYC9zxRo9n0rCfC6SXHFcOiA7w
         z4hw==
X-Forwarded-Encrypted: i=1; AJvYcCVjlvqWYFpLcPGNt4bPp6j0RUE6ahZaJcq2vH6qSJBepLZBoiCohx6vk6yErXWykWXLImNlvIFjZBl2j7/MxKIGa64o1WqzPgss
X-Gm-Message-State: AOJu0YzuRjdruWal4+sFieRWjgeEhnkCs3w31K53QViYYtzLCaA0u72q
	CuDUo5m0wgoom9DdwdjAGRYPtoN0j2VYnSo/50zAjoedkbJq9AyM
X-Google-Smtp-Source: AGHT+IEEPBR0WadFpkeHeRyELxle/6vAx1+ttD0XNfRRI7+hZIvsIVceYuaZLrN1plY2c1h7n10ZEA==
X-Received: by 2002:a05:6870:96ac:b0:21e:80ee:523b with SMTP id o44-20020a05687096ac00b0021e80ee523bmr7297638oaq.34.1710222975622;
        Mon, 11 Mar 2024 22:56:15 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:15 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 5/7] usb: misc: uss720: document the names of the compatible devices
Date: Mon, 11 Mar 2024 23:50:30 -0600
Message-ID: <20240312055350.205878-5-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Information about 04b8:0002 and 05ab:0002 is from commit e3cb7bde9a6a
("USB: misc: uss720: more vendor/product ID's", 2018-03-20). The rest
are from <http://reboots.g-cipher.net/lcd/>.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index be7d3fa4c150..15cafc7dfd22 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -767,14 +767,14 @@ static void uss720_disconnect(struct usb_interface *intf)
 
 /* table of cables that work through this driver */
 static const struct usb_device_id uss720_table[] = {
-	{ USB_DEVICE(0x047e, 0x1001) },
-	{ USB_DEVICE(0x04b8, 0x0002) },
-	{ USB_DEVICE(0x04b8, 0x0003) },
+	{ USB_DEVICE(0x047e, 0x1001) }, /* Infowave 901-0030 */
+	{ USB_DEVICE(0x04b8, 0x0002) }, /* Epson CAEUL0002 ISD-103 */
+	{ USB_DEVICE(0x04b8, 0x0003) }, /* Epson ISD-101 */
 	{ USB_DEVICE(0x050d, 0x0002) },
-	{ USB_DEVICE(0x050d, 0x1202) },
+	{ USB_DEVICE(0x050d, 0x1202) }, /* Belkin F5U120-PC */
 	{ USB_DEVICE(0x0557, 0x2001) },
-	{ USB_DEVICE(0x05ab, 0x0002) },
-	{ USB_DEVICE(0x06c6, 0x0100) },
+	{ USB_DEVICE(0x05ab, 0x0002) }, /* Belkin F5U002 ISD-101 */
+	{ USB_DEVICE(0x06c6, 0x0100) }, /* Infowave ISD-103 */
 	{ USB_DEVICE(0x0729, 0x1284) },
 	{ USB_DEVICE(0x1293, 0x0002) },
 	{ }						/* Terminating entry */
-- 
2.44.0


