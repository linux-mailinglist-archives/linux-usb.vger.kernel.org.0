Return-Path: <linux-usb+bounces-18546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73799F3C95
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 22:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0319165E90
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 21:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3C31DD520;
	Mon, 16 Dec 2024 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ck7Az4yN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D91DAC88
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383854; cv=none; b=DODJtMww1NWsSsirZLM3kkAxbFwoJymUFMaT4nyKaKT3njAvEsPyxgfuXyjuCu7eEZow51auuQQPmMYMWk2FkqO2nwsxmoqxg9Wp7spCh4/zceEdvv/dDYBJik7dhTujYTQ8kfcrofYIQKcsMhK8NEEyXbdr9DhH1vU55qnmHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383854; c=relaxed/simple;
	bh=Juo2ve3rrjlu9oDP30UIZmhGa+flQbphR9swoQR5GS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r9PzAOjVLkjN/70i6/MW6aJCQF3k2+wvGF+rikekl8xV7qvdww4cx8CZzBM/qmeeU2lAufgwkihUzgH7Yq9SFb0AGOYMxbNsuxOtjgQRaVHHCdsXqx7EUagcyKJ+pTs9sP7MmNcuPv8BYNO4VW4Hzj55drn+w7pCZigDeV10Tr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ck7Az4yN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467a3c85e11so23948831cf.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 13:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383851; x=1734988651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JdfI8iMG82M8irlFSVYMbWfZvDLPeTNhiZE+t4N6pwc=;
        b=ck7Az4yNU1mMJp66dLdH5at7e8d7WaBtyH4gT39AhwIjPBkPwFHn+a46+0wShnHe0E
         01R+r5E5DBuZ978DazWMFvzEHniQUS19ChznG0DpEQ+h/iSYD4Sxo7Z6lIvtF5O4m4CG
         wwKcjEOI4PvJWeo+vh7MpCNT1cDGbbBNi8BX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383851; x=1734988651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdfI8iMG82M8irlFSVYMbWfZvDLPeTNhiZE+t4N6pwc=;
        b=df2zjskw7C8yR0i2AYMsqDVUF2Dw/5//NRCl4Qz8XYRm6GCfVp0fU4z0mTES6JZzMi
         76AX6fojyqGyrSj7nKAjd1w+AoBPohLAo6Y2HOo6/rckQRmmWa6HRYUOSce+HwaaLo+4
         wvSJtwzHcSj79mPF1BTLJJZBZ6hwIScGWHa4QCIRXKE3UFNQ6b2iXmZB6cObMTaZqqAG
         5mVuNPEvUEGaGZdtc8LbpTO7+ICpfdQBWvIMI7NydvNGXC5N0YKutioWsPH3rOR+oUjH
         vRekjmuwmpf3s/DSX81FhySicXhsr1eOCsgJYPh93qqrJiCaULTrO1IIEiPA12hOK/j+
         EBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP9WTKEWPJbXn16TwcK7Q46aRbdUQpx8lOPbrGah+A4H5+zh2744NYgWDafohafcljSYFX2yhnAM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQvIiqXQjeJY4zqMSy1Ai35Inl3W0BxzDtKtcuQZxvJwqPtSJ
	27ITf5w+Dhq9YbmHLddCS7HvjBmkOW955HyCmg+c5y4s9PCfT/vpjSGHQ7whOg==
X-Gm-Gg: ASbGnctk67KF5lqzFMA0yiBd53r/AtCtWjcW/IiD28jO6bagmSosgh+Fe9e8Ci1l8NK
	Yge8W5N8wUNx9hGO0iVYTEw9mKfN5QwcJ5zgITbUPjry8Bn+p5ai6OM5Ae0CoUSGd/ScbTNKALT
	ExmJKRUxURk43s5D0+G00M89zGnMtbY9/TN0DMyYhXzmKZx5rdIDs51az4cJYXml+v3HHs2sL3X
	2Ig9/Ttd6cu3IQ7LUVTKHdZP8OcgMpikKpXp2USSgz11nUqp1+I6gVxVzHb+t5H3XQJepzZZ+qE
	cNID7kvUI1rXpMICPUkzSmvI3WyUE3I=
X-Google-Smtp-Source: AGHT+IEl8hUUhzs8PDA9iSUQEkMmOZX53TWYQb+JuoOBexm0lrDkqiD/7RB/yiHbTUvOThs4R816YQ==
X-Received: by 2002:a05:622a:1817:b0:467:53c8:7572 with SMTP id d75a77b69052e-467a5759258mr245947171cf.13.1734383851253;
        Mon, 16 Dec 2024 13:17:31 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:20 +0000
Subject: [PATCH v5 6/7] ACPI: bus: implement acpi_device_hid when !ACPI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-6-3d6b35ddce7b@chromium.org>
References: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
In-Reply-To: <20241216-fix-ipu-v5-0-3d6b35ddce7b@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Robert Moore <robert.moore@intel.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Mailer: b4 0.13.0

Provide an implementation of acpi_device_hid that can be used when
CONFIG_ACPI is not set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 68c0e2fb029f..aad1a95e6863 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1003,6 +1003,11 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+static inline const char *acpi_device_hid(struct acpi_device *device)
+{
+	return "";
+}
+
 static inline bool
 acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld)
 {

-- 
2.47.1.613.gc27f4b7a9f-goog


