Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0095339186A
	for <lists+linux-usb@lfdr.de>; Wed, 26 May 2021 15:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235152AbhEZNDM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 May 2021 09:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235009AbhEZNCo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 May 2021 09:02:44 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCAB8C061354
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id g17so816835wrs.13
        for <linux-usb@vger.kernel.org>; Wed, 26 May 2021 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jb3Z8YQiJXIHCxHdQR6bpLMBiPX+oY6Ogmx9bytHFZg=;
        b=EvVo2ectQ9owwKk7Y/bcDbUANdvrdyNy+Bo8qjqFPN3hp+p5tqnmM/ZTHRFkAxmnLu
         zRMLaMQaC8SRDnvDEnogMxECQqs4qqg6IYn2DvCApUTGlZ3affwRK6s5AOy9sMM3AWte
         iXZ3pJunIwEEVyZQSm2oZhCHBv/zx7xUE/R+L8mncIao6jvSe9AQD7J+JsnodmxYm7BK
         usoRyCRnDUAzPd/R5rD804KwHEkiFOEehttu9iGTfu0cNC6WInb59jHRQ6lFg6GnYjIg
         Pr/0mkTZVVctHsLZaF/mhred28d73fN41aOlzBh84Fy4MTTXJ06KHKe7CZ6loLEUV8Qt
         KoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jb3Z8YQiJXIHCxHdQR6bpLMBiPX+oY6Ogmx9bytHFZg=;
        b=UGLK5n44yTPODnv/fWN40lTg/7ZHwu7kHnEJp+ZNQyHsFGPf2eMFWM9ZkB88H2EtS0
         pwc3FF+TRw8fYPtjNeBBcFO6etR/Yn4fOL82jCZFPwbN4TnPGF05l14HnSSwq06Busn4
         IRU5TS1F8V61/mgdc2Q8Z2TDDcLR+uV1Yh6Bz3o/brdn+SowLljaFbq0lR/n9hhi8I1p
         4LY0JG4UPfC467oJ3jl4mQE8NqUwmzuFrT7iiKILztgWAPJOPSti8EDh1OPJC2DB2k3r
         jgYXS25T+X5KlhZTeh3iwAtUJD1xXw57dF/TN5fl+hxyyeP9WxXQXWW3PEyyM3ug8z58
         vggg==
X-Gm-Message-State: AOAM533L8y76qQ8EvztFxQBAiOYWrsh5PP/l3M3E8tBtAbqd2AlF6ELI
        655rGVwgqSpcK4ECug7IUo1O/Q==
X-Google-Smtp-Source: ABdhPJysJzaJHg8v6C+H+04qOo7HKqWB6dgXQTROFeTjTcAPu7ct9vscg3kahwp0hH5849vpbBzx9g==
X-Received: by 2002:adf:e411:: with SMTP id g17mr32218603wrm.402.1622034068386;
        Wed, 26 May 2021 06:01:08 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id y14sm6430036wmj.37.2021.05.26.06.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:01:07 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 21/24] usb: host: xhci: Move array of structs from the stack onto the heap
Date:   Wed, 26 May 2021 14:00:34 +0100
Message-Id: <20210526130037.856068-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526130037.856068-1-lee.jones@linaro.org>
References: <20210526130037.856068-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/usb/host/xhci.c: In function ‘xhci_reserve_bandwidth’:
 drivers/usb/host/xhci.c:2859:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/host/xhci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ac2a7d4288883..40ce4b4eb12ad 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -2773,7 +2773,7 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		struct xhci_container_ctx *in_ctx)
 {
-	struct xhci_bw_info ep_bw_info[31];
+	struct xhci_bw_info *ep_bw_info;
 	int i;
 	struct xhci_input_control_ctx *ctrl_ctx;
 	int old_active_eps = 0;
@@ -2788,6 +2788,10 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 		return -ENOMEM;
 	}
 
+	ep_bw_info = kzalloc(sizeof(*ep_bw_info) * 31, GFP_KERNEL);
+	if (!ep_bw_info)
+		return -ENOMEM;
+
 	for (i = 0; i < 31; i++) {
 		if (!EP_IS_ADDED(ctrl_ctx, i) && !EP_IS_DROPPED(ctrl_ctx, i))
 			continue;
@@ -2824,6 +2828,7 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 		 * Update the number of active TTs.
 		 */
 		xhci_update_tt_active_eps(xhci, virt_dev, old_active_eps);
+		kfree(ep_bw_info);
 		return 0;
 	}
 
@@ -2855,6 +2860,7 @@ static int xhci_reserve_bandwidth(struct xhci_hcd *xhci,
 					&virt_dev->eps[i],
 					virt_dev->tt_info);
 	}
+	kfree(ep_bw_info);
 	return -ENOMEM;
 }
 
-- 
2.31.1

