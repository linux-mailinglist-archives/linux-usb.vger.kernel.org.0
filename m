Return-Path: <linux-usb+bounces-4948-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B21C882BD7A
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 10:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62719286C41
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 09:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F64D57307;
	Fri, 12 Jan 2024 09:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="xF2OLl39"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7082BD1A;
	Fri, 12 Jan 2024 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052743;
	bh=IJ0fhahSkBQixlmEf3QoSmH4xGCg8CHJlBEhtfGdLM8=;
	h=From:To:Cc:Subject:Date:From;
	b=xF2OLl39wqqJO0TA3f5smqCQhLClBMqGoWzc+IhNY9x7wNUhvQ4D2yAB9RZ1h6CAj
	 S81nrzPjhZUf+/Biy3FyEAYk5Us59/bXA5WRAexnVZpERmXexIBGSYuWi7nJ7mrMAM
	 MeXgOE04Twr5J6IiarBICERj8O7gC7MIUDvjz/4AMvrlpnhoRVISBGGWt74o/u0hXi
	 1JEDzIX5UTgngaCooH/5JiceZkb6u+WP2qnQp+of/hkbAmwFHyJGsyyXiqFD4QTrAk
	 1JZwdmmKJ8YitiJpMPIwFCRT7DmEX5NL0xByT5ImcFFwN36hDvPKxXI4WMjziyM2n8
	 Oqn29EOzVTfkg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 70B0E3781FCF;
	Fri, 12 Jan 2024 09:45:42 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux@roeck-us.net,
	heikki.krogerus@linux.intel.com,
	cy_huang@richtek.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 1/2] dt-bindings: usb: mt6360-tcpc: Rename IRQ to PD-IRQB
Date: Fri, 12 Jan 2024 10:45:37 +0100
Message-ID: <20240112094538.65639-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since there is no user yet, rename the only interrupt of this device
to "PD-IRQB", avoiding underscores.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
index 053264e60583..0bea23ce2f09 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6360-tcpc.yaml
@@ -24,7 +24,7 @@ properties:
 
   interrupt-names:
     items:
-      - const: PD_IRQB
+      - const: PD-IRQB
 
   connector:
     type: object
@@ -58,7 +58,7 @@ examples:
         tcpc {
           compatible = "mediatek,mt6360-tcpc";
           interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
-          interrupt-names = "PD_IRQB";
+          interrupt-names = "PD-IRQB";
 
           connector {
             compatible = "usb-c-connector";
-- 
2.43.0


