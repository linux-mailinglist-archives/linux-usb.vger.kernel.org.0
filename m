Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ECED11C28B
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 02:44:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727631AbfLLBnL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 20:43:11 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:33998 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727626AbfLLBml (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 20:42:41 -0500
Received: by mail-pj1-f66.google.com with SMTP id j11so328555pjs.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 17:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jz3XZ9gPuD/g+1P6LY7Aq8wTOFKwQIrTyqi7Mx3AGIU=;
        b=ADWf++LNikL2sGcTcPh38acVlVtjYE212k4TEnvD+Rlztp08dFU+PiVdolU95yghh6
         if+zoAeLlhz35y8sJOpcVWTpgCkbiTRdT7UVFZ8NunPzp3KQLHiuLU72mrPDlXlgSFzF
         Qg76tZUqRmSr54W87h1n0CZgA6NFZHf0PBE/vqGlb5jKzdYrpuWrOVyOJEBBJG/+wKbG
         AjkTYbw+imyPgYY5IOoJieUH9yT/QpO6cub+CG/cQiNynfS9eC9OgqL54UdE51EvzMYi
         I1BjdPjZYGckxWevF0rkr1EtzpTBv6ZZjAcidkSpzf8uiRC9c/6TSiuLBHGL6on42fkM
         pptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jz3XZ9gPuD/g+1P6LY7Aq8wTOFKwQIrTyqi7Mx3AGIU=;
        b=fgwUuTu6JqBd01pRtoLdO0inGik9dVgrD3sJBM6aHOZyEt33XIsJ6hDxI69v0t8RzY
         5SG/6LIMUX7hrEuOL/AuE/lJcSOQkfeCotDEW+tw/UqVaQDpDHCxsgj3emTeil1TVsca
         yMGqJxL4p5uPY0QN3F+kH4BCyI+BkalBcmryVcYNKX3NcxEKj3HS6dsUZKodfFvAxmDX
         jlb9JHbsyG4fygLXiKAgsATxlrflS3DdrqVGwroe4KE8x8PJUT155Az7lh4NVJJJjUFL
         guj8IQQ2ZhDsh6x3cmBJviyE5Q7TEo5r7k08ZPh48gNet5SVd2yZpzcuFeuleUzBDrJY
         ssnw==
X-Gm-Message-State: APjAAAWX0PpeZM11HPeOWbTqeMNfwoXED+R1A8O8xsx2IVdaeCObbkUD
        OhGqAURPYxgjvaK5IRZN0qp50C5sKGM=
X-Google-Smtp-Source: APXvYqz745Iom7BCnhPJbNjWnLV0N315h5uwmC47BUMzZV6zx6EdHy7BP/H0GGZcWSHDGlWW5rf7jA==
X-Received: by 2002:a17:902:8608:: with SMTP id f8mr6851979plo.106.1576114960549;
        Wed, 11 Dec 2019 17:42:40 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:39 -0800 (PST)
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
Subject: [PATCH v7 4/8] dt-bindings: usb: dwc3: Allow clock list & resets to be more flexible
Date:   Thu, 12 Dec 2019 01:42:29 +0000
Message-Id: <20191212014233.32799-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
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

