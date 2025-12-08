Return-Path: <linux-usb+bounces-31290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A94ACADF18
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 18:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 404C6306902E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 17:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0657A260565;
	Mon,  8 Dec 2025 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W0E2WxT4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAF2512F5
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 17:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765216399; cv=none; b=lniapsL48V0SO0vUYdos8E7UQSQmd3Et/G2RWNLmtw0yC0PA3eSJXvhpdQaoELZ7gY8isgrStRKW+JXj6ocAD68wAK37g2hQpRMV1lVE6AzQ6etKaBcx+am10gs5b1rmc0rzt79y2V2KhGyC/ozOhvz3JdHvEX5kQ0u5xl7Ca5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765216399; c=relaxed/simple;
	bh=/4g0sfFpu+nQkM05brrBeQ1I6pziEFQwsFkh5bggQ6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRHTnLwhvBWy6ssGjikKHE1VwdDXETyiQWisjecUeGzZzMiRqFN7dTk1GP/O15kWNzZFHmk4T2lazvRJmYKcppDTjKP5LhVPJa6IZVqD+O2olSZyrhbBozH4NG0cR7Dw9MevaqEXoIAJUs0zRhRB9wIJi8HkfMPG/+dxK1L3NYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W0E2WxT4; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2984dfae043so49124325ad.0
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 09:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765216397; x=1765821197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEWypdml2g6ZmvoA6qdsowKW+LioP7gDpyLABGzs5+Q=;
        b=W0E2WxT4qZT42Xds2h0bvuAZrKTALeTNciEEmCd7FugemqK1q8oiDg5skQPl0QqZid
         Bp6qAm6jgCVEfDxzIE52AQRP2wqbGRMvFe9qMKRWKGdCecNQu2ZKKPC+Of9txxI96Cla
         UBsm18uYvCf0Z33RyRuA4gN6AyZ356RSD7ep8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765216397; x=1765821197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cEWypdml2g6ZmvoA6qdsowKW+LioP7gDpyLABGzs5+Q=;
        b=SzsdHNbFMKNHiznDn7b/zuROGcQleS4jYn48lDt+eaBdX4pJIYY/fA07IMwatef8xP
         rrD19y38cbXwuICof85gouf3YdLgcs4RNTVfhviSyiLv+Vrfu80BE0ny5eaJ4toO4mAj
         5vnJOrxXTPM4/vymf1kXFTMN7M9BHC3Vpi0xZSeg1wyLr+3z1b2MfMfWP8KGkOH/hU3/
         POrd7+nFqdwLVnknbrQB+pRyjNDt5G6NH2bU3BPu0z+NaP7h8nwiWakU7egvFXmuls3L
         yfZtmP+a27ray/djoAtMs31yy052EVvwZagviJ6roEWwYHf1TraJC+9SkrX3dEgAViw6
         xw5A==
X-Forwarded-Encrypted: i=1; AJvYcCV1Q0sYBopf6sLo+XCE9a9Hs6JANiybXhWMK3jsvrKjBziEevxY8iIb55hMPwAfj9JSXO8kHF2jPdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO4+t7FvO5Q4Usbs4I6REjwojnj1Z/PjOpqyLeNcvsMTvdJKyU
	U55thSStGupEkyIPJEh2HzDa4tOIxjmqHJcx5LPwe09pPl/J4XaM11BCmImDEmeEmQ==
X-Gm-Gg: ASbGnctL2qEnxa7kywR7/YacSEaKXHUmaZMBG8NzZE5PMnXkQmVyTebNlqM6X98289c
	g5EnyMDGDgVRphfh5N/2gy7UA/fhte3aVDjXvGmlRCEN3UQpfa9D9SDPvau3OLLJ9nmUYW3E3vH
	BdvdxUw3lxWiyh3JahIxwzzURN4Fqw4bmp+drz9MWS4AFofwmKZEsGzjYbUEKRTJ9MNJ+8Opphc
	xnLvUHemogOwjz8+CwibP/JCDmdGJHvtOmszcpKwFLAtNOCrUY5/N6IrhMG62e7FJAxAhSC2XMH
	Ui7QGz3XCvHFZIh9ksKW6kIbYHqz/tJIXBW/dqDCJlEQZ21I0D3NegIYtW83/y5j9toONdu6GSY
	EOl4M1eb+4zNTRh0bwquryJsunmeCqo+Rv45te24qETekFNEixpjN0wFRzhUC96xFbS1GQpcMbP
	Ppu4IIQdAfMQrT94gv9Rg3YCTZUXMxZWauw9gXgv6fbyzEUJp+2X0JqmqPsJUn/bIJ9VRIqmpbD
	c5h
X-Google-Smtp-Source: AGHT+IFd9GbaIJQSZ2M6Z+nbshFo8jv1wuVtKPyBkqEdqVTqaZDfqHf604Q0GjI2ZQ0ymJO02cSACw==
X-Received: by 2002:a17:902:e812:b0:295:6427:87e4 with SMTP id d9443c01a7336-29df871034fmr92024085ad.40.1765216397316;
        Mon, 08 Dec 2025 09:53:17 -0800 (PST)
Received: from decatoncale.c.googlers.com.com (167.178.83.34.bc.googleusercontent.com. [34.83.178.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9f1sm130375675ad.72.2025.12.08.09.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:53:15 -0800 (PST)
From: Benson Leung <bleung@chromium.org>
To: heikki.krogerus@linux.intel.com,
	sebastian.reichel@collabora.com,
	gregkh@linuxfoundation.org,
	jthies@google.com
Cc: bleung@google.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH 1/2] usb: typec: ucsi: psy: Fix ucsi_psy_get_current_now in non-PD cases
Date: Mon,  8 Dec 2025 17:48:47 +0000
Message-ID: <20251208174918.289394-2-bleung@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251208174918.289394-1-bleung@chromium.org>
References: <20251208174918.289394-1-bleung@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

current_now would always return 0 in for non-PD power sources, and the
negotiated current based on the Request RDO in PD mode.

For USB Type-C current or legacy Default USB cases current_now will present
the max value of those modes, as that is the equivalent of the Request RDO
in PD.

Also, current_now will now return 0 when the port is disconnected to match
the same behavior of current_max.

Signed-off-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/ucsi/psy.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 3abe9370ffaa..b828719e33df 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -202,10 +202,28 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 static int ucsi_psy_get_current_now(struct ucsi_connector *con,
 				    union power_supply_propval *val)
 {
-	if (UCSI_CONSTAT(con, PWR_OPMODE) == UCSI_CONSTAT_PWR_OPMODE_PD)
-		val->intval = rdo_op_current(con->rdo) * 1000;
-	else
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
 		val->intval = 0;
+		return 0;
+	}
+
+	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
+	case UCSI_CONSTAT_PWR_OPMODE_PD:
+		val->intval = rdo_op_current(con->rdo) * 1000;
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC1_5:
+		val->intval = UCSI_TYPEC_1_5_CURRENT * 1000;
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_TYPEC3_0:
+		val->intval = UCSI_TYPEC_3_0_CURRENT * 1000;
+		break;
+	case UCSI_CONSTAT_PWR_OPMODE_BC:
+	case UCSI_CONSTAT_PWR_OPMODE_DEFAULT:
+	/* UCSI can't tell b/w DCP/CDP or USB2/3x1/3x2 SDP chargers */
+	default:
+		val->intval = UCSI_TYPEC_DEFAULT_CURRENT * 1000;
+		break;
+	}
 	return 0;
 }
 
-- 
2.52.0.223.gf5cc29aaa4-goog


