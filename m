Return-Path: <linux-usb+bounces-15809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE635992DF0
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 15:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BAEF1C22ED7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 13:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890251D61A5;
	Mon,  7 Oct 2024 13:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CwFtpwfR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C141D5CE0
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 13:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309327; cv=none; b=HKVHkGW7cxgGFt8mzmL6HkpTFnOsnHArq9C/nPZb/O63JiGFUDmiIYwqPUcU8eyZq4JGjj3MSn8NL6Y0kcIZfGPo2gYgC9i5ZKiPZMau1v2HnXsBbzkTGbwvvz7vybUhqd+cNZ4dwkVV5p6Zuk24D+k9Erb71NziCDOs1GX5CjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309327; c=relaxed/simple;
	bh=WkIFA3Bbn+M2B5VzgzqBsaRxhzbrBeYNIHEndslM8DI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dIo6Pd/jYMbR+FC9Shpv/DldYKEqKTRXTmmVR9HSzE1gTvyF00/UDiOlnct4RnWOO4byQCVvoBzKF+VGchRJev8LKFmWXEozrDaKEeTfZUXe31948xT/PHUt9SSYPY7zlao6w5M7DWvEzEvPxEiBjSOE7tcv0jvJO+Lj9dAj/2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CwFtpwfR; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e230808455so53701147b3.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728309324; x=1728914124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CblMzpCPNydZZpvacmjghKpdVLiy01vOQxnw0IUvqWY=;
        b=CwFtpwfRHMfxXmO55c0Lwx/LrOjH1eknvkF7swKeU1TQfAyX0wWjit2wBTctg7Wd/w
         /qr+uqc/fYpmY2N9k90Ot6CnQaPcmAXQJPktWTiVT34PSU3QI4uZWcMrKnZnS2zTk928
         afmkzmQkDjLBHdd+ywWtMt3gX3RwgeVJcGAUA4y0aV8MNjNA0Ifq7GG8jk91dJ5KUIS/
         /hRT1pBQ+nuL5t128PBIcsgGoOnyWa98VQRvWqp4lwcCJ8fOkBU9EUmzARp+IaAS5qnS
         UEhcQpruVLvZGnMWyxZtAY8aCyxR44LOTimFhttRR9cz4HCBkiSCIr0bwwihbDdhysMc
         Q/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309324; x=1728914124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CblMzpCPNydZZpvacmjghKpdVLiy01vOQxnw0IUvqWY=;
        b=dG10rAjKlexyvZtrFwmMkfZWVDJzEjJwaY3aVNzuwE4502o7D19swsc0RiaInfxnMk
         wFbL21RGjtsX0I7tOW0duaDbKBrPv7eUCVQMJJaDiWCo6YVFD+R9hsDK2hsi7XDj/TEX
         V3xE86UlUvMBGW8Dy2VYi0LygPn3jI7xtXUzw+4gf9WtGrQQUpNd1lbzPwo9W8vVR1dK
         mjpdHkFYx+tWDGb6KUclIRjaMe8B1aJCbwESlwYzb3uW3dYpnXOaI8JFatwzhp5Llzd2
         zscHKRYB/pXzgM2hJ6CAfOB3WU7xacchhU36q0AYryyPaTu2FpKAi38jk6dsRf9Hlnqf
         4rVg==
X-Gm-Message-State: AOJu0YwgIeG6Jkev+lwTX4KMHS2goczBltWqvwqqVRAch1Sucsnoe+Gq
	aDqDNmotbV/vKTVjLxB3sU/a2BybTQLYFIHRuxC2J90mKFClKGpeSGwhp/NfRIKL4wR/UH+xr4T
	r63OJRkAtjQ==
X-Google-Smtp-Source: AGHT+IHEWUgCEIy7iPCOVn7Lb+x/YbYzsOzZFkYER6vlS8wHJBCQCEMmUmC8PeUdmvbDxuhxB58u1a4APwmNFA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:d1d:b0:6e2:2c72:3abb with SMTP
 id 00721157ae682-6e2c72bbd5emr3753187b3.7.1728309324364; Mon, 07 Oct 2024
 06:55:24 -0700 (PDT)
Date: Mon,  7 Oct 2024 13:55:06 +0000
In-Reply-To: <20241007135508.3143756-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241007135508.3143756-1-joychakr@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241007135508.3143756-3-joychakr@google.com>
Subject: [PATCH 1/2] dt-bindings: usb: dwc3: Add binding for USB Gen2 De-emphasis
From: Joy Chakraborty <joychakr@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

PIPE4 spec defines an 18bit de-emphasis setting to be passed from
controller to the PHY.
TxDeemph[17:0] is split as [5:0] C-1, [11:6] C0, [17:12] C+1 for 3 tap
filter used for USB Gen2(10GT/s).

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1cd0ca90127d..a1f1bbcf1467 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -190,6 +190,18 @@ properties:
       - 1 # -3.5dB de-emphasis
       - 2 # No de-emphasis
 
+  snps,tx_gen2_de_emphasis_quirk:
+    description: When set core will set Tx de-emphasis for USB Gen2
+    type: boolean
+
+  snps,tx_gen2_de_emphasis:
+    description:
+      The 18bit value of Tx deemphasis defined in PIPE4 spec driven to PHY
+      for normal operation.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0x3ffff
+
   snps,dis_u3_susphy_quirk:
     description: When set core will disable USB3 suspend phy
     type: boolean
-- 
2.47.0.rc0.187.ge670bccf7e-goog


