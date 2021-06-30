Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E4A3B7E15
	for <lists+linux-usb@lfdr.de>; Wed, 30 Jun 2021 09:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhF3HdN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Jun 2021 03:33:13 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:49582 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232785AbhF3HdL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Jun 2021 03:33:11 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85884639"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2021 16:30:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2CE9241DBA50;
        Wed, 30 Jun 2021 16:30:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 01/11] dt-bindings: usb: generic-ohci: Document dr_mode property
Date:   Wed, 30 Jun 2021 08:30:03 +0100
Message-Id: <20210630073013.22415-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Document the optional property dr_mode present on both RZ/G2 and
R-Car Gen3 SoCs.

It fixes the dtbs_check warning,
'dr_mode' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
  * Dropped RZ/G2L SoC and USBPHY control IP is modelled as reset binding.
v2:
  * New patch
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 0f5f6ea702d0..569777a76c90 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -109,6 +109,11 @@ properties:
   iommus:
     maxItems: 1
 
+  dr_mode:
+    enum:
+      - host
+      - otg
+
 required:
   - compatible
   - reg
-- 
2.17.1

