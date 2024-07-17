Return-Path: <linux-usb+bounces-12237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DA9334D5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 02:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FFA61F23447
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 00:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A781109;
	Wed, 17 Jul 2024 00:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uyEn5/QS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0CD848C
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 00:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721177489; cv=none; b=P5m2nac+T+G/EC+iB2j5pN1yf818a0ETvJBiWr5NTz9TyzblrxK058Rpr6Kb4AJun7txMZU/pX+N50h4ka7b7LsTqbUc+ikrz421TiJRarSwb60hoGqr70r8xYsLsvuROMGIB7n5GoPtOGDBKaKut/9lJpgUxgH9irqCD1sBwxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721177489; c=relaxed/simple;
	bh=imrdTBKFl9/ler02ONXWrJRcIjmutDnfzz+XiKEiY3w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HqEJrO05+t0tSWV3akTbGPXehMobyr1MPdxOkHLvRFMOJVsUKGDNrrdRcO/UDNy+iGGP88+caiVkYEQekhdfL6HHOvUKROkqf7n9e7BFIJ2yjjS8j59qqIUFtacTcrjkPOxM9kLf3JkG4DFagA3Gyqiz47uTNDv9QC2tJlizsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uyEn5/QS; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6511c587946so127333097b3.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 17:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721177487; x=1721782287; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssDYc+w2ZBOTZEW4SaOXob+zs6JJwedZnb8idSmatOU=;
        b=uyEn5/QS8n3nHDLDaN/Do694H85t8KqwVDP0WL9KiSf7eUfr8HuGb8GzasWKojQD56
         wqIu2tshIeHy5U9x+ass+kgnv2vhwOTbqGxNlUSggrOBi7P+2YmOgLkxU+8nEty/INg/
         hZ7rz5G8amu7n4axw51bI6EkslGvSQRHBmlSEO+FlBw0qyBok+nfNTyNZ8NCI1f37IXe
         qSuJ4b7+GkNCn5FWqgAbGZVBLmSTA62bmFmrdtfr5RSylYInMIrxISoHiGt2JL/+S5pT
         iey4mQWEFGXWxKnjBaAAxjNJlWfAkGpx0Cyt78cgb2TDleUCVUYXgmOLfciQna+Z6n51
         PmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721177487; x=1721782287;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssDYc+w2ZBOTZEW4SaOXob+zs6JJwedZnb8idSmatOU=;
        b=VlYiDI/Xp7O5ciRUoKxedPDp8FWuouEkb1jDfYl3RAjAsL+U/9FAz+GPgg3JF4vUSp
         zQ19lMkEWnBkdvAtfVFiz7IErRyYUfLd3Uad/NvvYINWGUolIx30OZ6WaSz41U/asTBP
         /17OjQ+Vf0w325uEByoPix7WgV/JnVnHaq50UhqTDOU1vOH22YdFGR5PB38xFd1O1zCf
         1CkcSI4kj7brpQ7NkeX9cwBXkpUQMIXfDv2u0FASMP32+4CJL05xL9Y0csJ9ErIlfMLe
         QkgNrdZJSoaEXwm8rQe1zLDLZq7uPd1C2vyO/XTX9SOkBuJb8c33mP4LSmNANdw/kxRg
         xsRg==
X-Forwarded-Encrypted: i=1; AJvYcCUrfJjyhF2btxAXB3E5XWmUofwPpFkiV+YYgePcUIBrw+fL3duJJFnOJSnDOEW8n9Xu33wXeLC95Rl42jp6fUIiziafj/+B6J9q
X-Gm-Message-State: AOJu0Yw8+kRgOYgiZJ3Bt/pdVYgasRog7iVZyk9unWMygDkSQ/dF+a86
	XHgvtE8K+UkfhxrHxiFcY9tSeQcUP5cgROQ18Cv5WsrTpu3aJyr2CqVjug5Y3eL00dODaT1qphj
	laA==
X-Google-Smtp-Source: AGHT+IGfziVk8mk/t5qqLgrjh2nAuQB6H4AHqRgQ9isrB7miUbLCHuZyYh4XWKyG4GLGSr/PpOKF+I1vupI=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a05:690c:660f:b0:62a:2a39:ccd9 with SMTP id
 00721157ae682-66500955504mr5567b3.6.1721177487061; Tue, 16 Jul 2024 17:51:27
 -0700 (PDT)
Date: Wed, 17 Jul 2024 00:49:47 +0000
In-Reply-To: <20240717004949.3638557-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240717004949.3638557-1-jthies@google.com>
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240717004949.3638557-3-jthies@google.com>
Subject: [PATCH v1 2/4] usb: typec: ucsi: Add USB PD DRP to USB type
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, bleung@google.com, abhishekpandit@chromium.org, 
	andersson@kernel.org, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	neil.armstrong@linaro.org, rajaram.regupathy@intel.com, 
	saranya.gopal@intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add POWER_SUPPLY_USB_TYPE_PD_DRP as a USB type in the UCSI power supply
driver. The DRP type is set when the partner supports USB PD and offers
both source and sink PDOs.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/psy.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index d0b52cee41d2..45113e013696 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -204,8 +204,12 @@ static int ucsi_psy_get_usb_type(struct ucsi_connector *con,
 
 	val->intval = POWER_SUPPLY_USB_TYPE_C;
 	if (flags & UCSI_CONSTAT_CONNECTED &&
-	    UCSI_CONSTAT_PWR_OPMODE(flags) == UCSI_CONSTAT_PWR_OPMODE_PD)
-		val->intval = POWER_SUPPLY_USB_TYPE_PD;
+	    UCSI_CONSTAT_PWR_OPMODE(flags) == UCSI_CONSTAT_PWR_OPMODE_PD) {
+		if (!con->partner_source_caps || !con->partner_sink_caps)
+			val->intval = POWER_SUPPLY_USB_TYPE_PD;
+		else
+			val->intval = POWER_SUPPLY_USB_TYPE_PD_DRP;
+	}
 
 	return 0;
 }
@@ -275,6 +279,7 @@ static enum power_supply_usb_type ucsi_psy_usb_types[] = {
 	POWER_SUPPLY_USB_TYPE_C,
 	POWER_SUPPLY_USB_TYPE_PD,
 	POWER_SUPPLY_USB_TYPE_PD_PPS,
+	POWER_SUPPLY_USB_TYPE_PD_DRP,
 };
 
 int ucsi_register_port_psy(struct ucsi_connector *con)
-- 
2.45.2.1089.g2a221341d9-goog


