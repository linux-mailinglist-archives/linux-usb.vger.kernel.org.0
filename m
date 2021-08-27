Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED90A3F95EB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 10:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244530AbhH0IWa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 04:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244505AbhH0IW3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 04:22:29 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A25C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:40 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id v20-20020a1cf714000000b002e71f4d2026so6892834wmh.1
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=62h6uRc5/FuReu7rXAOF6mghumi9ejQXLtu8FgRmxU8=;
        b=Hgm8OaMBtNQZ93naj2XxwwN2zicDzre60pSwmXjyVgZg5WnAiuMv4WC11F4p2zL033
         k/xmSJQnzX4iZ9OLv+UiF+Z/NxSG1d5iydT+bSUjv/I831hqrv5mCkh/hbNNq5WvFhW9
         CFOrmVRETPY9VOYTN10KPCUt17pkJM7UdOcbUQnUvf/WbimPZV6X9JzGpebcvcqEGLUG
         0DcCVXSMhqzfO9LCQ2Kgn9sz8rT+zldMThy4xzJDuxUZkJGck6iK1bj6+E4TWloB1/e/
         rPFiZdzVvaf39kSaGk75COlohOQf2OuhLsL98h/N0wj+WHn4GcJdHAIFEjTDxGAJUIxy
         79FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=62h6uRc5/FuReu7rXAOF6mghumi9ejQXLtu8FgRmxU8=;
        b=F1IogyJ2AnPil4cbrsLlouInca4PdReuEqCXVxLo9FP7Bo+wSxQjeTnPG/PzgpLBKU
         peAr7GLtf1nVBCUYBcN8KuuUifR0WwWGsFzCV93PXlowu+MSrDrzSk28Ykb9JrmuCA71
         csajkBhLayTdtKM+SNGOjb7lMzrW2mE+uOvJymkJpQTng9ZMmDRJ3bgaqRpPcPeMQfLd
         SYM/4I0q7GDIzZor5W/KfE8N7qNqDEDaZcS0aJFu6ADcIxjsQr5buSulZi5egH6mrpj0
         g3KgNCL9OqCEHvAajGS6C16eDtRuHH4YyN0Kwr0L7Zo3D2IQmz0eaCYjmCGgqUBe6tYN
         4TbQ==
X-Gm-Message-State: AOAM532hQQPfb/OCuUsc9aa3GmQ7h2vU/loQNygFCf0/PoURwraf83cm
        ODIuJDnuH5ShyHW+imSAKi/cEg==
X-Google-Smtp-Source: ABdhPJwbZ4MFzQnE2KhOZmlaTFeYifgvxwquhjmWF9xXEh68kV9BNfSrHhlOxApRZ5ymhRIbOWcW4Q==
X-Received: by 2002:a1c:a181:: with SMTP id k123mr17994280wme.90.1630052498920;
        Fri, 27 Aug 2021 01:21:38 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id y1sm5177725wmq.43.2021.08.27.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 01:21:38 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <deggeman@gmx.de>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 2/5] usb: isp1760: fix qtd fill length
Date:   Fri, 27 Aug 2021 09:21:09 +0100
Message-Id: <20210827082112.4061086-3-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827082112.4061086-1-rui.silva@linaro.org>
References: <20210827082112.4061086-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When trying to send bulks bigger than the biggest block size
we need to split them over several qtd. Fix this limiting the
maximum qtd size to largest block size.

Reported-by: Dietmar Eggemann <deggeman@gmx.de>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/usb/isp1760/isp1760-hcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index b3a55c5d2155..fba21122bb00 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -1829,9 +1829,11 @@ static void packetize_urb(struct usb_hcd *hcd,
 			goto cleanup;
 
 		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
-			len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
+			this_qtd_len = mem->blocks_size[ISP176x_BLOCK_NUM - 1];
+		else
+			this_qtd_len = len;
 
-		this_qtd_len = qtd_fill(qtd, buf, len);
+		this_qtd_len = qtd_fill(qtd, buf, this_qtd_len);
 		list_add_tail(&qtd->qtd_list, head);
 
 		len -= this_qtd_len;
-- 
2.33.0

