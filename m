Return-Path: <linux-usb+bounces-18545-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 975759F3C93
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 22:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAEAD1659A4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 21:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3261DD525;
	Mon, 16 Dec 2024 21:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OZKlqkrt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B71D90C8
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383854; cv=none; b=JbRFmKkvd0DHWpoinUBtWPKH2Jr0LpT57c5lbRVrjkrLWaBH79dCzsRdsqWjJTXeuHVIGbJZrf21c8cd47A+Yxey2p9vsKF+MW2q5rwI6JMc6lCS6rnTqogGR/hdJlnwXUK61CbjltrwPByN+bvpTSw9Eq1RyFKDBE1HOSr69iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383854; c=relaxed/simple;
	bh=95QUI19i+vnnT5+G1KHFOpDSO/pMrFLiSHBGkodQPoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VBOYiM4HFgwHyE38qMTUUCARXHrzGA6GrPS1afzjMrrPTYwPMxcI4nZRa2KFLMi6jTBsSoNq9CXFdT0OiOvWyHmT5r7ZlWQgWxFGr4J3knlP78ZNfyGxOK83FcgWukZTYp/xDcwUEmOrVp+LYYP7mviChIm6dgYjXiScE4IU6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OZKlqkrt; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4678afeb133so49880511cf.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 13:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383850; x=1734988650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q9wRik7VAWXozMa2pBEsGGs4ayCPfnrgn33kguAxeWI=;
        b=OZKlqkrt9/2ONupx19ZzXA18kP6cweiU/xz/phCbkZJv0oh8Qajw9vF0Y1tWpO8MBE
         R1kwkFWtqtyfkzDbyWgXHOPB53jkFsqq0SJrkILJ+zKZUmHrjcGbbzW+G50g+LblXBPs
         iCbi9ciTLTmUskmHGwYd1H7CDftzpPmg98WFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383850; x=1734988650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9wRik7VAWXozMa2pBEsGGs4ayCPfnrgn33kguAxeWI=;
        b=IBNHnjWRzEyQaVXOWzlUrtR4RS5copsn3S60Hu8M9dATlgGdY1WZoa6OmAGKHH/g7D
         fbSQ5YpT2Lo5gcBn0XnBQhNPb80LAsQCef1oWOo0DUU6JCzOuyrnA/UKuFqfohMvNamv
         MYYsLj7/fiR0dgEm74HCJJ+/XJfiy8hLao9WQ+FZjDOsklxfbKWRHYSDlDDxMgJS7oDw
         rO4gPruIuHys9BZ4qJmwCjmh+XlEMjL0R9Bcvm0G7Fiqdi+74Dij9fqu7QJ40PIGi+co
         nGtaRBjxLxVl/1KfyCu3VyjX0I/wwkFAdBP68LtwRhcNwG0mJJRlXhzDNu9TfeybuW0R
         7xpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW905fm+xyD/nk6wK6uvu4AZdhoTQwM/qwGdHZepq+j4nlcCFG16Ntp53u6nDBeH2eIk1ZDfpRo4Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0HHS4J1RNs0lyj4O54fN1/YB2E29czOiayM6W5pAQ5hw3M1mS
	9djX3VciCZeAqEVPU+7c9u8Itw/2O98Gh/Gj8JmBJ/ela9Xa0S6qROAdPSktCg==
X-Gm-Gg: ASbGncuwxwGxEQpdAKpqiv0xbEP+DYSNSHZT3yglhon2jkO2drtRGlbHxHgPwRCyxWh
	sElOgkxbMJkHGMBAor+h9cMzAyEM8fzXS+lvg6Dq6i1zQxFKwrtqiATJ1QNbrJB/GzZ4omau48y
	WIX1WcBDKxwbJg8RaWKD9YJsIa6FWVCnemh2dU34p3X2JK1MrZ8YTg5MiuPZlJpT2B7v1BOPCHj
	qU9ArP5hzLOEMGCJ0o064I5rLt05XtBOeBdoPJoh3g5Qtqx6lbsPBYoUhjmUuwR7T27u1F+zfd6
	aSml6qFCRcDFrFwdrO+zjxnRJvlXjag=
X-Google-Smtp-Source: AGHT+IEWoLxfSlaf8rXHfYGdo/dNrMIk3fj9viLQXfHndjp90WcsgvICJeewTTVu5HvfhfYK4N5nnA==
X-Received: by 2002:ac8:570b:0:b0:465:2fcd:cb0b with SMTP id d75a77b69052e-468f8df3bcemr12486021cf.24.1734383849763;
        Mon, 16 Dec 2024 13:17:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:29 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:19 +0000
Subject: [PATCH v5 5/7] ACPI: bus: implement for_each_acpi_consumer_dev
 when !ACPI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-5-3d6b35ddce7b@chromium.org>
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

Provide an implementation of for_each_acpi_consumer_dev that can be use
used when CONFIG_ACPI is not set.

The expression `false && supplier` is used to avoid "variable not used"
warnings.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/acpi/acpi_bus.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index f38e8b1c8e1f..68c0e2fb029f 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -1009,6 +1009,9 @@ acpi_get_physical_device_location(acpi_handle handle, struct acpi_pld_info **pld
 	return false;
 }
 
+#define for_each_acpi_consumer_dev(supplier, consumer)			\
+	for (consumer = NULL; false && (supplier);)
+
 #define for_each_acpi_dev_match(adev, hid, uid, hrv)			\
 	for (adev = NULL; false && (hid) && (uid) && (hrv); )
 

-- 
2.47.1.613.gc27f4b7a9f-goog


