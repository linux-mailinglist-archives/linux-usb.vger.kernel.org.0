Return-Path: <linux-usb+bounces-33719-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPrpEy3gn2lbegQAu9opvQ
	(envelope-from <linux-usb+bounces-33719-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 06:54:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB21A1A122E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 06:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D99DF30CF036
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 05:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ED438B7D4;
	Thu, 26 Feb 2026 05:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nJ5EzEGh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA02538B7B8
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 05:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772085202; cv=none; b=KMWc+21xw/LIVZARlOZygrNt8ns1C/adhnmFXjQwCRO/PDiyGaETNhUmgXf5rEUuNhFnw4av041ziAIeK+fH0kYjjTIVK6RLSNI4/42/vuDmI2nz1ajHy6B12mifeQZRxFssujvSfrQoiXb3ltKe6gCCgDVDn/pPOTwYVQXwxFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772085202; c=relaxed/simple;
	bh=5PZ8CggFuOHWg9Rc+M/mGjcAtyt2FOwDfgn4r8JYe38=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a5tyZKLmtOGLrnLF5l/LjlYzvq1dJ1FkVt98VL45cMOS4MKlxDZQQFy05zKZz0uUYCfv8dJbPqYSAxw59G5zVdagZmXUMFD5CEU22FYiJeb4t/SZTygtRjmee5/2i6S8ApQCtRsupvpb2mib8jSe0eaIj3IFxWgthlskz43MMqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nJ5EzEGh; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-126e8ee6227so742190c88.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 21:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772085200; x=1772690000; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkHfgITQ7X2diSbprSgbvJHo2GTsX0M8Rs/FPJ/8x+8=;
        b=nJ5EzEGhJv6NmwB4nf2mwyPuJnrPiy9O22MdUKN8QI4muUNlT996WHs8KJMUlxtE8N
         cFiKEUk7NBspLKBA68rdwRDIo274+R4Y35st47VUzHp/w/g74+2eKCSVg9EilehRf+Gv
         DBwNtd2hPuFFC73XhB1iIcNzEDj/lETGUdsz76shNWHU6JNoniZ0kbx0yvChQfG+xQZ5
         +Qw5oYDr3m5neNpLtGKbVG/VECbaXPWAcR5YUdoZ353SoIV4NNnLntRvFi57UoDNxoZ1
         vhVzXlUenosXwYTLrM57wCNZY9sJrKDbsSVHKqeXR0lM5mzrivLBhO4JYYb1sKYpPP9j
         /78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772085200; x=1772690000;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkHfgITQ7X2diSbprSgbvJHo2GTsX0M8Rs/FPJ/8x+8=;
        b=IHuwDSTZX6SJoj/G7xlPMmwRxWHCsvqbroBd4/vNduZhpdXAKUHFPvDKHNI6RLvluO
         73L9CImBVVR8sw5x1EO6RNKJTywHajE1bFZx4GXeZEODcQo8Q+X3rLneqT/BUhzZNVk/
         y4ye0NWtGsTlQtB8g3yQdNGH7nG2SpTZnvGOhlBlHivdBerrx8KKheGNMjDY92Myo7vD
         bom9H2+efgNNlMjjAKujbgQ7H86jAO4PWol5u678tKkcxkS+xF2GJsnVEv+p9C8aQ1E/
         5xWbellNN7u741iQfxwKJ/N+P97jQ410XoxAJmqa+Ws6MioFPm8zsV+egbus2JBZ9Xil
         oIgw==
X-Forwarded-Encrypted: i=1; AJvYcCV2eIHLqlmAzKjjBYskTppAvpjOUrq5QmcB9rUn6LqaczQDmDNYYiR82cdWke5FZeSqO5BDBt3smAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJyGE8ugYfl/pJHmsSKtPL8idwtTYjjRFZ/pKyZdEFp3Z7Ojxx
	zuPx/SFLG38gLChr0mSq0IyGPqYFCsT+zKrK5fBwp6eSr7mKSXfEJ4AymJhgH7d3Iyeb+raxdX8
	C8brNWg==
X-Received: from dlbuy16.prod.google.com ([2002:a05:7022:1e10:b0:127:32c4:b97b])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4384:b0:11a:fec5:d005
 with SMTP id a92af1059eb24-12789c76961mr613663c88.10.1772085199939; Wed, 25
 Feb 2026 21:53:19 -0800 (PST)
Date: Thu, 26 Feb 2026 05:53:10 +0000
In-Reply-To: <20260226055311.2591357-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260226055311.2591357-1-badhri@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226055311.2591357-3-badhri@google.com>
Subject: [PATCH v1 2/3] power: supply: Add PD SPR AVS support to USB type enum
From: Badhri Jagan Sridharan <badhri@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Sunil Dhamne <amitsd@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33719-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DB21A1A122E
X-Rspamd-Action: no action

Add two new members to the power_supply_usb_type to represent the
USB Power Delivery (PD) Standard Power Range (SPR) Adjustable Voltage
Supply (AVS) charging types:

POWER_SUPPLY_USB_TYPE_PD_SPR_AVS: For devices supporting only the
PD SPR AVS type.

POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS: For devices that support both
PD Programmable Power Supply (PPS) and PD SPR AVS.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/power/supply/power_supply_sysfs.c | 2 ++
 include/linux/power_supply.h              | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
index dd3a48d72d2b..f30a7b9ccd5e 100644
--- a/drivers/power/supply/power_supply_sysfs.c
+++ b/drivers/power/supply/power_supply_sysfs.c
@@ -70,6 +70,8 @@ static const char * const POWER_SUPPLY_USB_TYPE_TEXT[] = {
 	[POWER_SUPPLY_USB_TYPE_PD]		= "PD",
 	[POWER_SUPPLY_USB_TYPE_PD_DRP]		= "PD_DRP",
 	[POWER_SUPPLY_USB_TYPE_PD_PPS]		= "PD_PPS",
+	[POWER_SUPPLY_USB_TYPE_PD_SPR_AVS]	= "PD_SPR_AVS",
+	[POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS]	= "PD_PPS_SPR_AVS",
 	[POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID]	= "BrickID",
 };
 
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 360ffdf272da..7a5e4c3242a0 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -210,6 +210,9 @@ enum power_supply_usb_type {
 	POWER_SUPPLY_USB_TYPE_PD,		/* Power Delivery Port */
 	POWER_SUPPLY_USB_TYPE_PD_DRP,		/* PD Dual Role Port */
 	POWER_SUPPLY_USB_TYPE_PD_PPS,		/* PD Programmable Power Supply */
+	/* PD Standard Power Range Adjustable Voltage Supply */
+	POWER_SUPPLY_USB_TYPE_PD_SPR_AVS,
+	POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS,	/* Supports both PD PPS + SPR AVS */
 	POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID,	/* Apple Charging Method */
 };
 
-- 
2.53.0.414.gf7e9f6c205-goog


