Return-Path: <linux-usb+bounces-30861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34CC80937
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:50:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09FE54E5400
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C26A430171B;
	Mon, 24 Nov 2025 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jCewDmK6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51749301463
	for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988411; cv=none; b=pccYmBmgqDSIdL2eJDBQjLUe5RUaM7uhbDqzrNYg7aNFWAVOz2qrNadEayaNKPBIiwPhfBfiS++Mxdb67Ai9vWVGQo1V82xED3y2lQUIRy6WSZjE97S9tPM0nT0E36XOE+Nex0ma95Fy5pAsraWBmYcqxyghpfD1JVs1cPYOmjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988411; c=relaxed/simple;
	bh=fxEbaz6w0uMCGJivWLfG+scyIrw8SEt71KrJ1bqrzW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b93o6hiz1bMO5naMmXNI/1+BiYyqVFZ8p3xH1R2iSKYePdXnPBz1Hvwzoq+4llujNnpELaa/BBy/0V9COzZ+1jd4De/PVd6ZRWTU6Y/LMDiA9zhukiJlNr6ZBQBMj2nmlyfhxNiwqkgyHzsxjVPAbC1rpIj5yX+ClGQ1i3vy2DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jCewDmK6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7291af7190so620780466b.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Nov 2025 04:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988406; x=1764593206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnwvCDgrr4841IDmxQlulqzHQNtUVlEwFIhs0bIly3A=;
        b=jCewDmK6wy7OcmPCyDr7gUfwKzJMuOgt3+V/t3CKBZGA61adXuCCv+/BB7akbNqY8t
         FogPSceo0Cs2FXXEvK5rRtAPPCznPTFt+yCifJVVJd19tYIy8irsrvhjzDS791anbOM0
         4sbunm4yQL35SAPmm2Qzquen7QpT0oMAmeung=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988406; x=1764593206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnwvCDgrr4841IDmxQlulqzHQNtUVlEwFIhs0bIly3A=;
        b=IMe5RT2psWMn4GwgsocdHuo+qsahkdbs6tWzPMNm/31U/I6I+1inTIR1WDadWjk97R
         cfrxJZf2S935Snne1+fiwxD6q9lMWETDPIR6W9uj+6LgRhjpyNjr6gyryw6um8sa+Dlq
         8vr7qgXHQfZspzrlgnndHkfVNngHhs7tW93R6k6FbdygCsvwShhdp0omIEC9XYNEBsl5
         A3tl4w0eywFbHOA9RC9EJzgaoLM92DHH0L7i/GFAxBM/MKrHe7YUSbLonH9dhxu5zzsb
         MmMh3uLJWyk9qF9hrjBHEGhBSpAMUBJGXmuPHrDYQPoSIR7bOkx9rBjRi7OeUsapqtfl
         c38g==
X-Forwarded-Encrypted: i=1; AJvYcCX1QkIZ2SCyIPPWI1drb8sLEE5C/B57Kfol1MblBq4FwruB5CxDxniXu/2gAA7d6Yi7pX4PAuwYufo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGCSEcgdW+3sBte+fzkX3/TL0L0L28bGkyAKh0ZCqF8UW6UsBo
	DW4BY7PNb30N3MWGWGnAkcL4PFdG6NL0PNuNNsPvyHo2XXlBFvzPTW8Dp7Vj0hVxTQ==
X-Gm-Gg: ASbGncuttfD1l6DL5gFsQjk+y4VbiOksQtBMhgMa+PxvQZwXor9k94MlsUa2eTYkywK
	MkI++EuxAkMQS5eExraVLdI0pyONM/yCqaJ7C+duPe4v4OyrYl09LHBYWU6zHtfd3P1rxcm3rxN
	JZNoAg/i7vHhoYlDzVyBX0E/45T5HiupYwd5ZlqAw/lKpQGUr547bFh9Nt2xW0IPoKQKfzYxVBW
	0f+OX+E48vxNbQdgJCK4pV7GlA3u+jE4ttMpuL0chnq8b3uSZdexmszQbTzZibrHP82kVxBN3xw
	eI5WoKYWBnqgIZ5Sf4rgLfZkAcaDhCyY7AnOl0za716jjXeXkl6r5d01xZ9ohmc/sud4Lre0a9J
	MJRcgWQlYg/VA+ARi5RAOYjCsUqEMoRFC3Q2+nW8o4tyD39bALGY8askxfM/5mqCIZyGSjCpmcc
	5u2JUgx3nrp3gpndiA35GpSfLUUNXdIcbdIgoPK4YHEVPfHKkoDwME7YxmCqqgiDmMKPjjgLphP
	OR5FbJqEYw=
X-Google-Smtp-Source: AGHT+IEBkgh8AVlO5hu3L84i66IimEV3HBFW93RnnCjQGKAdtwiKbIMtcj0XYTbEpogMfTr251MMCA==
X-Received: by 2002:a17:907:3cc5:b0:b71:51b:bd4c with SMTP id a640c23a62f3a-b767170c7dbmr1109856466b.50.1763988406487;
        Mon, 24 Nov 2025 04:46:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:45 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 1/4] usb: typec: Add mode_control field to port property
Date: Mon, 24 Nov 2025 12:46:36 +0000
Message-ID: <20251124124639.1101335-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251124124639.1101335-1-akuchynski@chromium.org>
References: <20251124124639.1101335-1-akuchynski@chromium.org>
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
index 9b2647cb199b..a5327e444265 100644
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
@@ -2694,6 +2696,7 @@ struct typec_port *typec_register_port(struct device *parent,
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
index 309251572e2e..59d5fd7e4ff4 100644
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
2.52.0.rc2.455.g230fcf2819-goog


