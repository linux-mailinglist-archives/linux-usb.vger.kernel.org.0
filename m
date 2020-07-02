Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4832C2126AC
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgGBOqu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgGBOqs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:48 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1C1C08C5E2
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q5so28768603wru.6
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K724gNBq1+8gJuUosuyXSMvH+REcJBS2sGMOEUVIfWc=;
        b=bxMpXkgMVaIQhUosfclwMUUcexKCyxfNvmHDbmWxGE6fnfTamN5u0EjbZj6xscXTJO
         KIqwSDdDoUdpSQjaH5gfR2j3bPAjelzx07KQNxL5h1MuR11ckg4jcR5+LCNbnF7m0LyX
         uc+hTJBCiFR8J/aHBmIrhWw+iCM8BO8LXIO9UZm+GQk+ettGaEC+svC5PHWO9knyxcxq
         Eyx45/1OtfW7w8v3xhWVQYzHpRGQvw0Iu6TXfXbdmUcCnnO7yuLErpt3TcRveMRqx4t5
         9j6tlz681kwT2hbuts1GpJis58KKUpqBVck9dSa7i7jQ4OzcB3v+7hlHUu2FUQP7ik3B
         tWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K724gNBq1+8gJuUosuyXSMvH+REcJBS2sGMOEUVIfWc=;
        b=kMIU/cnvzYN8pGKD0LdJxrrsSwRv+jbME6VUVWmwf0cEfvTrG9KhwfndjEe9eszVAg
         sN83HYAZ2xta/2jbaf57TEgPl2/G3t7Cs1RS/P+L1hN51Qw4EnV0n3QwCzrpVQMzgOMd
         KS/VJBOBbEv7QiDtV1wEi83O/GkF+9u4KhAK/YGLbrE35RenIgQvcfgeT3d0V4AEHA8c
         p5jWlPAbZYC3lIIvkEpxN6FsJ/Px9y3/9R7nwr4FQvHYiAESz9/HUO5uIVDyZIRGpXUc
         3ONTriR0cSo8e201S2i4qqUkj0ETHAjPAoQyH82Ri8Wak14wMltR4rRCp+hcYZYuhxUF
         /SAQ==
X-Gm-Message-State: AOAM532Sg4bz86pO7y2GMvGNT1ElxR2FeHp44V5eQtDbn/l7UAHF0JK4
        T8nsgEziwAZgJgBE2WNXlRQsxw==
X-Google-Smtp-Source: ABdhPJy4S926IqfqG9+GjXBGJlktkqEcFIY2+P6+GBBzSak8NQL0ghDJYlnEAQjhrd4dBc3MisUR1Q==
X-Received: by 2002:a5d:4051:: with SMTP id w17mr30549831wrp.183.1593701203410;
        Thu, 02 Jul 2020 07:46:43 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:42 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Ben Dooks <ben@simtec.co.uk>
Subject: [PATCH 09/30] usb: dwc2: gadget: Do not read GINTMSK2
Date:   Thu,  2 Jul 2020 15:46:04 +0100
Message-Id: <20200702144625.2533530-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The value of GINTMSK2 hasn't been checked since the inception of
dwc2_gadget_wkup_alert_handler() in 2018.

Fixes the following W=1 warning:

 drivers/usb/dwc2/gadget.c: In function ‘dwc2_gadget_wkup_alert_handler’:
 drivers/usb/dwc2/gadget.c:259:6: warning: variable ‘gintmsk2’ set but not used [-Wunused-but-set-variable]
 259 | u32 gintmsk2;
 | ^~~~~~~~

Cc: Minas Harutyunyan <hminas@synopsys.com>
Cc: Ben Dooks <ben@simtec.co.uk>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/dwc2/gadget.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index 12b98b4662872..14c422ee6a069 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -256,10 +256,8 @@ int dwc2_hsotg_tx_fifo_total_depth(struct dwc2_hsotg *hsotg)
 static void dwc2_gadget_wkup_alert_handler(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts2;
-	u32 gintmsk2;
 
 	gintsts2 = dwc2_readl(hsotg, GINTSTS2);
-	gintmsk2 = dwc2_readl(hsotg, GINTMSK2);
 
 	if (gintsts2 & GINTSTS2_WKUP_ALERT_INT) {
 		dev_dbg(hsotg->dev, "%s: Wkup_Alert_Int\n", __func__);
-- 
2.25.1

