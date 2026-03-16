Return-Path: <linux-usb+bounces-34885-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAfKBPAbuGlYZAEAu9opvQ
	(envelope-from <linux-usb+bounces-34885-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:04:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F329BF33
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:04:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5C19F300FED1
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 15:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBA530214D;
	Mon, 16 Mar 2026 15:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DWIkJ5bd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f73.google.com (mail-dl1-f73.google.com [74.125.82.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E4C31B131
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 15:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673391; cv=none; b=CEfXwU5Huxz5fWy3CnAUZquDEgF0aJ3oaVufETUb2iW5LLkXOxxQS+DREq4BAGqBwNqcXN6MnbnvrHHbcaQFZ81tEZFex7KmdbkGdLRfuTpxr2VOtSiZxgCtpQ+P4IYAJDYs60JBrcSk+7nD7UNuSOO0+qBiE+OFk7krl21810Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673391; c=relaxed/simple;
	bh=FAgn8PATspMB+pVd+tPE4w1KID3ZX0qCAzJbN6EYHd8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pPeZkfvhfotkT2pf6XVscmbgcFDVmlnKRogynx34mTljhYc89fQEAxJPWD0siSI8o8buLO0+aMAIl3XIp//QHKjArCfxZSeZA2+ZIsC6ZiZBsk8rfVAfvrw4CneI1Zg+B1I4jzC42ddLyGUJtBcLWQcbDpuEexh+Z3yRg2074/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DWIkJ5bd; arc=none smtp.client-ip=74.125.82.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-dl1-f73.google.com with SMTP id a92af1059eb24-1276e71652fso5414851c88.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773673388; x=1774278188; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlmlDuwufDiMYRaMF84SHpudU9RqQKI1UxXXTehJXjg=;
        b=DWIkJ5bdRc5rhsla3JsCMOhHQUb7puHBUvoEjv0JaP6KvJavtyR0CVpRx5Lc0FMaj5
         DZ/Qpxhekm470MJa7v1l00KrHEq+YjL5GE3gKfVfuXo9dXwpSlMEEc4NtpKuMC2ACnmW
         222Mz8J8bbPwjxtzDYPjyQ+Ur4mDaP+Kq0FeRHVGhS2LOMhRjuwTnW55sR+cAuMR0Prs
         6cEOlf2RLYicKjRtg9tAWep+JjF01Zsc5sxRr8ffFC4dHw9gaFxnI3cst6NtmKXML0sP
         cH6XR04CXH7owcdWLsyJcHGqz1rvQseA0vdq1wpXvyfUrFo4NAvD2aSB58IaM6FHdVSv
         rAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673388; x=1774278188;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlmlDuwufDiMYRaMF84SHpudU9RqQKI1UxXXTehJXjg=;
        b=WHF7RsKJzpNrtxFcmPmXG0rY9buuNKn23ndswYAJLNmVsdb2OOdxkb6uAxvzj65OlR
         Ye0xiUcRKv8CiQ3EbvM9dbW1qHeWi8kNCeAFLRZSfO4ySdy6qbjvIQ3Jy7v7EO+8MVzL
         NDT3evaiCp/4Tl1RLWvdb6OUycePtykonLBYDzXDyo3h43weMaEzf4MzJ/j9ydG/cpxz
         /+JK/WiBTot2+nU5BqVdjPJngdLGNDZiHEzd8iDI1FbcDxfGdRNKM7vHyb0DPrYlKa66
         d1TwyBgrlpnuJV5GVkyD44U+tf2iFZ7lPwsFLAT6M5smABWzp0ATN7bzG7fbhRoa9d71
         wxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/3S1cwagZdkoL3kOEIs7UcwGHhEiBxywfjn0FpLIYp7T1ECElT0fpdLNuOGYjWF/4yJB7vac+864=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8+cGgjCg8qMitnO421UDY/hzom+h7wZqZQ854TmqsBnHH1OK
	ReuhRNmZoM/NnXd+olNUFXg2WaAM4OYXEBjBKu1uFRHMALt2ZdNqs48TeoQQHyjNG1obwVlkqJX
	bDSv01A==
X-Received: from dlae14.prod.google.com ([2002:a05:701b:230e:b0:128:d97e:9ee4])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1602:b0:123:2d38:928e
 with SMTP id a92af1059eb24-128f3df8ea9mr5063477c88.35.1773673387856; Mon, 16
 Mar 2026 08:03:07 -0700 (PDT)
Date: Mon, 16 Mar 2026 15:03:00 +0000
In-Reply-To: <20260316150301.3892223-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260316150301.3892223-1-badhri@google.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260316150301.3892223-3-badhri@google.com>
Subject: [PATCH v2 2/3] power: supply: Add PD SPR AVS support to USB type enum
From: Badhri Jagan Sridharan <badhri@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Badhri Jagan Sridharan <badhri@google.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Amit Sunil Dhamne <amitsd@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34885-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 527F329BF33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add two new members to the power_supply_usb_type to represent the
USB Power Delivery (PD) Standard Power Range (SPR) Adjustable Voltage
Supply (AVS) charging types:

POWER_SUPPLY_USB_TYPE_PD_SPR_AVS: For devices supporting only the
PD SPR AVS type.

POWER_SUPPLY_USB_TYPE_PD_PPS_SPR_AVS: For devices that support both
PD Programmable Power Supply (PPS) and PD SPR AVS.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 Documentation/ABI/testing/sysfs-class-power | 3 ++-
 drivers/power/supply/power_supply_sysfs.c   | 2 ++
 include/linux/power_supply.h                | 3 +++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
index 4b21d5d23251..32697b926cc8 100644
--- a/Documentation/ABI/testing/sysfs-class-power
+++ b/Documentation/ABI/testing/sysfs-class-power
@@ -675,7 +675,8 @@ Description:
 
 		Valid values:
 			      "Unknown", "SDP", "DCP", "CDP", "ACA", "C", "PD",
-			      "PD_DRP", "PD_PPS", "BrickID"
+			      "PD_DRP", "PD_PPS", "BrickID", "PD_SPR_AVS",
+			      "PD_PPS_SPR_AVS"
 
 **Device Specific Properties**
 
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
2.53.0.851.ga537e3e6e9-goog


