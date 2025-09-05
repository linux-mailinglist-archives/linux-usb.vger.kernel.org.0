Return-Path: <linux-usb+bounces-27600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E72B45A3C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 16:22:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EBD57A4F5B
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 14:21:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F51E370588;
	Fri,  5 Sep 2025 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EGi4rZ3g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15EF36CE11
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082139; cv=none; b=BOJkmh8AIzIO6KhVXrUzwRKwdiJErNQeGQcYsuQmiDV7uixHZwsFxzJuXlSLNfmaVX0AWwnSag9dflfGxo4JH9Ii2pmjPjZYoMN+rdZRk0hWOoTZW13aoBG5LC8Lgl14kvt1xUg5cGemy9M+CN6UoQle3jFXGj+w0TRVNHgl9Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082139; c=relaxed/simple;
	bh=Hc11dQRZZPHY3rRj8sQC49olD9NpE7/7qRqZ+w5XAn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfEWotzDgUbAGffX9cUY5DK7OqlqkUeYetsl5wYUVxVqCScKPZoEVwB0FDuC43zvHlhNqkLtn9EScxDYhlWrtu04+P8pHEb+t13A4CPyRzKWKOFfqkz8CMNqy8uhifZ1EfmAOfAvis/s10cArqKpWTGjP/jajmjrfyEWnQ7IYZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EGi4rZ3g; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so352256766b.3
        for <linux-usb@vger.kernel.org>; Fri, 05 Sep 2025 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082135; x=1757686935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OV1LDwfiuLJ9IBiJAs7IEkPWomukwV1rFx4+Ev+/eEE=;
        b=EGi4rZ3gXp98MjF18cLDkcwhmcT3KAvL9cEWX0LJ4qcLVNHyJFtaNShOppa2UcyQhH
         CArbZZqBY6WpjM2thXJuFIe6HjYgFyUdG18KBKPWrDhuMRNbIZfWKxJ+d2zZisJguuMm
         QoJPx+6Y9fiPREwXKgX2FUnp4maOj08lmMFJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082135; x=1757686935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OV1LDwfiuLJ9IBiJAs7IEkPWomukwV1rFx4+Ev+/eEE=;
        b=mWpW2p/SpwyFfqNxZeVopioGDYNZSCKMLhiLHSYhVaBFKO9KJi1WQL55E2+f2fAITk
         Zk39iHmo1C27Bv62lho2OMVVq5F7dCS+J3CQjeXLvV5IJHLp7j39GKDnKTrfxG3yqQHE
         6lRc5q+XDP0xJtlSnUxJ/JsufCCjLJ1hbvzEGQg+lqP2W/n3A9Jpb4Pu0FXpu7Wn7DNV
         0payTdbnbKvpXv+3V1IeHKdQzzaTYXU63IdKauko7aAHNPKTo8dvRmlfyZs89cMKN3nT
         RCw7qi4cL2ipdsK9B0G2KTgg0P6gWxl0DumJG1EZN1CGrjHJzZtQLO9KXJ+I2TNnnr4/
         6YRw==
X-Forwarded-Encrypted: i=1; AJvYcCXJrnVXo8trgnuP+5xhiPUSjEIBIhaL/Rvpk1dLcq3ZHwfzMpMGbHinfTQmZde/Q1J0J8NZJgR7TJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6R+qnG5CBccl+cntITN6QDkTEujde6PX13sImP756heX3Hkkz
	7jM0Bx9kN62pLISxYiD66Gq4HNTRRhVMzHKHfrLJaWlD5yDKSrGgFCRQw40KipcV8g==
X-Gm-Gg: ASbGnctfRu9c3Gmy8WG0kUch9TGq3GnJkVvm3WRa1WOe7NAh6vXfKUiwe7sUjAvZGQN
	TZGisC6l5bVktKbGJRa6lcb+N09c3jbNgx278JUt5YmzCtmAW+i0bjTEE37Py0R4nHbo9W9PEvw
	bYgF/scg2cpq64grxM0ExoYr4mpwe8+cKA08IotRiKD5I3RnvcN3NHzBE4aMudoszMTQQXlWbUK
	B8gKy0bKSqI627n/i4WaPKdMWtnsCqgXSnEG66/e6RIKCkbkdbcnVVimOxu+2t2U8dA2zDm22FI
	AiJjw2r36LBATebXBV8wrAxLvYsMcbb5SsOR6LNtGC8FbzAUXBTgHQPEG8fIno1spRR9WaonKnl
	UOxSv/7F6auPY7/SwATIYVTZMNpp3UJA5OQWxVIF7tvj2JePQg4MFhQrs+4TPuWeJxWVmIe0/Oe
	yXSyM9wNt3bqOYsPkO3UlLyx5RSQ==
X-Google-Smtp-Source: AGHT+IFCvd3VJRlMQTN63ZbgjjAhsrShJNCJ07Shx+1GenFVnJohKqUi4MazUtwYOIyKPWi7eRjrKA==
X-Received: by 2002:a17:907:1c8c:b0:b04:8ed3:9e81 with SMTP id a640c23a62f3a-b048ed3d358mr431118866b.31.1757082134828;
        Fri, 05 Sep 2025 07:22:14 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:14 -0700 (PDT)
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
Subject: [PATCH v3 1/5] usb: typec: Add mode_control field to port property
Date: Fri,  5 Sep 2025 14:22:02 +0000
Message-ID: <20250905142206.4105351-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
In-Reply-To: <20250905142206.4105351-1-akuchynski@chromium.org>
References: <20250905142206.4105351-1-akuchynski@chromium.org>
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
 include/linux/usb/typec.h | 2 ++
 3 files changed, 10 insertions(+), 3 deletions(-)

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
2.51.0.355.g5224444f11-goog


