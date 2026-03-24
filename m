Return-Path: <linux-usb+bounces-35379-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMedKRJpwmlScwQAu9opvQ
	(envelope-from <linux-usb+bounces-35379-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:36:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBA6306833
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92ED4309D3CB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED943E3DBE;
	Tue, 24 Mar 2026 10:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NWkxjUCx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7843BC670
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774348223; cv=none; b=rTXXkBUsj83h0yoAGXTOu+Y8AtmAh7D+HR/rvE9+PUmUR8hmi/0e97jNT14VwQRncUZEEIktXOvORD+5vdM+u5roiWn/yyS2Z3VLd8EM+1t/VZfVOm88VlUFi/c5lhlBJX8MYcRaXAeJh9V2NGrXWGcUAypSXwUb+/g3KhOLTfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774348223; c=relaxed/simple;
	bh=qmvn95qLYi5zD/L9ziLnVeERZqUjiU0m9oMXTSssOxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G0Ks2l01hXdhfmSy73JYe8W5/wlrwm/Defs3MLr7pb0nXvy1DJsXp45nuePGiUwuIAd0cWrEIuK31Gbj8r5NnEqtDa6mq6q0HWdEcGBcLX0uLfkvpPeiSeZjPDbiwYSA7aTWPubToMTwWYZSpG6fc1hGi3QUZ+ZVdOh91l6678c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NWkxjUCx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9793fa5371so694747466b.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774348218; x=1774953018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ5B9EsEVAtAKUbh3SIdMjXFUTqdrORMXqDWfN2cV3k=;
        b=NWkxjUCxEo0Wp6N8/JGTSoR2kVyB1LwvkSIk8He9g/jMAcwLAflHid8S8nqaqVyhFz
         6kPQsb1JZUmAEHeZEuUQLoAy7J8n1+Dq/IXLBzg4jKESSpWhKsmTyDCVyg2SA7/HCnRk
         MauLX6OyZjJKTVX295BWIzSUIuYnR4BHGffSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348218; x=1774953018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJ5B9EsEVAtAKUbh3SIdMjXFUTqdrORMXqDWfN2cV3k=;
        b=ljxyNMSfKfsR34bxHayceO7Drmi7OFSjPR0p3CMf7nnw856FDs6okXc7C3gO6dhEw8
         LGF8UNwcBWUUYD8ifRsWYiKkdgq6FtVrwNL291ksOXVVnVtc8FA2SoLiSo/2WfqxIUZ+
         S9NI1Bcn/6JuVdxjcwEPrKRdNtSCel5ldi0wOLuyB3d5RM6baX8+pUjG0rLpWF9uTbVR
         eFnIxoAho6czDDAc8U99W4yw34jOlodnngxvvvdv8j0ffwGkalSHeVqraJ+gk9ruKuF7
         fMTui7JCHJ+KgaqxB13hlhEIwVYlBXDTmSVxBA838bfb72wPVfN2JAM0gzGnP1Bam/EO
         Mb8g==
X-Forwarded-Encrypted: i=1; AJvYcCW693Qb7AvE4yvpulcwPWBHs0rmKhH/PxqD3yJAmR/4zdG7OTyB6w2ojGt752l7RwEmETfB8yY5Z2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlnDX200cKebmuNU5y4d5RlLBXo2dX+xcIzMgaMvzgj4a67K4g
	NXYM7LbvV3kwPFlyvIkXDXUJdS2gEpdKXBy/ORRubrnaTlilVbrQELCW0T6efZ5qRg==
X-Gm-Gg: ATEYQzyXKWLm2K0bGFjAFOJ7wipAA4TIrJWjnK+LLGt9R1tcdUwn5W0f6rdHyXd0Grx
	65e83NA4GXNNIpfvElg4MCaX3qzgRDC0cI54l+keP3uvTkIYzxNzNczoAtbLl3bgjhTR5ZByhFy
	GtcCIazTd5JLJmuOcrDdTt4t0bkvOSAgyTyUHPgC0hihySyswG3wSB8HmvZvO/UuKkeUnMu7FAn
	6962q78AQ+EAhSf4yqdRTsVuKdPwdvVA1WU+9yy/9utK8dLTPxwh6I9sUKgb70FN8ZHe2Kl5pkv
	Ula4pPCYUiQOr5zClu14fYeCBVckb6tmTsqT52gJtrO4819vMnPpgtxFwa7n+1YvNb9+s59JPPp
	ltYCsnEc/fsf5kZ/E5DgVTU40xNRpkdiUm1lwrRKGVFfhRHIxvT63QNR7UhtjZyaN9ZRyEKNX8a
	ZrMAd3OjndHgkSDyHBr6C5Iin1nwbcmlGumBYUhqKsztrdOTfN8MkbSbmclKHZVvgToHqdKnkRa
	Gn+0laXLydzLtbDQlT3Shw=
X-Received: by 2002:a17:906:b74d:b0:b96:f329:e66 with SMTP id a640c23a62f3a-b982f39b31dmr905699266b.51.1774348218439;
        Tue, 24 Mar 2026 03:30:18 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98416ac27asm496819666b.59.2026.03.24.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:30:17 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: [PATCH v2] usb: typec: thunderbolt: Set enter_vdo during initialization
Date: Tue, 24 Mar 2026 10:30:12 +0000
Message-ID: <20260324103012.1417616-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35379-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:dkim,chromium.org:email,chromium.org:mid]
X-Rspamd-Queue-Id: 2DBA6306833
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In the current implementation, if a cable's alternate mode enter operation
is not supported, the tbt->plug[TYPEC_PLUG_SOP_P] pointer is cleared by the
time tbt_enter_mode() is called. This prevents the driver from identifying
the cable's VDO.

As a result, the Thunderbolt connection falls back to the default
TBT_CABLE_USB3_PASSIVE speed, even if the cable supports higher speeds.
To ensure the correct VDO value is used during mode entry, calculate and
store the enter_vdo earlier during the initialization phase in tbt_ready().

Cc: stable@vger.kernel.org
Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes in V2:
- Marked as a Fix

 drivers/usb/typec/altmodes/thunderbolt.c | 44 ++++++++++++------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index c4c5da6154da9..32250b94262a9 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -39,28 +39,7 @@ static bool tbt_ready(struct typec_altmode *alt);
 
 static int tbt_enter_mode(struct tbt_altmode *tbt)
 {
-	struct typec_altmode *plug = tbt->plug[TYPEC_PLUG_SOP_P];
-	u32 vdo;
-
-	vdo = tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B1);
-	vdo |= tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
-	vdo |= TBT_MODE;
-
-	if (plug) {
-		if (typec_cable_is_active(tbt->cable))
-			vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
-
-		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
-		vdo |= plug->vdo & TBT_CABLE_ROUNDED;
-		vdo |= plug->vdo & TBT_CABLE_OPTICAL;
-		vdo |= plug->vdo & TBT_CABLE_RETIMER;
-		vdo |= plug->vdo & TBT_CABLE_LINK_TRAINING;
-	} else {
-		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
-	}
-
-	tbt->enter_vdo = vdo;
-	return typec_altmode_enter(tbt->alt, &vdo);
+	return typec_altmode_enter(tbt->alt, &tbt->enter_vdo);
 }
 
 static void tbt_altmode_work(struct work_struct *work)
@@ -337,6 +316,7 @@ static bool tbt_ready(struct typec_altmode *alt)
 {
 	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
 	struct typec_altmode *plug;
+	u32 vdo;
 
 	if (tbt->cable)
 		return true;
@@ -364,6 +344,26 @@ static bool tbt_ready(struct typec_altmode *alt)
 		tbt->plug[i] = plug;
 	}
 
+	vdo = tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B1);
+	vdo |= tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
+	vdo |= TBT_MODE;
+	plug = tbt->plug[TYPEC_PLUG_SOP_P];
+
+	if (plug) {
+		if (typec_cable_is_active(tbt->cable))
+			vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
+
+		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
+		vdo |= plug->vdo & TBT_CABLE_ROUNDED;
+		vdo |= plug->vdo & TBT_CABLE_OPTICAL;
+		vdo |= plug->vdo & TBT_CABLE_RETIMER;
+		vdo |= plug->vdo & TBT_CABLE_LINK_TRAINING;
+	} else {
+		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
+	}
+
+	tbt->enter_vdo = vdo;
+
 	return true;
 }
 
-- 
2.53.0.983.g0bb29b3bc5-goog


