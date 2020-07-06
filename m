Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2C521587C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729238AbgGFNdv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgGFNds (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jul 2020 09:33:48 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3A3C061755
        for <linux-usb@vger.kernel.org>; Mon,  6 Jul 2020 06:33:47 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q15so39369864wmj.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Jul 2020 06:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WNaU7ol+N7ICBJATYVP9nw4MVbukWo2xxwQRmnXSWuw=;
        b=NkRY2E/HSC6TCiGYYeAp7Ij0MVWlfjDJVXmJchaUI3rMunKmwloMDjVwIp6WkePzX/
         zebB66G53xUr0ZsJFMrQhXE1gWX/AxLXp0tbYzYz+lCr6MH6Z9gTFrD1OfaR+kij4/1e
         2NzT2rvVJrW4SvM//cDtdM/tfm4y/E8QoRFFxL2ksnPMJ1Kp2LcVIiLEjXgEkiSAokKK
         hFp2tTqg+WJ9LgX/G1frCemjOnFGdmZY3t5IEYxNaXbrue949/A0rRh6O9KbRzWpzsYL
         dWP09kh1fL33PDeBGoUY6awH4Adfw8S3qvhYakuSG2YCXfUEfR/XdT+fSm0Rukc4Wopr
         vteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WNaU7ol+N7ICBJATYVP9nw4MVbukWo2xxwQRmnXSWuw=;
        b=LrY+JN2bs3xLWGZrnqlXkCXL25+JrZC2F8sHUTm+5JVqCnTrJEeogcQtYiE72QW0j8
         uDc+tktAcpoC+KPF9eOdNm71Kv8MJf9cidpCRrwsbCMBigWG4yK75GjdCfRfzrBYykah
         lsGnvrJXnXRSWZ5ComtjPYwWCOZMt5DdP+yxbi977iZAsl+lMuMnJcNZMlatuo56GTvn
         bkDw9uCaquGreMOSqaVLmGMlJ8whYG/Mhy4nhv/LZRDlnekocvJnrqWF2T/RSGWsQ02i
         EV/lUy7kLmGgaoRAP+C9PIogw9v1QLElLiOpvR6LEcCmLyNCW3Vo6Wxq/gFj+aiZPsDe
         3UBg==
X-Gm-Message-State: AOAM533gudR9VZlQL707Jeq2JkBS1/KRb2H+FWktnWHXKuSrgtCcD5tL
        rNt3XR9MBRFS4YnGcJjbd8DrZA==
X-Google-Smtp-Source: ABdhPJzV6Ohv7aXVOIIpA3ZhF5c1WJsv9HI1KNboAwezr33m6B8+3YAS3pk85zXnZUZoeM+YxtgKZg==
X-Received: by 2002:a1c:1bc4:: with SMTP id b187mr52514926wmb.105.1594042426613;
        Mon, 06 Jul 2020 06:33:46 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
        by smtp.gmail.com with ESMTPSA id v18sm25416082wrv.49.2020.07.06.06.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 06:33:46 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        David Lopo <dlopo@chipidea.mips.com>
Subject: [PATCH 02/32] usb: chipidea: ci_hdrc_pci: Fix improper use of kerneldoc format
Date:   Mon,  6 Jul 2020 14:33:11 +0100
Message-Id: <20200706133341.476881-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200706133341.476881-1-lee.jones@linaro.org>
References: <20200706133341.476881-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document any of the structure's properties here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/ci_hdrc_pci.c:132: warning: cannot understand function prototype: 'const struct pci_device_id ci_hdrc_pci_id_table[] = '

Cc: Peter Chen <Peter.Chen@nxp.com>
Cc: David Lopo <dlopo@chipidea.mips.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_pci.c b/drivers/usb/chipidea/ci_hdrc_pci.c
index 49a61549cee67..d63479e1ad104 100644
--- a/drivers/usb/chipidea/ci_hdrc_pci.c
+++ b/drivers/usb/chipidea/ci_hdrc_pci.c
@@ -120,7 +120,7 @@ static void ci_hdrc_pci_remove(struct pci_dev *pdev)
 	usb_phy_generic_unregister(ci->phy);
 }
 
-/**
+/*
  * PCI device table
  * PCI device structure
  *
-- 
2.25.1

