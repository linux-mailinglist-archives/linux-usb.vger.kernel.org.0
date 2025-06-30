Return-Path: <linux-usb+bounces-25301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA5AAEE039
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2784917806F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A4A28C2D3;
	Mon, 30 Jun 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iRJQqOJx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A15228C027
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292774; cv=none; b=rKPWvpxEykNIn32Pn0jFkuERYE0XR790kdHiFqKF0iGRUAkhGLADRcGNNT5N6EP3uRS5o7r+oeS3MozWL10DMZKZEYqQyF/7d2da2YfLTS7jhfTOwzuuQsQ6XeNZ9t90DjVoQqlzLpQ2hIpGnOfr0wSOey4qbmbuLbkgAX9X5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292774; c=relaxed/simple;
	bh=UbU7avGhiW9Nh0EyyPRGSkHu5w0s9/pYfAxGAYTBVT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6msf+Iarvzwh+I+JP3z0TaaZEj7TirGT6Kn9Jhpeym1uhWiVBd/h9eiBtCJsZ286LqqI7QNnUSU5pkDXp45vxyjilX9eSQhymp6kN/wk+APyCW86s7gq6LeTkLWuEtMN6YfwsGMWUZ6MjZto2F7/W2SYO9O+y1iKB3yjcx/zdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iRJQqOJx; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6097b404f58so7711618a12.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292770; x=1751897570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3faCGZIUGXYM8A0hkVX0sik8je51spanXR3H0h+FTl8=;
        b=iRJQqOJxfnPkd6Wl2DfM1kvlsltOm2MQaJWvBQyB7ZWmh2Q8DIvyXNMhKhEz02EyKE
         bMvJFfSEzi3ODwCsJ/BIK9iLR4c3o/lliXD+IHH7Dlp8jgYt3pBIovPZ1efczWS4iw5E
         +eibB8U9w1RRwOXfttFjbgHUAHQR+WTeQHNyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292770; x=1751897570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3faCGZIUGXYM8A0hkVX0sik8je51spanXR3H0h+FTl8=;
        b=wpKbhcJI/+1vL6Az5F2gXAdG6anfw+NMPlHcMU/PS++X0bfNwmM4eAzqw2fVA09Vtr
         7q6oQ6ESTAW7JASJRvOWBTUpGzJrQxl/b+WVBzuz2hlUWmr2DMsT0wsGKv5w9foBIJg2
         +GlTbwZAmkLev1/5R1Z+X1aILRhvHkJr8ohRxMOl2dTgpqr1q3szUPjhCJDr+HmSa35u
         WESFOlY9QoOSxiebxrbD+kLVuwOV0cZ5aubm6Mx6qZBEaJNBJsEHaLP6DFanMtfR+D3R
         sKC1i3/9ict8u52GdTth8chG2gaQM5yfg85tpMj5Xb3z9V23qMRJtvDoWvTSvzmXdd+A
         sMpA==
X-Forwarded-Encrypted: i=1; AJvYcCXLeV9b6YX6MvQkkA17/FFILUES34BWpiY0KsIk73n0lZzZN7W4qfPtvidC8tsk54vWYYLfH4qg6Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/2gabmtexjvHJk41gZKHIZ736TzcW6w3ArIcGapAl7mOKjsmC
	oZ+3ZBMuhMdKPOn65/DUixzHGzIOg307ifkTToyMrbeq+obOQx5U19aikAMa31CBmw==
X-Gm-Gg: ASbGncsCpbpkdnd3uzTTXwORD6tBRy2MpxQdeQu4KbxgydkeX6SztVpbUnXslFukpLy
	k6faQinrO/I3fxT0GPEOJAVc9WqoaBBiPiJDEYe7M57X99mr909qB0F3NEeMXxMaeFPJzE/iUlG
	jSKiDS/ApyYIkpvwO0fSU3bEWqVnAXjWS24M9Ad1TJVgLG+oVYjK+TZeOl0nm2rkMNnf1ra0KUZ
	6AAJRqj2jZEzkb6i5kO4aPA5ZGj1/eCzIAI4CFcv667Sx1iDJFbZ1/vmHaifXECOKzp6HPPHFK/
	yFSurQtflBOOUNrrOBfe5H3yBBfauc0BrNcKAqr1xNkEKO8YJWYd38tejmC3ZN+KQ4Kk5I8KVQz
	KZejMJK4N5OCOAmVN3RJuTPWOURJ1h8lRVIlxHBMEn8pR1B4jbcUH
X-Google-Smtp-Source: AGHT+IGivi6cPTyaSHpxq+HEAQH9kp3ktVpVCImG4H7wtjZGGZZw4e2kZfR98cB5DDtCwjdDtwQmUw==
X-Received: by 2002:a17:907:3f1f:b0:ae3:6a82:e6a2 with SMTP id a640c23a62f3a-ae36a82f7b0mr1096335266b.29.1751292770281;
        Mon, 30 Jun 2025 07:12:50 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:48 -0700 (PDT)
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
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon, 30 Jun 2025 14:12:30 +0000
Message-ID: <20250630141239.3174390-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
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
2.50.0.727.gbf7dc18ff4-goog


