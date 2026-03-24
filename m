Return-Path: <linux-usb+bounces-35369-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC2NBBdVwmnNbgQAu9opvQ
	(envelope-from <linux-usb+bounces-35369-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:10:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 71303305529
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE56330467EA
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 09:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE0E03D9DB9;
	Tue, 24 Mar 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HYuAeZCF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560283DA7C2
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 09:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342955; cv=none; b=hmUidnMdAlcLR4oHfn6kJlQj4EZlC+iYUi2FJ/a+62jXSUrwP5YTH9B0GsMlReO1FvfCLA/XoRcG6as/AdvggACHzpKm8WecT3mWwSTHqIvsE/cmC/pKYSZDOkKvC2bn1CN7c8dKbFmNaptohYS5HCwckvfMojuF2IFFjWfMfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342955; c=relaxed/simple;
	bh=aTm6Xu1isAhzPk4bIIK5Y2FaiAaAFekgp6c80IYWzes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oj2rxYM63ib3dag73uuTy7/1EKlt8e6rnX6sqyQu024aI29mpaEJ8/ujV8VSlZYJPuFIDjySeZqG2nk7PP9lVmT9X+bm0x4EUNUyZxG5ihVV9BwhW9NSbp0xAIg3PpeJW04m3mMYTX9IfBPQYnBkyUGRbkA6zOvhj7Y7SgoWt58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HYuAeZCF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b97a06d7629so673641966b.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774342949; x=1774947749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtkRrxgSSdlkWo4XCyDaok2JSx4EdzvQO1vwg8DFaWA=;
        b=HYuAeZCFZK2+MwVc9bcDsdxVWAJJm/v8C/l0583lWJ9kgY9bWbgEi2Y+Ii0gVq0hsg
         wJ6gEifrHVb0sTHnt2W65ODrJvw/aZFCHdmxRTeFdsuBAdMgeTSq8LLVkFvZXcvqtC7v
         U1braR5X0DdzqYYm9weoWhIRbCTDij8d0I5k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774342949; x=1774947749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtkRrxgSSdlkWo4XCyDaok2JSx4EdzvQO1vwg8DFaWA=;
        b=d0oiafKc7m+4TOS5kin7GWfJqjNjE8zVtQrImJnhcFHmkb6MS8XWX7wUhqtcW5oyhU
         KiY9i2U9axjC2WYJn4Sj/ekQcVKDG7Opy9/MxZn70jAOOH5jiNMXQqq9NsGwsYSzcAMF
         XeBCD2IOQaI7E5QfqHAJXpqAPBWAPZPS5B6F+pTXRElfwkSiQLWpeZcSrM0HH/5r03tA
         NCPSPGON7Cu2ahI7LJwRMQawR37VhVkex/pTcVmCbVj3kHNyYAN2W37GcNHHL2hQG9xx
         g+/JY4IlbAytUlu44t22Cj9sabqenxrEDheOv4ADO29rhZEfl3qvpuCumnG8pVidFs4Z
         y8gg==
X-Forwarded-Encrypted: i=1; AJvYcCUdJp/A9Zcqf8QpwVPR5XgfvVuz9VEklL2Ej/kgZHhHT7a/spJImOxTKaGHkiC8VytrqnfmhsmL3SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaD25xFdC6FleIfaa1mZpO2EISCBZr6hZI9h/X67xoTqByDhD6
	RJV/34N/zjNXJkwyN04n+y0m8v7cpKRixZLLy12KsIiOmiBGwUY8L7YPKvds10HqFQ==
X-Gm-Gg: ATEYQzzxXCYI+pjTO3c2B0lidR8bKam1psgtyM1O8/hSpXsHJ5dX2yIdO1SLObP6bYn
	2l1cpcSCSvKfgswfbDGrNQZHel5OcUXKVBsLnGh8xgpppSqhpxpviIdmSp52UVAd/htzANE90l2
	+1EccCKyCsYwyeaN8rtul8edf9pM2RYW0vnLGMk09c+01tLxkS6xAJfUs6qkoxgs3rY7inQBHzE
	VefjAQcIN7/Q8G90Ea/lDHpDrhp5fQPDFIVoHAmpsdbQtZPoVYt2zW5nDwt4P+CxTbbYVDMOs+S
	jZYoRGO6iR7cuaETDXTwPP+nyhaTtNNt6Q/k7PKcCWpMg6rTL1zaV/7iEIeSI3OZxCoQMvLHfcq
	6hSc3ntIroh+9Ly+euXPMfGOTi1s4Ukl0BqnaCN5u9C8lI833Uhl/SUxKYAiYGOHPD6XvdSlvMy
	rJXrOe5ncuu5WyafbYhXJdr6c3ytG3bR4XbI1BnnTuJX+A1WiZFtxss95Wrd+D7Jz0I62VuzaJ0
	0tEKSjo6PUC51w80+6CEd2xzWxGXu/pnQ==
X-Received: by 2002:a17:907:8b89:b0:b97:b6ef:fc94 with SMTP id a640c23a62f3a-b982f20d5acmr990094766b.19.1774342949204;
        Tue, 24 Mar 2026 02:02:29 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a1adsm604873166b.45.2026.03.24.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:02:28 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: [PATCH] usb: typec: thunderbolt: Set enter_vdo during initialization
Date: Tue, 24 Mar 2026 09:02:23 +0000
Message-ID: <20260324090223.919832-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[chromium.org:server fail,sea.lore.kernel.org:server fail];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35369-lists,linux-usb=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akuchynski@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 71303305529
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

Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
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


