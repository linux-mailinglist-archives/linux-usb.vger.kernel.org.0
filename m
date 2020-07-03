Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D10213EAB
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgGCRmF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbgGCRmB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:01 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E19C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g75so32747479wme.5
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GH9kLkzHctUtpjzMG5uKy/EUP0KmLjkarK3Zyi+F734=;
        b=oPyrB8PidDxQT0BDJL8ttUMskiiCjdZZjs3FWjc7sJiQ3GTGABuuowxYHEb4PXYO9R
         oUuXo2ZFCkIhfpc5FiL95BvY5X6H8sYdqjL+mtb7hHzsc5+VWC3YCMEvMqjGFbMZZtaG
         c0W+rgRjDKk9CsLqqPh94NHRplYLc6no40CMSS2sqVsosXrilmdr4P4sTUGhyv3MvAFi
         vSXEuHkzSkqfzBV05NAGb4G7gjUg4oLd7gld3YYCk6nJ6wyrZcO8NIGoeATjlSR43iDM
         sW57euHO4YC6uPitM6vEsxyXp4WxMo/dVFUtPPoeuuSx3jG9FAR8gNR65w2CAGjEPmjw
         QVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GH9kLkzHctUtpjzMG5uKy/EUP0KmLjkarK3Zyi+F734=;
        b=HzJw6JZTG+vmtnHRvo4iyQ1v4mInZEtm6H3AzLfeY0qdzpdxmM2I2K8FB8rFXioxUq
         ExsQcncDC8iMERKAJHQpYjFUJMv+IDHNWAQfQZ11+uXfsNJUO5cjealpTn2KlJAiSBX1
         yh+pIqSWtZiSu2F14JTZv+aFiWWV1ON6bbDD3RvYMe0LEBsGjJ9NKZgfAMTlwiMDKWFg
         PI8nNWAEOnuTWCNRIOIAEflyWf5DlwBvLG1bO9mV7kGEtLpkzs5d/nuymz96rW9Or3bv
         M2ec+4b2+wQOwmSdLNE0SnavSq0s3PTRN6mWySsvku84NwTeJdawdJggfZNK1W+J5u57
         KcOg==
X-Gm-Message-State: AOAM533eFlUTHMIWjEVxzfy7GfiqRznrwMxcJFf71I5aC10dYIbeLem8
        6IJO9tA5MEBfZyqQEQ80v0jaVA==
X-Google-Smtp-Source: ABdhPJyR175xQdUE3YbXopU3B0c7WCXx8R0l/TMeTSCdkdTrAkW/AeSsiuMDCeOhzYob4uQ7e/uQvw==
X-Received: by 2002:a05:600c:c1:: with SMTP id u1mr38510987wmm.48.1593798119975;
        Fri, 03 Jul 2020 10:41:59 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:41:59 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Roman Weissgaerber <weissg@vienna.at>,
        David Brownell <dbrownell@users.sourceforge.net>,
        Christopher Hoover <ch@hpl.hp.com>,
        Ben Dooks <ben@simtec.co.uk>, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 02/30] usb: host: ohci-s3c2410: Demote obvious misuse of kerneldoc to standard comment block
Date:   Fri,  3 Jul 2020 18:41:20 +0100
Message-Id: <20200703174148.2749969-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

No attempt has been made to document the function here.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/ohci-s3c2410.c:356: warning: Function parameter or member 'dev' not described in 'ohci_hcd_s3c2410_probe'

Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Roman Weissgaerber <weissg@vienna.at>
Cc: David Brownell <dbrownell@users.sourceforge.net>
Cc: Christopher Hoover <ch@hpl.hp.com>
Cc: Ben Dooks <ben@simtec.co.uk>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/ohci-s3c2410.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index d961097c90f0e..de5e570c58bae 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -343,7 +343,7 @@ ohci_hcd_s3c2410_remove(struct platform_device *dev)
 	return 0;
 }
 
-/**
+/*
  * ohci_hcd_s3c2410_probe - initialize S3C2410-based HCDs
  * Context: !in_interrupt()
  *
-- 
2.25.1

