Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62AF23F94
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 19:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbfETR4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 13:56:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39574 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfETR4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 13:56:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id w22so7132432pgi.6
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4CUjhStx9Q1czDRNZdSf4vceu5KbZk+h2BQP0hsuERo=;
        b=MFNW8y7mNTo6N1VqA5T5Mo6RzW9jVYQYoQ6qYJl5we7NYdFnZFDyx0sLkY0ogXYLwn
         enWsfvygO1Z23KozLJnz0N3qWtFlricRqhBNrAnq4nJz3++GH7QK0Drjjj2wHUSWnds0
         fpeGcp4z76OpMh6bXOsowHGITGPi2pbzJqyJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4CUjhStx9Q1czDRNZdSf4vceu5KbZk+h2BQP0hsuERo=;
        b=ersvZkT+qlmJeoJycelmqLxxQ0g9vLVWgsPGoBdaW+vYPVkq4KWIJ6fY3yIjgPzslU
         BR55gctvhg0+kBKXXr+VuDkdk66xDPZ6Qob6xswphVBmdTOfQjLs5ZFugoSG+Sp9KZcr
         +ctwjhkk36Ak1+kW2s2kptXTmer6A+cFhZKFUY+hTm/3zvDBAw4Gc3usqT4czGpTBdB+
         waI7vLOxZksFHcejT3kZ0c+1XbYNMSUfuN3WMX38WrZtbJENf/0s2ZuCi41bn/MLqzkZ
         SAoYFa5Rwf6G/jxpQ2aH7grHvMWiLApb9DhJKutCwwmmOjp3x2XtujJEdS6TqILY0TS2
         X40w==
X-Gm-Message-State: APjAAAX47PGjPU5o006jl42v5QF+NT6Cu7xZ2g6eA832U/O9YKby5XPy
        CJ45lDc9kbEr2OsqnYWkIdLRIw==
X-Google-Smtp-Source: APXvYqx8PLoZmRIV8cyPnbkbGG132pIi5rrVAVnCDXIAjwYFv8VXCCCG4c1elHrOmzAQBdfYcMChEw==
X-Received: by 2002:a62:6341:: with SMTP id x62mr80813484pfb.63.1558374973618;
        Mon, 20 May 2019 10:56:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm16852723pgq.1.2019.05.20.10.56.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 10:56:12 -0700 (PDT)
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
        Elaine Zhang <zhangqing@rock-chips.com>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/3] Documentation: dt-bindings: Add snps,need-phy-for-wake for dwc2 USB
Date:   Mon, 20 May 2019 10:56:03 -0700
Message-Id: <20190520175605.2405-2-dianders@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190520175605.2405-1-dianders@chromium.org>
References: <20190520175605.2405-1-dianders@chromium.org>
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


Changes in v3: None
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

