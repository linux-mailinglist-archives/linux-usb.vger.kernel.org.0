Return-Path: <linux-usb+bounces-27258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B277B344D9
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7256189B63A
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 14:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3312FFDE6;
	Mon, 25 Aug 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="egCByvB0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA0F2FF65E
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 14:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756133886; cv=none; b=jzKUA8qHzBFNqpAZl5al0RkzCZrzzm81+eVVH6hfxCZA9qhOE+DRiPRPNe9am+afSbSRfOl63SR4R1/wTLjdeJMhSImj0AcFQClwtTOL+mpnL8MZZOpoq4mdxuSfukq6cdT6ZQJc7hiDbf8ilmY9BB8dAJY/DANykb9bmC0gr+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756133886; c=relaxed/simple;
	bh=ZCOA1dM21DunNLDV0WZf6KhjFBCppPrsp5+Kx8CnzlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwwkvhyPTLSmYgO6s8u8VcM3hDMOqqeHf4LMxAbRIcnBKCJKhm/1pQ62Rid5MNaTIfrlMurAf5yoJf64Jo+gUo3i9jod8Jce6St1Eg7/8ruBxCcVG+Vg6npnrgPboqG0cnpYqRXIcBDcYOKzS+Aueql0T5NVEtZzdHs5rCp6MbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=egCByvB0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7322da8so720639966b.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 07:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756133883; x=1756738683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTzQ3AFf99voNBq9nE295ufzA7UoytsbpCDnPP4k4Ho=;
        b=egCByvB0CGJv2O2i+vnX/mCEY6YET4BBQSJ2uSBc7qceE+r3mr5w8QgvJ8+fycnKjL
         7WMiTYwj+r4vytFFSKI9ZnzF8xS868dHTyabUSALHBtjf0RIHNzJaLps9sd6AdVbxP2c
         6JkECXldd0VdLe6qxJ1AfU2HMkIgutSAITyII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756133883; x=1756738683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xTzQ3AFf99voNBq9nE295ufzA7UoytsbpCDnPP4k4Ho=;
        b=TtrCITYjYks3TSuRQYm6bR+X3JG43lH1OPEZnij/OUlGnG+3j84+RvCr+JrXLCfRLX
         80zEPqfgzx+UraMnJtPvgipaZZAoFydiVo49Jo8s7elVCVikaBnE//JR3/L3OggPm668
         FmdMctcufDySVisPJHs0lp0jjsD4Z/MWWFR0JSMX4IMFzS47aV0jr/c4EY9p6Xg2AHez
         ve0lWO7MS0P3eyfjCQ1v43Jx5YMMfGxd3r27LqGPMljrN00F52DweO/yzO/BntgvXw+i
         mJJio5Shx3zWKvIUC/YroJMB56u6w5loM123Ix6LBCslNXoo5UEpThgshQqrZqV/ZRKI
         GHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY5vpTO8BmHdjRU/vC9wPD2FVPVuhNMnexvFnYXsggNOw1v5qhjYAycCyZH1ZFdBvRswyQhBP+otE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVYb9TeiJJnu9Mc7xVL/N/fC7CkgZSdztV+mpuhvfI7HA3ulLA
	J4E7XKThf9J9OjdPVlNuzRs1dZ9L66CiVRuvxozestwwCg9sNAw22jzji7xzN/jJlQ==
X-Gm-Gg: ASbGncvYHBrzlJm+oCACaoDV3v/FKo1idXYtKgDBuAkQznfyC5aZysc0PLdItuQpmWp
	z3GzNGvJCMYvtNf+d9uA/dBx8RJP0iitZ445KL8yPnbjucce/vk1fkfo/fkV6I0uI5m/2cIbcF2
	hR2V2ndrHeCjnNlfFaW2bJpjdzHN7cT8bwX+iMS1t9qSlfgBErComJ3hZMBmJzMotL5y0ep6Ryf
	A9ob8FunQ3Fx9XGCT+OzP7EMz5fxgFdg0KVVt9zfbu2CQ+ipW9ADDs3VHKPLGp9c50B3kpX8tyZ
	Rzus4BVnxgwqGYazUvXhBIvKlxYVVY04hWWcI0VbkZhTd2R6Z7xIF9i0+mANaXWvEiuvZanEy24
	h8S0E2SnVhMlXMVOnEioZgiBhjwFz10MR0V0gIbAh4Q9CnjHkAB9lDa2edyC4szaOQXuq0FkuOZ
	am5sBVhkVUJWxb
X-Google-Smtp-Source: AGHT+IFBnjzL8FuKILHR8m1mMoFjA8Jca/gOoCCUsOrFaj7AmltK/a12XxOh8THN9ShkNgEj13D5rg==
X-Received: by 2002:a17:906:6a04:b0:ae6:f564:18b5 with SMTP id a640c23a62f3a-afe29047b49mr1141748466b.19.1756133882714;
        Mon, 25 Aug 2025 07:58:02 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (168.23.91.34.bc.googleusercontent.com. [34.91.23.168])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f981sm117294166b.60.2025.08.25.07.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:58:02 -0700 (PDT)
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
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 1/5] usb: typec: Add alt_mode_override field to port property
Date: Mon, 25 Aug 2025 14:57:46 +0000
Message-ID: <20250825145750.58820-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
In-Reply-To: <20250825145750.58820-1-akuchynski@chromium.org>
References: <20250825145750.58820-1-akuchynski@chromium.org>
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
 drivers/usb/typec/class.c | 9 ++++++---
 drivers/usb/typec/class.h | 2 ++
 include/linux/usb/typec.h | 1 +
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
index db2fe96c48ff..c53a04b9dc75 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -80,6 +80,8 @@ struct typec_port {
 	 */
 	struct device			*usb2_dev;
 	struct device			*usb3_dev;
+
+	bool				mode_control;
 };
 
 #define to_typec_port(_dev_) container_of(_dev_, struct typec_port, dev)
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..cbc94282e45e 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -304,6 +304,7 @@ struct typec_capability {
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
 	unsigned int		orientation_aware:1;
 	u8			usb_capability;
+	bool			no_mode_control;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.51.0.rc2.233.g662b1ed5c5-goog


