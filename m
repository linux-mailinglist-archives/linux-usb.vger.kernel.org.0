Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13A22FC701
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 02:44:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbhATBna (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 20:43:30 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47280 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728591AbhATBhN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 20:37:13 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 376E0C00AD;
        Wed, 20 Jan 2021 01:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1611106570; bh=puVvPDC3uOYOQl6YSaOtQhB4hXZ/OPxDOYyjlaafVyo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=lIXlvmBGXCI0CZqNVQaesHCXA9xUmDt4oralNmn5Y1z41UEvM0j9NMc6ADO1YMnC+
         lbwAQe7HexGSJTJyvxCcWgSjBQJI1r0do88UA0+E3SUzSCuwn9upfKz5ZvHwPPiL5L
         UNvKQpKCSN5tKvpIMCyLRUWTZAGxS99mstAcxG/e+LJC08EuURW1P67gOofnYqSO/c
         CdMgasPyRcrldo9wfbykzNdBNRNITMEVUumWMojUG19GWazzPgr9GhjwS8afb1qGi6
         +fP9t5XiZmrEGvoyK98UU8e/123Y6xkHTtr7R137f5DJ8qkicmRLqKPzo7dIjQ2cI9
         Yt4k8+EcrxiXw==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 94186A0251;
        Wed, 20 Jan 2021 01:36:08 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 19 Jan 2021 17:36:08 -0800
Date:   Tue, 19 Jan 2021 17:36:08 -0800
Message-Id: <cc7cc15f87e209c9963f19129f51398cdc374358.1611106162.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v7 1/6] dt-binding: usb: Include USB SSP rates in GenXxY
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the USB 3.2 spec, a SuperSpeed Plus device can operate at
gen2x2, gen2x1, or gen1x2. If the USB controller device supports
multiple lanes at different transfer rates, the user can specify the HW
capability via these new speed strings:

"super-speed-plus-gen2x2"
"super-speed-plus-gen2x1"
"super-speed-plus-gen1x2"

If the argument is simply "super-speed-plus", USB controllers should
default to their maximum transfer rate and number of lanes.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v7:
- Rebase on Greg's usb-testing branch
Changes in v6:
- Update the different maximum_speed enums to the usb.yaml
- Remove Reviewed-by: Rob Herring <robh@kernel.org> because the commit is updated
- Rebase on Greg's usb-testing branch
- Update commit message
Changes in v5:
- Add Reviewed-by: Rob Herring <robh@kernel.org>
- Rebase on Felipe's testing/next branch
- Changed Signed-off-by email to match From: email header
Changes in v4:
- None
Changes in v3:
- Use "maximum-speed" to include both the num-lane and transfer rate for SSP
- Remove "num-lanes" and "lane-speed-mantissa-gbps" properties
Changes in v2:
- Make "num-lanes" and "lane-speed-mantissa-gbps" common USB properties

 Documentation/devicetree/bindings/usb/usb.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
index ebe7f4275c59..78491e66ed24 100644
--- a/Documentation/devicetree/bindings/usb/usb.yaml
+++ b/Documentation/devicetree/bindings/usb/usb.yaml
@@ -54,6 +54,9 @@ properties:
       - high-speed
       - super-speed
       - super-speed-plus
+      - super-speed-plus-gen2x1
+      - super-speed-plus-gen1x2
+      - super-speed-plus-gen2x2
 
 additionalProperties: true
 
-- 
2.28.0

