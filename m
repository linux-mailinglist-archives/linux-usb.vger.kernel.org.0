Return-Path: <linux-usb+bounces-30817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB284C7CE3A
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3758934246B
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4802FD7D2;
	Sat, 22 Nov 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmRlyp5v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971F22FD7AE
	for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763810766; cv=none; b=X2g988c/pq0wYQUgSmAhQvI+uDZW6gVfsARkPz1M7hbEZ3QElJXnDhV3zDja8aMBaUlUpCtA8KCApZgNQNakC9dMBbxfy0THCTqP8iO0cgHMvFkBzZZz6y+IY4x6q3mNaFw8Lsy2F4fxS4ei9a3SeLlYLZgrw1RhAFRyiX+FGuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763810766; c=relaxed/simple;
	bh=an9kJ35GCpI6QudU4rlIDJI0BmkwJKKK9GCgX4Ns2S8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CpU2XJ92wYP2AvyDF56S3b1K5j8lbqsiTQxOtwbAQZHOK74DmGPjwlZpewpO18B8nBIS15SfJIWNY4BQ0wmNPLFCPIbVcTvPZUKpF1nby5xFIj79v4NFyec8ZbCIr2YJYcTW/CObJMZkKDQioQRZuLv4UbvyJg+KRkNmLAenEaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmRlyp5v; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b9387df58cso4573897b3a.3
        for <linux-usb@vger.kernel.org>; Sat, 22 Nov 2025 03:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763810762; x=1764415562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zSPPPnIHfd6KTKHtFLn3pGgWQS0TyX/HkQmeGrAs0U=;
        b=fmRlyp5vO1j+Y7AbgB/wQin6PU3SKD7YeHO7+jkNhbXRu2xuZUOE6ECGeHndxR0Kyo
         olmkdV/9uZkWSUVvEiE8juCKdwqt3XELtO/snKQnXqVowJqnUFUh8eyqugZGP8G5Z3RK
         /avTjQpIFj6jJ/mAhkh3f8PvY6q85Paurq5RD3mHcmF2dOm96HI07fFFsSOpIsZhCSJI
         wR8qcL2V7uteYtgUs9l0PFEdHzJFGaIs6/3DjWxdBupY+z8rI1v3HUQAFpkncU2NKfd0
         9eqUNBD315e8m5LrwXFIzCZLxvKL8Dc5YFgn4QjsUcTqocGRlMEuaC9yVFvo5i0LTOq9
         CSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763810762; x=1764415562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zSPPPnIHfd6KTKHtFLn3pGgWQS0TyX/HkQmeGrAs0U=;
        b=wNqHmL/xDfD3zVKsDJicO7l5Wt0Qgh6m4YUyzxkJLIKrKDNCWO5nauk0KC/DEpCRc7
         aUEQbOuTd0WRTvpGu4M0weUEYL3sEte9A1yONIuVvwcuvlq0CszzOmyaSBimzamiJNUN
         6ZK3+IZrIpiD5C9lHQgj2qVVoNnuWRrDE+Jx54KWobefJksRPANMhPEjWfLOX49mCm6d
         2QYehhvblaPlgLsJUXU3DIZ5yrkqBm2XZxzLqBSt8GQAPUwt+eEtUKjacCtNvAFM69uL
         dWn2X9JTIKhKwtoa90T0cab4pI1CXQvLQDuISdmpXyOKJyOIXaIzTedYofAhylZIIKEb
         VPeQ==
X-Gm-Message-State: AOJu0Yxu/4kSAXsfh01aQn1Lh1lVaCZY6MgoX/NrWIyh6F76RTayhlEt
	axH4v981U8Oq5nc07qqSV0JXb5WU9qy9M5mjlTDJPzs8yGjcAuG5jBM1NhADrqaSfc0=
X-Gm-Gg: ASbGncv5fi35gzCoDi+9H2yT3YWT91t5o2bqBNiBZWFhYhBcxNRGxdwa5vFz3y0tiuA
	ZjfWdtcsgyFuvH0EidsNJ22UgmYSTcabNCVf3bL4KMPP4utBkJQhSPWIod8ZGgaI+zNo/pGZC2Z
	ZCcJdq4j1dWcX8bYqbQNOc4e/0lP2C4gsELBh3mRhewgSHZYdAc6kyb4mBo399id8vdV05JlNHO
	gDbY8dgGt7GkjtjsCZe9iMOgEyoUrw8hT1YFFxgwQQ5QeaT6pfVr+PkdOseL7SXzdKA79DehgBd
	DlidIyaO02iuHYgLcvJh2H4Cm5UgH4NFb73l3TO+Lu8AerxF6RSFQLCQQXKzZbxkYYVtX3mOVJv
	insF2zFmN6Xe2MmFpj8GOd6rR5/bgHN1DdWst1S658Ws92vAubIDFP2/+JAZeo1JxISGBmtTWu9
	HL60kCpZr/UQ4VdQ==
X-Google-Smtp-Source: AGHT+IGAwSdzUIv8E7gpk7OnJTk9Qi3ec6e3Gjur4KU73hfslAvGuyMS/GPq75TyECJjafbwzvzb9w==
X-Received: by 2002:a05:6a20:3d8a:b0:35d:53dc:cb56 with SMTP id adf61e73a8af0-3614edd9bd8mr6372448637.36.1763810762455;
        Sat, 22 Nov 2025 03:26:02 -0800 (PST)
Received: from xzq.huaqin.com ([103.117.77.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ecf80f4csm8815704b3a.8.2025.11.22.03.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 03:26:02 -0800 (PST)
From: Zhengqiao Xia <jerry.xzq@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengqiao Xia <jerry.xzq@gmail.com>
Subject: [PATCH] USB: of: filter disabled device node
Date: Sat, 22 Nov 2025 19:25:39 +0800
Message-Id: <20251122112539.4130712-1-jerry.xzq@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should not point the of_node of a USB device to a disabled devicetree
node. Otherwise, the interface under this USB device will not be able
to register.

Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>
---
 drivers/usb/core/of.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/of.c b/drivers/usb/core/of.c
index 763e4122ed5b3..6bb577e711811 100644
--- a/drivers/usb/core/of.c
+++ b/drivers/usb/core/of.c
@@ -31,6 +31,9 @@ struct device_node *usb_of_get_device_node(struct usb_device *hub, int port1)
 		if (of_property_read_u32(node, "reg", &reg))
 			continue;
 
+		if (!of_device_is_available(node))
+			continue;
+
 		if (reg == port1)
 			return node;
 	}
-- 
2.34.1


