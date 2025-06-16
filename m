Return-Path: <linux-usb+bounces-24787-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB78ADB22F
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F31483BAB84
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2502EBDF1;
	Mon, 16 Jun 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gbEXMURP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB62877D5
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080807; cv=none; b=CEEDoaSdV7SgVV2/lQsJmlQUDb98TSg8X9xwku72cn9tTflgMSkLHq2iBhqR8jjSov8SmxmKkH7LGxxlug8fZ67FFsmzLVGUjmH8N7f1M9QsUhVryC7zI5iStyUp7canTBiXm4nQunTNOqVuMOnuEaRr8eLo4XxdYyGZBktw4gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080807; c=relaxed/simple;
	bh=+scX2JYc7g6Ny57270FvHahCDuDgXd0MvSdrc6MN7nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bHPE5RrCOAir0nv5B4O3zkvSXujvJtOEuV7eAIyb0YVV9LOYSibH1g97diDwoTMU5IDeEh9CussNGOMibCOe5HTxUWnPen6U8UxhBec7f4g2j6To5E9Dy1dL/F1d+LwvwlYwo25dqzmz+TVqGZVdN6zMAG/lRNLr04ZqzH2Yvog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gbEXMURP; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6828361a12.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080804; x=1750685604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPdVq+ZgSkdda1i1UwSKR/3OTMARvQfHUqZ/Ok6pdjM=;
        b=gbEXMURPbLhmBb8SWn6CgAXg9/Dv1SZUZYgiZf5lIV9zgH6vHMydxFNfhSWxvXjXsj
         HkzlqQYgEQtOCt0WqkGzI0BzQNKx0CYhVOXQxSrOzbikiUpFtVL8+/V8Oekciqrvp2Rw
         PQV9FbjaWK+TU61C+LJQdq8jJaJ4v2srpkvtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080804; x=1750685604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPdVq+ZgSkdda1i1UwSKR/3OTMARvQfHUqZ/Ok6pdjM=;
        b=JtisrM9GJTZumlkWZdmZViJK2ZHKVOtlPn6ZJKUwI8L9ZNkDPsPjzCE+SLFW3sdGe7
         klQIWROHD8h5X3AzemVN4WxVSDEoognymRZzphFNj7WKKjTeyYD7cr8oGtwPQ3qhG3ij
         5QiHlhPAXSsDueT/q2CyxdMBcS2eaFzQoMp9/xpGx/JxhVhox4xrmQJFVTdVv05elmnP
         4ug1RhT/QCmRGmteyLhqzuS8jsOoFSA0857JN7W5Z25BHzr5PI4kFbnAnvyqL1UFTBHu
         nn9GeuDKVlvsDsKHDT3bkO6FgeS8aadQ6v3cgzGiJRIRaNe71Ao6iyTaobaJwSnqxW3t
         PbJw==
X-Forwarded-Encrypted: i=1; AJvYcCU2AqDMQoZB3J1dKSomFo9n5/ZlHBiVgraA6TX8VX4bgzn++LMIQNC82Pvkyo2hHTkwRKLdQFK1OWw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqa8qOb4vNdk+FppOMrcSWsY3tQBG+g1SFCWx/wZQwTK8n4wE/
	CIoMSGm55dsY+w94BBs2CXMAlWs4YcOKw4nHn3v4qoL9fBcosaoNScN4IrrJn3j+BQ==
X-Gm-Gg: ASbGnctSVVfvB0PRb/PJS0daW7W3//4TN6UldKnhVXllG+NwN4DEKulhmk5/pvJ0qkZ
	wjP+BDRbZ8SsfGYG7qG94CekPgUUKjR7loC/9EQ9W3QTHbvLCE+hQWWXk+v0Y3ijrxW8p4Q/wzf
	FiDioUVBDBybkpb8fWDcVUDKGoY9QN6JlzAVDFbN1K0xzBLsZUtFF1nUnAlhMNX2f3DUjdk5i8k
	wUQ7FueSUxk1a4AxKsjPxhpyUAsOiZlmmCkbpZsW50rCu6CkfgPtP8jcDS+AZnAuqo/AUEJFNoh
	uHYRHpYJAoypRVXKfNA3DqHVzUM38lxlxFrwWAhkj4EfgxLXRVPyv4u/z8br9SgOeJqc9m5Kbvy
	eUhBpaI93ApjGq1cWXWHsnty1ohICORlXhRLB1NcXrwGq5muBcW7h6B3rDQ==
X-Google-Smtp-Source: AGHT+IEw1MMStshySFu2Mw5NkUcbiGEAYvldonklBIuuR3wJfDRbJH4QZvobhuQJzCFy5gntWE9cAA==
X-Received: by 2002:a05:6402:34d3:b0:607:2d8a:9b3e with SMTP id 4fb4d7f45d1cf-608d0835d29mr7714154a12.2.1750080803788;
        Mon, 16 Jun 2025 06:33:23 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:23 -0700 (PDT)
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
Subject: [PATCH 09/10] platform/chrome: cros_ec_typec: Propagate altmode entry result
Date: Mon, 16 Jun 2025 13:31:46 +0000
Message-ID: <20250616133147.1835939-10-akuchynski@chromium.org>
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

In the `cros_typec_configure_mux` function, which concludes the DP/TBT
alternate mode entry, the error code should be reported back to the Type-C
mode selection logic. This ensures a detailed result is conveyed to user
space.
To inform partner drivers about the result, the VDM mechanism is used. For
DP altmode, the DP_CMD_STATUS_UPDATE message is utilized, as it is the
final one in the mode entry sequence. For TBT mode, the
TBT_CMD_STATUS_UPDATE message is sent.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      |  9 ++++++
 drivers/platform/chrome/cros_typec_altmode.c | 32 ++++++++++++++++++--
 drivers/platform/chrome/cros_typec_altmode.h |  6 ++++
 include/linux/usb/typec_dp.h                 |  2 ++
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 3aed429fde03..a4f338771094 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -610,6 +610,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	if (!ret)
 		ret = typec_mux_set(port->mux, &port->state);
 
+	dp_data.error = 0;
 	if (!ret)
 		ret = cros_typec_displayport_status_update(port->state.alt,
 							   port->state.data);
@@ -699,8 +700,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		cros_typec_tbt_status_update(
+			port->port_altmode[CROS_EC_ALTMODE_TBT], ret);
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		if (ret) {
+			struct typec_displayport_data dp_data = {.error = ret};
+
+			cros_typec_displayport_status_update(
+				port->port_altmode[CROS_EC_ALTMODE_DP], &dp_data);
+		}
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..7ee295cf0c02 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -28,6 +28,7 @@ struct cros_typec_altmode_data {
 
 	u16 sid;
 	u8 mode;
+	int error;
 };
 
 struct cros_typec_dp_data {
@@ -295,9 +296,16 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 
 	dp_data->data = *data;
 	dp_data->pending_status_update = false;
-	adata->header |= VDO_CMDT(CMDT_RSP_ACK);
-	adata->vdo_data = &dp_data->data.status;
-	adata->vdo_size = 2;
+	if (data->error) {
+		adata->header |= VDO_CMDT(CMDT_RSP_NAK);
+		adata->error = dp_data->data.error;
+		adata->vdo_data = &adata->error;
+		adata->vdo_size = 1;
+	} else {
+		adata->header |= VDO_CMDT(CMDT_RSP_ACK);
+		adata->vdo_data = &dp_data->data.status;
+		adata->vdo_size = 2;
+	}
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
@@ -370,4 +378,22 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 
 	return alt;
 }
+
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error)
+{
+	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
+
+	mutex_lock(&adata->lock);
+
+	adata->header = VDO(adata->sid, 1, SVDM_VER_2_0, TBT_CMD_STATUS_UPDATE);
+	adata->header |= VDO_CMDT(error ? CMDT_RSP_NAK : CMDT_RSP_ACK);
+	adata->error = error;
+	adata->vdo_data = &adata->error;
+	adata->vdo_size = 1;
+	schedule_work(&adata->work);
+
+	mutex_unlock(&adata->lock);
+
+	return 0;
+}
 #endif
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065a..848a2b194b34 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -39,6 +39,7 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
 struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
 				struct typec_altmode_desc *desc);
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error);
 #else
 static inline struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
@@ -46,6 +47,11 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 {
 	return typec_port_register_altmode(port->port, desc);
 }
+static inline int cros_typec_tbt_status_update(struct typec_altmode *alt,
+					int error)
+{
+	return 0;
+}
 #endif
 
 #endif /* __CROS_TYPEC_ALTMODE_H__ */
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index f2da264d9c14..1679f7bb0c75 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -44,10 +44,12 @@ enum {
  * commands: Status Update and Configure.
  *
  * @status will show for example the status of the HPD signal.
+ * @error will contain the error code, if applicable.
  */
 struct typec_displayport_data {
 	u32 status;
 	u32 conf;
+	int error;
 };
 
 enum {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


