Return-Path: <linux-usb+bounces-32503-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8DD3AA1B
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 14:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11F983078EF1
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jan 2026 13:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C369368283;
	Mon, 19 Jan 2026 13:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bFPvJrPL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A5B368285
	for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 13:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828727; cv=none; b=tLVN7cDQq+11u67VgsZCG78aE0RJGW13r1pSEhWAml95zs0HAjzDDiWFXLKTyNwbw54wmPAyB31fPGJpR+Y8BYWQD95rsldh6W+qm2/OzbSF1lOqEBLsyFhtvUauE50myTklMGM8LZnvaRa8HSpC7ohHJ+j7veNaV9npZh4WV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828727; c=relaxed/simple;
	bh=V1jmUzlQs0mqeDEI06ZenpYXU3urQAv3hO+yVPpB20c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgyAwx+SB67ZUQOuX3CKSJ43mrXbxgSeWuIl00yJdgUB9o25obsS5KQgAXniNnfpA+nvoyBNRGs/K/Tr96jcQwqZ+GUiLZ6BFhg+ngFjpMU64KyZVUlQgX5KH4RoJa4oFdNFo4fIvYuQg+KlSrndter2WKKJgM+gjY7mR/g30bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bFPvJrPL; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b86f81d8051so709517566b.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jan 2026 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768828722; x=1769433522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=bFPvJrPLR1mSUfB1JPSjU3Zm0EmWTrNGyJmdr8h/4bCNt3gO4VDRV3VASov/dyXePk
         O+9J/5tScCq30NK9yaK7pY0Lhf3JamA45WBguVudWzg6SFlK3roLpqEOsul1kDv77qtH
         wyl8Mb5q1p7brZawTOEB56UzGB1PgSyyOmnCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828722; x=1769433522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cLqa5LSPMe82XqVLviPNjog13TrBNYmx2vAnL8Z9NGE=;
        b=iUHOsaPiLxQ0g/m9jmLUtrjcQHxWsTKpHHn8Z/ymMRLzX2GEe7ARqdZHfz9v+ty5qN
         +mTnqZVvCSejG14kts1rowRJvYQ/ICNf9FFd6f8+oJiHzcB+It1ML3E3ubMtuOzfPwIt
         hvZyR7FOnQh9yuDpTSiZb8E8EVARl/NtmW7O/uiXLRxaAOHd8jvOyKf+QwHxnpnq10nd
         /3KI8Oa3TNtiueMyBbbCkZpaB8JEiJgyHPNa902N2smmoRvQNSxyFDWZERUdDPKbpzmw
         vQUCBg10Emi27bFn8DDa9cA9el9g18ZKKEsxc8RVpi8fIpZ3Od3Ari7QRK0gr+AOHaIU
         MOGw==
X-Forwarded-Encrypted: i=1; AJvYcCVArB5bimhD26nDI5F8pSRhIrk3578o2zx39/E0XBi6sd+a+abRZAzq//7JAIwFt09Sn5Mne3GFKhU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxspvy/mCKeIbP4ZZKjIDZ3bvERrs1fNKnYtwLSfibPi3BjR7lq
	LCzFlFyfGWv2zhjczxbs764KjMy3XZwIhjK/u0E0yuL80/uEpw0aEBsFg3Hql4SzHg==
X-Gm-Gg: AY/fxX7B3UcQn4XFfXQlHa21lYQaRFAiLi0mQAqPdglIAUcjalo4qS0fKC4NkMeMoEn
	TVCZ78FB1NzIMHXWKD3TSte6C7wcGbq9lvy2e9kfsUX49xoGiw2dUddvglPkSHrgfTfAe4Z04Bu
	XkKAcMNeKiEIRqgSntSlYghYWPTpSjaInEKGBKVt3JKjFVPLiS6oTU7AF1aQ9VefJeIGX0btDkX
	xePF85HlVeIhIVenyXCk/6kIONo8rPVfHJwW7bAjOn1c+h+1FNCuY5zBc4CxeRJnzEpDKUWxvFj
	3RA9+aLZfSbFoh04yUalgQ8DbBW3h0cDJAf2DQtPz/ScpyBZyiB6HqB0PezzOxWiK6O7PZkh+ki
	CB1k26dwdKDGwqefcV1nU20H9cd6NJjWGBJ76m/adEj9ikr9+VgyXbhkeS98f9JRfW/3SlIXcDy
	ebJKEqQrAPc/cE4BDmCj95aKr+i7+QN0/dwykA2p1VAV8MX19ApRcAdCL5PWb8kxDdL9lcy0Jue
	R6lHDNU
X-Received: by 2002:a17:907:971e:b0:b7c:cc8d:14f4 with SMTP id a640c23a62f3a-b8777a09915mr1291724366b.4.1768828722003;
        Mon, 19 Jan 2026 05:18:42 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9a14sm1078801866b.45.2026.01.19.05.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:18:41 -0800 (PST)
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
Subject: [PATCH v5 1/7] usb: typec: Add mode_control field to port property
Date: Mon, 19 Jan 2026 13:18:18 +0000
Message-ID: <20260119131824.2529334-2-akuchynski@chromium.org>
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


