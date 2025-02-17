Return-Path: <linux-usb+bounces-20733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78846A38CA0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 20:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B90188D9D9
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 19:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D298237194;
	Mon, 17 Feb 2025 19:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="ocExaFjs"
X-Original-To: linux-usb@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DA3236433
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 19:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821464; cv=none; b=jiu3AYNb5CC6YHwE2oItdT7v2W3I8eiLq1U2VpReDSEiF0JTzGd5+tGQHaD0Ce74dZZMBnhjpqVm0PJJsoQjeR04H1L/5t4yHwaqx6Sr0UbflRZrc6WXHPo5pQtpkux1SoNj1iqLvGa9KcA+9ZRR+z6XZKssHrTddOhuJksj/XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821464; c=relaxed/simple;
	bh=IgmrKZQ+U6jM19WQ1y4s62f1uaoWol9FnsSA1ZFXU+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=g9MY4XzpkUqjoEli1ybgFj0AAtJbx47PPZCyMX7ghnb3WOcJps6QkQZzFRrZbWCFGbSg06KuKuHU/61cD5+TMiu4T31EEzct3qa8gv05Psald6OJwHf1d8vX5LqfNZx38dXXdhzSaaOIB0oDdiphWMSsHJP+s8goq1uMzwQcCB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=ocExaFjs; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=ocExaFjsgLFVQzh8ijKBYhiO9N1lKDnf3zFjEDFvKJwAYlJT8gGMCucPkiD/jb2oyZYBV9oLWOAwWuO8+mhv//oT1tq/MYqYNYjs6eov+EY5lGc6I7zuKbUKg4zXyyss3Y9ro4VsAoZ+ppbnUC5Cm33AydgVOI4kVMyHBIi1kn4P+YMQfJkH+j9NEWmdTBwedT+IqOfVEiG/Mib81I6Be3fdrzb1qvFGXXnwu0Zvur6Y5fePvzn6dsY78JtM/OEvNUokWGpV9w+Z/S9gMPwjeuSn6QhX+XZng5NwvyLyTh2ct0QegEl8giXyINQHwvBQqqQqaUmKV6qM2MkB17DAPw==; s=purelymail3; d=purelymail.com; v=1; bh=IgmrKZQ+U6jM19WQ1y4s62f1uaoWol9FnsSA1ZFXU+4=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-usb@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1112335277;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:44:15 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 17 Feb 2025 20:44:04 +0100
Subject: [PATCH v2] dt-bindings: usb: samsung,exynos-dwc3 Add exynos990
 compatible
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-exynos990-bindings-usb3-v2-1-3b3f0809f4fb@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIAIORs2cC/4WNQQqDMBBFryJZNyWJWk1XvUdxEXXUAZ1Ixooi3
 r2pF+jyPfjvH4IhILB4JocIsCKjpwjmlohmcNSDxDayMMrkyuhMwraTZ2uVrJFapJ7lh+tUPrp
 SdYW2mU4LEddzgA63q/yuIg/Iiw/7dbTqn/3fXLXUMoW8NYXRjS2b1wS0uHHc2RFMDmlEgsB3H
 3pRnef5BbmVk/LPAAAA
X-Change-ID: 20250214-exynos990-bindings-usb3-6f80f7194137
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739821453; l=1933;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=IgmrKZQ+U6jM19WQ1y4s62f1uaoWol9FnsSA1ZFXU+4=;
 b=B6t7KTHxA+iuFtJA+yAANoa5OJat58KmWVxgOUSKRZvxMNtbaoOTTAlv4dPWmlT5LWwh2Pu8k
 q6eEIZ+JUKrDuBKPF+X1xlb64anSsoZh8AOFx9Q0WEbW2fD/l12oaJy
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=

Add a compatible for the exynos990-dwusb3 node. It's compatible with the
exynos850 variant when using the highspeed mode.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
The Exynos990 SoC embeds a DWC3 USB3 DRD controller.

The controller's design is compatible with the Exynos850 design
for high-speed mode.

This patchset adds in the new exynos990-dwusb3 compatible.
---
Changes in v2:
- bindings: re-check, fix picking the dwusb3 compatible
- Link to v1: https://lore.kernel.org/r/20250214-exynos990-bindings-usb3-v1-1-3e5d2721c98c@mentallysanemainliners.org
---
 .../devicetree/bindings/usb/samsung,exynos-dwc3.yaml     | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99106f3b6201ab31d4d9e3fcc55627..f11e767a8abe1d2fb7faa6d6b5be09970c5c9b37 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - google,gs101-dwusb3
-      - samsung,exynos5250-dwusb3
-      - samsung,exynos5433-dwusb3
-      - samsung,exynos7-dwusb3
-      - samsung,exynos850-dwusb3
+    oneOf:
+      - enum:
+          - google,gs101-dwusb3
+          - samsung,exynos5250-dwusb3
+          - samsung,exynos5433-dwusb3
+          - samsung,exynos7-dwusb3
+          - samsung,exynos850-dwusb3
+      - items:
+          - const: samsung,exynos990-dwusb3
+          - const: samsung,exynos850-dwusb3
 
   '#address-cells':
     const: 1

---
base-commit: 5cbcf2652f4cd84eac21f5e88fe2a0baecc601fb
change-id: 20250214-exynos990-bindings-usb3-6f80f7194137

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


