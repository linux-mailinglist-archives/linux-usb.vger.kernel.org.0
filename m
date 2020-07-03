Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB58213EB6
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgGCRmL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbgGCRmJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CE7C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g10so11353197wmc.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rg3aFGb8OfRKBHM94n8q4FN1ZasqFE+4EzVqNDg7yKc=;
        b=YxY130FyIPR9Gm07AHbGYOGYZ5uDSYNgEhKE/C8aNhqL0yl8qgwg6rJUkdr2CCU2YW
         AtopIVNMNXMk47KxDB72Sj9A0L+dPsHtfXJA12sLuN2SWhKv+LkgOVOmMbDdpCr2Br75
         OmCUEdF/2uQ58MLoN0jVA4nrwnOU7TVriTfuR2ggV0OueDEdCv0f27/TDEJKITw+vl2c
         X9eJHC4Z6ZZC594uHVV1hjOQpMWfai3gaKh2m+Map4HqjdepflZHEKdAbyCzC0gpr14j
         MBKxodujMzGU+ZAD48XZM8Gx6heyNRAfAjRvj9Z2FUJNpiG/EVBOcsd+KbZYw2BG6Rnw
         t5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rg3aFGb8OfRKBHM94n8q4FN1ZasqFE+4EzVqNDg7yKc=;
        b=s1GIcb2+ZyRi9JNWyVjgVnDSxYjWd9/odM57UW4LLnL5tctZnKtosA2IEA2whaOcS6
         +cIJ8+Marf4IxZYmSmNyjyjSJS9/ryhFon2y/2r58Ts9Rvb76Es4YpmWNp1sDwGR5KoI
         oBfnhvEUQukCl/3XboiBCfqdrb4h+nfm6kQUdQjHiTPxkPwCAtgnqMvltPed795DOZRi
         VKpiIMzhzlinoxpQZKbyol27qdj4KNBtnjIjXHxGbI8U4te7MWXzNhO2l03Dwxnzxoqm
         du3FgV8sCeD82Yb3MzPWN3ocf0v3Oyy23q08ozgMbwfqX+KU3nSwjAAmm0cUfWwTvwHm
         mZGQ==
X-Gm-Message-State: AOAM532gwzC0IgZmg5NK1T/ZkbpFXpPNcJ+DpRnWz/4NeYhUYuD4szD2
        7ZpDoDmHJWINR4DURwrx+WSBIA==
X-Google-Smtp-Source: ABdhPJy+9vIk0iVFK825nCyPVCUC0qAi9muP8YyXvlu55JUrNIhVbPA9fpJn844SKSTCo2SOUdiiIg==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr39360654wmk.21.1593798127542;
        Fri, 03 Jul 2020 10:42:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:06 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        David Lopo <dlopo@chipidea.mips.com>
Subject: [PATCH 07/30] usb: chipidea: core: Document hw_port_test_set()'s missing 'ci' argument
Date:   Fri,  3 Jul 2020 18:41:25 +0100
Message-Id: <20200703174148.2749969-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/chipidea/core.c:163: warning: Function parameter or member 'ci' not described in 'hw_port_test_set'

Cc: Peter Chen <Peter.Chen@nxp.com>
Cc: David Lopo <dlopo@chipidea.mips.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/chipidea/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 9a7c53d09ab4f..1016596532a9e 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -155,6 +155,7 @@ u32 hw_read_intr_status(struct ci_hdrc *ci)
 
 /**
  * hw_port_test_set: writes port test mode (execute without interruption)
+ * @ci: the controller
  * @mode: new value
  *
  * This function returns an error code
-- 
2.25.1

