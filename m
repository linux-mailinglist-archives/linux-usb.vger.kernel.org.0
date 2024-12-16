Return-Path: <linux-usb+bounces-18543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A07569F3CA9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 22:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61E551885A96
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 21:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7D41D95BE;
	Mon, 16 Dec 2024 21:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LSEs2M+2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA501D5CCC
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383850; cv=none; b=lb4owYVOeVqwFUNsdMQ9MBUd4hNerTzs+pFRDMnZEWNgi0jNTKACaHKu9t7twM6/SySVPLX1UKLQrWhHd5oJbE82CHZ4YH5Gk4/Dzx0GrgPHrSwyaAABGjYmwYNBZHRcyt2ahSiasH/mjSP49orbODwjw8yPKk1bSAJe8EQXHAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383850; c=relaxed/simple;
	bh=X32i657SSLdAHHKEkAbumTOxZEIg1B0mwuSYHOFYedE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJSXNDmksPWEI8m6f3n4qc+tP45F2N9YjCmB+YGIIYMZk1ogG1FI2nE9ZJUKywLdRQ4jbGAGIR33GOaeV0oVfQzYFn7+FaW1Q9ANTl9TeLIIytsO/1cTOBwO6F1ziCKvRvQK7ghzi9BIXpvysCYkRMOvP/459cqzC/LbnoQyyT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LSEs2M+2; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467a3f1e667so23692971cf.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 13:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383847; x=1734988647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqBBzZFuR8Mx+keH2/BU5geK8A+jljM9pAiu8cpH6y0=;
        b=LSEs2M+2u4DUw7wALz8b4Ub6cQ2qEl/y/zuTqEE3TwDenbsNWiFE490qDAuagbC75v
         RUwY0bCqz9XbHcdpEcetZGUp/wPYfmGgQAPLKDbLGag8TmV81Tb+vMoLZ2aqvDn201/+
         sZaqERXgCo9kspL1Kdh0UuH7V7U+WZPvH86Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383847; x=1734988647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqBBzZFuR8Mx+keH2/BU5geK8A+jljM9pAiu8cpH6y0=;
        b=Op4ssOfFxKaAgrlllPirZSQmEwVp/eiDTBUnYuyaZyOi4nwcMkBstyf7qcLFOGkhUb
         uSXRozuCxWVEIBEiiYwDFI9qVZFubVsCdpDR1zzZHpKHILSPrEiel08f6MVHrorDDxJ0
         GH6nhr7zh1qFpRLzbIDnSXUUgCRDgSwOfUGDeeKqzX74yWvU0hQd2V8N6b/iQMZ/a3Q/
         M9PT5zQMUY4qtO9T60rsw/4anRXuv1ZoxYlcAp16khntxN8G0UKUQCThRbiecvoIUz9p
         j6vZVFXkkB5vo4DSjwTfTcFgMGcqSwuYLarsXSTAF66GfzrV1Tj3iDxG6L2ZWvyb3nol
         dayA==
X-Forwarded-Encrypted: i=1; AJvYcCU2IVUCs9BeHtdHJOwShGQJsIlaT65nI0v4RYmSC4FWkwYWAGo6uAX7fzOkt8B7wtq2WCXvEIYs8JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtoT8zKYfJ21WbUdmBMNo5sqBUY+v6VaPSfNXGPzrLMAdyl9F
	MpWHXfglpcB+ofYjWlBXMeEuB98NNB8GW6DMEmVS2X3tE7Am/PZgfj3JFHIk6A==
X-Gm-Gg: ASbGncv8wfUBqBc7xjr8NzKpuYMrQTmREGo80+UDnWvLDxl+1rpXQ09xrbXXm0a7+zA
	RSp0yx5w6yrmpW/rQaoFpDAUj7IGzmgG1KV+zQj6e4ZLEK6ufcHZGPcacY2/EnCKcQ2svU+xkU5
	gyScJwd58DNx/wmqcP6PEsNdmA0X9SjjsIdJdschUaFJThVZXvY6shgxsZo8bZjODPrUc4uFQzG
	1MURDycHAaixjmwFQVGbIx7s7IUBgIfSFcpV89E0NsN/C3Kty908/zbDeDu/I/AEwo+TGc5MOh4
	60uy072ThPTZ1g44lMIDogh1RvTk7Pw=
X-Google-Smtp-Source: AGHT+IFa0lE3VU6S7yMTSi6U10IiAbRleFzkYam8wiPnIWkXufZo9uMrtys/YCrx+kHmkm9mMlGHjg==
X-Received: by 2002:a05:622a:1aa1:b0:467:79eb:4a16 with SMTP id d75a77b69052e-467a5721b4dmr271093651cf.4.1734383847705;
        Mon, 16 Dec 2024 13:17:27 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:26 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:17 +0000
Subject: [PATCH v5 3/7] ACPI: bus: implement
 acpi_get_physical_device_location when !ACPI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-3-3d6b35ddce7b@chromium.org>
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

Provide an implementation of acpi_get_physical_device_location that can
be used when CONFIG_ACPI is not set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index a9b5a5204781..f38e8b1c8e1f 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -43,9 +43,6 @@ acpi_status
 acpi_evaluate_ost(acpi_handle handle, u32 source_event, u32 status_code,
 		  struct acpi_buffer *status_buf);
 
-bool
-acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld);
-
 bool acpi_has_method(acpi_handle handle, char *name);
 acpi_status acpi_execute_simple_method(acpi_handle handle, char *method,
 				       u64 arg);
@@ -60,6 +57,9 @@ bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs);
 union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,
 			u64 rev, u64 func, union acpi_object *argv4);
 #ifdef CONFIG_ACPI
+bool
+acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld);
+
 static inline union acpi_object *
 acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 rev,
 			u64 func, union acpi_object *argv4,
@@ -1003,6 +1003,12 @@ static inline int unregister_acpi_bus_type(void *bus) { return 0; }
 
 static inline int acpi_wait_for_acpi_ipmi(void) { return 0; }
 
+static inline bool
+acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld)
+{
+	return false;
+}
+
 #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
 	for (adev = NULL; false && (hid) && (uid) && (hrv); )
 

-- 
2.47.1.613.gc27f4b7a9f-goog


