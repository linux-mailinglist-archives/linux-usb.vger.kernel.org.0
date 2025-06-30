Return-Path: <linux-usb+bounces-25310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC4AEE059
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A30F73ACAA9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2239228EC15;
	Mon, 30 Jun 2025 14:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nQbDSTCC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1D128DF14
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292794; cv=none; b=oQXOmw44zyf+RgCsG55wdQDwuRAEY/l4mMfOY5uDVg2LAfR6PW08mXPHZ/CFumDq9XGbGi35MBIsy8AWhx8lYB+UhgdnUc2JvEjauN2czfR46uwTfB3s37Qz4k4awcEB4TEYIqYzpBI/j7ZHy+ucv6l2M6DWINe+gJujur4fvsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292794; c=relaxed/simple;
	bh=Vml+Vlmh/yNyrlNV0OMkYSZVPlVmBlgOUuBzWRBqzfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ6dbNBlikwI8y8LxEln90ObuyAmx94laBBCH7tvbPRznB8e3S3SXJQ/hJ5A3xCSfOcWO5t0dXIvCQCgPzfJlo++fs2wMLbEV6C+ZIa20ByHiX4lplYCBWJosnNh2vWQ0aLEXOfEWyN4A1fvpuJSXm0x0y7Nz40JIjXluNTk5D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nQbDSTCC; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae0dffaa8b2so758918666b.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292791; x=1751897591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8NRsPP90vS0j3nzCWJKBndtcs4Ube9as2Ue2hWIhFU=;
        b=nQbDSTCC3FxgKwEiRz1PSeZOVISZ5LatLPX66rfD6etRhMS3QASWeUW7zKGxbLinig
         vdA76B/6nbXoj3bCxCUCGLjzOl88bDgERTbkpF2cp3F0jh/d60OUj3p1t7XD/oGyV2Il
         YvCCVfLRppreCCw7f0d0AbR9a/FNp0Hy2IDo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292791; x=1751897591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8NRsPP90vS0j3nzCWJKBndtcs4Ube9as2Ue2hWIhFU=;
        b=WMfB0/c01H+UTEVdZNmzS39pGQxWY5lllq0TiXxk4YjwokwC9gbOx+mbkkD6kI9OSE
         QlAATZ50eWL74f9OlvtyAUcyDgIj6EkkrJO4kq09wm8PVt4nZah2WxUh+kEK0U7DkopE
         crJMO3Bs/zDLnPRZIRmdRozvBtish2Xo4EBmz4QZPuQ7iYbAbEX/+DC2vkmaKRfW3VKr
         LE02suBkNKrPqt+l9gfhyYsuNhU/NVWKd0AFvGAsiJVsxt80PnAObCMFzJ1X4p+cf04m
         auEo+xzyWsHl4FWlTNBtEbVXls1wzzgyTt2jbUhpRc49sg0fMDtXmSe2SMWXZBBwt3/+
         +r7g==
X-Forwarded-Encrypted: i=1; AJvYcCUm+Hpui+TGw1U/IWJpwans9zW0mp4en7vqgn1ELCGntt3t5ElncT7CgB93JCWsmwo4pKTwKfwAsV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUEYZ0vuxfPr+faEi03OEoavIe1mD0r1aERiLuChGvBFjPp09
	XzdpuKPI0lW+9ZHDtISS3HdXrIXA3V3NXMPaH/CDjgs5Z9qxSveU0crNnKGXMvpPxA==
X-Gm-Gg: ASbGncsHlPJp5LqSPXy9WATbQzAiRQOZDOKoQ1tyaKJLXagpUISDXeYf+i0KIRZSDax
	JfPPQ0KoJNKiB3aClz90ebWOL1y6qDpjj2oNH24KjjNzZWCtBqF3q5NxxwrINJfdcOcuf5DvUE6
	652Xla7APnHPhkhe/XhxHMetGHkLf3AXwFN8tImtZBIjAZ0kZJ1jP2ijhoYCSX3hXbSINkiDUon
	jWyFYwEKWSJ2GBphmtEnJWzU1Z6AzJdJ2v3ssLbOllbJiaNlBEclk3366221/pyridHpdMzNSFV
	iMj5+RDNdGQCb3S3VK7CulYmfgoUVbcSMVN6soKzjxR2JhWANiGSHQgxNm+11AZ2B3mSpjK7gIu
	ICZoCE4dfDV2zAkaqE0MmvsWqShJ5/XwnrjJVcLcckHPjhHBrMV3p
X-Google-Smtp-Source: AGHT+IE29gt8xWBI8pZXeQthKWA11FWxnfDchrHgHB2UzYqRmz/TTQgJ95KCGJWKBD6ofw4Dv8EGrQ==
X-Received: by 2002:a17:907:720f:b0:ae0:c6fa:ef45 with SMTP id a640c23a62f3a-ae35011ed14mr1314176166b.41.1751292791326;
        Mon, 30 Jun 2025 07:13:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:10 -0700 (PDT)
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
Subject: [PATCH v2 10/10] platform/chrome: cros_ec_typec: Add default_usb_mode_set support
Date: Mon, 30 Jun 2025 14:12:39 +0000
Message-ID: <20250630141239.3174390-11-akuchynski@chromium.org>
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

The `cros_ec_typec` driver currently doesn't directly consume a default
USB mode value. This commit adds the `default_usb_mode_set` function,
enabling the `usb_capability` sysfs attribute to be writable.
This functionality allows users to dynamically activate or deactivate
USB4 mode on a given port.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c5a7f42ffb5a..3de6b819906e 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -44,6 +44,11 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_default_usb_mode_set(struct typec_port *port, enum usb_mode mode)
+{
+	return 0;
+}
+
 static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
 {
 	struct cros_typec_port *port = typec_get_drvdata(tc_port);
@@ -59,6 +64,7 @@ static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode m
 }
 
 static const struct typec_operations cros_typec_usb_mode_ops = {
+	.default_usb_mode_set = cros_typec_default_usb_mode_set,
 	.enter_usb_mode = cros_typec_enter_usb_mode
 };
 
-- 
2.50.0.727.gbf7dc18ff4-goog


