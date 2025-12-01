Return-Path: <linux-usb+bounces-31064-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 659DBC9740D
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 84F6A344DDF
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D05030BBBD;
	Mon,  1 Dec 2025 12:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FlTyu7YO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F361A30CD9E
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591983; cv=none; b=n7pA3RVb8ha90jUiPg8mmGvVkjeiaES2YBpNkvZr3+XHMqc0ZSBySjXYE0pJJGx0W58B/Lks/XgRm78ivnEzLnudwY4NroSkJz6x5L7yrY+vypMgUkK7TjVL+UAn17OGpz709m26pXjcYB8/zDMJHaPWf7QEM4rxoAlvtDkArC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591983; c=relaxed/simple;
	bh=2fgxrQ6jc8GbzE02aljh/gumtmLhDqXZ2JKdgPay0tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTz/apcj3SpfmPztqkHMctleUBjjH3Iw346KgrN/Bq8AC1PbTijEAY2dXk+0PJPywYQq1qbslybOKpinqJdw24q90/U2OoxEEONpzgComDPtlJfp14s5QfMKarSu0oGYXWfbyHpdMcAzj9uahNtvko/ztLb5ptPcYIrsrC484Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FlTyu7YO; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6417313bddaso6473997a12.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591979; x=1765196779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQwsVtSafiZd3UhajYLeZRsX8ICttvoyqVoP0kXhJGQ=;
        b=FlTyu7YO8kqqXe2M25mbovei5S+TIqE+GJ4890teKAQvCOw/7gRd5gdzrhEkhwWdcB
         VjSbEH1y9xKUtuJBFt+SxmPtdM4SMf+VSB6GnzHlI7V9wtI+yL6+1ckv93orrAWT8iIB
         Mq17yYjva9V5DIDgHXDtSL9I2a6leq4yveZ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591979; x=1765196779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HQwsVtSafiZd3UhajYLeZRsX8ICttvoyqVoP0kXhJGQ=;
        b=CnMXj9fpRZvWYRvnFUdAlzGk7g22/n5Dj8A13qhMfDCeuTDYg6G5AWzrk6/xNZPJ1S
         OWQDQ82e9MX2Zc5UjcJIVe5AuwQnXX9vwuKRYJxVojtZ0h57/+m3vHeh+gc8VrchT/tR
         YgGpKa04qjR1pqvOeoLRp1vfiQtcQaejGQXTIadohFM1rreEXiG89ORbitClU+NrQDBL
         Ksk+PWwfASqpOh2hP8soN1O+DL4mNlxbdupD9NUcjFzzxQzrmE3Xva4Y0MQ4rRcgrSMp
         YGZkgsOMfR0yehcyjc4OZgQ7Z3twkSw602ULY3C5rHFwpPaZRptK9hxshsoa4+L9/dia
         EgmA==
X-Forwarded-Encrypted: i=1; AJvYcCXUX3pcx/PNFnBaNJPf1/7ajhG4sh7TztLyG9YWi+i5lvDBFlhC4Q82SKLuQX5+HX9odGEjEiTfU2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YziHC4EiFQQPoyfCwKcEXQwWuqxVNUr0xBXcQ6d/poFvVhWXuR7
	VL3kAvTrOXymWTWVm2qN6c1diZwU1ElDY3SB6x53OqDLncy2l52EDiv0csg8lJhqWw==
X-Gm-Gg: ASbGnctRd5FybuzlHRVrG5rgfm4pJbOxZJj13j3jVLiVG+8EDAtOzOKaTtdz12hCzGc
	gcjYUNd1ifhQR79Q9XPdQov98AfnQZTC6Knti14ZDv9KKTAQM3MFBiC1FzC5LupT+yWci+Q0aHj
	vJ0bTCgr34lMtzzYP+XUDCpFxvFU6BfbSYEzStPLcYyhIRBGPzerCRIm1FGTOlOxqViHZ856X7q
	1L/R/bhwxbfPRslf7TXIwj/4RnW9qhCN18ERGtezwL4/7Mg7AwxTiLLlZz+t6uSVUdQgv0mCqzZ
	8iIbWya05p4HVij3xsun1Zm2QtRBdTnlNu8e2RA2AazOTMP7j8K7qOHYcxKgi7e7Nua4UWrpIYK
	FmUFAmAQVmToxTR71fnwkQ8kJpJhITTrfbZg0TmnjUMxh8+BUyLb17AcqE9JPWwHkQHQzrf9BEu
	zJeYXykU4lpyDERgF6Swd2BDOG4mc+wb93jRQuaW+SYJ8oZRkGEjsi4MInAEehy7ad5R/wEUWdq
	8aPnGkFwEA=
X-Google-Smtp-Source: AGHT+IH3FHNKiHqdnaGg19IfebqWiFqLmfFp6qr3dC+UY3zUwt8OkPTo0J+bJm2U71ymQvdRKypR8Q==
X-Received: by 2002:a17:907:78a:b0:b73:5b9a:47c7 with SMTP id a640c23a62f3a-b76c555dc15mr2821605766b.51.1764591978997;
        Mon, 01 Dec 2025 04:26:18 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:18 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 3/8] usb: typec: Introduce mode_selection bit
Date: Mon,  1 Dec 2025 12:25:59 +0000
Message-ID: <20251201122604.1268071-4-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The port driver sets this bit for an alternate mode description to indicate
support for the mode selection feature. Once set, individual Alt Mode
drivers will no longer attempt to activate their respective modes within
their probe functions. This prevents race conditions and non-prioritized
activation.
The bit is not set by default. If left unset, the system retains the
current behavior where Alt Mode drivers manage their own activation logic.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 6 ++++--
 drivers/usb/typec/altmodes/thunderbolt.c | 2 +-
 drivers/usb/typec/class.c                | 1 +
 include/linux/usb/typec.h                | 1 +
 include/linux/usb/typec_altmode.h        | 1 +
 5 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 8d111ad3b71b..49d5a123e4c4 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -800,8 +800,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	if (plug)
 		typec_altmode_set_drvdata(plug, dp);
 
-	dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
-	schedule_work(&dp->work);
+	if (!alt->mode_selection) {
+		dp->state = plug ? DP_STATE_ENTER_PRIME : DP_STATE_ENTER;
+		schedule_work(&dp->work);
+	}
 
 	return 0;
 }
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..c4c5da6154da 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -307,7 +307,7 @@ static int tbt_altmode_probe(struct typec_altmode *alt)
 	typec_altmode_set_drvdata(alt, tbt);
 	typec_altmode_set_ops(alt, &tbt_altmode_ops);
 
-	if (tbt_ready(alt)) {
+	if (!alt->mode_selection && tbt_ready(alt)) {
 		if (tbt->plug[TYPEC_PLUG_SOP_P])
 			tbt->state = TBT_STATE_SOP_P_ENTER;
 		else if (tbt->plug[TYPEC_PLUG_SOP_PP])
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 049d1829be98..cffe3c7d1671 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -639,6 +639,7 @@ typec_register_altmode(struct device *parent,
 	alt->adev.svid = desc->svid;
 	alt->adev.mode = desc->mode;
 	alt->adev.vdo = desc->vdo;
+	alt->adev.mode_selection = desc->mode_selection;
 	alt->roles = desc->roles;
 	alt->id = id;
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 59d5fd7e4ff4..7a9dec9b0775 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -152,6 +152,7 @@ struct typec_altmode_desc {
 	/* Only used with ports */
 	enum typec_port_data	roles;
 	bool			inactive;
+	bool			mode_selection;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index faf72e4d6ceb..c72065fddb7b 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -31,6 +31,7 @@ struct typec_altmode {
 	u32				vdo;
 	unsigned int			active:1;
 	u8				priority;
+	bool			mode_selection;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.158.g65b55ccf14-goog


