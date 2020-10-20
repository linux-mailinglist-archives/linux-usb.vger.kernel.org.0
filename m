Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDDF428A451
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 01:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387796AbgJJXPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Oct 2020 19:15:34 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57830 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387953AbgJJWxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Oct 2020 18:53:06 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 457D380023E8;
        Sat, 10 Oct 2020 22:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id b3wUIH7K5n06; Sun, 11 Oct 2020 01:41:34 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 14/18] dt-bindings: usb: dwc3: Add Frame Length Adj restrictions
Date:   Sun, 11 Oct 2020 01:41:17 +0300
Message-ID: <20201010224121.12672-15-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In accordance with the IP core databook the
snps,quirk-frame-length-adjustment property can be set within [0, 0x3F].
Let's make sure the DT schema applies a correct restriction on the
property.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 36d4b8060d7c..f1e6c3dab1ff 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -226,6 +226,8 @@ properties:
       length adjustment when the fladj_30mhz_sdbnd signal is invalid or
       incorrect.
     $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0x3f
 
   snps,rx-thr-num-pkt-prd:
     description: |
-- 
2.27.0

