Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A409538079D
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 12:45:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbhENKqS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 May 2021 06:46:18 -0400
Received: from mail.manjaro.org ([176.9.38.148]:38888 "EHLO mail.manjaro.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229504AbhENKqR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 14 May 2021 06:46:17 -0400
X-Greylist: delayed 1103 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 May 2021 06:46:17 EDT
Received: from localhost (localhost [127.0.0.1])
        by mail.manjaro.org (Postfix) with ESMTP id E18A1222588;
        Fri, 14 May 2021 12:26:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at manjaro.org
Received: from mail.manjaro.org ([127.0.0.1])
        by localhost (manjaro.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Qsi7fE3KL_nW; Fri, 14 May 2021 12:26:39 +0200 (CEST)
From:   Tobias Schramm <t.schramm@manjaro.org>
To:     linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tobias Schramm <t.schramm@manjaro.org>
Subject: [PATCH 3/4] dt-bindings: usb: dwc2: add compatible for RK3308 USB controller
Date:   Fri, 14 May 2021 12:27:33 +0200
Message-Id: <20210514102734.2091238-4-t.schramm@manjaro.org>
In-Reply-To: <20210514102734.2091238-1-t.schramm@manjaro.org>
References: <20210514102734.2091238-1-t.schramm@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB controller in the RK3308 is compatible with the RK3066 USB
controller.
This patch adds a compatible string for it.

Signed-off-by: Tobias Schramm <t.schramm@manjaro.org>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index e5ee51b7b470..10c7d9b6cc53 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -24,6 +24,7 @@ properties:
               - rockchip,rk3188-usb
               - rockchip,rk3228-usb
               - rockchip,rk3288-usb
+              - rockchip,rk3308-usb
               - rockchip,rk3328-usb
               - rockchip,rk3368-usb
               - rockchip,rv1108-usb
-- 
2.31.1

