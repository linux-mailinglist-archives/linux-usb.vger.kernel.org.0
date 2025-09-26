Return-Path: <linux-usb+bounces-28701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D1BA3CC6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 15:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8B81C04BBC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 13:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551562FC88E;
	Fri, 26 Sep 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MEdFAQ1S"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AD82F7AA3
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892299; cv=none; b=Y/iHO0dpikJupCkhv6N7gQOvpzp7+ECn9esn1sp8C2DZq1+p+zwj3pE1y7kZW03v/t6g/s9uDHsrAogDG6MklddMEQo39K3k/q/uGVTWQz/wx3CF9m/HiBxUkKkxCfgBj2yhfti07GAxnxQudc232GNoLlMB/u3BXG2LdbTC3R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892299; c=relaxed/simple;
	bh=747DSL3/0b26gMfctw9GAJQ4wcs8qWL90knTYpPv+GE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RFAdMQLRUeIq20zgxiFCmc4T9Zbho7COdHK9bJiU2prEraz8MNLG+0SRUJ6MfcNfw0Q8+dLrZWjZrOvp9iyRA5rvSp3LtJ6UAbxEhqKnvxjRJGbncDNtMx+RhJbQP1w6LSBYGralyC4R+Ysm4A9BMI6Oiq+dnLaxLd0YgZVbKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MEdFAQ1S; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-579d7104c37so2967898e87.3
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892293; x=1759497093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEFN0lLdAUAhxOrw8NBMU68FYdHDfoPQjtv/CBRcNWg=;
        b=MEdFAQ1S/grHZMhcCO6tE2MJcK4ibjWaeuhsoYyuBn71UUcnUC/shY5ocmLp/qu7WP
         7okYhCuXdM2bbt6BvNRcorf2eaEw8bYT5GfWfnogq8O28zLjMWCbeVbc5r+A5z91fMDr
         LpswgYv+M4HDBm0DOXhHwb1oqtph27Tu0Jodw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892293; x=1759497093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEFN0lLdAUAhxOrw8NBMU68FYdHDfoPQjtv/CBRcNWg=;
        b=nXnZcdZVkdckk4eFJdxYnpiYQbiJZvLxhW4ets4uSkzT+2c9BxMLUmtAb92pLMrxT5
         1Zm55k0nJJAy76wexK4+tZHNEWjQKRy32gKZFBs6BfuuYmoFqN4kUc+d5+WSmsw4kRju
         FFrEXWJl1PyfmqbxCHHGZFY1Blu9zjRcFJD+z4GSGI5V7d82t57JOkeHJ1HDQlmIR4v5
         Hfpk2Ur9KOMJy4Ci3mv59k2L0ihUImhesBffbmFhdz4s0lRg3E7ynERfJPOWgKy56JMy
         sequdfUDFpFbfUCLSEOOAtfDwAPwxsNRAZ4NoKFG9KwF0SPS1yEdzgvXwTqMYKLTRqh4
         Rqjw==
X-Forwarded-Encrypted: i=1; AJvYcCUeTlYKMCEMuEXacAEmObuaZoK6Ps6HdOU24fdL7H6GRIDWWLRJrcY2WbA0or/GCdaSdvBlpXymi7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdBFUzEPEb4kww64uIvMN3NsFG0eKIMkCPNEYj+flYMpsbK5oF
	2hcjnFdQExnjn4wxjHycY7+rPZeF4VVQ5FakKJKKOioDfGXXUKZPW3ak7et4KrhbCg==
X-Gm-Gg: ASbGncsUW/EZkxhbnNnAz1sOAcmFKaGm/+fk2lmJzpMrPujKBrQdgwX7Rt5cI+D/Gp0
	O1OOZlop8o8X0ExDumVh5vd0QPIoDYlg3DL9iISheEQaqtxLOTGw2m6o2pujRz9HjRmcnxkYquZ
	iTgNIWInbCWidAUSNemkHRsWK11cjWfUYU520wnCvpe7p7hJBUsnYD/5VI2giu6ani7bxWI6Ur1
	rfYz1pYqNtgDGxspSjuUu/NkfLexLyO37pYk7HSPWK7oIIDpy9r5LopxTwzwQ4olHBXx8ciB5CC
	H8EVbPKK8A7tUvW55Vm6CmySMWKLtL+LjLFVHVShL33fOgA/xt75xYLWaLH0KDpp6T4/gyvGW0r
	2VncD90fCzEhLT3pqRgdrli0sd2w0gP0876Ce5+Am6EeqebpZY+8MMZpomVKN737c53sQ8PLndP
	AxoQ==
X-Google-Smtp-Source: AGHT+IHoXncX6KzHuffRNxD1bdNRByMLtGFUXJU+Vx+pJpeCHx/eyFalgZtv/Aq9A8oN/XwwQ6kRbA==
X-Received: by 2002:a05:6512:e9e:b0:563:d896:2d14 with SMTP id 2adb3069b0e04-582d2b4cb9amr2443275e87.36.1758892293127;
        Fri, 26 Sep 2025 06:11:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:32 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:30 +0000
Subject: [PATCH v3 06/12] media: ipu-bridge: Use v4l2_fwnode for unknown
 rotations
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-6-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The v4l2_fwnode_device_properties contains information about the
rotation. Use it if the ssdb data is inconclusive.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/intel/ipu-bridge.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 441d1a5979fe94bee4738da68e185a44dbd411d4..6155046ef4fc6b5d074194d1b8113212304136bc 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -242,19 +242,23 @@ static int ipu_bridge_read_acpi_buffer(struct acpi_device *adev, char *id,
 }
 
 static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
-				     struct ipu_sensor_ssdb *ssdb)
+				     struct ipu_sensor_ssdb *ssdb,
+				     struct v4l2_fwnode_device_properties *props)
 {
+	if (props->rotation != V4L2_FWNODE_PROPERTY_UNSET)
+		return props->rotation;
+
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
 	case IPU_SENSOR_ROTATION_INVERTED:
 		return 180;
-	default:
-		dev_warn(ADEV_DEV(adev),
+	}
+
+	acpi_handle_warn(acpi_device_handle(adev),
 			 "Unknown rotation %d. Assume 0 degree rotation\n",
 			 ssdb->degree);
-		return 0;
-	}
+	return 0;
 }
 
 static enum v4l2_fwnode_orientation
@@ -297,7 +301,7 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 	sensor->link = ssdb.link;
 	sensor->lanes = ssdb.lanes;
 	sensor->mclkspeed = ssdb.mclkspeed;
-	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb);
+	sensor->rotation = ipu_bridge_parse_rotation(adev, &ssdb, &props);
 	sensor->orientation = ipu_bridge_parse_orientation(adev, &props);
 
 	if (ssdb.vcmtype)

-- 
2.51.0.536.g15c5d4f767-goog


