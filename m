Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECC2BF3D52
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2019 02:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfKHBRa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Nov 2019 20:17:30 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42241 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbfKHBRa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Nov 2019 20:17:30 -0500
Received: by mail-pl1-f193.google.com with SMTP id j12so2852556plt.9
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2019 17:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LLXZrZ84x0Pyw/nld9adeknAuwlBiKPfBfqjo8+Ifgo=;
        b=u/JvJWNtCX0x9O+sSjvMa/QWd8kyTLghXlBUPWCupQcRCLT+i3CCELlTUCl24eIxb5
         zA/Pz9hWhV9GWJrulx67Xr59HQk32CVEqgT/eaRosc79Z3ycVrHIlbOvcFDSqfds/JnK
         6Uj4VLci3lcaQ/cn4WkmbVndipKWjYnelFlhJtAh0IKamhRF1hkS0OeElXESfWmKqYFi
         oXo+/V0PdT6sOAfet/xjOUDfhbjWHflFooe0WhgiY4NqAsnaXE51DgIQ7D57AltUmhD2
         yFT/0Jtdudw3tuIeNGwAy/fPpGhRhQSWNqziPBMnVBUbEr3VRp+H6wiITyKQork4q4f/
         5ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LLXZrZ84x0Pyw/nld9adeknAuwlBiKPfBfqjo8+Ifgo=;
        b=fhOGR65m40Fhx4rgt0EqeX+4j/rstmjaOq6Ef/LR3Zvz253ij3oHFlgvSOSVEcxWN8
         IOAFNBB3dfzfi1AbcBfGFQEFGHhcSaiEcF2lon9gkBQPyt6axbkJmGGCt1s7DwugZIL1
         a0dfswNYLYo23zVjd9/dM8z3nOz0XSBelJbAEnMhPNyDPfq15uuNVm+0WZmRUW6KFvDL
         H5MTyLOLp9xo8uXb+y0rIHhs7gAOclWuImIP0Pv6LNS55MQlRch6Jfc0YzSg7e3b4ymW
         pqArOAWxQPZlSkG88G+kKgnu+zgbcglOXI6YpKDwENh0DGu7iFFeNNRxt0tBwds13x/Z
         bdiQ==
X-Gm-Message-State: APjAAAW96MJ6yEYQN2/IqVTj5H8fo5YprhbmW+HlQbAQDe9DKveG7/ds
        PZefv340iSgKCIXWPGOSafjImg==
X-Google-Smtp-Source: APXvYqwS5DMlcFIk+38hkbxym79JhkVpzW7JM1wV8qZd6lco9HB/8rFAXIE8J/Oq0TJUCqk28jNfIQ==
X-Received: by 2002:a17:902:6946:: with SMTP id k6mr7463711plt.60.1573175849449;
        Thu, 07 Nov 2019 17:17:29 -0800 (PST)
Received: from localhost.localdomain (c-67-170-172-113.hsd1.or.comcast.net. [67.170.172.113])
        by smtp.gmail.com with ESMTPSA id s23sm3801627pgh.21.2019.11.07.17.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 17:17:28 -0800 (PST)
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
Subject: [PATCH v5 2/3] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Fri,  8 Nov 2019 01:17:22 +0000
Message-Id: <20191108011723.32390-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108011723.32390-1-john.stultz@linaro.org>
References: <20191108011723.32390-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v5: Switch to string rather then a bool
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
2.17.1

