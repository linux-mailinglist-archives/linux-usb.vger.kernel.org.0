Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5870A53D4EA
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 04:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350219AbiFDCsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jun 2022 22:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbiFDCsM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jun 2022 22:48:12 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D0D1E3EE;
        Fri,  3 Jun 2022 19:48:12 -0700 (PDT)
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F3D6B4022B;
        Sat,  4 Jun 2022 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1654310892; bh=xZvSInX2sjlaTumbQ9XqBq4EUsvUia+nprlzKxJFyaI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=R8dpE2rrnPXAGT3iPTNnbI9Axe2BJKIUWezERVetuZcb2WYxj6/Aw+8ZJpVHm6rMh
         wPFHXJ+Tg0YlSr2eDVPGHLxVu08KjCCkPUZ21qiIi+K4i7BoeybjEvp2AEi4Ctr9ez
         EROlYw0cOmKQy9EM5FSwAT+IK7DTpPIyagIVa+65qBzCvb0HP3F48LqXSr2xieXkNS
         /TRY8sdhQko6Ydy9XohqsBQEVkd9CGmz7myOZ/qIcmlFwyW9p8R9Bwd2QEYczaa1N+
         V7JOy1qL4B+3vaB9HAbHNpzn91Je9CvSaQuLsAPcTsnUy9WtnuslsAcGQwcUTrciCy
         CwIt+ynLDxxsw==
Received: from te-lab15 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1 with cipher AES128-SHA (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id F3D34A008D;
        Sat,  4 Jun 2022 02:48:08 +0000 (UTC)
Received: by te-lab15 (sSMTP sendmail emulation); Fri, 03 Jun 2022 19:48:08 -0700
Date:   Fri, 03 Jun 2022 19:48:08 -0700
Message-Id: <1ff0422b36c32c0b8b76f99333ac785f275edd4d.1654310542.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 1/4] dt-bindings: usb: usb-xhci: Add xhci-snps-quirks
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set this property to use xhci-snps extension to handle common Synopsys
DWC_usb3x host quirks.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
index 965f87fef702..540044a087a7 100644
--- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
@@ -29,6 +29,10 @@ properties:
     description: Interrupt moderation interval
     default: 5000
 
+  xhci-snps-quirks:
+    description: Handles common Synopsys DWC_usb3x host quirks
+    type: boolean
+
 additionalProperties: true
 
 examples:
-- 
2.28.0

