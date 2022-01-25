Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B9449B886
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jan 2022 17:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242464AbiAYQXD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jan 2022 11:23:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:47138 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1583465AbiAYQSj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jan 2022 11:18:39 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E0E22B81737;
        Tue, 25 Jan 2022 16:18:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0074C340E0;
        Tue, 25 Jan 2022 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643127510;
        bh=RclnUdWYXZYBackLuNulVETwidezdXIJdtI4dXHKaRg=;
        h=From:To:Cc:Subject:Date:From;
        b=nn+FYi+dxpTXsOslHHO1B1bjJ1B0JTUQI6zvYsgYEcZp6QRK2MutXDqxHTi5AStfW
         AObbqV/Hno0owGpeD+yEpTGBD1g0llZXdrHasBJVzOShCysQJ/IXxnSPuYSMg7EdGQ
         pakGDZ1BAOWGn0FABtRJHF4uN+YyldKRCd1BZBlrd5QeRYYIhrgK5xun0NiWdzx7vP
         DfvxVsMgEdscx8ZR+0XrTbEcWYN6DMuiNZ0qiENBS0fKYvaAH/q8hzeeQcV6QGO4BZ
         K8fyspxF6ofTYE8a8wwtII1f/sZRocN0NOdlC0ynnhl1ybbc9oIHCC6IPjMeRY3tld
         sZ/r0Dc/Xfp1A==
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     hminas@synopsys.com
Cc:     dinguyen@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: usb: dwc2: add compatible "intel,socfpga-agilex-hsotg"
Date:   Tue, 25 Jan 2022 10:18:19 -0600
Message-Id: <20220125161821.1951906-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the compatible "intel,socfpga-agilex-hsotg" to the DWC2
implementation, because the Agilex DWC2 implementation does not support
clock gating.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index f00867ebc147..481aaa09f3f2 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -53,6 +53,7 @@ properties:
           - const: st,stm32mp15-hsotg
           - const: snps,dwc2
       - const: samsung,s3c6400-hsotg
+      - const: intel,socfpga-agilex-hsotg
 
   reg:
     maxItems: 1
-- 
2.25.1

