Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACB9CEB32
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 19:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbfJGR4G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 13:56:06 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43763 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728545AbfJGR4D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 13:56:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id a2so9112997pfo.10
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2019 10:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BqAPbs/wZUWEhGivyo3NLB3Z3ocJiJHq8gLjsQrSOVI=;
        b=zkLe1lXI/kTfrysTVpJMwuaXco3MElI5JuoKHwGdd9huySPjwcnc3rUpITt2/11Zm5
         tiXNO9v9vnVvIIZd94wdw/YiU4qkXUd98CG1rM8X+hL7q76fc91jo2CiIuKtM0jtJ9rL
         v/kOPD4SUR/VvcEUI+ziPVYPSPfQsN3CGSoWEWAGNtH2cGERQn01eSXsazGSuW5VlQBc
         XCg5L0bLn/3dNIkIPJ/E/0FVK8XV2n51gVKvv+dTLBeaGJMwc+fIFiXuQ8Yn0/Sq28RE
         2z+dVzuJX2OsLboR4aXc7T1Ei8Y1KCFzodNnELOhDZ0euq7lSepkr59SyAKucel2Bn9c
         bjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BqAPbs/wZUWEhGivyo3NLB3Z3ocJiJHq8gLjsQrSOVI=;
        b=KY04RIJvGmDoGEzCSu9cmzsOe448bXM5uvaMbf8ha/BdNoee0XmotruzbLdpNPpZQZ
         j/okFBb6TnxxKki7aQ6mvRhD2WFlroM2K9c/Nbq9GL9EgeEA8QlVrl02iU1/i9lJLOW/
         Lk3okyHzXYr/tk6ujXJSQZLgKEx9dQZfYSsmrGiGDa10chXAryY+O/kQrLoR3fazVOd9
         d7Opb68x4m3Dq4p4ZSwet/0Zeun3o8TEJnlmqzr9uJnNS1S5wIwAwTehqFELQsXdzy6Z
         hDcVPjbJJwxUSpfLyJv3zuIg9fTEhiIUUFPmXNuzyT5A8SL5+fmPv6F9OjSFAVRCzqoe
         JaxQ==
X-Gm-Message-State: APjAAAUwFCU9GWsRhQg8rA9+tbhbrcbcRk90ywzy0XnlWNnSKXLW/IPo
        jx9nruqGklOwEsLgTXnpeeSTrQ==
X-Google-Smtp-Source: APXvYqzR09qKYZDkL9zavOHzE5V/dTeZBEetwtzxc9ol5SRT48VvfuWeKP1zcPB5Go2sfBi0OZM/lA==
X-Received: by 2002:a62:1516:: with SMTP id 22mr33771701pfv.87.1570470961345;
        Mon, 07 Oct 2019 10:56:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id k15sm3820096pgt.25.2019.10.07.10.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 10:56:00 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yu Chen <chenyu56@huawei.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC][PATCH v2 1/5] dt-bindings: usb: dwc3: Add a property to do a CGTL soft reset on mode switching
Date:   Mon,  7 Oct 2019 17:55:49 +0000
Message-Id: <20191007175553.66940-2-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007175553.66940-1-john.stultz@linaro.org>
References: <20191007175553.66940-1-john.stultz@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Provide a dt-binding for quirk needed to do a GCTL soft reset on mode
switching

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Yu Chen <chenyu56@huawei.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 Documentation/devicetree/bindings/usb/dwc3.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
index 66780a47ad85..cf4ef6c22fb3 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -77,6 +77,8 @@ Optional properties:
 			during HS transmit.
  - snps,dis_metastability_quirk: when set, disable metastability workaround.
 			CAUTION: use only if you are absolutely sure of it.
+ - snps,gctl-reset-quirk: when set, GCTL soft reset will be executed on mode
+			switch.
  - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
 			utmi_l1_suspend_n, false when asserts utmi_sleep_n
  - snps,hird-threshold: HIRD threshold
-- 
2.17.1

