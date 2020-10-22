Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 338802957BE
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 07:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507852AbgJVFPq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 01:15:46 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42630 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2444222AbgJVFPq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 01:15:46 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 78B3AC026E;
        Thu, 22 Oct 2020 05:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603343745; bh=nTPdEZ2enkeB1WuU/L+M60LEJY7TTeAXK4W7ufmjOgI=;
        h=Date:From:Subject:To:Cc:From;
        b=abmLuYPdh2xTN0ceQG+1+/FrpFxN6HCcHaHX3q7+RdQ+n9s5Pjr9XlVWA84UbqvFY
         KAI2iKB/I/ekU3K0hOv5alPoSXEKYbn3dXJtqqY0+b9YY7/sTukYF0N/cUUz30xCcl
         5XtO1OXYc93m1nq52Siz/YTmIQ6cJl3q8TUSX4HyudNHVgqR81IJkVGSNvqkHnUgAs
         BLvcgXSuBNAUWqb8bgbQOJsvRAILMshVG9+3BjwUZ47cvr+hGyQYLnTEEawfXvMy2j
         Hzi0bHCfHEmybbU9alPtH4hKAyOf0/rFJ9DEH+j5cREcsFfY0x2m9aRNX9bioueljy
         nvrkJgpKtxtuw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 07B55A0072;
        Thu, 22 Oct 2020 05:15:43 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 21 Oct 2020 22:15:43 -0700
Date:   Wed, 21 Oct 2020 22:15:43 -0700
Message-Id: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 1/3] dt-bindings: usb: Add undetected disconnection quirk
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Synopsys DWC_usb3x host controllers will not detect enhanced super-speed
(eSS) device disconnection if it has active isochronous IN endpoint(s)
behind one or more eSS hubs. Introduce a quirk to workaround this for
xhci and dwc3 device tree.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt     | 3 +++
 Documentation/devicetree/bindings/usb/usb-xhci.txt | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 1aae2b6160c1..b23b52f5842a 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -105,6 +105,9 @@ Optional properties:
 			this and tx-thr-num-pkt-prd to a valid, non-zero value
 			1-16 (DWC_usb31 programming guide section 1.2.3) to
 			enable periodic ESS TX threshold.
+ - snps,blocked-disconnection: enable workaround to undetected disconnection
+			while isoc endpoint(s) are active for DWC_usb3x
+			controllers operating as host
 
  - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
  - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documentation/devicetree/bindings/usb/usb-xhci.txt
index 0c5cff84a969..60812ae74d46 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
@@ -28,6 +28,8 @@ Optional properties:
   - quirk-broken-port-ped: set if the controller has broken port disable mechanism
   - imod-interval-ns: default interrupt moderation interval is 5000ns
   - phys : see usb-hcd.yaml in the current directory
+  - blocked-disconnection: workaround undetected disconnection while isoc
+		endpoint(s) are active
 
 additionally the properties from usb-hcd.yaml (in the current directory) are
 supported.

base-commit: 270315b8235e3d10c2e360cff56c2f9e0915a252
-- 
2.28.0

