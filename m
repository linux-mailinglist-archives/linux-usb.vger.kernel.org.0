Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B803535EAA9
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 04:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239428AbhDNCNf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Apr 2021 22:13:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:55310 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237646AbhDNCNe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Apr 2021 22:13:34 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4474440461;
        Wed, 14 Apr 2021 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618366393; bh=sz5HlAYVEDYGqW4ZBqAnZr/VRSUriOJsr/PK2U/WSME=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=K2vKWp0yE2LZm0f1fjugAFWWI9p3dq5b4XGCicqiP3heOy3m9GLGQYVrjOntj0jah
         KtlifxOq/CmUnrJEwl7N1/P1mFSwxORglALc/kFZ/1edjgkVyRCjiAlkwLepX97xxF
         Wb3TnAy3xMha1+NgEMa7pGYudvQq0OfMs8nYw559Vga0ZpnkV1sFbYoqUzgAPumSjK
         ihmqRUZsv1qp8jQGWQWx9zY4RQEmUgnJieUrbtkKgTDcIDz6jRcA99uAhpuFUnhvQH
         agqgoDHACz+6ilkQLSKsJYto+mrklgH5qjKLXoDJdFSoNXXh23j8HANyIWZSJe7pyk
         ehRl90T890xww==
Received: from lab-vbox (unknown [10.205.146.58])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B14D3A00A8;
        Wed, 14 Apr 2021 02:13:11 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Tue, 13 Apr 2021 19:13:11 -0700
Date:   Tue, 13 Apr 2021 19:13:11 -0700
Message-Id: <f31348ba744318c83b3a9ab1eab75c61122b15ae.1618366071.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618366071.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: dwc3: Add disabling LPM for gadget
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add a new DT option to disable LPM for gadget and update the description
for usb2-lpm-disable related to host for clarity.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - New patch

 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 2247da77eac1..41416fbd92aa 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -87,13 +87,19 @@ properties:
     minItems: 1
 
   snps,usb2-lpm-disable:
-    description: Indicate if we don't want to enable USB2 HW LPM
+    description: Indicate if we don't want to enable USB2 HW LPM for host
+      mode.
     type: boolean
 
   snps,usb3_lpm_capable:
     description: Determines if platform is USB3 LPM capable
     type: boolean
 
+  snps,usb2-gadget-lpm-disable:
+    description: Indicate if we don't want to enable USB2 HW LPM for gadget
+      mode.
+    type: boolean
+
   snps,dis-start-transfer-quirk:
     description:
       When set, disable isoc START TRANSFER command failure SW work-around
-- 
2.28.0

