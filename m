Return-Path: <linux-usb+bounces-30791-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD33C77CE9
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 09:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29B544E9DFC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 08:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D610931A07F;
	Fri, 21 Nov 2025 08:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="XyWqYNIZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B015A2FF173
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 08:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763712554; cv=none; b=USp3+9BWUqgR+zY0qqrkwmIPNit6oabQofkSYTnJWB8JbdVaopr2fQXHqbw3Yyqu8iGZ8KFRxuUtJlrT3/iebCa9Gx/+uaJKQUTCrFJ73RaEUvqWnCHN9BMQ9wWJVt/blhlxbgDgIwZ9pDIsYtHWeo06pl9a2wMDAy1Ex1c7KEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763712554; c=relaxed/simple;
	bh=6cna0rS4IfPxRB4BilAAAYmQnpk/pBqq8XIl1z/UP8o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CgVT5rdYgnfPMkewyuq93qTIBeTHABo6Ka6zG3jCnNE8q6lX8FCgyU24G7yc7+utCweM8/UFL4DhTjlf3LBjxz/7SUROXHnXNlujWNiyyY01zqAaYxcSiDGe+logClTlZglyZv4qF8mLtsjceQumcMwzoyxzmUhnbTnFELajIi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=XyWqYNIZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-299e43c1adbso2225505ad.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 00:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1763712552; x=1764317352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DrKLC6redEZpXj8qIVeKcbQHX3id2C2vU9NNtfE0BOE=;
        b=XyWqYNIZK/tUqjRf5SlzcDKrnbU8CGisnrXiAuH3dMOAIE2J1hj7eH3yC1ugvnfw8F
         AcNOx1esGvZjOheVJOfDi3NHAMKnrSVnQ1FDklJv2aA98PJ6I3CiQmSzYP4bnCDx3477
         rzhur/Lx5AsA6kexCenjKYsfewIrVIp4CGX/7Pcf9T0qjqLanHbk6h/LNPueOkcaGUPo
         DnXTTF6EAcmMUX+UqRwE8AeQ76Cp4/22YInpt8rvMKVvVwGDVu71T7E3/g6hZqkdXKmZ
         6HeJ+4rem8zfOUWdKs7/RSo+Vj01MSCjW8xhdVkhAAxHTZTbm33K+Xh241o1j//zOLGj
         E+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763712552; x=1764317352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrKLC6redEZpXj8qIVeKcbQHX3id2C2vU9NNtfE0BOE=;
        b=NecbTkdBm/0eCtwIwYV7HWSt4ZuAE9aOx5Di1RujKtn3frLDqabwHGUKr1UEFV4oX0
         /eUgAZILigQ2plnsXXLmr6i2GaWr3ReZAsjuW5Y4MJRqlw5NZpkpbz+ndZJW0NbIdgB3
         vZCOi7gDsP5lhOH9UmDdFnKaPE6v/7oN5tIy17pDPV68YV3pcqKiyj894JCqf11L4U24
         B3Upn9i158mbzN1duwVIIs033gCHbadhP0+3Ycrh/QHjFgyiUo7DnzNC6+V3v9bnZKgl
         /Ibc/ovPiqhNxifhKPGkCX+DzMe+wJJqvJLgVPYUe8a+ZRev7cbYXbqc99RQXAtwaFci
         bX8w==
X-Gm-Message-State: AOJu0Yys1OCmuOzgkyDrbfbLSS9V39szy7esEMRcF6JSkGSWTUv/83qR
	ZEB1KmXERw4riMMJ74JCJFeV58c/qeBXdQ/5DNc5Z5fV2H+rUQWyXsYMTx8MSnTHIf0GWJfHmhS
	2ZsSf6Ko=
X-Gm-Gg: ASbGncsL3H7xKSVe6tHLle6/WaEf+RZR67z1S6aVmfSezgT7eWxAegQIFTmkEGzi934
	PQXRfP6zCgSRzcWNmbsrMvkC1Sxeh3fqTbWxPAbB+N+RNy1qDo5qqNqfbtPPrv1dm60xn+hGZhv
	Xy3dDkuqlo/a11T4junCphClKC4Br82n8MmjEWCLTIqoHmmHCVTaOmUOo9dpD6EoBX9Mt1tfbai
	bT428PK97/dG/tf4CsLNLMci9m0O2kfMQxSBP89vHkr4NY2DX5KoAcZM7+DTuo/xEbvY1VJaWjf
	RlNvYYmLLj3PEhqgIzI9wRDQB5hxBQGgdALIN1jOsZ0uXjDYqKCsKN2xA10AIb6jcFY+N2q1Wwn
	lVRTZdCZ9tAHQHv4kWRDqtSsQgVhiMBwPrquODBZaNgfPaJmngHf4FZI/RFWWENXI+JE4+Kvb00
	7fxa9OiYxBUy497qLI7JIzmatdUCE4FfCUWL69mKH5u+WfShsg2wBaR+F8
X-Google-Smtp-Source: AGHT+IFG+J86hr9mHNL2OUXjacId2x1O1j1Mm9e3eA7FfOPUViRAz86RoQfxPiHy4w467ljg+fr3Ig==
X-Received: by 2002:a17:903:f90:b0:258:a3a1:9aa5 with SMTP id d9443c01a7336-29b6bd50e1dmr12254935ad.0.1763712551994;
        Fri, 21 Nov 2025 00:09:11 -0800 (PST)
Received: from xzq.huaqin.com ([103.117.77.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b2a7ad6sm48088635ad.87.2025.11.21.00.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:09:11 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH] USB: of: filter disabled device node
Date: Fri, 21 Nov 2025 16:09:05 +0800
Message-Id: <20251121080905.2237648-1-xiazhengqiao@huaqin.corp-partner.google.com>
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

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
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


