Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72C8F213AA9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 15:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgGCNNI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 09:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGCNNH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 09:13:07 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2D1C08C5C1
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 06:13:07 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id g2so18462428lfb.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqRWIJhMC4M/71vzb+wdaZK54MriAOHFklGDRAsmSSE=;
        b=jx/g9BXAXl5s9yHnomGbRXFf/i5G7s5Iz7ZuuNG4GtbSg3XroI5B+mT9+/JgtKfZ2t
         GjknZBczMph7WigUdM79KNkxrIfi/XumLNotiWUyaaEt0Gfl6rdY3MhR13TPv9aFvemF
         TYkKUKEADjmwBh1Eej34v99MW9/Y3oovxeNASU9RNCL6GVjHcpDc6A08q1lvARJnNNJS
         fSC11/1YROnaEAw+Y7c4x8FDWEYbvH3cAzXhIHJhT6qaaiuJ4XPF0orDPkXvTLeomQ0j
         ODszDdCYauSC+57zTC9OfnZNRYImX+4aB9CxP+zYumNlhNMsKlB0wUHWS3WEDnpR7aKV
         ah6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yqRWIJhMC4M/71vzb+wdaZK54MriAOHFklGDRAsmSSE=;
        b=algtmdZwAiZqHkWVJSbVtDIsP3RiOrUv2fzHhvgnr7yUET1uSWDgMXABkhJvdtYhpu
         SGnLZcfYAWaqHy54CYuDaaYe0mi/XpPGG++PnJMCr87OGxRJdwoynQfEQJumJuJTtZkN
         3fcZUYBgipPeH6lyG5su2JasR5BQQzxkX7Lfy1nCqGFP8LygHl6F36uN9jXXCyP1SntL
         0DzDf1FN2VpTM17yumsSkBgRihwdjJXxhfTlhsKbcDTenUKbGMAxR5CBFJ1zjDw92yxn
         DVo8W8vMdb3LUEHdB/nCnAkUGb4Oc3awRc/Tl0386hyatFB5mHizq7gvn/HI88ZJqRrW
         8Bqw==
X-Gm-Message-State: AOAM5334eUJ8MavCBoE09fJkyFdJkh51n/0805cly1azHrBSvToAOVj4
        8E6GuomUn+jkqDonPmdO7oSJP1wDejEtYw==
X-Google-Smtp-Source: ABdhPJzVbyrbXQbgh3H47rHAXCtYJyQ9DWXKbwP2B0hrguOr1THBnrtXL3WDPRjAKuSaJUbL3NRzXA==
X-Received: by 2002:a19:22d6:: with SMTP id i205mr21859502lfi.50.1593781985503;
        Fri, 03 Jul 2020 06:13:05 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id s14sm4107438ljs.52.2020.07.03.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 06:13:04 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Roger Quadros <rogerq@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>
Subject: [PATCH] usb: ehci-omap: Drop surplus include
Date:   Fri,  3 Jul 2020 15:10:59 +0200
Message-Id: <20200703131059.515436-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The EHCI OMAP driver includes <linux/gpio.h> but does not use
any symbols from this file, so drop it.

Cc: Roger Quadros <rogerq@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/host/ehci-omap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index fc125b3d06e7..94b4b3ea49c8 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -24,7 +24,6 @@
 #include <linux/slab.h>
 #include <linux/usb/ulpi.h>
 #include <linux/pm_runtime.h>
-#include <linux/gpio.h>
 #include <linux/clk.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
-- 
2.25.4

