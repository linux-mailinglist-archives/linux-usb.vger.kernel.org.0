Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19B4356484
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2019 10:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfFZIZk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jun 2019 04:25:40 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35214 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZIZk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jun 2019 04:25:40 -0400
Received: by mail-lj1-f196.google.com with SMTP id x25so1277884ljh.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2019 01:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVvFhH1InfH3PPtlMQoNsG6tSqcFtU2rxZDyXe5lT5Q=;
        b=LsaIZt6+o/GShxGCDExFHWu/jR9XgIIq71Cx3FconQBZeGat22YdgVfHQmapitORlX
         TePd0RLTaZKKAvrx93Lx/1F2sdbT84cA47bJ0Pr4RDSSXTy3oU5t09N+YZXWXQTvNhrJ
         DWYCefJJxu9SmNmw/Hjj8xyyuDIDlK1wwsfWdykiAQi68Ppz0cdodcPElkSeWs0hkvn3
         J0fi1zfDvX+pbGDBo+sgCoLsZW4L8+7SMMwsL8CXMRu40Yu2wUPOnVLte5/ju+Hw3MHB
         ireoifccQXYjhLALoZ1iWBA2W1dvoO6dOmx1WrYW9tBx+SF8himxw6k/z2lcHNESt/ss
         pFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVvFhH1InfH3PPtlMQoNsG6tSqcFtU2rxZDyXe5lT5Q=;
        b=N5R1Zv6y+XbW9knAk/fR1R0cJodQCoKLmkHfpq8D7o3K0wQp//29g04/l7YWq4ifRB
         4Wmu9YKQdsyWBkz5hSSW1aPU2muKwP6OjAo81B7DHWV1bGXaxbbHJvUNtw5poDhhHdcc
         i3TPjlm4pnzBB2hdlk6nHmF+ekj0yV0sjljxYNxE2ksuOXlwHww3jafh6r5yyIncRIEc
         Kqo6tEBvhTadbCH6loO8Zq8Eju9ubVBANXNxWhbnPxtzlzG23cWvEgSf6eKiNPMkEoJ/
         H2v1Fx3Ev0ANR7JYGffiBlk5jLawD7eqjNXXTuaft2qibvxnvXPtNTt81jQYqZBBZoqZ
         +irA==
X-Gm-Message-State: APjAAAWjPzmG9K4ONjM3fAOTfuX7K1dQC/puvO5x24SF42PB/ElmxMP3
        havCXXJNnEFWENbnPA/zVa/JDHAP10g=
X-Google-Smtp-Source: APXvYqxQy0gBjQPJ/fBtCeFrYYWAP51N1u1/ULoXTp+yL9WDnmJqTlDBOKANxL7ffRxuhWL/1K+/rg==
X-Received: by 2002:a2e:12c8:: with SMTP id 69mr2017721ljs.189.1561537538258;
        Wed, 26 Jun 2019 01:25:38 -0700 (PDT)
Received: from localhost.localdomain ([217.153.215.58])
        by smtp.googlemail.com with ESMTPSA id e8sm2690359lfc.27.2019.06.26.01.25.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 01:25:33 -0700 (PDT)
From:   Krzysztof Michonski <michonskikrzysztof@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     Peter.Chen@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        afenkart@gmail.com,
        Krzysztof Michonski <michonskikrzysztof@gmail.com>
Subject: [PATCH] imx: usb: get pinctrl if it's not yet initialized
Date:   Wed, 26 Jun 2019 10:25:12 +0200
Message-Id: <20190626082512.7637-1-michonskikrzysztof@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In case usb phy mode is other than USBPHY_INTERFACE_MODE_HSIC
the pinctrl for device is not acquired. It is however used later
regardless of the mode, hence leads to requesting access to
uninitialized data.

Signed-off-by: Krzysztof Michonski <michonskikrzysztof@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index a4b482c3dc65..2f02b35c40b6 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -428,6 +428,9 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		pm_runtime_enable(dev);
 	}
 
+	if (!data->pinctrl)
+		data->pinctrl = devm_pinctrl_get(dev);
+
 	if (!IS_ERR(data->pinctrl)) {
 		struct pinctrl_state *state;
 
-- 
2.21.0

