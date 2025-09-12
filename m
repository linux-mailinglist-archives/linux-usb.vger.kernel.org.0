Return-Path: <linux-usb+bounces-27994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA02B5432B
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 08:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46ACEA0559E
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589F929E11B;
	Fri, 12 Sep 2025 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ori/PK32"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E370C298CAF
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 06:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757659682; cv=none; b=jQyE5hArf0duaMKATffrMv1cgBSeUh/GNAh1MaQwZuXfOkzqiNtSjnYQQyE3SCGtauhmHZ9XHaxeuN8emwsF1MW0EzkrKoEX45d8ToXoJh80X+H1JNlKsRyyQvps9itvXlJ3nNFW0EREM5I3pv3nWqWnzo9tSOhtly1JnBNzumw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757659682; c=relaxed/simple;
	bh=9TpjhbJBttEeS1KmCJosi4Hh395qIeJ+0k53azp1Q0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgIBPOMtNX4oCjIpWHjrhclx/AKcxEQhuiAdGfPLNTLlamkxP8TjxE/PGvWtcpGhLpUgXcIi+yENItkMgx7oOe7aFc9PrrLTKec09n55/iNwohTLt6qtXzkQLKCjDbhnYM15vs9i94juEZUEDeUhXQMTwjvfLg859QrA4SJTwh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ori/PK32; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b04ba58a84fso212779466b.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 23:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757659679; x=1758264479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faD29vPc8TtJSIlMGbZZx8zq4usFD6uCUoteS6fd/xA=;
        b=Ori/PK32m0qecDiURF5UbohhVhLpLD7bJ5olQjAd28TQOk8JN5wH+NvtWXpKPs08Xb
         X/GYUk3CFtrX0H8WR//izJcZVc/Yt7ZYoiDNzVt+1QJoaOyePgjkLWYSp6HqDBkgQ9k+
         DJLr3JZTdqFTL/YIx3HjkQzNC4uzTl9nFuTwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757659679; x=1758264479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faD29vPc8TtJSIlMGbZZx8zq4usFD6uCUoteS6fd/xA=;
        b=YVo5yctGMDriwja2tAdmNKJuydBTLs8nHst+pd7s6QYMMQLpmTsytwgaecDpAHfEgm
         4UW4SETVxVAQiNge7bjrMOaKfXkyhz3F3BUHpAPAa4l8Xy2K4oQpT9uZ7oVyKMRZE0fs
         9ymrJ6fxrO9KoD7OCZNEVf0vrrdso7l+WFft+NEFARosH3VqDK4EApVsaNu78AISbeU4
         uj8vyQ2f2Kt3llZIEAhIGrft+X4jAetBrqkwKLONfKbnzoH8qpESuctrsaak9JJXHrgF
         BXHvnU+nwp4FMvJDWl99GLIQr+dk1Npugj46x0rF33o5XWt1Hk6m0tDzAL6+fz1Kx059
         iH1w==
X-Forwarded-Encrypted: i=1; AJvYcCX3e+1YPmyqkKpnYGjaVNocwLacq/RTfGwjKTv8akBsdG9N5OaS+tturGL/sXATFsooC1EIyVso3Do=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuIlGNcJyRpZWt4cHoG4I2n9Ys92L77FaETW8tZi2bs/11OhPK
	WuFPqtMYGLMcUxoAtBgZZNjih4C0JNMniaNUtdlIQTIm3C6+0FQLUWUgU99dWzlbxy83trAmGpS
	K6GsECw==
X-Gm-Gg: ASbGnctbNvmBjrEPFHNUJL86SVjkWY0OSx3+FELNud9Oe4gmpkB9pMwxqV6s2BPmHJI
	22wwWGV4Q8dAsRLTaGcL1QsJ5+AM0X+S9KcdfXglly4fbI1WXQGvNFlM9wvcfe2vGjd0iMjaVEA
	Rcifh1tJiFBovaHDIZSRnQXzKowWyluRRqe5ggi07p01gfnL326BQw/Pj1UakGpETPv+t9kWWxH
	0g8/g4UT3XdygBruPp1nEtv3UgaoW+ou8hK99CBD00yziKmPwiOo/VCNYeO6Z8eJjl2Z6FNXjLm
	/sVXj8h36C4d8jBmALXlNMAY0czC/OpfuRmkqg2J96GjuJhqhMBVBSCTKqubWnvzQPtIzWEJFDI
	kvmyrSXaRveaP/FCeGAtMY/3Zi8RW3tI3/dJMf9TENqdOcq3sXwm/mA7O48NNkOVcjNWLeYBT5W
	tUpyrGD0Qns+q1BhcyJ9n+toShdA==
X-Google-Smtp-Source: AGHT+IFx9ydYE5CesosJBDmvUWYyToOaRt9RCUyztzIS5eLFbP6lDhD0TsJXKbVlqYDJqGhNfxzUgg==
X-Received: by 2002:a17:907:6d21:b0:b04:bfda:e457 with SMTP id a640c23a62f3a-b07c3a7b8d8mr152607566b.63.1757659679234;
        Thu, 11 Sep 2025 23:47:59 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm295465366b.29.2025.09.11.23.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 23:47:58 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 1/4] usb: typec: Add mode_control field to port property
Date: Fri, 12 Sep 2025 06:47:48 +0000
Message-ID: <20250912064751.1987850-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250912064751.1987850-1-akuchynski@chromium.org>
References: <20250912064751.1987850-1-akuchynski@chromium.org>
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
---
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 1 +
 include/linux/usb/typec.h | 2 ++
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..9f86605ce125 100644
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
@@ -2681,6 +2683,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	}
 
 	port->pd = cap->pd;
+	port->mode_control = !cap->no_mode_control;
 
 	ret = device_add(&port->dev);
 	if (ret) {
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..2e89a83c2eb7 100644
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
index 252af3f77039..8f51665d44ec 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -287,6 +287,7 @@ enum usb_pd_svdm_ver {
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
  * @usb_capability: Supported USB Modes
+ * @no_mode_control: Ability to manage Alternate Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @pd: Optional USB Power Delivery Support
@@ -304,6 +305,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.51.0.384.g4c02a37b29-goog


