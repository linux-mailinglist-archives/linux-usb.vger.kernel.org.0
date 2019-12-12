Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBAD11C277
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 02:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727604AbfLLBmj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 20:42:39 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:37217 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727580AbfLLBmi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 20:42:38 -0500
Received: by mail-pg1-f196.google.com with SMTP id q127so281808pga.4
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 17:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X9Kc7R9+KeUY27tDEV+sMDYPQg0vMU8CdEEpsw9B7eY=;
        b=V0PrWbfKF6yh5jnUesdINqEzgHzMsX3X/h8mQRQt7abSsm8BD1zIM3mTyuJAm4y3kP
         fjCqZ+MT657YUqC5fFq+USYJQkg/nwLbiZzbLc1ZZ/+AH1ZY2o/P7I/ogmVWFT2eoKVD
         VvmvB8Nw8+/gE6DnMtNB+4sghteYtNdFYbeM6Q+B1VJiUIlyNXEbJbs1yHD/dUMged95
         pH+vBbrBuz/G5kKvVuB1H/0Z3wWaXELPX8OJC9XBveAInCMPrFPLT1Ygauyjsf5HBtMl
         4jvvIt4F9HQcgkLnmCLBWh5/bnO15j/5DUAR1SOnmrY3lzfgR/SF7SyOLeNBzoM7XasI
         kbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X9Kc7R9+KeUY27tDEV+sMDYPQg0vMU8CdEEpsw9B7eY=;
        b=RmPhbFS1eX9+X0r6yUYR7jKIcO3+IZELHxTLBmAkyrBuws8J+AFanzV0ZQQePLkSaD
         F/eTxoE2MAQGuGXDyhh6CoJzfx38mPziNTvk6/FkCGdFjWw/lMDyMhzpAqBO9p2+eFX9
         yjPv5u5rnDzjwe+aQCJUbbWk55G27uHvY07lw4yMJp0TPyCAu7pcRGB3SVVrwpbd/fyJ
         M+pZX/qAqv5gCltD+pnixhbAd2Iw1sxq6OL9TFalOaddZYrNLa27/u95FHRk/hxZ5HHT
         Z3xYMKuTpzY/zyKXtZm0PQwHVIMRMhZJG18ZNdPXnOBstl8x71jFK7QsuMOlsBNaK2JQ
         kjSQ==
X-Gm-Message-State: APjAAAXoJK1lLSw+qpCJ/s1RM6K1SSSnY+k46qj+M4v2BUBhRiqnHCrx
        2VLoMN0hL982t8QovtMZp4D2qQ==
X-Google-Smtp-Source: APXvYqy0BVmYHRBfzJOVdXEzf35ykOhMUK6HJkBTVjdR49V2P5zoAJ4NwvOkopcghcK3+EabZw/nPQ==
X-Received: by 2002:a62:f842:: with SMTP id c2mr7196663pfm.104.1576114958243;
        Wed, 11 Dec 2019 17:42:38 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id p16sm4217996pgi.50.2019.12.11.17.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 17:42:37 -0800 (PST)
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
Subject: [PATCH v7 2/8] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Thu, 12 Dec 2019 01:42:27 +0000
Message-Id: <20191212014233.32799-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212014233.32799-1-john.stultz@linaro.org>
References: <20191212014233.32799-1-john.stultz@linaro.org>
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

