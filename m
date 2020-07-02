Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3B4F2126F8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbgGBOth (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729943AbgGBOqj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:39 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC79C08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:39 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id q5so28768016wru.6
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V6gF5OZoL4RS0/p0R84cBC4PkOOgqqKbUR7gNdMwCYM=;
        b=BjS0+cjbl/ylf9WIsjuuM5KRIKa1tflpMXbUUUReB1WQml9HUW6E7bANNjfQ5fTX/A
         ePKj5W/F4jTQ5DLni9yk4rEL0mT0PZ8dx/ky2IeK4j26F+tluYD+xaCITBCrSwhHDkG0
         UjYtzRYY1AZ1XJ9FbJStn9EZ2dOaSQVOz0ZTjAy3qfUFL/OnG1ALFNX/lOhWfCrk0PAA
         E9iW5PKN2w1rivJs2V0GOJnXF7m6RAcY+Rhv3sFBPzim9PY9lAbUX+LDiXQaJWjLIobh
         7BZt8ywcNGAKtdq5SRkR8fB6Ov7RYsv3mwiu7mpnDcFkBnkV5Ha2N/0X48uQF+Svx/43
         Gn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V6gF5OZoL4RS0/p0R84cBC4PkOOgqqKbUR7gNdMwCYM=;
        b=A3t/OQaay5T+z5Tt8z5nbK0lTbKluEN9YetKKPbk15Qcl2n//NOsKSDeuYJCyjzk0h
         2zaFbQCIZ5n/turl2plOhcaI9V95hzarRGAXy11yIbbfyzuxxNLJSbY3iYKumdwCIcUE
         PuXtGapNz43YC1nVdf/RpnAas22ef942T0+naglPtQpoQhXLjMvjQIg014Rc7fAGBpm7
         ZrXH4mMxF7fjIqA5f1QuzW2IlJFE+1d6S3KtERnREmkfkLVOCrMQocr7k2j5pQTZCVab
         5lvYmVGPs2lfRPJVQPeNmXPAQmqVj2pLntl+YPa9RB2ivN2NZprZPt02JjEu1K2zvSmy
         pyXA==
X-Gm-Message-State: AOAM532K63AqM29AzuIq4m56EV8H2fLBD4wNEqze5tdktrkHuQezVse+
        xUY5rtzlKy5JOJxLcFtWXpERsg==
X-Google-Smtp-Source: ABdhPJxPgeQecG8Qw9IvYuzEGJ3H19n5YN5vEt0bIlABEWuytzwfCAbC88GDg3TzdKAG9CqcWTyTQA==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr31220077wrq.215.1593701197660;
        Thu, 02 Jul 2020 07:46:37 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:37 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 04/30] usb: common: usb-conn-gpio: Demote comment block which is clearly not kerneldoc
Date:   Thu,  2 Jul 2020 15:45:59 +0100
Message-Id: <20200702144625.2533530-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This block lacks a title and argument descriptions.

Fixes the following W=1 kernel build warning:

 drivers/usb/common/usb-conn-gpio.c:44: warning: Cannot understand  * "DEVICE" = VBUS and "HOST" = !ID, so we have:
 on line 44 - I thought it was a doc line

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/common/usb-conn-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index ed204cbb63ea1..b4051f042c79c 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -40,7 +40,7 @@ struct usb_conn_info {
 	int vbus_irq;
 };
 
-/**
+/*
  * "DEVICE" = VBUS and "HOST" = !ID, so we have:
  * Both "DEVICE" and "HOST" can't be set as active at the same time
  * so if "HOST" is active (i.e. ID is 0)  we keep "DEVICE" inactive
-- 
2.25.1

