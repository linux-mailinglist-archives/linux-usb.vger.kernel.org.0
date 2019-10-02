Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44085C94BB
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 01:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbfJBXQh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 19:16:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41863 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbfJBXQZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 19:16:25 -0400
Received: by mail-pl1-f196.google.com with SMTP id t10so560466plr.8
        for <linux-usb@vger.kernel.org>; Wed, 02 Oct 2019 16:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rU3ZIe1wEyPAlyBuDaaRw79vpye8Qn/RpKU+olhtNWc=;
        b=yUio+wwG5BWebxxhvpw7haRUyEyivo6OPVbEi3XIn0sz8A+fsfgZW/IZSGk9ec0w4f
         k4ZlnzlypckTUxWu2hXxCWjxs8vw7UXlr95Mwpk0gklCavpWrE2yLme/muin40Hf1x9J
         ZtzTL/CsWMQoKLjUj4m/nIAlZgEjN2F9K2zALdSWKf4ca4eIshDHFjyScWISkS9ezCL6
         xakFfbbDqt6ZTYKTEyt6iPYey0xWjdaWccEK8xBkX2tPDAq9m0/MdlVA+9kVeTC+Vabd
         9hM4hLA32mrfL5Y1epXeavibzLHX300cNBtFli9v8J5PuuZWcPHBHLt/wi68gP7/DDEz
         DmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rU3ZIe1wEyPAlyBuDaaRw79vpye8Qn/RpKU+olhtNWc=;
        b=KOQaFDWM0skK2jCfJIOYM/IQ3PhzmyV9pUsi7yIzr69kx+fRoB9TutN1v6SenvdACl
         Z114fziSJUMzdSe9QjO4vezMUPerqSkGuIrJNIW5Gy91Tu2JvHynJL0cFss0ZFkVh+pY
         UcKjBcDisLiC/aEm4PcOVo2F4/0mZ9hloC8b3U4soko3AeURm+OhUWZ2gRvq8zwIRUnX
         4uBRcwj/YlwB4iqE3LAJoOs/y4EziEfvO+u6jA6N/PE/4prfAiG8wBi3HGSyQ8Iyio8Y
         7uY/POQnMRDGgJ426hzldFPSXf++HcVVVr92qsEgTar8hkS/YD9I2zDaPhoi/yuXCejS
         qhoA==
X-Gm-Message-State: APjAAAVGIdzu7PifuH/c2/JZZwVU7EujQRdjgZnFhMYLloVXtMOB9wGW
        Bq4J0VrGjwoPdv8RQ+TSJODJ8w==
X-Google-Smtp-Source: APXvYqwcoB4Ky8kF2Dkr6DmmT3lpgIWscDqSSRfTpsmolukj/DFBnWE3VjYEeGe1NHexI2kCdvgjsw==
X-Received: by 2002:a17:902:ff08:: with SMTP id f8mr6340368plj.309.1570058183692;
        Wed, 02 Oct 2019 16:16:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id l7sm288791pjy.12.2019.10.02.16.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 16:16:22 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC][PATCH 1/3] dt-bindings: usb: generic: Add role-switch-default-host binding
Date:   Wed,  2 Oct 2019 23:16:15 +0000
Message-Id: <20191002231617.3670-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191002231617.3670-1-john.stultz@linaro.org>
References: <20191002231617.3670-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add binding to configure the default role the controller
assumes is host mode when the usb role is USB_ROLE_NONE.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: Valentin Schneider <valentin.schneider@arm.com>
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

