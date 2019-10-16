Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06B28D86B5
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 05:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391065AbfJPDeq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 23:34:46 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34044 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403819AbfJPDd4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 23:33:56 -0400
Received: by mail-pl1-f194.google.com with SMTP id k7so10588084pll.1
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2keRpRTlNq//agdfEU+WzxjuweOfNeyW5raNbEYcYgw=;
        b=v2mpFWC0YeHuM2R8yAg/xDpZt4YlyYEVb2YKwXwoQsMjqhvV4fsR1Q+zHo3hChIz74
         MW6PS7z0+vutQPyCMifBfWFJu7BomzYe3pJZZNJX9fBPaYzen1Y83jxgqRXYBaS7U9H5
         scyF2ijATEZVAZbM+jVPL3xBacyxLHMqGCOE2s+vXhdWKMN15J0X1c+Sg2O7EyOWXzvH
         V52YtiHaU85DASd1pNaSNMJRInWisTGPtptGEwmH6o7Nnegid13neEpqqP3dKTUMjQnJ
         tvTz2rC2F9gEnOwqvQdfEPwBq0sMvAzaAjD+WU5GOr/0YMnusEvDyJFkLqPqltkOQGC4
         Vz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2keRpRTlNq//agdfEU+WzxjuweOfNeyW5raNbEYcYgw=;
        b=qEwisTvzRpfuXpGsO39/vhwfH6VWEvhUDbCHws+kA6ve420FEzNFxXn0d9y512tkpB
         0PWIQyXRiyBrsy3dT2QpbaXcnPHV+qdLgcaEegsizddA98N/21Kfqfs/144C7iiOVizi
         nFcOe1xdUssqHOZvds+EOsYteQHQdnHktf/zPYxnXFy5ElHJToFa2XO+a/HxabVbd1yk
         Id1S8WwMxYohtDp16140Z5IdcPZGiVVabDZJLtPbBfY4vZYzt8ntcaI4A3JgE5iEeC82
         +hsWI9b/SqV98pigmWmCLo/1M6PQQxnDxb3J1oXfE+uvUE9gQl+/cnWL5wiEhh+yxX49
         NYIA==
X-Gm-Message-State: APjAAAXS1G302eZylVymo/FDPg217wmKm/5+4qEWeqk8+1UGDpFr2XAY
        3TKixFz73+JKgi9SRDEsvCa9lg==
X-Google-Smtp-Source: APXvYqzHJcZTagsu+7PgWeGgCQGg5oFBlQy68utODPD6pCC+Bv83uRYHQVAk7xRaFQ4dZKLhn4gl5g==
X-Received: by 2002:a17:902:7891:: with SMTP id q17mr15072798pll.241.1571196835824;
        Tue, 15 Oct 2019 20:33:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l23sm748356pjy.12.2019.10.15.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 20:33:55 -0700 (PDT)
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
Subject: [RFC][PATCH v3 08/11] dt-bindings: usb: generic: Add role-switch-default-host binding
Date:   Wed, 16 Oct 2019 03:33:37 +0000
Message-Id: <20191016033340.1288-9-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191016033340.1288-1-john.stultz@linaro.org>
References: <20191016033340.1288-1-john.stultz@linaro.org>
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
 Documentation/devicetree/bindings/usb/generic.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index cf5a1ad456e6..013782fde293 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -34,6 +34,11 @@ Optional properties:
 			the USB data role (USB host or USB device) for a given
 			USB connector, such as Type-C, Type-B(micro).
 			see connector/usb-connector.txt.
+ - role-switch-default-host: boolean, indicating if usb-role-switch is enabled
+			the device default operation mode of controller while
+			usb role is USB_ROLE_NONE is host mode. If this is not
+			set or false, it will be assumed the default is device
+			mode.
 
 This is an attribute to a USB controller such as:
 
-- 
2.17.1

