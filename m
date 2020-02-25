Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63A2A16ED21
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 18:53:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731348AbgBYRxn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 12:53:43 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41533 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731067AbgBYRxn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 12:53:43 -0500
Received: by mail-pl1-f194.google.com with SMTP id t14so87471plr.8
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 09:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BvrsPeqWN8PtkcsNQt8nmKsbCOyaPIU6nwAu5WHHWq8=;
        b=qJIcjNpq7sNoGonrSyBwsUENY6YaoKkRyUf20hxq8GnBbV3M27SCu0TVozV1KzZdlM
         8VBOe1y43XOXOxUEvDB+W7bWNdMDQgS3/Tstdgx/URb7qasOfRM4L+T6OTFEUKIksSZb
         Y8095fEto0/TFnclle7yDkOmHXwf+D7G95FlABoJfmhlv/oRE2KYDjFdLynf90Mu57c0
         /03xXJeFOzwv383EhjYytugA4QmBO9KJmPRVnVqEKk0jGojepBVvWUzwxQNBe5usWNUa
         HMterUg597cX+SsY3MY78kRiB7g6NRJUlVW0sEtn+8DRWhN1mni7MzBb95i+SVj8eOBV
         nxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BvrsPeqWN8PtkcsNQt8nmKsbCOyaPIU6nwAu5WHHWq8=;
        b=n/GefvPNxJJgV58VCZpufZ0vVwxAMLFY1FRY3qgsUpr+6zK1uoGumOVNCnvCdgIkvz
         naPdN+s9/zHTpdvRerREMRWH6+fYA3PxPJrQPChCCEjMAqfvMl2QfiAh7O1Ck/9a2Wn1
         2/WHs041IghXRWgsYioeBPNFYHFkt7Y3xQGW3ttqY4S97q2JP3DHqVT8nu8nTn2UJWfW
         vAZvniJ4mzOqP92f1blhEEognx30exi2Gtj+6TuTEji+yVVLBMg/5OPBqrcAQjHiONVs
         GF800WQvcSBv0xKIns1wU4XH1syMljDK9dtbYHZe/YQg7nkBXcYHSDmbJXqrOjpFa1aq
         jcYQ==
X-Gm-Message-State: APjAAAXyO6x25mSV9urr7NZYPOromXsYO/gquc5JYe0H4loNEJvFai6X
        l/od3WHQYEcsdj6zrWi5hXN9YA==
X-Google-Smtp-Source: APXvYqyuKIgv1526C84JiSsSOclqQi0aMoZtQERj2XWo+5FnwHBWcbSGK4675peuZbzUFDL4AF5KFg==
X-Received: by 2002:a17:90a:9284:: with SMTP id n4mr123696pjo.69.1582653221195;
        Tue, 25 Feb 2020 09:53:41 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id v8sm18013291pgt.52.2020.02.25.09.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:53:40 -0800 (PST)
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
        Jack Pham <jackp@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v8 2/6] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Tue, 25 Feb 2020 17:53:00 +0000
Message-Id: <20200225175304.36406-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200225175304.36406-1-john.stultz@linaro.org>
References: <20200225175304.36406-1-john.stultz@linaro.org>
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
Cc: Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v5: Switch to string rather then a bool
---
 Documentation/devicetree/bindings/usb/generic.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic.txt b/Documentation/devicetree/bindings/usb/generic.txt
index e6790d2a4da9..67c51759a642 100644
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@ -35,6 +35,12 @@ Optional properties:
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

