Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75405277E17
	for <lists+linux-usb@lfdr.de>; Fri, 25 Sep 2020 04:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbgIYCmW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Sep 2020 22:42:22 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:50874 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726764AbgIYCmV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Sep 2020 22:42:21 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F8FB408D3;
        Fri, 25 Sep 2020 02:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1601001741; bh=9j9IOKYQ+2iz0WIvVdK47pVCx84Ln+dxrwyZJRqySVo=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kANvUlerY5g2/SX2sECo+zhu2+JGOmKmHHNLux27ibSD3jLi/5qM+JGPnZDzuscXJ
         1sO6HFnpwddPHPTbnHhXblPwn9MVeKm5vjpqDYHruOwTDzyBv34sKZjDQxMBl+BiRo
         cyCdPH3SmY7vAGBUTvKKOy83+77Qq2PPDop5EzZ/tfyIQC1DaOg/avhORkARkOOSrj
         jlf3V5nARDi07dX4LlaHX9btAa/X1nJiAborY+0K2n6s8gumLdi2nPkqeQfpTV10VA
         JdoMGh7B7l8+y+M9x3OXP36+DMki/kWwFQ7mLQw7VvbUFw5HHgmB6UENxd4675o0DT
         NxJhJ2+YrTQ3Q==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 576E7A01F1;
        Fri, 25 Sep 2020 02:42:20 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 24 Sep 2020 19:42:20 -0700
Date:   Thu, 24 Sep 2020 19:42:20 -0700
Message-Id: <675520b99f9648e8d4f08dd389b1d93c580ffabd.1601001199.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
References: <cover.1601001199.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v5 06/12] usb: devicetree: Include USB SSP Gen X x Y
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the USB 3.2 spec, a super-speed-plus device can operate at
gen2x2, gen2x1, or gen1x2. If the USB controller device supports
multiple lanes at different transfer rates, the user can specify the HW
capability via these new speed strings:

"super-speed-plus-gen2x2"
"super-speed-plus-gen2x1"
"super-speed-plus-gen1x2"

If the argument is simply "super-speed-plus", USB controllers should
default to their maximum transfer rate and number of lanes.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
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

 Documentation/devicetree/bindings/usb/generic.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index ba472e7aefc9..8541b9571f2f 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -3,10 +3,13 @@ Generic USB Properties
 Optional properties:
  - maximum-speed: tells USB controllers we want to work up to a certain
 			speed. Valid arguments are "super-speed-plus",
-			"super-speed", "high-speed", "full-speed" and
-			"low-speed". In case this isn't passed via DT, USB
-			controllers should default to their maximum HW
-			capability.
+			"super-speed-plus-gen2x2", "super-speed-plus-gen2x1",
+			"super-speed-plus-gen1x2", "super-speed", "high-speed",
+			"full-speed" and "low-speed". In case this isn't passed
+			via DT, USB controllers should default to their maximum
+			HW capability. Similarly, if the argument is
+			"super-speed-plus", USB controllers should default to
+			their maximum transfer rate and number of lanes.
  - dr_mode: tells Dual-Role USB controllers that we want to work on a
 			particular mode. Valid arguments are "host",
 			"peripheral" and "otg". In case this attribute isn't
-- 
2.28.0

