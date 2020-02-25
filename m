Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A5E16ED28
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 18:54:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731370AbgBYRx7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 12:53:59 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39539 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730834AbgBYRx6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 12:53:58 -0500
Received: by mail-pj1-f67.google.com with SMTP id e9so16221pjr.4
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 09:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jz3XZ9gPuD/g+1P6LY7Aq8wTOFKwQIrTyqi7Mx3AGIU=;
        b=lwkPosxwVHqNL5aijGc3VaCBSOXdBybtaEjZmFJj4LRQBc1cqJt17DPUHecWz7PfVI
         hrJucelVYpu3RNZKaaJtVsLaapcJgfF2RefqH7NetZv296lTcKDVuY2vWXMxsbzPIc/p
         FLwAkCyBx7W5nD2LDHW1DhzMp0RsUJtGxuTXQHgSw3r4hINvWge1vrAKod17Xc2+yrtQ
         pgKL8VpdpBgS8CGcvqEesteDbeyt5fqBJfyuKV9ZSlofhecFeoO98snsQ7JLh7m/WGTN
         xWO5PssZiu5agAlIKGQ98OUFjxR8qLWrq4dWCDWECc2NR6WxB1OhpBTR3DZT5T78QEJb
         ux7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jz3XZ9gPuD/g+1P6LY7Aq8wTOFKwQIrTyqi7Mx3AGIU=;
        b=lw1KFC9BcCZjC/YG/xZgy1pvB44FnCjXrCeZOmFvLGtrVTPJNBuMbZp9gKgSaxnvJv
         4UpGpJT8iAXrk6wbBue0ah+3RAANYGkgstwUlPlV6mwf1HR2onZ/xX/Kc0Kzr6AIANVk
         8SzV7byYIT1PH+UM95XoltabnsGkUiSFqk1QRmyp/ginjpIc+opHNbkCR6Z3nNIe/Ukq
         At4QKfzIf8WaY76RKchVRFqssKrPv600ZMW5mMKjW54npdwhbYOWSj77XVdu8GRf0kqH
         V5FXVvZia+XYIWkK4dttigGGHPemcwZJRgnBbRO7JL4rv7A/tPlNCvoFBhSu1R6CkzkN
         2fvA==
X-Gm-Message-State: APjAAAVIqCBIZ4o2wvfqHAMBbNucCLfLZ4fCig2zD2CSHFhYGxfvwH8k
        j0IB+r+c42uSOEEUFQioFK+OOw==
X-Google-Smtp-Source: APXvYqx9tINDep9zfUWEUUEMxu2YZzjpfKET0phziXq5UW9ojBW7/2GMgqVX/Yt4bAQq8H6W+ZvGFw==
X-Received: by 2002:a17:90a:ff15:: with SMTP id ce21mr155938pjb.124.1582653237674;
        Tue, 25 Feb 2020 09:53:57 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v8sm18013291pgt.52.2020.02.25.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:53:57 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v8 4/6] dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
Date:   Tue, 25 Feb 2020 17:53:02 +0000
Message-Id: <20200225175304.36406-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225175304.36406-1-john.stultz@linaro.org>
References: <20200225175304.36406-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rather then adding another device specific binding to support
hikey960, Rob Herring suggested we expand the current dwc3
binding to allow for variable numbers of clocks and resets.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
CC: ShuFan Lee <shufan_lee@richtek.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..29768b0ca923 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -7,7 +7,8 @@ Required properties:
  - compatible: must be "snps,dwc3"
  - reg : Address and length of the register set for the device
  - interrupts: Interrupts used by the dwc3 controller.
- - clock-names: should contain "ref", "bus_early", "suspend"
+ - clock-names: list of clock names. Ideally should be "ref",
+                "bus_early", "suspend" but may be less or more.
  - clocks: list of phandle and clock specifier pairs corresponding to
            entries in the clock-names property.
 
@@ -36,7 +37,7 @@ Optional properties:
  - phys: from the *Generic PHY* bindings
  - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
 	or "usb3-phy".
- - resets: a single pair of phandle and reset specifier
+ - resets: set of phandle and reset specifier pairs
  - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
  - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
  - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
-- 
2.17.1

