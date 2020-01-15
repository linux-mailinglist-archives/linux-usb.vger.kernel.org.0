Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78FE313C568
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 15:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbgAOONV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 09:13:21 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37256 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729906AbgAOONS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 09:13:18 -0500
Received: by mail-wr1-f65.google.com with SMTP id w15so15917861wru.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2020 06:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gF+yz44vMJ5le2NhN1eZ4E9RGP+2ncQ5ItA3lX0YkyA=;
        b=RMySduxSj2RLG9DiAOewAYemoP8PXWaCRgvSqqESVYz74fGKJUbnGjWF6/BdK3zCyd
         JnoyscpVMZPWLxscUZjqaIC263MwwjZquN6Pprce5YlmXTDmuWEm2EYvRVB933oG/H0a
         BPStWeT0PHnI261lEJnzDnOUNuFkXUjkMfIHLfVqjSZ0U/jsf6bIcZniUXyBO9NrR/os
         W24OMz19OZRUdrwJqX+4BhgujGDnqYlrn0Pj7PjCUAOukI5DH3wSn1eBEIXOasNudIMF
         jI3AWzSHQfxhH5t0ym4z3yb7BmJgGlYxOfTwphKtrE6LHCkCzDOSammkrGBB2q1t/pX1
         NbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gF+yz44vMJ5le2NhN1eZ4E9RGP+2ncQ5ItA3lX0YkyA=;
        b=n8dmYZbQntvWqQzErHMO2hXMHow1ha+v8+LWqTPiHL9ULiYObL0EfmGc0plIh4ECNZ
         J77WJIQyJcfEvxjou59b6qxBGTDrEa7jDzncQK5yYZMy9/3PrTyJ3twHeQCogvV4S+Y9
         lL5gpkKubunHd4+uCovdfmLDR07e8/L6JIdoXyyisFmt8gQTCGeF/okQhRp7594D6KOm
         tJlUlmJuKFrIj5Ku+XTDOaCKf5a3THW7EhMidyXUYWKjWmLR8qsz6zO/vIFalmTcO2Nf
         B6vCZaUqDMADqKjlz4pFmu9rRrc4YD6NyEOWqKP16st8l9HFSlPf0Jb3v6tzg7rCSrEW
         5i0w==
X-Gm-Message-State: APjAAAXXnT0pOhfg+aQ6Ne0E7blmLYOAU9i9H+W1OE3cfQxZwo1oo+vh
        7cLZnRc3qzpXgDEnbYLHjpTfOA==
X-Google-Smtp-Source: APXvYqzME+YNMc53CFOKTlmJn7dYQTuWk4Ul5azId07DM48/4ZFGWfLtMFTrQ7trOW8LhSqCjI5Vsg==
X-Received: by 2002:a5d:6551:: with SMTP id z17mr33078918wrv.269.1579097596387;
        Wed, 15 Jan 2020 06:13:16 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:15 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 08/19] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Wed, 15 Jan 2020 14:13:22 +0000
Message-Id: <20200115141333.1222676-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: John Stultz <john.stultz@linaro.org>

Add binding to configure the default role the controller
assumes is host mode when the usb role is USB_ROLE_NONE.

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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/usb/generic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index cf5a1ad456e6..dd733fa81fad 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -34,6 +34,12 @@ Optional properties:
 			the USB data role (USB host or USB device) for a given
 			USB connector, such as Type-C, Type-B(micro).
 			see connector/usb-connector.txt.
+ - role-switch-default-mode: indicating if usb-role-switch is enabled, the
+			device default operation mode of controller while usb
+			role is USB_ROLE_NONE. Valid arguments are "host" and
+			"peripheral". Defaults to "peripheral" if not
+			specified.
+
 
 This is an attribute to a USB controller such as:
 
-- 
2.24.0

