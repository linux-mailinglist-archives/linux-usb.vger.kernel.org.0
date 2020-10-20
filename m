Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE2B28A30E
	for <lists+linux-usb@lfdr.de>; Sun, 11 Oct 2020 01:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390769AbgJJW6c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Oct 2020 18:58:32 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57486 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733020AbgJJWmx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 10 Oct 2020 18:42:53 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9E3F5803202B;
        Sat, 10 Oct 2020 22:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1vI9s3Fw8Nc2; Sun, 11 Oct 2020 01:41:28 +0300 (MSK)
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
Subject: [PATCH 04/18] dt-bindings: usb: usb-hcd: Add "ulpi/serial/hsic" PHY types
Date:   Sun, 11 Oct 2020 01:41:07 +0300
Message-ID: <20201010224121.12672-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
References: <20201010224121.12672-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Aside from the UTMI+ there are also ULPI, Serial and HSIC PHY types
can be specified in the phy_type HCD property. Add them to the
enumeration of the acceptable values.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 39e90147dfcc..1eddcbf0a9d8 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -42,11 +42,13 @@ properties:
   phy_type:
     description: |
       Tells USB controllers that we want to configure the core to support a
-      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected. In case
-      this isn't passed via DT, USB controllers should default to HW
-      capability.
+      UTMI+ PHY with an 8- or 16-bit interface if UTMI+ is selected, UTMI+ low
+      pin interface if ULPI is specified, Serial core/PHY interconnect if
+      serial is specified and High-Speed Inter-Chip feature if HSIC is
+      selected. In case this isn't passed via DT, USB controllers should
+      default to HW capability.
     $ref: /schemas/types.yaml#/definitions/string
-    enum: ["utmi", "utmi_wide"]
+    enum: ["utmi", "utmi_wide", "ulpi", "serial", "hsic"]
 
   otg-rev:
     description: |
-- 
2.27.0

