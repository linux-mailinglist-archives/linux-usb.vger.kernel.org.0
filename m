Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F804E7BED
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2019 22:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390302AbfJ1V73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Oct 2019 17:59:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35268 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390276AbfJ1V73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Oct 2019 17:59:29 -0400
Received: by mail-pf1-f195.google.com with SMTP id d13so6833698pfq.2
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2019 14:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0d8c9xxXfq9azaoIMnpd7T7O6Htbc+6dqNsLBH6goLs=;
        b=OooiMpJlnthfCoHkNbKk5+ZkhnJ4zgwcMFUsDAdDdjsrni+Ym/oIzxMeoxGTl3a3Ma
         pj0Kyj2In07BwtHsqyedhyDIRyzCFk8VWca0Obw0bNYJee8KpxoiSfVZn9h/lVDEimRR
         5Q7G8PZYX9o9NcyIuCmaj57UB8KFcVl0IMa/vqB9XHsr6tObAeq8UoChUCRlr0A+tg+y
         FDiVVTyCiU7MPfSums1k96+5GW/yFF3TomG9NIwun5QiuwETMTfBqMgs5F+ynDLBgAis
         N6Yvgsv0rfanq46H8AWZ5R45RtHTXclUhZzTB9Vxgy8K7aSh8KBxgHcQ7X1TH0E3GqOh
         ZeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0d8c9xxXfq9azaoIMnpd7T7O6Htbc+6dqNsLBH6goLs=;
        b=uH6NQtUm2gakLf6PI+gAJbC/YA3g/tZN5qjyPPqVOHdJ9uq8jTsGqo7DLMrkDyxbGy
         XbL2Bira1bpIlMB9CBhN8KtAmz+eGZUaDF6jM2THOBi/vcYTyE0Km1Tfwkn28XYAZ7id
         ANZPbpTmNpdZHOeMQLij347/bBRbDRuIibQ+uV0zSKsEeZcU16QlacAjergxY12IjF6A
         2bo24vV17560Fg8+RCcVwEHefD9r6gkOe+cn9wfh8xH1RSCooguOCqeJaAoq6LZYhGDl
         PLuuUnJ/+c0FagTBuRBA2ZJdppwPNeAxEQQKqFud/yc5mK29YZsf/8v+gWcVtTxCYJoq
         Uhkg==
X-Gm-Message-State: APjAAAXyZ78MCezjTuG+Z04hNvs1iRPgxorMnfKRcgnwcHzNb3YfVju6
        2Krsp6KdyTUZVVHa4vO/lrxmnA==
X-Google-Smtp-Source: APXvYqxETt1r4GGA30YA4LQzxZEzUJ5jkilalooGWqJqTN8Hrs56L/j9noamumHZ8snA1JUFcFgYqA==
X-Received: by 2002:a17:90a:8d82:: with SMTP id d2mr1932147pjo.31.1572299968324;
        Mon, 28 Oct 2019 14:59:28 -0700 (PDT)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id f12sm10880612pfn.152.2019.10.28.14.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:59:27 -0700 (PDT)
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
Subject: [PATCH v4 4/9] dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
Date:   Mon, 28 Oct 2019 21:59:14 +0000
Message-Id: <20191028215919.83697-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028215919.83697-1-john.stultz@linaro.org>
References: <20191028215919.83697-1-john.stultz@linaro.org>
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

