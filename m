Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5BF142FE9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 17:32:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729469AbgATQa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 11:30:58 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37491 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729456AbgATQa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jan 2020 11:30:58 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so224279wmf.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2020 08:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sJ/NH1WxmyLs0OgxjuKXd3vxc/cRe0agzDtoq0wTKtI=;
        b=SheK0Ni4WUq897UiNO2yoZ2iQrpydQoRHL2aakkKfgYgrgUPzf3sLI3iwN2rZqeOGW
         1RmzZXPSK8XtykejBYck2DG+7FrOimSbKz5mK+3bSMTpZk7Pzkkt/Ca7wpMadTLtIbnQ
         4OqxPN+W/RfJZGFvUxD7CMccqXBtRIw0kxkZ99NrtOjXa41lGcrCojLqYNLL305ypBE8
         y/1RDfVOysy/urC9ILE2QkbAQklj2ohuqGHGKZ6c63ysNfIowhgKknwELjhTvkeA1yJ2
         HPLWztg7xMz89wBQM5zpwM9TItZcoglHUuDAdXerYtjMynP+/t/pN7a0/6E+SZIJuUI3
         ENJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sJ/NH1WxmyLs0OgxjuKXd3vxc/cRe0agzDtoq0wTKtI=;
        b=aByFjvWVPDmxcTbVogGcT+JpCvu3/X69Y2r4q2hnowVIR9mM3B5OF9+3HQbrHH1Iq7
         zqA64ucVH4jZg+R7of7+2ROACUZAqTlvztMIU0oQ0telcKrcSGyzuc7qELo/zl8oKbai
         bfMoKvaukuwz4uN7z9cvUQ8K3OZGOKAMUqmzJQHWLR0elQlDCYvzHU8YcqTMmI2mdg7d
         NgV2yVgYxslw5En1HchxSiHYN2EK0pQAmn0CEm6+wmbIcnKtayEjvTXJG6Wo+K4RaDUQ
         tceQWH77R0GxrZG4mq+uEjVJ7HT2eWCvUQASHtsmdWQx7s3aZrNT1KtNO6uc6I14Nnqm
         oQ4g==
X-Gm-Message-State: APjAAAV/I47UR9IEVjzR3mYn+27PD6vqqYb41/GFZEI/hIe/DZYUPZFG
        +V6OiWU/VXeA/YJhe161fKpAoQ==
X-Google-Smtp-Source: APXvYqwtGF4JKcw9P+n6WY/6SYI+Mkw5ip91G0dQV2J2bXvqTNvYADB8551sS3jgSNzN50ndcnYPaw==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr168063wmi.51.1579537857288;
        Mon, 20 Jan 2020 08:30:57 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id p26sm22631756wmc.24.2020.01.20.08.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 08:30:56 -0800 (PST)
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
Subject: [PATCH v2 08/19] dt-bindings: usb: generic: Add role-switch-default-mode binding
Date:   Mon, 20 Jan 2020 16:31:05 +0000
Message-Id: <20200120163116.1197682-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
References: <20200120163116.1197682-1-bryan.odonoghue@linaro.org>
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
2.25.0

