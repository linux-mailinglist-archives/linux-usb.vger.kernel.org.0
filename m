Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D37993B0F1
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 10:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388406AbfFJImU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 04:42:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56046 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388270AbfFJImT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 04:42:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id a15so7607056wmj.5
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mEH54ZZbXqjz3IZT5KkSbAecLvKUPwRnXivpNaH2j5c=;
        b=a2GG33XgJn18Yol+PHCleaS0zfozddU3pDxE1VGccaW5e5KeVgXCQOZG45tjtfIcaC
         Lxh5LFI6v+7mSVN/0absvabDtYraYaClMC0Tox8yizarBHRZs5MMT7o+bwZAkx+UYwjc
         gn+dIt02WuGoIQ96ZxrJl58wiP7WJ81xUZFPZPNaBg1wxnoIeEYCAxMT/iFUVXuCYnHx
         bgfE+tWRBOGSJHQBya+sXoyJclZs/lcZZa354GRxGDtOM/PZh/447J170T9AjMgOaYBB
         +XsGQbBGjNMw9PD2U4ouSEzKgUYuRFUJi8Zjv+NXPiv+HQ26SXZwRdLnAsvct3gWghyD
         Ugfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mEH54ZZbXqjz3IZT5KkSbAecLvKUPwRnXivpNaH2j5c=;
        b=mj7MAAT9p7vV7+Bm/rOvfD3kUAAFSqSg38ZjJYZmSLAy9gQTWGUhj84LzxS77D4Eqz
         hPIuXlewNZBM5XB+LE9CPYzo7lhRlYB+LNxNp1d+ukRs7DW4IbJdkUGgEeqMDt7csFX4
         AjNuPE0S8GmKYQrYBwCOEt15hFUDiVPxjC6+RSy55ASg3lnvJ8/TduJe7GvMzZphDDCg
         zzsU2W4+qeEOYGtLmQbf0nPzc9hn8rbz4m4RqBInnjL48aRU3SspWGon4GQslt4ZjNfu
         F9K+TWEmFO4gNRkak0xh8ZkaiKUgbEZQnAmZJruJr5CGlWjI2OPSKSt4vWW0zJGCCJed
         IvBA==
X-Gm-Message-State: APjAAAVDPxLt64LiA7iJHMF2HlXKLejcKgR7T9ASQFOTr40ADdd7w+6w
        WWjg6gj/H59VhGFtqaxTwbByeg==
X-Google-Smtp-Source: APXvYqy3EzeyzafpMZj28AeifpAxvXD7SUfAmQ4kAAkAt5yEYM9MwQsajAgi24GxBfJLBR5Hah0Qrg==
X-Received: by 2002:a1c:e356:: with SMTP id a83mr13188870wmh.38.1560156137485;
        Mon, 10 Jun 2019 01:42:17 -0700 (PDT)
Received: from localhost.localdomain ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id a125sm9929670wmf.42.2019.06.10.01.42.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 01:42:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, andy.gross@linaro.org,
        david.brown@linaro.org, wsa+renesas@sang-engineering.com,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Date:   Mon, 10 Jun 2019 09:42:07 +0100
Message-Id: <20190610084213.1052-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610084213.1052-1-lee.jones@linaro.org>
References: <20190610084213.1052-1-lee.jones@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Qualcomm Geni I2C driver currently probes silently which can be
confusing when debugging potential issues.  Add a low level (INFO)
print when each I2C controller is successfully initially set-up.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 9e3b8a98688d..a89bfce5388e 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -596,6 +596,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dev_dbg(&pdev->dev, "Geni-I2C adaptor successfully added\n");
+
 	return 0;
 }
 
-- 
2.17.1

