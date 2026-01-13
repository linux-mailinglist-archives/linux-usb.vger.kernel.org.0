Return-Path: <linux-usb+bounces-32259-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 077B1D1903E
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DB84304EF57
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E699F38FF0B;
	Tue, 13 Jan 2026 13:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="drw4+QxY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326A938FF15
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309549; cv=none; b=dbKsTfJDABgiyU4MtHmak+K9U91X1d6UJ2XW8KGPzJb8muOKrzggFLkEPTnSirzgvxYeo37vDpNBqBnkNbXhL1CSPg6K+hQRQnLslWCqbJxfDVgCCSHI5dW02WNgEWWpqDtnXV/7ynY3ywz2nbSDI+3lN2pcyQLV6t8KQuVmFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309549; c=relaxed/simple;
	bh=V1jmUzlQs0mqeDEI06ZenpYXU3urQAv3hO+yVPpB20c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjunvKx2vc9prhCpMomNDX2mx0mX3NshiUaQ3bJHSTJfuaGd4sjU3ZSqvrNF7OR7clA9CmXOHO91cZg98/wiwZByRPMP0yCMZrEQLlNcv5HCDWRaTGLO48jNGcSeg7/WYCTLNSce51g04kB6iDc/sYjmKnp5AocoYoBAtxfl4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=drw4+QxY; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b87113bd83bso401566666b.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309544; x=1768914344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=drw4+QxYOHZyNPKk4rMAhGLBNy6+KgtAZYmdtTGuFNzvPT1LrWQiKLQaxe65VE8c8C
         Q0da9kwBo0smGgBHRGRvsUB6STznfHeOf+TdlOKmIEcFUc3v4qFxYEha9yKKP4SCjAAh
         6H9qmfzQsOH/YPlU9eBKNiTg+zMjvgj+b3WMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309544; x=1768914344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=NBxCqGL0rKG42GB0R5P5zRR/RgSjY1+W+BWrsDzslGPF5ypbUjc8oq3CKoPfol6SiP
         m3Nz16KNr7kcxRtCxlREcOzuryqg+JAU+y4e1XYQZft8TVb1glFci4hSgsJwc3JtQ1LG
         tmRR3xaeUfkFAbDECLMEm/FxaiCPUryWaf5rVvUzyKI9oP9VS/CLC3MePA3Mm1uKlH2f
         h40KwquwA1Bp61MvZbjNXBkebdgPQAYsyz1RhcYEwObyW/kZ2AtqVkbnW0VEhy5OFxLQ
         rW2rGCGOi2qTi/KDZzH2WuqmTXyS0vdv6G1jqy8drKnlOQl1picHbcJWiOViR784Nqmc
         /Tpw==
X-Forwarded-Encrypted: i=1; AJvYcCVeHX6h9E25zSPl2/xDbLx/urV88z2g0sqIqr/I+xGDRx44ot7/emO007CqPjyVGKntJYBzNKHL8M8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX0s+bB8NbRw3iUC7CwnKuFs1wTWGViwel5173m/wdGfblp3vG
	XxuIQbPZTwNpDLG+bGjRMhZGmVZ0zfYWhE2mTSAFYNiskV6j1n/YW0gA0gzJm8SdfQ==
X-Gm-Gg: AY/fxX6C55w9lGHeFlRfnmE2xrok3frCpfB74xLulHRARkbIohHXdwR6PGm1cUA+YHB
	U/fOIblTWryvkuD/yFl7+B8e1C8/Ns7mj+1LzjBss4TMEefZTAu/HKAZQwGxT/udJg54CT6uwYV
	yLBub+hIIrjXvZ9Ob+lOSv6DGrJDGO/Nklk3ae5Jy3uftSEWGEWhDrP0XMuhPqSrPUas8OO0qv2
	FBP+IjTd+uHYOdzR+Tj9IhUfoHyvf3SbmpqSkApPWwcEfivzyrSeGhP4+Zx4ZGMdsmycNu2FPF/
	8LRdYRIc/MN6JnTMr1V5s7UGw1hFVgjh3X9oUk2sIBsMictAZRQJLqG5B26bEO32d/ZHC6w5aEa
	Gnjmh2gQN7gik15YbiDjhDMsKXJ7F1EuZWzCnfeYOxGsPBWNXW4dHrBZFkAmRS0lDGCa/CuMSFz
	tOXHby6cC7IRcX/XT4FSA02xVb36jjpm2V2tQ1pwmNZrQXRf2i0Prh1QIE/HsrHJ7lXsL0Dg1SM
	vLchiLM77wj6kjdzaM=
X-Google-Smtp-Source: AGHT+IH9fdlAcsYdBhHsm3MzZdhegh+CqE1dU7+aUp1J6imJDfwNUKifMVZoBAGXlrQ1du/vBUGWRQ==
X-Received: by 2002:a17:907:9691:b0:b87:51d6:22fd with SMTP id a640c23a62f3a-b8751d62cacmr45371966b.4.1768309544446;
        Tue, 13 Jan 2026 05:05:44 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:43 -0800 (PST)
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
Subject: [PATCH v4 1/8] usb: typec: Add mode_control field to port property
Date: Tue, 13 Jan 2026 13:05:29 +0000
Message-ID: <20260113130536.3068311-2-akuchynski@chromium.org>
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

This new field in the port properties dictates whether the Platform Policy
Manager (PPM) allows the OS Policy Manager (OPM) to change the currently
active, negotiated alternate mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 1 +
 include/linux/usb/typec.h | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c4ff4310ff58a..0f12d6120511b 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -457,11 +457,13 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 					     struct attribute *attr, int n)
 {
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
+	struct typec_port *port = typec_altmode2port(adev);
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			if (!port->mode_control || !adev->ops || !adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2708,6 +2710,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->mode_control = !cap->no_mode_control;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff0..2e89a83c2eb70 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -62,6 +62,7 @@ struct typec_port {
 	struct mutex			partner_link_lock;
 
 	enum typec_orientation		orientation;
+	bool				mode_control;
 	struct typec_switch		*sw;
 	struct typec_mux		*mux;
 	struct typec_retimer		*retimer;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index c6fd46902fce7..dbb259d885266 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -290,6 +290,7 @@ enum usb_pd_svdm_ver {
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @usb_capability: Supported USB Modes
+ * @no_mode_control: Ability to manage Alternate Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @pd: Optional USB Power Delivery Support
@@ -307,6 +308,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.52.0.457.g6b5491de43-goog


