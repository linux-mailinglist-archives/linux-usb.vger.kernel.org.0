Return-Path: <linux-usb+bounces-24780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B22ADB20A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6523B16B690
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752CD2877EF;
	Mon, 16 Jun 2025 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Nq9sAS0t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157FE1B040D
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080793; cv=none; b=FV+1KI5rx//8A+9W4yuXDEk74zmKhnYesKOjaD2tccAZZxmvHDyCdB6Jk3nLM+4ew7QN6m0F1zd01ChZM4l1RdSbUeKym1AHhO1Gt3OdMiCkD9P6KIWvXgkaA1LQatJ35IKVpifmS/csZ5cjYMge+McpazYqhZP/5WlFf07ro1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080793; c=relaxed/simple;
	bh=DfWtOSkx84l5KOCfEGNRyyvx2K3TB+JWEySzWnCGZMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fsdra/FvgDbWD8B3SecmPsMGm62qijMLpHXLjWSfRZFwAbyzXD4Jgin5H1q6bI0se43bakkvpViFVnikeoHKESO8XS1ecnxRCdk8FOZsL0nN3R6xAc0KxjPLYBL5Pk3Hd8NWgBG5lGRbNDFc2iuOdLIowoqDseomi8Ye5XjlQP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Nq9sAS0t; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-addda47ebeaso905038666b.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080790; x=1750685590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrvRU9dPA3iyQCatW33yYrWOV+Y1tKJvNMOa8l/wSkM=;
        b=Nq9sAS0tjhVHWqo34HkdDipyx7QRBX9Hh/Sb7V/3SBXdKJMbruVPEdw74m2LoGf8FR
         ubj2QJk8x29w4zmu3rmm57sI28gMt9Bj3avvsFW0saXxNnMpbd8+p5pOPRkNLMo5Pag/
         tPAI+BHjBpx4GbZIIxxquu1TUTGRDk6nqehNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080790; x=1750685590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CrvRU9dPA3iyQCatW33yYrWOV+Y1tKJvNMOa8l/wSkM=;
        b=WhJSt5A4928efXN7zzjncmYZpuM63HDkLBvNVGQq+FkvDM6ssEAyQ7jHJwUT8FxX/f
         K9XxEH1e6SGP+TTZQLt16seVERUwnj6+a5l+r9o2uqHkDULBpNIjAw4Nr0vh5/HzgrCV
         oJCj2b2BPuv6W2f9x43/ok0tfh12IhSgKpJgP2EG9AnSWVY/6ZVA2ftXyV0xp9myz9+b
         dmUQq8Ph6/d6h9mQrlWYaYeu0f3iNuV1m3/6v2U/8qWslAzmi2d7bfjjm8psbxl20FFK
         u6aajEcWgJlSZ2LyUqPTECx4Qhhv0R6plA9Ep0FUHcEGF3Yt+uMMdmM9KKYjSOqESzAq
         g1mw==
X-Forwarded-Encrypted: i=1; AJvYcCXcGAZwJZwbRoNdgy3M/ElEIqld3sjkI61FmmTYOMzZqOiSlJJknEdNhGjxFSiJtnBnovSYPyeOlBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY9MGB41a9j0AuJualKLiKELMjrVm+4X7/B2kaEyBNfwmqnKAj
	44vtRJErFANGluDkaQOIfuV9njAniBDLV1dBRUAvq54CrI6CEe9RP/TjfgiDgabtag==
X-Gm-Gg: ASbGncvjgJYMNgs0K+slZPZ2VbBfhFNFe0XlqA63OGBRJGG+vPI4zt4fJ/K25UTncea
	W683YqHyZGuBj4W0wHJx+ZKccaq4vJK+cDz7ke9y8l+JoxPHZKlbmWWf3PmzGfeQP/r9NjK8YkN
	jwpKIzTpKoqx+pr8G2FxBBRYRpB9KwYsDt3DAtunYg19BKq9NCHhMorlayIrWx39LqyUIV51RD1
	lsB6yzEKeKTYduFFLNkTg2PwGyYfBklY0iOG3hww+tnbOLGS7D0bvjZKYbAwoYHgLPGauZpdNxp
	G8uoQKHq259NL20iUMXKW2N0o2ZkRQOVvRC8K3RexRQ2kOviVarA1X6v6TrgnY+Qs0JeKW5+j/6
	UcUSZlQD15VMWHpbvciGvU7WJX90MnrnJXn19BVbC8wcJUZsAevcZl94Aug==
X-Google-Smtp-Source: AGHT+IHbDTcXrvlPhvHImcuxrvjv5KF3hnVki+pNJuztPFo+tXtICwF+2GhVHRAJEkGScMRhGJ4DLw==
X-Received: by 2002:a17:906:794a:b0:ad4:fd7f:a4 with SMTP id a640c23a62f3a-adfad4f42eemr816606366b.47.1750080790329;
        Mon, 16 Jun 2025 06:33:10 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:09 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon, 16 Jun 2025 13:31:38 +0000
Message-ID: <20250616133147.1835939-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
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
---
 drivers/usb/typec/class.c | 14 +++++++++++---
 drivers/usb/typec/class.h |  2 ++
 include/linux/usb/typec.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..a72325ff099a 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -459,9 +459,16 @@ static umode_t typec_altmode_attr_is_visible(struct kobject *kobj,
 	struct typec_altmode *adev = to_typec_altmode(kobj_to_dev(kobj));
 
 	if (attr == &dev_attr_active.attr)
-		if (!is_typec_port(adev->dev.parent) &&
-		    (!adev->ops || !adev->ops->activate))
-			return 0444;
+		if (!is_typec_port(adev->dev.parent)) {
+			struct typec_partner *partner =
+				to_typec_partner(adev->dev.parent);
+			struct typec_port *port =
+				to_typec_port(partner->dev.parent);
+
+			if (!port->alt_mode_override || !adev->ops ||
+				!adev->ops->activate)
+				return 0444;
+		}
 
 	return attr->mode;
 }
@@ -2681,6 +2688,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->alt_mode_override = cap->alt_mode_override;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f05d9201c233 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				alt_mode_override;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..6e09e68788dd 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			alt_mode_override;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.50.0.rc1.591.g9c95f17f64-goog


