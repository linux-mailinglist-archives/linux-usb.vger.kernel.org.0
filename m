Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E356AECFF4
	for <lists+linux-usb@lfdr.de>; Sat,  2 Nov 2019 18:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfKBR0N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Nov 2019 13:26:13 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53858 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfKBR0M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Nov 2019 13:26:12 -0400
Received: by mail-wm1-f66.google.com with SMTP id x4so1352819wmi.3;
        Sat, 02 Nov 2019 10:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fyDnq1nN+nBljTccUqkL0S9NbGaMqk/7uGJ95nKwmMY=;
        b=UQapHqN+wkzlL1+uoBngM6+F2een+XSvY2UaBruXhkgTonLhACYXkUlP9MjGCpZTkA
         kNmatLBhwJnRITBvYO+QUhpi2ect00W7N9NBQTvovOBJzaP8k6n3kphs8RvmiJGMWHa1
         zV0TMbDZAsdu8aeR1252Cy7dhiTCtQNh5PLZhOBPL95xHecqw1HW6pfUvi6w1oDMtq2O
         wtaHDL/9KLnp7R+NJdfATcV8PQWdQ4xTSVAxKnXXfCvuHhd9/wJO79YUpRLjZwbnOWnp
         q3SaSPuouALuolZEm/Zgrw0URVh9Lxr4juvdM2pXBx/IgkPTPJyh6dW8pZAMxY0k93Lk
         1sTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fyDnq1nN+nBljTccUqkL0S9NbGaMqk/7uGJ95nKwmMY=;
        b=NSzQ8XYx3CsMql8FlvrkR1XF+V1dtl6GgkT1xqbTOPdLyymSdsoSBCa7Eel0Cgx7K+
         Xk+KWXlyNn9QpVBFfGK5kaAPlvbs4yI4FAfCVosHl8EWJkQCsVtAzU1sCWQ+S7wf7dor
         Xn1loEsLxZysD7m44ybAKUZrBmoi5cY5uz9x4t2raDf5mGtcgSZoUzDJPn8cDd7vRm8W
         BjgxnUm5eSmayfDlriyB8tatG1hcoyT+FbmUKXUjpiJwGsjco9ZrAFZW8+zeoHyAYk4h
         aWiHp5Nh7YG6FNcNFAesk+fclL/uNHdho0JGJUwnAH6WgD9SWk1oWOLuQCR+I0RsJUbo
         i5fQ==
X-Gm-Message-State: APjAAAWE1D9z6IJm9ef36hOJq0/50EwEiv9weJ49NOqWVcDWQWPT+2gt
        vvFfEq3guZXHSUC5YGAohlA=
X-Google-Smtp-Source: APXvYqzr8A0WbBfIvXk0hpps0zg3o3Qa35KN4as2AfceMqz6x8DNxVAcrV9xEoD4HrMAHwnwkKWy0A==
X-Received: by 2002:a1c:113:: with SMTP id 19mr14444772wmb.42.1572715570184;
        Sat, 02 Nov 2019 10:26:10 -0700 (PDT)
Received: from morpheus.home.roving-it.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id u10sm13682324wmj.0.2019.11.02.10.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 10:26:09 -0700 (PDT)
From:   Peter Robinson <pbrobinson@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] usb: host: xhci-tegra: set MODULE_FIRMWARE for tegra186
Date:   Sat,  2 Nov 2019 17:26:06 +0000
Message-Id: <20191102172606.26934-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Set the MODULE_FIRMWARE for tegra186, it's registered for 124/210 and
ensures the firmware is available at the appropriate time such as in
the initrd, else if the firmware is unavailable the driver fails with
the following errors:

tegra-xusb 3530000.usb: Direct firmware load for nvidia/tegra186/xusb.bin failed with error -2
tegra-xusb 3530000.usb: failed to request firmware: -2
tegra-xusb 3530000.usb: failed to load firmware: -2
tegra-xusb: probe of 3530000.usb failed with error -2

Fixes: 5f9be5f3f899 ("usb: host: xhci-tegra: Add Tegra186 XUSB support")
Fixes: 488a04d4bb2f ("arm64: tegra: Enable XUSB host controller on Jetson TX2")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/usb/host/xhci-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 2ff7c911fbd0..d25aba8fa219 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1433,6 +1433,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 };
+MODULE_FIRMWARE("nvidia/tegra186/xusb.bin");
 
 static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra124-xusb", .data = &tegra124_soc },
-- 
2.23.0

