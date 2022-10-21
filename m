Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E64D760789B
	for <lists+linux-usb@lfdr.de>; Fri, 21 Oct 2022 15:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiJUNiL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Oct 2022 09:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbiJUNiJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Oct 2022 09:38:09 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01FEA27518E
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 06:38:07 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id a10so4391022wrm.12
        for <linux-usb@vger.kernel.org>; Fri, 21 Oct 2022 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLW9FnoLQc7PleQYsjtukTsF4zwFV4e2UFMmghknV0A=;
        b=ymzonE0YR7nXbf5vxYalyCAO/LLN+uDz1EynBBLkY0GBLxkOL8k7Gb9siuEUNMdE81
         rLIwlljVOwe5I4g3IfRz5UWo/xJiEip68tl2PF8zqoaP0qLzmgjigdHkYOWbBq7yv5vZ
         oJAC0fOTMdzOfhj+CMc8h9LFSDoTqqmINPQ9XqX+axkvhhuErT5HNQs9/zPoicBEVc5U
         Kqp1K/fno53dVbWpQ56ustjbOrptAIVrtwrCDTq5/QHJYVok1vRmPKz+rlTPC3Q9/aWG
         Q0IlK3hFsWAT95i6cHf/edrzCuEhVDw4cTFvvlO2iSXoICqHRNnY7awIWdx3TjtyGaiX
         DbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLW9FnoLQc7PleQYsjtukTsF4zwFV4e2UFMmghknV0A=;
        b=n6YTkDJ4G3zo4uZRu7yEXa1mg2cl+x2YkAH9ICTwgo7YzT8KrClCIhnVHVyHU7V857
         CcrmJ/4dJclkva9K5bcQFwZNbTOn9cD+o26QgPkihpiEFTd29Ey5xaWWC+Pomb4H1Whp
         97c/nNx3iwU7JoJXdZeYA+ufxRmJcura4L3R6o9jXnub/XyIuZoUcCqqmNLLymyYa1kX
         KXvU1/N25UNC8pWURLqeebDfiR7tqEwiw5BtBN31hIVxUHaP8PUWQWcwPo7jsVOIRFN/
         hsdPEMsPFBVjaX03I61muh/NhqvjmqlxRbh0mHuLEcubq67OlAs2z2YS/L1rgfFYSZqh
         HWjA==
X-Gm-Message-State: ACrzQf0SVhOp2IsR6OlZ0nsUYcRgdxArZuis3lDjTEUdJXTKmSI7Rt5z
        CBmwm99xiLMc7fKqswQRBtyo1feobl3W2Faz
X-Google-Smtp-Source: AMsMyM78KxID0nlhfiPnA8La+isJ1lYfn0KYj8PqfiXRifKWZDT56bvl00KPWG3O4rhRbTxlWh3DAg==
X-Received: by 2002:a05:6000:2ad:b0:231:48fb:3a64 with SMTP id l13-20020a05600002ad00b0023148fb3a64mr11952614wry.184.1666359486433;
        Fri, 21 Oct 2022 06:38:06 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l35-20020a05600c1d2300b003b477532e66sm10462313wms.2.2022.10.21.06.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:38:06 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, johan@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        neil.armstrong@linaro.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 2/2] usb: serial: add myself as maintainer of CH348
Date:   Fri, 21 Oct 2022 13:37:58 +0000
Message-Id: <20221021133758.1881904-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021133758.1881904-1-clabbe@baylibre.com>
References: <20221021133758.1881904-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since I did the driver and have hardware to test, set myself as
maintainer of it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b9ed414dd8ab..cc498aa84a4f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4847,6 +4847,11 @@ S:	Maintained
 F:	drivers/auxdisplay/cfag12864bfb.c
 F:	include/linux/cfag12864b.h
 
+CH348 USB SERIAL ADAPTER
+M:	Corentin Labbe <clabbe@baylibre.com>
+S:	Maintained
+F:	drivers/usb/serial/ch348.c
+
 CHAR and MISC DRIVERS
 M:	Arnd Bergmann <arnd@arndb.de>
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-- 
2.37.4

