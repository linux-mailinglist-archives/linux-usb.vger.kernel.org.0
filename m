Return-Path: <linux-usb+bounces-2430-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454F7DDF3F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 11:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC7B1F2226F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 10:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1D7101F3;
	Wed,  1 Nov 2023 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iiubIDLj"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126CB10786
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 10:17:20 +0000 (UTC)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29775102
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 03:17:19 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d86dac81f8fso7179355276.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Nov 2023 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698833838; x=1699438638; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eYwnCg3MzOCxaL6syOpApDs7eXE4N92NMNfKk1723ok=;
        b=iiubIDLj9+fiCVO4MRpbpNiWATQLYfZHiBCO35SoWgZagmwID+7ufEeHiRa4+HlAkN
         sP0sY+7jA9UEd9dB/nWZLLxUnc/XHy3xiXnsWWd7Wu6V3eTm2SjcRw3lcjf24d1lqaLP
         2Due5leqljuEQc1plzedg+EhOxIMvpeAER0lnd+zngCkG4t3N4iWIsa05+oqyszpXG66
         v3K/FismcNKh1F/jqiWKQ/p+mHqd2f56cBTz4Dv8h85sufn5JUPiGjMyCDw/glZIBUWI
         Hsj3eEbSAy/NV2qcZ2KwyZjkdqswRkm6Cdqfiep/afgFQKz9guD+Ve4azVqRkl0TeP/t
         PdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698833838; x=1699438638;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYwnCg3MzOCxaL6syOpApDs7eXE4N92NMNfKk1723ok=;
        b=JMRr94sU5DYujHx9mc9lGpB9R3Y3NUbE9KUpD3At/mjyiynqQ9cEO5NLm+nauhlQZp
         BNmDnDyMNnzV1IEyOjlVZnHFRnJTiGRqtfEQDqhjvFFeFo38P1bw6uCbA6suSq73bbLC
         LoHoYntPxixKv0EfctrBOu4BQy5UjiYssyWTPiqv0MOedG/nFrE4O8ODRWnfjQpAwC3r
         kn21MbRSq3Q76cViUFJOdm9yFR+k/GSLxAwHWd+rMjdxFl9S7XA+oOKzVQsljPcMqwoJ
         rV6DbWpqv5ki2OxY+s5kn3+DhC5quXXwhbProZTK5mkIkawW6puH8QlM3NBTAN3wQ0QD
         mo9g==
X-Gm-Message-State: AOJu0YxEa8+pQKTu3OARK1i5NJ67XdXAMKa/ZMTEyuRty6jTZeGIFx1n
	NTwMOU7BNoTq06Mq61GSZfB3f/Ga+j6h
X-Google-Smtp-Source: AGHT+IHinYRwD8fj0nrrNZJpNGMVcxTbcgPusqm9nKng4RFXsyc4EKTfTVPgJ98yc1drhyuZAcOYzZfbiOsN
X-Received: from mnkumar0.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:313a])
 (user=mnkumar job=sendgmr) by 2002:a25:bc52:0:b0:d9a:3d02:b55 with SMTP id
 d18-20020a25bc52000000b00d9a3d020b55mr296671ybk.0.1698833838374; Wed, 01 Nov
 2023 03:17:18 -0700 (PDT)
Date: Wed,  1 Nov 2023 10:16:24 +0000
In-Reply-To: <20231101101625.4151442-1-mnkumar@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231101101625.4151442-1-mnkumar@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231101101625.4151442-2-mnkumar@google.com>
Subject: [PATCH RESEND 1/2] usb: host: xhci-plat: Add quirk-no-64-bit-support
From: Naveen Kumar <mnkumar@google.com>
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, 
	devicetree@vger.kernel.org, Naveen Kumar M <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Naveen Kumar M <mnkumar@google.com>

This patch exposes the existing quirk XHCI_NO_64BIT_SUPPORT so that dwc3
clients can also use this flag. Despite HCCPARAMS1 being set to 1 some
clients may not support 64 bit addressing.

Signed-off-by: Naveen Kumar M <mnkumar@google.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index b93161374293..d5f37decb7da 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -249,6 +249,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "quirk-broken-port-ped"))
 			xhci->quirks |= XHCI_BROKEN_PORT_PED;
 
+		if (device_property_read_bool(tmpdev, "quirk-no-64-bit-support"))
+			xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 	}
-- 
2.42.0.820.g83a721a137-goog


