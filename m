Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD3861536
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jul 2019 16:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbfGGOWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Jul 2019 10:22:19 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35008 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbfGGOWR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Jul 2019 10:22:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id y4so5714292wrm.2
        for <linux-usb@vger.kernel.org>; Sun, 07 Jul 2019 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kresin-me.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=w3LniQ6iXsSS0+1RwXMeY58UwnRpF89TfP1t4jDUkfQ=;
        b=QKvLQa1n/cKpBfhUYlk8tR6oV35T1scLc4gslWfP7AL8OpnZ6WBC142P3Uu/bnG8Rx
         Zg/rmeSl1mXeZPeH7jUaOVh0N/d/zUGgb8t4ES5el4eAR0sq8IuN8yC3XWKs7i2tOPEd
         N9tS0NWQGTg+42SCaJ9nlkSbN7Atnq6RK8VdbcaaPeWFkWmsuf62lfXREBilVUALc0Ju
         eixr+nvUw5bVskMoyPe3nm5fqQQzQOLpiGNbNxSLKIZl+sw5DuQ8N8zFUXdu2TkXePEX
         DrZ9EYrHpCns3w1Jl8mLChMZz+LFA18P7zwVARbX4S8mF7CH0yeFOViZg81DrG3Hz0r7
         aI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w3LniQ6iXsSS0+1RwXMeY58UwnRpF89TfP1t4jDUkfQ=;
        b=CCvjIdG4vESFd4EHzKnLvWo2xalZRzSQGlBxlqm9+GysYD1hEzH1QoXZ08lss0pZMf
         f12Qg2CZ8y6B/jXRHw/2rstBZSJ/WcDBoBerAK44JwxZk0FhILRc5D4ZLw24b2ac9K4j
         pgiaSshpyaxz6SSLVb+uvuMN2lBfLGAbH11Hl3uUwml5BIkHlGTBumxpinRTTJJF5qlW
         wi3hLuG+0CYk/pLG3x8z+vEPCb54zYNRpAbrqzPbIAV3jE6HLMy4s5jSyMM4/Aq78Pyk
         pCZR0lefIVAIhBOucLQB/dwRjMRtp5eM1GCnx0g4eRl3SZzsmNDtVyuMe6yJi8DeMRZL
         rEtQ==
X-Gm-Message-State: APjAAAWNhJyvJH2JvZ+ZOiMAwc6QSPdWaaZ9vn53wUnVNGu87yqC9FwI
        jP20uZtwrYsGaBFEBcjhlhBWEMfCqlM=
X-Google-Smtp-Source: APXvYqzk1dbkVNEkNFcvLLdw8VYQjq0V5wIXjmSKICTqUAiWCP3t5pxaNncffMIzOdjWWdX6bnl4dQ==
X-Received: by 2002:adf:dcc2:: with SMTP id x2mr13828848wrm.55.1562509335238;
        Sun, 07 Jul 2019 07:22:15 -0700 (PDT)
Received: from desktop.wvd.kresin.me (p200300EC2F2740000018F6A9D84AE81F.dip0.t-ipconnect.de. [2003:ec:2f27:4000:18:f6a9:d84a:e81f])
        by smtp.gmail.com with ESMTPSA id r123sm8386943wme.7.2019.07.07.07.22.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 07 Jul 2019 07:22:14 -0700 (PDT)
From:   Mathias Kresin <dev@kresin.me>
To:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] usb: dwc2: use a longer core rest timeout in dwc2_core_reset()
Date:   Sun,  7 Jul 2019 16:22:01 +0200
Message-Id: <20190707142201.25645-1-dev@kresin.me>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Testing on different generations of Lantiq MIPS SoC based boards, showed
that it takes up to 1500 us until the core reset bit is cleared.

The driver from the vendor SDK (ifxhcd) uses a 1 second timeout. Use the
same timeout to fix wrong hang detections and make the driver work for
Lantiq MIPS SoCs.

At least till kernel 4.14 the hanging reset only caused a warning but
the driver was probed successful. With kernel 4.19 errors out with
EBUSY.

Cc: linux-stable <stable@vger.kernel.org> # 4.19+
Signed-off-by: Mathias Kresin <dev@kresin.me>
---
 drivers/usb/dwc2/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/core.c b/drivers/usb/dwc2/core.c
index 8b499d643461..01cdd236be99 100644
--- a/drivers/usb/dwc2/core.c
+++ b/drivers/usb/dwc2/core.c
@@ -524,7 +524,7 @@ int dwc2_core_reset(struct dwc2_hsotg *hsotg, bool skip_wait)
 	greset |= GRSTCTL_CSFTRST;
 	dwc2_writel(hsotg, greset, GRSTCTL);
 
-	if (dwc2_hsotg_wait_bit_clear(hsotg, GRSTCTL, GRSTCTL_CSFTRST, 50)) {
+	if (dwc2_hsotg_wait_bit_clear(hsotg, GRSTCTL, GRSTCTL_CSFTRST, 10000)) {
 		dev_warn(hsotg->dev, "%s: HANG! Soft Reset timeout GRSTCTL GRSTCTL_CSFTRST\n",
 			 __func__);
 		return -EBUSY;
-- 
2.17.1

