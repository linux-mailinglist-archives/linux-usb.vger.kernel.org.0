Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78B13D8694
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403835AbfJPDdu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:33:50 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46940 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403812AbfJPDdu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:33:50 -0400
Received: by mail-pg1-f193.google.com with SMTP id e15so5392318pgu.13
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fk56Pt1fGccXmKmQ/Jeo40yXUyiG0Au7sOVELWBpmSc=;
        b=i5842S39DyNZjUZRJPov05KdX7BzPpP2NUVj577HofBXaFkmDioGcqwLERfGPCtRSo
         HxrufDjWomrDtclywcgyQlD/y+bxJRLcjN9o9sAc0492h3Sqk9lgZvAl3G9PDq4gU/Hq
         T8lEnvqFyCrhZWZLbPGC3IBEqFDHD0vSeAJP6CJMI6TeFEXj9lHjQ1gMcXvUshJNlSbV
         hQlwzNfdpEc8o1zpF4j8MeUNFET0RjQc3rMX03QpqyJyDqQ3SaEPhKKI+dAYa8HCcRdh
         3kR7U+p+H01mWN3lCCwYydpOV9lAS3XXzH9hxXY97aQyeg0idEeovmkH84X+Db9lycVc
         albw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fk56Pt1fGccXmKmQ/Jeo40yXUyiG0Au7sOVELWBpmSc=;
        b=V0x3zrdD3kZls4qGqExuqBW9T5LSxmjzPqAqxpWz7r0U1LxLkurmTJOCfwu3hFBg60
         CQ0J/s/F/uSafi9SufIU43kkY8upIK1TjJaCBTdTmj2cyWvCtfk3pA9ENRGI00YHoKdf
         AqOM5QXLJPUVi+9eLAJrXnP0G93/vzZmboo4vELd8xkW33Pt3jBA49SubTZJFzBdnTWN
         zdplXI6h6/nYf6fi2QhYzLza7oKlAMhP0zek/N37pLjXA7lWsx29a0fceKmTbnGkgLtu
         0UKj3pHNIF/Yn1XOsQXxzwJodZmF4SuxlrIM7j236jd8ahdxXhRXQ4I7Io1MGilkOWSo
         0mHw==
X-Gm-Message-State: APjAAAVSkpDBalkWsLzQ5h8Egf7i6GBDrrXWFpa7iHOyxvtWpX4K4+4n
        zugZBwHIOs52qFdbiTao7JUQ9Q==
X-Google-Smtp-Source: APXvYqyDkJPdQQMUkmfGn1srI4a3vVQ3+fGtZ+xRSHgsO+5CqQbLMJGruDMef6xeBYAvO7XFUOWfqg==
X-Received: by 2002:aa7:8046:: with SMTP id y6mr42224599pfm.178.1571196829644;
        Tue, 15 Oct 2019 20:33:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:33:48 -0700 (PDT)
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
        Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [RFC][PATCH v3 04/11] dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
Date:   Wed, 16 Oct 2019 03:33:33 +0000
Message-Id: <20191016033340.1288-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
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
Cc: Jack Pham <jackp@codeaurora.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Suggested-by: Rob Herring <Rob.Herring@arm.com>
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

