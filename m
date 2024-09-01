Return-Path: <linux-usb+bounces-14437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF729674C7
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 06:10:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 663461F21E94
	for <lists+linux-usb@lfdr.de>; Sun,  1 Sep 2024 04:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DDA14386D;
	Sun,  1 Sep 2024 04:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b35c02Nz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AB913F43B
	for <linux-usb@vger.kernel.org>; Sun,  1 Sep 2024 04:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163646; cv=none; b=S5ZjP75b7ZVnLoAbVcJagJ04pwNRO445msDN8Wb6OQFcdGWw4WnFBGze1akJSVSTCUNXWI82+1geox6c+ROSZdUplcFLkdG1HAvLA5FUylaZeq6FaqKhhjU22MptH4AX68vmcLmtQpAPE+4OrLmqqM8j9FhYCt3gVw4mMMO9Zus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163646; c=relaxed/simple;
	bh=2tAlkjfeIOfQ7pqxJw2iSfNqPK9cXn4z7367eyq0Rjg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8FhhF5WfsD3krWfCebTQD0ulC2PsfAETjQ8/JFjWJ8xTytVwQBCkJUKF3DHLTY30FJx8L0U42gHDSaDXH31OVWPEVUiaJbKaJflH72M2/AJpoi8MGgqheYyk3TKeNaOwLhvIYjoktfbNoOfeIDW3VLQJSiWSPeVJgky1viLsqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b35c02Nz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-715e64ea7d1so2744262b3a.0
        for <linux-usb@vger.kernel.org>; Sat, 31 Aug 2024 21:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725163644; x=1725768444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nad3jYq+zuMNkdjkLGBBGQbMhdXY1+s1WlyYMjA8ho4=;
        b=b35c02NzFzR6or7KCjz/JT3hJrf37zKeLbWgTGlp16fZ0Ts4DAduISZ+lmV220xwPN
         bSa3mYlBa13/Efam+Yz8CuMHwKTbi+yNX7kjy0Bu34WsSUFwTjH3Uh1qbN3a3A5OZ9dZ
         zzVSXn119IcN9TGua3ZOfMV3x8CbX762/j1vY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725163644; x=1725768444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nad3jYq+zuMNkdjkLGBBGQbMhdXY1+s1WlyYMjA8ho4=;
        b=ZTENLDy5ZPAPnkm8KCMxG0JbhDPB50t0E4ieZnOKkW/2qO1ujJ9AJpCyaKxLHkdLGn
         k2gyY7GNgo7lz3KDWGDWd08zabboOD42F0VCcmSe/BCbs/hdRD7VCyJAOjwc2ub1+R/z
         BZ9DucXnl8IyEb4xEGHu/YSkFzUAg1agP5MbSO/q06VRcb6Y5wCJG9NooLmFAcLjaBZR
         nP983aBkt/Al4hRiayGEbldMFI0d/tBQr8yRtKXdSJqC/oBUDF4N6gyND/stNJnyv9Gk
         1g1Ek2bSHT7ksXhwHiwcglPd+tC7fiGKzIvxf7gsLdFv95l5pAvl+rCN5e52Hbrnkxno
         VE0w==
X-Forwarded-Encrypted: i=1; AJvYcCVlVD/F4SoTMdskp90WL72l7kVD9YNrvpA9IOSyCBoUwmYScRF1en9u9XpBXWtKtswiL0g40ZXRIHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0pfq+2qPqidkCIzvi4TJl6W/1OcN4Wyq2ynw9L+z7pHq/0bGq
	XdcZJ6akTofOGOYqeZQGSV73lx+27eYixlIhQ6Ec+J6Uizg4ezm9j54lxB+GGg==
X-Google-Smtp-Source: AGHT+IE4gRNS1Wle0dhusZLk2Qf9YkMQZghXHbtMZ6oKKSwEP4ondmRftvf+lk7yL+f1D9vFEqjyTA==
X-Received: by 2002:a05:6a00:91d8:b0:714:147c:1377 with SMTP id d2e1a72fcca58-7173b5c8556mr4671065b3a.7.1725163643536;
        Sat, 31 Aug 2024 21:07:23 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-715e569ef39sm4828452b3a.122.2024.08.31.21.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 21:07:23 -0700 (PDT)
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
Subject: [PATCH v4 10/18] devcon property: Document devcon_match_fn_t
Date: Sat, 31 Aug 2024 21:06:48 -0700
Message-ID: <20240901040658.157425-11-swboyd@chromium.org>
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

The usage of this match function is hard to understand at a glance.
Document the arguments and the return value so it is clear how to
implement the function.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/property.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index 61fc20e5f81f..797b1eeda7d2 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,8 +507,25 @@ unsigned int fwnode_graph_get_endpoint_count(const struct fwnode_handle *fwnode,
 int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 				struct fwnode_endpoint *endpoint);
 
-typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
-				   void *data);
+/**
+ * devcon_match_fn_t - device connection match function
+ * @fwnode: Remote connection's device node
+ * @con_id: Identifier for the connection
+ * @data: Match function caller specific data
+ *
+ * Implement a callback with this function signature to search a fwnode's
+ * connections for a match with a function like device_connection_find_match().
+ * This function will be called possibly multiple times, once for each
+ * connection. The match function should inspect the @fwnode to look for a
+ * match. The @con_id and @data provided are the same as the @con_id and @data
+ * arguments passed to the functions that take a devcon_match_fn_t argument.
+ *
+ * Note: This function can be called multiple times.
+ *
+ * Return: Pointer to match or NULL if no match found.
+ */
+typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode,
+				   const char *con_id, void *data);
 
 void *fwnode_connection_find_match(const struct fwnode_handle *fwnode,
 				   const char *con_id, void *data,
-- 
https://chromeos.dev


