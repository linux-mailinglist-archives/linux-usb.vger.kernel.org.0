Return-Path: <linux-usb+bounces-8067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B61FF87F88D
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 08:43:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EF5C282CC6
	for <lists+linux-usb@lfdr.de>; Tue, 19 Mar 2024 07:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089535380B;
	Tue, 19 Mar 2024 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VrvtbxoS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470D23BBCA
	for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 07:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710834214; cv=none; b=rzISjApDboeSAXY1ttQY4eu3q5Lbh8LejQd5ApViosjZK3AGuHKOXwLYJFxyFxXJYzritHz3jdMMvZz/kCzWv+p3hSNILpbLg4+7MSiktCbOLIOFD+CkI2O7tCteoas3tYIU/ByGOvyixtvMP8k1Kk5mB/triivJWGU1dUayS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710834214; c=relaxed/simple;
	bh=HD6kQ+ioRHxPGSTP8IsOyUFZW7mQgOF13zNVMkezjnM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=U1lcEmNwAhAz1LcUM4VjadO0gXHYRupA/h+3AImRUn1DSGNbzlpOKZ2j2A4iM3ZKSZ5ehdWWC2MtBmTB21h7HNdGmof5JSoFPWDlcw1W4V0TLYWVRXecprSb1llzEclTp58KH1khcLB9FzJpFES/7ZuTTyTzudGvmsp3dDzxshI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VrvtbxoS; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kyletso.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b26ce0bbso9993675276.1
        for <linux-usb@vger.kernel.org>; Tue, 19 Mar 2024 00:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710834211; x=1711439011; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OnwyORFqYkzH8hHLHjIf5KeiogbCHS6CJlbafRrvsPA=;
        b=VrvtbxoSY3waMrjWNC/AGaYlDvPANZv8vkPkRNMbz9UgTAWSy62LIQRz98qIMSHMqu
         Pt3M11+reS1L4uLeFR0zx+7Xs1tL+lGv1s/LL+bAuZdr4Gp7UCpTuabNpZH1SM4airGt
         yNsksEe4o8wUMXsfv8Df7RnNTgNTHa/jlv0UVm93/u5Me3nSAfXlYgCbLmlo+sAQFaJo
         rEBN5IxygtAmvjzYep9h3Zu8iyDUA1s3qDyeCRk6XwAX8dfxIm8C+cjNMFSDN7EXW2sY
         ifvjDihmShjE4UnbI32sd3KhFmAeOLi+4qvJZ6lUr8T2wMZrge6K7GvHWyKsRbwGM1WQ
         7fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710834211; x=1711439011;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OnwyORFqYkzH8hHLHjIf5KeiogbCHS6CJlbafRrvsPA=;
        b=U/lYoRb6IdpwIU8xf9urdNI3zPKypB0a1NUcwzLVb3fWjIM4AOQ0UcLJREPL36J3zB
         l4sLqFmdQfg4oa8m6S4/HKZPe+ZkQp4Mv9beVbBAUozppHI+RQQIOZdm/RemBjC/KP9u
         AAnOEuX96qrA4w7u9ilIHxXHybwvcjUYnEiw0MFmHOiMMvQfV7c9hmOgpPkaXYntNTVW
         +fqD31Y9s6oMbVjRoLOSxYt1+cLVI5ga8AMr+7PTZZovi3EVtlZJswzmaf1j2m+M/zC7
         oXxNB0jdfBhLMyof0CJDjL4V1JygPwt8lFTJlwL8c1RjFCZDcwbIGO3bFp5kvbRe+bjv
         blrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRafxxOXGyFhA6+5sGAgqEL2b7MDnCT/IuiCbYvvgELithiefdOzYvD6f8Z/bSdYoIu1L1Rv/aWHfHh+1FNJ0Plg0DitRCulPX
X-Gm-Message-State: AOJu0YwVpMiXVarcCjSTgnZXpDjMDaZ85Ucx6s9Rqu3XPDiSTBjm2yM7
	5imkJvkl6FMLZNPJECknvDqkL6Yfl49/VQ5Syrn3vglycHXyX7uHSS+A1m8zeBC/L/32QHsLiO7
	1sXeJpg==
X-Google-Smtp-Source: AGHT+IH6atxfqMs0Z5PSMVfV6XRX3NOJZvi6OTsXrgS1I78Y0u2K25gag5+nyxOg0DCLkK9hS6meBUKwHlq3
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:2f6c:fc01:709:12f4])
 (user=kyletso job=sendgmr) by 2002:a05:6902:e09:b0:dc6:dfd9:d431 with SMTP id
 df9-20020a0569020e0900b00dc6dfd9d431mr394859ybb.1.1710834211438; Tue, 19 Mar
 2024 00:43:31 -0700 (PDT)
Date: Tue, 19 Mar 2024 15:43:09 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240319074309.3306579-1-kyletso@google.com>
Subject: [PATCH v1] usb: typec: Return size of buffer if pd_set operation succeeds
From: Kyle Tso <kyletso@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: badhri@google.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Kyle Tso <kyletso@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The attribute writing should return the number of bytes used from the
buffer on success.

Fixes: a7cff92f0635 ("usb: typec: USB Power Delivery helpers for ports and partners")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 389c7f0b8d93..9610e647a8d4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1310,6 +1310,7 @@ static ssize_t select_usb_power_delivery_store(struct device *dev,
 {
 	struct typec_port *port = to_typec_port(dev);
 	struct usb_power_delivery *pd;
+	int ret;
 
 	if (!port->ops || !port->ops->pd_set)
 		return -EOPNOTSUPP;
@@ -1318,7 +1319,11 @@ static ssize_t select_usb_power_delivery_store(struct device *dev,
 	if (!pd)
 		return -EINVAL;
 
-	return port->ops->pd_set(port, pd);
+	ret = port->ops->pd_set(port, pd);
+	if (ret)
+		return ret;
+
+	return size;
 }
 
 static ssize_t select_usb_power_delivery_show(struct device *dev,
-- 
2.44.0.291.gc1ea87d7ee-goog


