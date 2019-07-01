Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 600F5210CA
	for <lists+linux-usb@lfdr.de>; Fri, 17 May 2019 01:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfEPXAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 19:00:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34754 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfEPXAD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 May 2019 19:00:03 -0400
Received: by mail-pf1-f193.google.com with SMTP id n19so2626179pfa.1
        for <linux-usb@vger.kernel.org>; Thu, 16 May 2019 16:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3AN0TJJxN8MtDzX5Iph5PzGAe+8Uoxx6FUdLGJx7ICE=;
        b=nSXc80/CuM7wCAu9eEfz822i+s8PDxGqnuq6ulYoRqo35+23kjL0xS8NheIX44Zraw
         rHeSNCKU0+k3HLIVvspnPamHZXfPlhP82YCNxizzRQz7yxOpi1XwunB/0QNgM7KA2Ksa
         aJRD7udcbWEk0s+aQzZft/R2d52644y+TzVDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3AN0TJJxN8MtDzX5Iph5PzGAe+8Uoxx6FUdLGJx7ICE=;
        b=LuuoQDCe0AWm4cTZiUmOgiECXOvvjYiTlNBzTeyjvZ3yeI4P8YJ4oO3/Wy41KxVevR
         sNhDy4IN+JgNJyaALSju5d0ccTtF3v/tUj5UARRWviNvYFhWMwUa7Kd5Vdh7WoBBPDbt
         /BbwQXMwPQD41uNTnWPsSyJkBLChV4fhPHe7BzNIWuD6PFeFWj9Ar7IdKeO76q6FBRxd
         m7PawiG4FBIy3BnAMenB+l/wBvwRmEj8lfCDcdhOWe8ARyBIJ+UnuZYu17wG2WZvaHWH
         MyRJc5ZUpCv664u27MdeXZ7SAZwIsOS8XHEjNov85SA1dqMTRUtAhiTBoYUskeI1mEsF
         zklA==
X-Gm-Message-State: APjAAAUocbHfVPaMLCQgQjkL+sx9N0EHYSrLtx+4SQFGqJcA7k06pFGK
        QGTsIl1G2vS+xphaae2LEeSOL9thlxM=
X-Google-Smtp-Source: APXvYqylgevqrKIDD/mmUDsN1EbCBsMcMGLJn9tGRUV9ROjY5j75gDluyLf/UhG80yxA5Tcwvvm4cQ==
X-Received: by 2002:a62:4d03:: with SMTP id a3mr58452313pfb.2.1558047600933;
        Thu, 16 May 2019 16:00:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id j64sm1769506pfb.126.2019.05.16.15.59.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 16:00:00 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>, heiko@sntech.de
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        amstan@chromium.org, linux-rockchip@lists.infradead.org,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, zyw@rock-chips.com,
        mka@chromium.org, ryandcase@chromium.org,
        Amelie Delaunay <amelie.delaunay@st.com>, jwerner@chromium.org,
        dinguyen@opensource.altera.com,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [REPOST PATCH v2 1/3] Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
Date:   Thu, 16 May 2019 15:59:39 -0700
Message-Id: <20190516225941.170355-2-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190516225941.170355-1-dianders@chromium.org>
References: <20190516225941.170355-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some SoCs with a dwc2 USB controller may need to keep the PHY on to
support remote wakeup.  Allow specifying this as a device tree
property.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
For relevant prior discussion on this patch, see:

https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org

I didn't make any changes from the prior version since I never found
out what Rob thought of my previous arguments.  If folks want a
change, perhaps they could choose from these options:

1. Assume that all dwc2 hosts would like to keep their PHY on for
   suspend if there's a USB wakeup enabled, thus we totally drop this
   binding.  This doesn't seem super great to me since I'd bet that
   many devices that use dwc2 weren't designed for USB wakeup (they
   may not keep enough clocks or rails on) so we might be wasting
   power for nothing.
2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
   it more obvious that this property is intended both to document
   that wakeup from suspend is possible and that we need the PHY for
   said wakeup.
3. Rename this property to "snps,can-wakeup-from-suspend" and assume
   it's implicit that if we can wakeup from suspend that we need to
   keep the PHY on.  If/when someone shows that a device exists using
   dwc2 where we can wakeup from suspend without the PHY they can add
   a new property.

NOTE FOR REPOST:
- In v2 Rob said [1] he'd prefer something based on the SoC
  compatibility string, but that doesn't work because not all boards
  will have the regulator setup / board design / suspend logic
  necessary to make this work.

[1] https://lkml.kernel.org/r/20190430012328.GA25660@bogus


Changes in v2: None

 Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 49eac0dc86b0..aafff3a6904d 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -42,6 +42,8 @@ Refer to phy/phy-bindings.txt for generic phy consumer properties
 - g-rx-fifo-size: size of rx fifo size in gadget mode.
 - g-np-tx-fifo-size: size of non-periodic tx fifo size in gadget mode.
 - g-tx-fifo-size: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
+- snps,need-phy-for-wake: If present indicates that the phy needs to be left
+                          on for remote wakeup during suspend.
 - snps,reset-phy-on-wake: If present indicates that we need to reset the PHY when
                           we detect a wakeup.  This is due to a hardware errata.
 
@@ -58,4 +60,5 @@ Example:
 		clock-names = "otg";
 		phys = <&usbphy>;
 		phy-names = "usb2-phy";
+		snps,need-phy-for-wake;
         };
-- 
2.21.0.1020.gf2820cf01a-goog

