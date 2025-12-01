Return-Path: <linux-usb+bounces-31063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A33C973FE
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D7732344BCF
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C85B30CDBE;
	Mon,  1 Dec 2025 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UpPT4Zoe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5430C34A
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591980; cv=none; b=U2jNBjJ6RuABjogYgB/JscV+vgKv9mhTOE4fjwPDPkktmuXu4LtVbiTgiqJYMHra6NfoCckgrg89T+r5ycBWWSGqAZGeh5k9LiS8QAiWE4x3fCy5gFxB1sOMJ7+PeEJigg/5yYgZ0w4jjrjQd8q4qeqpMYWQ5KaEr75zE1OAkKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591980; c=relaxed/simple;
	bh=6VDUNhFKjIyxAfmAoMmcN/eMripBuE0sbN890k7u5Co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uGiesR439jDBrphwH7CeVCr010fX3Ls/ArlMN8wMyuvlbjBzGdAL7tke4rz6SrWEjKP6JWSXT1ScNJzVBC24ZVvCf+1Irv9lWUyl4SuyJFKfZTn6wgbocex/XEEisK0OhKpQGDWV+YKyQlI2DUEt5vZ5PXjeWNT/tTubkfkuTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UpPT4Zoe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so7152021a12.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591977; x=1765196777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjAcK5jQuv2kklMSEXof63giOR/XCPNAsoShF6a7bVw=;
        b=UpPT4ZoeVHXHl59Vz3mg1aWK8Bg+Y2G78tqyTR+u93i9qxlrYWsDH/CSft5fSF2J/K
         aPMZV3to8k/rCzJZLA/3/gTzjQ6MwCYhhBIH54nZDqJ4+lmqmtCKJDSgM14msRdzIjQ6
         /zX75RCprvagV65UZ5zbLqh6Zz3AvIZESa25A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591977; x=1765196777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjAcK5jQuv2kklMSEXof63giOR/XCPNAsoShF6a7bVw=;
        b=tQZM7MztHipajbQsB+S1q/fPolIoX79HreuQ1HSJFDESNlVUraIvOicxyBzIx4Nq0T
         RgjaQb8lvK/JEjtGV9sRdxVzJLBk+8nDTR8jd8SI5fqWIHOUU9BU7z4cKcF18lyGcsa5
         lf2wuBXRydQD5Y9ditk37GVODdPCdwzROy/9m3QDqog5vzZzQ3EUS72T2jfND+wUtw4N
         uCQmO1tVj3N1vUR5XoVi0cnJRjSd5rqYwqzz9q9Mtlj2FCaqkvnRpwH3q+2Enyem6sY7
         odOr8umSpc0xPw/xkzfSabfPpgCodLTxEqPEZBWSB8v/C1DZkHruxxIM64KJD0DmZodG
         /XnA==
X-Forwarded-Encrypted: i=1; AJvYcCVdaOOCEItClNp0WNGBM2k2Uc1IeuNpLrXf/2cM0M3VVvvErQop5MkDGPexkbNSZHUZG6+9nR4C1ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWmTDGAqH+EgbwYSzWaZowI//nQY0p8qHH1ZFeJjDMsvmWei94
	Rlawyy195YKsE75gGMAs5g11I0EO/PiIjcTkBMNe5e0wBMwW0j05q7dmCvi4AZeCyg==
X-Gm-Gg: ASbGncs0RDpQvoesWOfeHhqBC6O+ThENO8RtFMAIxfvczWKOYQ5gQMsfMrAhX9XTAlw
	6heWXvUSAPVr5vStI/rJmijjJVlPqto0l6wLTeTB7QNPa0NMZNRl5CUzDPs7eFqMIorzWFimYTp
	T88I2VDvEVFjlMtLln6T6Cw5U7Xz+5rrobjioWpvgXs/EtByySNdacYf9hGuDoCcl4ZqBXXePUY
	VjriayiexIh04dbW9+9cieTf74w1q0h81TvVAFlwUJeZITZ3VRFjw+sR0tgpO64xV/duYfU07g7
	13IBmLawSVS0Kr7iLXWnko+2ALE/AR7GPqev3Zs2YX3xyC+K2jpzhZqr9bj/FKbZL387zjE4F9s
	J0wHI6TFhVxJR/TD7eAAu/nqHorZITsFax8J2TKM9kKk8MIbz6mRUwjQRTOvlyzwX+alK+y+gRi
	krK9ZvgkrPWZV2TcOTPJ7Yux3XbZo3OwAZEkvDXY0oIB8JpWbbx+jmoakXDwtdrDbqzDyyzkiGV
	prkUcuJBU8=
X-Google-Smtp-Source: AGHT+IG3kfMAbGwiNdUyy1C0roJ6R6b1shoAdCyb+csyZ1jwsKMGfN9QjFVoFo8tRijm4LmBgMo8uQ==
X-Received: by 2002:a17:907:6eaa:b0:b71:854:4e49 with SMTP id a640c23a62f3a-b767189cf54mr4375094666b.56.1764591976789;
        Mon, 01 Dec 2025 04:26:16 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:16 -0800 (PST)
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
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 2/8] usb: typec: Integrate USB4 into the mode selection process
Date: Mon,  1 Dec 2025 12:25:58 +0000
Message-ID: <20251201122604.1268071-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB4 is defined as the most preferred mode and is placed at the top of the
mode priority list. This ensures that if the port and partner support USB4,
activation is attempted first.
Activation is handled via the `enter_usb_mode` function. System control
(enabling/disabling) over the mode is exposed through the `usb_capability`
sysfs port attribute.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/mode_selection.c | 27 +++++++++++++++++++++++++--
 include/linux/usb/typec_altmode.h  |  2 ++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mode_selection.c b/drivers/usb/typec/mode_selection.c
index 1cf8a4dcd742..957e09813831 100644
--- a/drivers/usb/typec/mode_selection.c
+++ b/drivers/usb/typec/mode_selection.c
@@ -74,6 +74,7 @@ static int mode_selection_activate(struct mode_selection *sel,
 
 	__must_hold(&sel->lock)
 {
+	struct typec_port *port = to_typec_port(sel->partner->dev.parent);
 	struct mode_order order = {.svid = svid, .enter = enter, .result = -ENODEV};
 
 	/*
@@ -85,7 +86,14 @@ static int mode_selection_activate(struct mode_selection *sel,
 	 * interval.
 	 */
 	mutex_unlock(&sel->lock);
-	device_for_each_child(&sel->partner->dev, &order, activate_altmode);
+	if (svid == USB_TYPEC_USB4_SID) {
+		if (port->ops && port->ops->enter_usb_mode)
+			order.result = port->ops->enter_usb_mode(port,
+					enter ? USB_MODE_USB4 : USB_MODE_USB3);
+		else
+			order.result = -EOPNOTSUPP;
+	} else
+		device_for_each_child(&sel->partner->dev, &order, activate_altmode);
 	mutex_lock(&sel->lock);
 
 	return order.result;
@@ -236,7 +244,9 @@ static int altmode_add_to_list(struct device *dev, void *data)
 int typec_mode_selection_start(struct typec_partner *partner,
 	const unsigned int delay, const unsigned int timeout)
 {
+	struct typec_port *port = to_typec_port(partner->dev.parent);
 	struct mode_selection *sel;
+	struct mode_state *ms;
 	int ret;
 
 	if (partner->sel)
@@ -251,13 +261,26 @@ int typec_mode_selection_start(struct typec_partner *partner,
 	ret = device_for_each_child(
 		&partner->dev, &sel->mode_list, altmode_add_to_list);
 
+	if (!ret) {
+		list_sort(NULL, &sel->mode_list, compare_priorities);
+
+		if (port->usb_mode == USB_MODE_USB4 &&
+			partner->usb_capability & USB_CAPABILITY_USB4 &&
+			port->ops && port->ops->enter_usb_mode) {
+			ms = create_mode_entry(USB_TYPEC_USB4_SID, 0);
+			if (!ms)
+				ret = -ENOMEM;
+			else
+				list_add(&ms->list, &sel->mode_list);
+		}
+	}
+
 	if (ret || list_empty(&sel->mode_list)) {
 		mode_list_clean(sel);
 		kfree(sel);
 		return ret;
 	}
 
-	list_sort(NULL, &sel->mode_list, compare_priorities);
 	sel->partner = partner;
 	sel->delay = delay;
 	sel->timeout = timeout;
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index a240d8264b92..faf72e4d6ceb 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -9,6 +9,8 @@
 
 #define MODE_DISCOVERY_MAX	6
 
+#define USB_TYPEC_USB4_SID 0xFF00
+
 struct typec_altmode_ops;
 
 /**
-- 
2.52.0.158.g65b55ccf14-goog


