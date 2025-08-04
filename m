Return-Path: <linux-usb+bounces-26456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B405CB19E30
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9B53A9050
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE8B2459F3;
	Mon,  4 Aug 2025 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="luiiZTaN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABF2245003
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298249; cv=none; b=CnYJxOXbUgOxp9nM1k2tO3SMzmhxuIOkWFbHff7WW8amvfu1oiD1piq2sTF2i/X63erhWGEBET0BzqZtMi1bOknHD0oF6GXCtraSCXVRcBibqRTfBuhsmKhmyacR1s1xofzEnpm0YpMyzsaC62oxUYIXxAJu4L8LeyzkRGe0BGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298249; c=relaxed/simple;
	bh=SeYBoLiLdsd4RYBx+xmk62y4glTyVdE4JpC5IMRPlMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPz9A9vIOoc9Dvb4HnQYmh0iuUVOgBuoei+vBm6a7NG7JebrVXN6Y1xd5MmzWrzWnpPHLljTc+cex+WUXH9koagfPhZG+sPAR8U6gwOa1FQtZ8z0fldmmQaT9QyZz8rGUGw/1UhWhynU3tL2vyo35K9cpEtYD2wCb7oSIiAurVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=luiiZTaN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-af949891d3aso236064866b.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298245; x=1754903045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbhdT3BVEtPsr7nMwgyR5zxNdwkZ/IAe0pEt6XO5SM8=;
        b=luiiZTaNv7Qxi1lKhzxANGHnOQk5b6aiP0HwgCFXaiC7apueLzmcFu9sA039Ws7N26
         b0Xa2rxNdJaVPiNg74xVWCO0dkVrAlLOKeKCUUE+WPst7ZZvFJ+6exvUjnCUb3ULWeOJ
         13PSA3QkgJBtvJURdLNRZPknWrBlF3jk63+nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298245; x=1754903045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbhdT3BVEtPsr7nMwgyR5zxNdwkZ/IAe0pEt6XO5SM8=;
        b=vsGU9bBza6Y1HgxH6T8lcA9kI4Y1kG9swk+TSbWsIfwjfhDmaSY3869gLphRIWy08O
         3Q0/y27tEA8+IYTye15gM3XDLOSlKWqXsa8UB1j9BhuChUt63eOsrOhjfPezc0HlOnTa
         Vx7Xt63Xlbw33/EkqiG7IYJu8d77/p3xlTkXrncC4BX7jxdBufJNnxkRk4PxT5DBHd/w
         kw9KnELGk3dEIhWORaSC9gPb19xENLiV0URcpyZZdwWjxWryDhoK7SoJQBF2yVVH/w3F
         RmgQnlo6xPHfe+2otfNDeCIWHzj5YRavaMOeW445WewAaG9esqoN/4reODF6emqVxtrQ
         pTng==
X-Forwarded-Encrypted: i=1; AJvYcCXeT6W3lahrQlBdb00Gq3cClLXbNO1WQkTgOrqFeflUitYP5fhiCuVpQgByy+ROJkh+kx7G5Ul6zXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7tS6dXX7bqC+glBuaVVRS9FmmhEmyZwDSGF84tiguMERvakLD
	vj/aqm8OBM9VUqBFgbE39ku9n4JBgR3RicTItZrUnsnWZ+NX9dDKFI8xIGYemfhGQw==
X-Gm-Gg: ASbGnctRF1Pxyfm2cePqapu3GOrw0pfOYAA9O6Ix9mJj3aYzZ03CQgRWKJS0ItT+g1a
	eCJnybGvo2tk3+bXI1ehdp63CQ8yD221x6+Nz+rhc4ALT51Gz+o4cl6ss6wN7G/dNHV068y88qL
	4P2yPK6MZegVwcdY+DjwZBM1mtZhjWVh8L6HvcgY1bFZBeAGegyabONAGAciXB0FP7t3TWpNHIP
	5BtyivwELz4UXOn7BU2icSvyVMNSgx/3sdDJSZV8JzJbqspEWLWocgM/qgZMN+FM8rg+tK+XfVm
	/jcmpjafkMxazz+fgSzFhzrJtLW4gK+bVnks/4n6am55DCR2uU4RdeRmf2oW7B/d8uCCEq+oQeE
	2VnGSfixMvfm/EjY0codI27nsb8S8KXq6CkwB8QfP7ymm7l5FioPV9zg4OP9wMvHsYbj10wWFeb
	A4t4doHcriIP9nvLEWbQYBbnNESg==
X-Google-Smtp-Source: AGHT+IGevy8HvEbH/6/5kPktQXX98NEixPFRIRgQ3eseS1Hs85sSCgqCJM8sG0Zq21CouJBtYcjtwQ==
X-Received: by 2002:a17:907:6d1f:b0:af9:e9a:3ce9 with SMTP id a640c23a62f3a-af940031934mr1082193166b.10.1754298244562;
        Mon, 04 Aug 2025 02:04:04 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:03 -0700 (PDT)
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
Subject: [PATCH v3 01/10] usb: typec: Add alt_mode_override field to port property
Date: Mon,  4 Aug 2025 09:03:30 +0000
Message-ID: <20250804090340.3062182-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
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
2.50.1.565.gc32cd1483b-goog


