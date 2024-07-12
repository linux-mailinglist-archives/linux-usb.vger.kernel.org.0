Return-Path: <linux-usb+bounces-12167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA0792F9FD
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2024 14:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9891C21BA8
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jul 2024 12:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BFA116CD30;
	Fri, 12 Jul 2024 12:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZvrfNNR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57C16C69C
	for <linux-usb@vger.kernel.org>; Fri, 12 Jul 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786197; cv=none; b=D2DO+RWuPihsGiIOmAOyFl82bNdL87q14hS6mi3EKAwZ1XY13HhMzidu6j6gCqhWB5xZ+hDEaYaHCbUSa2KFcrM6m2XYOgkbN8yVc6spxDsjjYywGVWDt4B2Tt/8u1XSdSQPBGA3zZJVSXZH5lNav7OKExyGOtIGLNYWDVqVZco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786197; c=relaxed/simple;
	bh=OIrzi2bKxo+eCcooHZT/RMCkC1SZItiA4+kWQyzMGvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AoW7qBAgcgTpZSNjAhprxu43jVX6m2KN3WeabF6Ch2clWBkzVTlj/ipVexoFvOL+O9gVZeq8cxGfclkhPOq4J/bNCJwTZoBrmJVRyjYIZxSp57uci93trfLOIUs3Ze6gWcNGCYYpVYlLpQokqBXWrMA/qAPOeh5mmMOIIM21UdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZvrfNNR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a797c62565aso219599766b.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Jul 2024 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720786194; x=1721390994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNntVhao/NNdLY8rx+f8V3o0CFX0EkUu/LTAXiMvIcs=;
        b=MZvrfNNRWAGSQeZYGpq3PuUzqquynegU2LSbMpjSC2LKA4S6Rz05UBRbyuQY2wHvqf
         sNUezElZNtZhJ/pCGQs1qFSuvZWtSB2COJvKvLh8f4RdDDSPGFNJ1ICXEuflnrNTxDB0
         hXcoZfuz6ZpUUt3FfHjo9E8EgV84JDpIznJmz2FoBZpSdRXDVsGqHdtrJM6k1wL1hfOB
         +39660UkOi22fbm+yInUyskEifmoz/a8XHjG9rpB7QpOocF942+j3Hh3BrvRjup1NsYB
         7+tssFixX9D8rRmK1nlFzP0pKV9M0ABvR2CxJgMMRbH5I58bCb1e3pDvS5Kf6WVM9Xnh
         euSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720786194; x=1721390994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNntVhao/NNdLY8rx+f8V3o0CFX0EkUu/LTAXiMvIcs=;
        b=teiVL3Hzc4HxnmQYTj4uRsNgex6aZMyEmkzPuTpncjEnzf7b8Dj3OkBy7IKZZEdZ2L
         ZTL6LHbadWKYI6TdVZW1XFN8kmMRJcclLD2K+Gb8MAQdM50tdCuFMJRf28KW9f4YJWC9
         dUW+d96yEVgwIpjOjjiCXCES7L3dLy1bV7TzlYcUrAxtU8zFHlPY6IQlk9zfYGpcGY1D
         0YmdN2ajztGmER+v01AFGJg+NbgSkGirE2qjJFbUBe6jXtW4Ohw4cU/M1oKQVFQ1ywWw
         tYOTEvSL0s+wj5yqlPWgrJvsgf3E3UP/49w3CA2q+QMe1lihR4tWQTUyofaBMrt8Eg8M
         lSGg==
X-Forwarded-Encrypted: i=1; AJvYcCWbQb7HvB8QEJUT5rZ5nE4NvePJLSjwfdfmY43ihMjdYFJCQx6GsfeLMUED2mEfmcQVppQMZCuqmagjtQBpFIoTQ7a/yp8Rtj6Q
X-Gm-Message-State: AOJu0YziProiBcCb7yU/RVtuGeDaFmiffuwsBuqy4n5M8jItqa/Vuvhe
	ogsdfJDHJFLmMpbWF5ogHRDio6ooCFpuWU/KsC4xJIhebORKbZjaG03BRVNEguo=
X-Google-Smtp-Source: AGHT+IHH0x54o81fY6kBI2hODYRZJYElKFwdB2ZffnEks6H/KrFkmA6JoeuWx1pH1FEkIjhYX/QjhQ==
X-Received: by 2002:a17:906:2985:b0:a72:8762:1f5d with SMTP id a640c23a62f3a-a780b8848a8mr735618766b.55.1720786192981;
        Fri, 12 Jul 2024 05:09:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79834624c6sm209717166b.201.2024.07.12.05.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 05:09:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] USB: ohci-ppc-of: Drop ohci-littledian compatible
Date: Fri, 12 Jul 2024 14:09:47 +0200
Message-ID: <20240712120947.86181-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "ohci-littledian" compatible has typo (edian->endian) and is not
used in in-kernel DTS.  Considering the typo and that it is an very old
driver (~2006), drop the compatible.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/host/ohci-ppc-of.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index f64bfe5f4d4d..a6be061f8653 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -202,10 +202,6 @@ static const struct of_device_id ohci_hcd_ppc_of_match[] = {
 	},
 #endif
 #ifdef CONFIG_USB_OHCI_HCD_PPC_OF_LE
-	{
-		.name = "usb",
-		.compatible = "ohci-littledian",
-	},
 	{
 		.name = "usb",
 		.compatible = "ohci-le",
-- 
2.43.0


