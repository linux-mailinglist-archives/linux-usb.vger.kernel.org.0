Return-Path: <linux-usb+bounces-14431-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16259674B0
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 06:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F384FB211AE
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 04:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD2F38F97;
	Sun,  1 Sep 2024 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XXUBv+CG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845676F2FA
	for <linux-usb@vger.kernel.org>; Sun,  1 Sep 2024 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163633; cv=none; b=reI3TmqwqJi/yQZEMIvgRnx04K5/uNG80LbKaEfAKuFCTMqlNZp5b9E1XvArDlJIbxzMlIOMzbJcwIx72XtzkJqjQjLqVLB+LNBRDKjOs/Ct6FawMsQ3yHfafhgrCYRThjKoKHY7EtLeB/rDI0kPNUL42TsWwz+yfEKBB2f9rBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163633; c=relaxed/simple;
	bh=lQuo9VmpRTMEUSypDAVnMcCD781MhPSwWoCv0Ud9eec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjnBrpxxCxLRygqbQtLW/FbX7nYc3l3xt5212gIgAOIgoyM3OxH2Ohmqwk4ddR2BAvSU+94i3oX90ysR7k7lbyqacCDQGKYn32ikzyX67qB7Ol2omiJ+bXLl/f0I9/JEramQRDEcLs+MFrwY2yQV+IAEaTPVmzLOcVTxGGyrBns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XXUBv+CG; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5dc93fa5639so1904603eaf.1
        for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 21:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163631; x=1725768431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N8vS/njRh59NN9Hhbqh05Yl3HU3mcBshclMsZjbFEo=;
        b=XXUBv+CGuy3CD5Jb251OYi4bH6NRFL8hhKhRN+LccXoDWdaNtsaE7P7Os2YnehRkya
         LeblKHIvjH/dRZ/eSwOqRlZKRkvJXh1qTQSu+l5Gm8Htxk54v4f4gWXeZoCia305gNXh
         XyZUKfsI/VNTFC2iruBY195KOQqTKp8FEjpnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163631; x=1725768431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2N8vS/njRh59NN9Hhbqh05Yl3HU3mcBshclMsZjbFEo=;
        b=lc7OIJ7NX4pVY9EK2dgS+YKoVCLC/UMesTNSZCwdcWBO4C8xBKWNaUwkT0L7v7zNOe
         nHxclIqQxdkPxJYYQ4MAgtHFxVN21fYUxwEUQwodr8XXNk1J+25GUrvoxG0zeSTRau/Z
         M9/F0ZX2/kTPq3Hsv/IWpIoAKo9dDemATr1xd/zQ6bgH/IHU6QD5YxqTED0c47TuphPU
         1631KxKqE8XKAPLMj/mL6UpyQlaC9HOfYE5IDC2p86iZYgAi8Le7xrN/SUDtUAda+8AA
         4mvcKwOmMcREOiOwGKb7Kmu/buZLMxFXkWYvYenVZElq3V9gBKnqN4nuqtN+vs8bzbLi
         AGHg==
X-Forwarded-Encrypted: i=1; AJvYcCXnO+p/lJpnVn1DcxrhgghCafcNhycLMm8UypSXWeJ0Q5IUGBeT4ZfTF00hzU8tx1bmfNfJxO4aIMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbkWHb6XyhAXu2kk96wESosnkxcVM3dXPJkdi0q96j4LtzoH8
	kdWYk0JZ/OgRT0MyKw/qrZs7GtzlblMqk+mZzBT2HmIy5EGhv/Gj6gD0cye1mA==
X-Google-Smtp-Source: AGHT+IGn0G5AiONQD8K5yi4LzBmU8yqa6VFEQOeNXV9U2Ho8xKtvyvDtSksQxtqrZ7RRI09TCw6qDQ==
X-Received: by 2002:a05:6830:7310:b0:709:5601:abea with SMTP id 46e09a7af769-70f72bb320amr3883433a34.10.1725163630581;
        Sat, 31 Aug 2024 21:07:10 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7d22e77a7besm5341681a12.37.2024.08.31.21.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:10 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Benson Leung <bleung@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	Guenter Roeck <groeck@chromium.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Lee Jones <lee@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Prashant Malani <pmalani@chromium.org>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 04/18] usb: typec: Add device managed typec_mux_register()
Date: Sat, 31 Aug 2024 21:06:42 -0700
Message-ID: <20240901040658.157425-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240901040658.157425-1-swboyd@chromium.org>
References: <20240901040658.157425-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify driver error paths by adding devm_typec_mux_register() which
will unregister the typec mux when the parent device is unbound.

Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/usb/typec/mux.c       | 35 +++++++++++++++++++++++++++++++++++
 include/linux/usb/typec_mux.h |  7 +++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 49926d6e72c7..db644bec862c 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -457,6 +457,41 @@ void typec_mux_unregister(struct typec_mux_dev *mux_dev)
 }
 EXPORT_SYMBOL_GPL(typec_mux_unregister);
 
+static void devm_typec_mux_unregister(void *mux_dev)
+{
+	typec_mux_unregister(mux_dev);
+}
+
+/**
+ * devm_typec_mux_register - resource managed typec_mux_register()
+ * @parent: Parent device
+ * @desc: Multiplexer description
+ *
+ * Register a typec mux and automatically unregister the typec mux
+ * when @parent is unbound from its driver.
+ *
+ * The arguments to this function are identical to typec_mux_register().
+ *
+ * Return: the typec_mux_dev structure on success or error pointer on error.
+ */
+struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	int ret;
+	struct typec_mux_dev *mux_dev;
+
+	mux_dev = typec_mux_register(parent, desc);
+	if (IS_ERR(mux_dev))
+		return mux_dev;
+
+	ret = devm_add_action_or_reset(parent, devm_typec_mux_unregister, mux_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return mux_dev;
+}
+EXPORT_SYMBOL_GPL(devm_typec_mux_register);
+
 void typec_mux_set_drvdata(struct typec_mux_dev *mux_dev, void *data)
 {
 	dev_set_drvdata(&mux_dev->dev, data);
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index efb5ed32b813..08431f0896d5 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -99,6 +99,8 @@ int typec_mux_set(struct typec_mux *mux, struct typec_mux_state *state);
 
 struct typec_mux_dev *
 typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
+struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc);
 void typec_mux_unregister(struct typec_mux_dev *mux);
 
 void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data);
@@ -123,6 +125,11 @@ typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
 {
 	return ERR_PTR(-EOPNOTSUPP);
 }
+static inline struct typec_mux_dev *
+devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
+{
+	return typec_mux_register(parent, desc);
+}
 static inline void typec_mux_unregister(struct typec_mux_dev *mux) {}
 
 static inline void typec_mux_set_drvdata(struct typec_mux_dev *mux, void *data) {}
-- 
https://chromeos.dev


