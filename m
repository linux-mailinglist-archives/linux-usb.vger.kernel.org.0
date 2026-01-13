Return-Path: <linux-usb+bounces-32262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A76EFD19053
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F0AA30532BF
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E30AB3904D5;
	Tue, 13 Jan 2026 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Mj5Fjztq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B3A38FF0E
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309561; cv=none; b=raGMzhTzoip5/PIKuXq3LzQx9xJRdpmLkTA4XUyIkTkg1gBqV9iP1Dys8cjJO/OM9Qf6TsWZ8T7R0Mjeq4wtAxpkz4N+1hvqqB0CGWmb6+9nDsspvhtOCIwEcsHn//F0MEsYmjJpjaO0SDl285fL5f6T61xntwh7tE1mxEF7V4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309561; c=relaxed/simple;
	bh=PBxq1XtnNJDHu6QLFTPbS6fcZBdgfVFC9T9kO3oXU8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fmy76yqjBJkIgrY4sTkkO4Fr2eiYXU8inLE8FgCGkAfigCiWMCn3OTzQJMbvNEs8RfTER3imMewxas/1ePJhrkLxYToegwmZcbJ+pZbuleacmS7PzY5bprVYrVAd3pL9QEjjirHRw3ec51ZH+qvSbrCckeOhIacI5FEWMKFeIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Mj5Fjztq; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b8719aeebc8so352199766b.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309556; x=1768914356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JexYB6ufnP2njfyWsSs8jFTtDnvJKYKAr3d1TGCGR/Q=;
        b=Mj5FjztqrNZA8BrHquTm+eMBlOH5i2XkFHbTVDZHWD/SNYBZ/LIieUdFS5tva1t5S+
         mgrk7X+XNiVhgvi+miJOnVulbOjRYic0S2L+ZIiHsegNmJx8f/EpejtBq0qN7+aLiD1U
         A/R0qFaCiaY8yg1y8NQlT/9MEs8sUsXYkhPfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309556; x=1768914356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JexYB6ufnP2njfyWsSs8jFTtDnvJKYKAr3d1TGCGR/Q=;
        b=NX/KZ04ZAXnEp+GZwYciwbjmCslpB/x6yTJqDheVWL0lhbOWXV2YtEToZQy62x8t4L
         5Qc8HvLWRJzdqXgDpBYVpIt9uBWRR5VCn0YzfuDYJ4Bc9Pk8hFHrTTBhJ22k1Z3ybmqm
         koleQhkZzpBdQcnn2w5ge/LvF6/t115J2jFbaYDEL+0U1/QsN59eM6iqcNHNsVl9vyRR
         j0vrLk7MpckxgzAM9JLllT1VK5p1tz50og1NRfg13Zrehhb9FyubOfUAXjA/JYiS2L6C
         Crs5ytDUznAhFd8XXn9X2ne0VqRA8uRzC0KPkkjI9DTKPUoov72a2mi1x4dnWqbnSWjx
         Yckg==
X-Forwarded-Encrypted: i=1; AJvYcCVTkAZkcFGc/HIz3mmKX30LTHXUd9w8EQc3ixnKbMqRwFJ7wD6PmODMz133kKgWm5XVdlvZ0tgDpeA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hoCdpBmEkAeQE5ZM9fp9PirUMKDioVu1Az5DiJ5ovcB81E0Z
	D3C82mAJpRLQo3ETGvcqEKJ2g/yZ16tBp1BisIMBXNg90Xig3bjB1bBJoxcOwKX9pg==
X-Gm-Gg: AY/fxX4Dd1rArOMNBUzMpwKHPbzi4O5slseHaOOnJ0mlgzhz/p8XBUf7vPhwbUgU2gD
	qb6/bPUmiJ1FrGwwI5i8tQLcudp+3I24HW9QLXEGs/ngZlIRoAQakYPfTodGTGnl+kbpckKlyED
	dCQvZcTRmEoZKix61ErfCPI3DTO7UwC74GbmQsc2Pmw39jW4X5WQbI/pg+dWNaxICXyxqAKeWlu
	9GSJqnFBvINK2Of34wERPHA85sm6+LUIMe/qBLYLiJLgr1yVsNJCX8P06y3Tys79UWnxcDtVXic
	DTWCvi+YWM6vYlqPR4eIG9io7bCOCzDczmEM0crOlF+xgNjXSvVNBbOVKlLEcWBp1hs8i0uBj9z
	ReGWG7IN7A8oPOVQ3S9eM9JxCDXjJcW36K+jEAyMVWLo4cI1eaKKDgJoGWAqsUfghnuCy6eWN/o
	uV8i12YZ9osxMcIt5OuW5Nqgi65dCfHInuIqEdY4e1dVymQv78sQVexabIVL9mZfjwWCNsjEOn/
	MRnlKGirpz0a3bomeU=
X-Google-Smtp-Source: AGHT+IFTvE3kPXoaMFaHVoxvyk8+opt2tAgG+Q3yLoEc+MEmRNu8mDVwkVmFMuobpUoOnxGKBIsrcQ==
X-Received: by 2002:a17:907:702:b0:b80:3846:d46 with SMTP id a640c23a62f3a-b8444caab67mr2155678166b.20.1768309555953;
        Tue, 13 Jan 2026 05:05:55 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:55 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 6/8] usb: typec: Introduce mode_selection bit
Date: Tue, 13 Jan 2026 13:05:34 +0000
Message-ID: <20260113130536.3068311-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
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
index 1fb5450c0a2f2..9b9254350733d 100644
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
index 89b285a4ee7e6..4bde80e4c9b0b 100644
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


