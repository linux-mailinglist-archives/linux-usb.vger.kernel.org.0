Return-Path: <linux-usb+bounces-24521-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47257ACF5DF
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 19:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 003EF189C1BD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Jun 2025 17:54:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EC227A45D;
	Thu,  5 Jun 2025 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I1VnEq3T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEA27A918
	for <linux-usb@vger.kernel.org>; Thu,  5 Jun 2025 17:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749145992; cv=none; b=BaHltYQVhI9BVbdxzWmN9OZkhMYfXtnbO/vgxNJUTGSZzgN8C+xU8tLRAtGyPqlYNqClxNMmuKti0Otl6Ps9lOAspWIVs7eKIMlmfDkVBKyjpsC7bVXpqYS6wEOKUGFNm7tDe79r4zVULymmL8adp6K0m26zLSKgy4kqoJykz20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749145992; c=relaxed/simple;
	bh=NngJ6Yx0t8C9t8P4XXbFrpgjfgvwAkcfBnBpT4lxGFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqBmuMmLpG/paEOLzCB5PqgLIh4XP0Wux5t/1asCgM/OH/4NaozchkK9oAkOpa7HZaKqbAkczAYNbnpvLw1CbBWAA2rJ4GBcOhgI/pD5gDbJfbzZu+NPvakxSdEj6+ebs/nE0l6a1klHazAT67HFGApw3yCahz2tM8n5c+Jue6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I1VnEq3T; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-551efd86048so1376073e87.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Jun 2025 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749145986; x=1749750786; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar8+oEy28CepxnVsr2jEiRDXTfDok/weLPLs5Z9kVHA=;
        b=I1VnEq3T8ddqhvoQ5NQEukgf98kgl7JFV0+hJFR08RpOZNJJecr1c0dpbMFgc2cV05
         0qvwE/NiO1qE7Mp+j7Wh7nVnDoL2Ul0nM8dMnVCvPQiR8V5swuaCtKPfusjdb1M3GaMR
         wlX1GOuM584IpO1TFQgHjYERmMzoyas7NAhKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749145986; x=1749750786;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar8+oEy28CepxnVsr2jEiRDXTfDok/weLPLs5Z9kVHA=;
        b=mnEFrDU5G77IP/+so+Sx0qPAsZ20ZGSPjFU4OwfUMSxlWEn8i2QIVELPP8ZWywdCfK
         V4rgV89RCJVhCwwtE5YmyUs0Iplt1UCGhg2DsuyRnx++YlTgYLg4mr4aGcJ9PuxqL/su
         WU7G+9tFqx5Xz6Y1HYNOUBCbn0UdJVG0MHmlk0T6UIMlt+DzoqF9rM0fqDlCBivauBl8
         zYkbKZb20nhJLKaAxnIJsHI/pZNaz5+7lZDEs8G3mo1pN5F/FrjnXKLzkk/aiJzrFtZE
         SMERgUUxSje8kso50JCPTmGz45RkuqGaie9fKXDD1snXGWPzCyxu/7pS1K6iKYGAN4ru
         yJYg==
X-Forwarded-Encrypted: i=1; AJvYcCXjYbRkpNay37Zh++Dz3HqDAwR5pbCAVzIwRKZsOveCECmJKGrO1sMWs3AAaejL1C/Latx4PLxkoYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqEnaM3wHqm28+OhgcWc9eiHZN1gWaqNJLW0NGekGp82sqoWKt
	+iQ06InwNB/L8LCujEKuQtqK73DElG65CQunR9Y3pK7/xD065KaQrKzPulsiYINpmA==
X-Gm-Gg: ASbGnctstec49kb77Yd39M3L0DdCA96cdWyJAY9PiH0nYcYao7n1feYwz0oP/4bOBTS
	RiK5pxSf2HEMJcuINM8pHG9YztY722J4BdugkMJklwO58I4QprvdH2qjkdu52eJv1JfSmNzcHga
	Qpz87ChpX2acq0kZKUpfPfk8d8u5pJ2Jm8moNEyqP/40ujpHH9lPxsY7CCkxUND0IH/JbcczXMp
	YuQknR6e0QBqIYsDzMCqm6LXndbZ9INJ/uNx+1nnINQF2WCyF58q0HmjO9MGXKC6lffiW6I+RqQ
	qip30lefXIrug8rimElNAELHhAH2bmk9NlIUQws/fDBxkEG89osVotHbbu56mCBxGFdIz8wd5m2
	oWfUr7E6/Em3TunNKqDLSISm5GrGLkReiHvZ+
X-Google-Smtp-Source: AGHT+IGuo9eAuj3/ZulUgVYVuEINR6TV4aJnWcXikBTGTDNlZ8YqpVl3rERmqVeHdcMBB1locGc5IA==
X-Received: by 2002:a05:6512:2242:b0:553:3892:5ec3 with SMTP id 2adb3069b0e04-55366c354f4mr16249e87.46.1749145985864;
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553379379c2sm2641210e87.251.2025.06.05.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:53:05 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 05 Jun 2025 17:52:59 +0000
Subject: [PATCH v2 06/12] dt-bindings: usb: usb-device: Add orientation and
 rotation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-uvc-orientation-v2-6-5710f9d030aa@chromium.org>
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
In-Reply-To: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

For some devices, such as cameras, the OS needs to know where they are
mounted.

ACPI has a property for this purpose, which is parsed by
acpi_get_physical_device_location():
https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device

In DT we have similar properties for video-interface-devices called
orientation and rotation:
Documentation/devicetree/bindings/media/video-interface-devices.yaml

Add rotation and orientation for usb-devices that matches the already
existing properties of video-interface-devices.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index c676956810331b81f11f3624340fc3e612c98315..a44eb24c657993f88145377a4706ec419b6cd998 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -44,6 +44,14 @@ properties:
       - minimum: 1
         maximum: 255
 
+  orientation:
+    description: If present, specifies the orientation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/orientation
+
+  rotation:
+    description: If present, specifies the rotation of the usb device.
+    $ref: /schemas/media/video-interface-devices.yaml#/properties/rotation
+
   "#address-cells":
     description: should be 1 for hub nodes with device nodes,
       should be 2 for device nodes with interface nodes.
@@ -103,6 +111,8 @@ examples:
         device@2 {
             compatible = "usb123,4567";
             reg = <2>;
+            orientation = <0>;
+            rotation = <90>;
         };
 
         device@3 {

-- 
2.50.0.rc0.642.g800a2b2222-goog


