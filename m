Return-Path: <linux-usb+bounces-18544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0CF9F3C8E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 22:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83538164E93
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 21:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A647B1DB37F;
	Mon, 16 Dec 2024 21:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fkTiktYF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19E1D88A4
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734383852; cv=none; b=u7Gcgdavi8v1fQhhHTmV/eivGIek0WLONnDyy7m7AbzByO9VO7W5ZyGlB408uKi5IwXO8le77G/UKxb8qnUeu1qbwNe2zqPzaXafWqDiya9pOjhApe8uyjatG2ydhZ1LU/2C4YReyVGndZDO7iVCHKNKkMq9i7MHgtiP8uzXYAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734383852; c=relaxed/simple;
	bh=OSI5+enbqVnK80hh3GRt2v2/xjuyertlyl2dDt3BvaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s5q2K0xFEeZYYb0d2miQS+0Psi3dHQ18QuHDk4fx5MRpt5ZZ32E1frkE6PVFeFy9pa35EDq9m1QcQ6UExIIrPX5KIvzm884uJLncIsJdUGT82m+BgPwf/eeASaacvr88C3gWjgWdmdHpZ7gao2/xmiqZkfPzhDz6wxUu8+s3YMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fkTiktYF; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467a63f5d1cso35181031cf.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 13:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734383849; x=1734988649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94GpRvEFGP1zDl7TooYa5XXxiXoizWnVF+RBMjgEO9A=;
        b=fkTiktYFTPmDeU9C4JP925QArvW+eKnHcm6j/H5w2zAykkSRytleeNs+VWy4zzwKTB
         +aYKjrb1UEjiGE6Du8jzPlIzSkdGhavIKg0Gbnk2WkrGHnPO3naJwCBiMxKlW8mBpNuN
         GOsPXWogbrd2ZH1g8Gj1fL7YemXx3isGnfgSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734383849; x=1734988649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=94GpRvEFGP1zDl7TooYa5XXxiXoizWnVF+RBMjgEO9A=;
        b=gBjJNX8eYgjNWMX3JrELRJnG4pQWXBHyR9x2cO/CyUV6gzT9GRQ19K3R7f4vkgFeJt
         qAC29Ba4meLoYhMT7zcqOhlUz2O5qMz4TT+rsGn2WvEcj8ipk8Cg4g19WPxsdwpnsT4d
         eIHPIYR+ujp9XiE5TRWDcjuEz9SRbS10oNosBrsnlLrt2+rh+cUKcSBWa0ghcpwmijv5
         WUaSjUfGIBx6M5iye5jXsJnGdlGVp+T4aa45SfuaBDW3PZoxXZojz63Um1jpCPvrCx2f
         Ipsykr+YV7lZCycJT0wrXanT1p6CildCHvx0vb0gyrvlU4qwR5X0MKifbQNvYf0AlhkM
         +Kaw==
X-Forwarded-Encrypted: i=1; AJvYcCWjXYvic3P1gpg/PCf3GnHI4xNKM/zakteSVOsXvBTidwzhdzz5RNILY9HG//Ke7sueOkrm5ECDffU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMKCgq70uQvnMrWGu574OevCjB9DEF0yTwjpBlNtysg+Wne/X8
	xyMtp3h6KSauKNnC9kW0N83EDrmVObNKlYj7xWMmL1t05HX/iUjnYgjIk7u1Vg==
X-Gm-Gg: ASbGncs8cuNou6w5CzY8QFMcmeqlINNsUx031jUvKytn2XeLNaWRU6XUxQS8vykB0jQ
	6hJfJ77tKHcVYJ3JGw1isb5/90+HEXbl0s65PKxht0ks2jzE7jWkTvxDMnqDQxooq8iPTNszbFc
	HtKwlWIqmVxxudlKt8dN0Kj39FOPYGirCYLkpTSqRidkbV5YJZIMdtgBSSOOiLOoZ7PELpCnxhL
	iiEQJ5HwtyoxOimUu0wwn7PZrJzKgXpMZKoOR8tp3izzBlx9+/J8G56GpWcpH5qd9aQNrCu8GeX
	8N07fL5JX+8cJtkU1nx79TrECSz7mv0=
X-Google-Smtp-Source: AGHT+IFyzGw+gglrqm8+RhNerLly3LfTpt0cYg/FTCF385N1SMb70IaANKI6otHSuU62jnflMlYR+g==
X-Received: by 2002:a05:622a:1210:b0:462:e827:c11a with SMTP id d75a77b69052e-467a575a86emr267051701cf.19.1734383849004;
        Mon, 16 Dec 2024 13:17:29 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2e85c03sm31927501cf.69.2024.12.16.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:17:28 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 16 Dec 2024 21:17:18 +0000
Subject: [PATCH v5 4/7] ACPI: header: implement acpi_device_handle when
 !ACPI
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-ipu-v5-4-3d6b35ddce7b@chromium.org>
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

Provide an implementation of acpi_device_handle that can be used when
CONFIG_ACPI is not set.

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 include/linux/acpi.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 05f39fbfa485..fb88f21bffb2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -854,6 +854,11 @@ static inline struct fwnode_handle *acpi_fwnode_handle(struct acpi_device *adev)
 	return NULL;
 }
 
+static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
+{
+	return NULL;
+}
+
 static inline bool has_acpi_companion(struct device *dev)
 {
 	return false;

-- 
2.47.1.613.gc27f4b7a9f-goog


