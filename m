Return-Path: <linux-usb+bounces-1861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3207CE0F1
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 17:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64A6B212A9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 15:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1843938BCE;
	Wed, 18 Oct 2023 15:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkACMXt9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFEF20307;
	Wed, 18 Oct 2023 15:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227A5C433C8;
	Wed, 18 Oct 2023 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697642220;
	bh=h3p1Fgw5s66YZXzFyyzsdTutBTpnztoMsycATj7QWJc=;
	h=From:To:Cc:Subject:Date:From;
	b=KkACMXt9SXHbr8xJ35K5NJ7gmujYnG98pC583tri3SyZ9RbIZm0Wq+5MILfnrtt2o
	 GTiBhK4T7LOBuDQCtwEFLHDk0nzXzqL33NfIkfVIQy6RXneLj3ZdK2paZxqIcxfHz/
	 uNT5dKCvPTLkMXC3R7HQ0ytAyyRkTOVTjSzhx4OMyByuTvq88MkEkuovqN1AN+58ju
	 gzmyzSU6wxMF4Rb+2qzTKijpkQbmUA2EMB48R/eqF6HNZOo9Y6CINTMErYqCH7Pkun
	 kaTqkggFJLpPdDkpSLb3jGseeaFfN2LdKAm8/plBU8Pz54AP2xEl2q3SPNjZXpqLqa
	 jDPWxkyK/9Ung==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: usb: vialab,vl817: remove reset-gpios from required list
Date: Wed, 18 Oct 2023 23:04:48 +0800
Message-Id: <20231018150448.1980-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "reset-gpios" is optional in real case, for example reset pin is
is hard wired to "high". And this fact is also reflected by the
devm_gpio_get_optional() calling in driver code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

since v1:
 - remove th1520 usb dt-binding part, this isn't related.

 Documentation/devicetree/bindings/usb/vialab,vl817.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
index 76db9071b352..c815010ba9c2 100644
--- a/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
+++ b/Documentation/devicetree/bindings/usb/vialab,vl817.yaml
@@ -37,7 +37,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - vdd-supply
   - peer-hub
 
-- 
2.40.1


