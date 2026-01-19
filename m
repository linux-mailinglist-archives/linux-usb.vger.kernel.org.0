Return-Path: <linux-usb+bounces-32506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD71D3AA25
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8B5730ECE15
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00130369202;
	Mon, 19 Jan 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="McMA2foG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55E1358D1B
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828735; cv=none; b=DLUMvKnm+l8eu2e0ESdukoo7CdG92T2gDWAHrbBQMHiOnWxF4/B22JORf5cJrqtobBctZ6oPZYHCiQaSuY6r1xUefImUkG48HNNzbkbEpwLko89GlBijIXZay9T9oZFRS2JbmAMBqeMTHDYJ1sBmsdf2+eorWBSGGP0sb1JVmtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828735; c=relaxed/simple;
	bh=PvMl78Egz6bmb1PsfFjOs6AkxoGFu1IQkxwSzJj0RZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCgYHOWbx9b2gIDnLkmeyqHFDPxFzKWEw0VCj4ovPFyAM0Kt0g66K+YuCidB5OQzaur/T7/+ZpVbvLQ85dx3JtYZzy+DpEbqwjFtLmYlWSgs4uxVl/ifcRYXtaCbmGbDn1VO1fBi1mIpisG55loWCU8RE+PHf83WFMuGTouwQXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=McMA2foG; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso8912894a12.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828732; x=1769433532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDnniPjMK/sJQN7VPW7dqxpb712evvAY2y6naw6LGNE=;
        b=McMA2foG3PfY/bLG2smlB9DVMu3pMOuRfZ8qXgtSFRM3nraOyDAvHG6b4Bm2S9I0vh
         v05Wapeh+mgyQ7HxvMywrlyUjm6mb55UqMVow0IO1CWeXfGDwHasGCUCBXno4sEeZjRI
         5Oxh6XfZPpPf8+quO1H/BwcO57FgudR9cbKj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828732; x=1769433532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDnniPjMK/sJQN7VPW7dqxpb712evvAY2y6naw6LGNE=;
        b=ZgIDa1cGN83eaBdb5/NBtFNrm626PWDvCpbGV9gQLr5ewnzlsgI18k6lCAGiCtZShg
         eWNDZrdCcXmk4C0bvlCKxqxDSJGfedttvMsUzfEDKnORboMIs6vgQppywGu8IMo7OhkO
         gUloGAbCCEzOjyUrXX0/ymsGtVmqLifju3C9MB9BjPXT2nCZjK31lA7ey33xEoL1yeGq
         WYCyKXC/S9MOdZ5huFVaygsk9jOiio1hNUHGF4Zz+xDaEZJnkkEo9RsYdxot4myvve9P
         GYvKZVZub8G8FZJNtz/JjI65OOKnLMtqRM6HP+jbZ2wDOQQ/Q0vKF0T2E/uYIlcdeR9n
         L9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXUTBK1AlC8l7RgQTshzYJCBHkDpGGugewMhAkYa+13XdG/r/gbX1Ylo7dwCU/0336mD4PtbGxuJLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC1juRxaTSbB6DFSB7bcaUnvpjwegKTnV4nXwHOkLi58zuj8so
	zb5bjFWEkr5mHdyPf3KZtj7jqQuf5CJ/X66h+W31Eh2PyaVJTqOKV2TT9FTlJsx+zg==
X-Gm-Gg: AY/fxX6Lyn+BwzWE+Q4WQDYgo+o0tRx0K6pVk0CQ9VA+uku3bJC6fhHpEUR82Vt3J16
	moUXxUR+smEtDnAaE5tVJPTN3jg2iSzxN6ApWOWqoeM/dHkk5tjJeVOjOPX/rJZ42DpZD6/rqtz
	ua1wNmSoP4KB+EMxlSGsgFCvVcyauFVkc0JlnruspykB4wLkgcpaO1l4MKaPndeVlkuSqodH1+6
	Ixje2YCHNpe75XCw8G/vxPRjXx8We3JLbfayufspUmVnX4Pww/3qVasDraUf0S6YU+h/5rC0qBm
	yROEUYFlqQCDNuhPW3QJ8kccv9YgH0P23DdyTYoBO6rwdjkArCrGjsDx6y5LMi/0x6/bdcv9Rwv
	PjGe0pj2UXTM+1ATZNmqpHjfhtrSeSg6UIc8BIvmlng4WIUQexrW5HqGxRt9HYBj2SDKhVcclFb
	HZ5JR/2MREXlBvJMdBpHmSJRxnyUC4H3eryaDpQBi9CYikWG9Oyby+RlmjXlo7aJ2BfscgwKJzx
	sDdQwZO
X-Received: by 2002:a17:907:d1f:b0:b77:2269:8df0 with SMTP id a640c23a62f3a-b8796a5a491mr862916266b.28.1768828731903;
        Mon, 19 Jan 2026 05:18:51 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:51 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 5/7] usb: typec: Introduce mode_selection bit
Date: Mon, 19 Jan 2026 13:18:22 +0000
Message-ID: <20260119131824.2529334-6-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260119131824.2529334-1-akuchynski@chromium.org>
References: <20260119131824.2529334-1-akuchynski@chromium.org>
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
index d96ab106a980b..d185688a16b13 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -804,8 +804,10 @@ int dp_altmode_probe(struct typec_altmode *alt)
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
index 6eadf7835f8f6..c4c5da6154da9 100644
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
index a48c447125184..dbba53f024977 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -655,6 +655,7 @@ typec_register_altmode(struct device *parent,
 	alt->adev.svid = desc->svid;
 	alt->adev.mode = desc->mode;
 	alt->adev.vdo = desc->vdo;
+	alt->adev.mode_selection = desc->mode_selection;
 	alt->roles = desc->roles;
 	alt->id = id;
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index dbb259d885266..d61ec38216fa9 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -155,6 +155,7 @@ struct typec_altmode_desc {
 	/* Only used with ports */
 	enum typec_port_data	roles;
 	bool			inactive;
+	bool			mode_selection;
 };
 
 void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 70026f5f8f997..0513d333b7977 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -37,6 +37,7 @@ struct typec_altmode {
 	u32				vdo;
 	unsigned int			active:1;
 	u8				priority;
+	bool			mode_selection;
 
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
-- 
2.52.0.457.g6b5491de43-goog


