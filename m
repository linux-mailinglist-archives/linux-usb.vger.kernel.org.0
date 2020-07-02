Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B95C2126D9
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbgGBOsd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:48:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730021AbgGBOqy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:54 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D31C08C5C1
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:54 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f139so28292247wmf.5
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LuydmHRHncRiKpEKLiFPz7smS3ISdpVCQYiyoW4VCQc=;
        b=cIkTP97Ltc4F26LRPd0k0vH8rCSPhi/svFlkgm7iKd4rUBiebH/6UsCDSQMTEs+DqV
         DP49K7VEoXDEQN+3y9DARzbaESZ5W1uuHqmbciLtfPHolTD+ucYN8BVDgQfyKWGbO6HD
         756KA9mM2iutxpw1ZJI7PuolhFV1232juQjtiTlEXKWJP33njo4EmHVOVLegPykn9Pat
         y/0yk4CPL7Cso65VaaRKexs5m2cpIXhiY2futiEY2jISvBCohLLdgn/Euz4eV2lRNfKB
         qHTdgXFbJnl4A+V4gHCMnLhhvAb2xZkinyaYH5F3rAEh7Tim5eHnqwp8tci0JCnaHOvh
         saCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuydmHRHncRiKpEKLiFPz7smS3ISdpVCQYiyoW4VCQc=;
        b=mUGh4wOQ0EkDRbE4kRXrkrDUSeI9aGsasAGkIA4JrTxm+HF4qb62TKLvtMHbfjnD0C
         xHAwoIY8CqeUr+pvRB76B6GnRVDzeKpZ6XmNgBLqQXy1MtQs187PbZKTtg98oIKp8FFr
         YrWDSA/GZHlvSXypfNOay9QBnSzhKiCOONMXZrUiSZNA28h21mWMhwOxyeNoxmj0KKaN
         bR5jKDDaFwQPuMc0Q0X7icqbxgW4bfGpOV6AZA6mAU/Og9TD7SGoihFMQOFdwLHtJke4
         WD/wO3bGW1Mv3gMkfKKReYOzRM/YOdBq8UqeOCLmkRAiv4Q+RYGA9aZAa3z5pt8eiGtN
         KLaA==
X-Gm-Message-State: AOAM533+NfDMt98QoPQVwDsk1FC0UQMBlF/5IyKdB42UrexnJ2dHyXS9
        cPJGxLCpVM7grlW7e8VNIqi8Vg==
X-Google-Smtp-Source: ABdhPJwt4BB5QN+0+VYuAyZoPm9sDJXGV16TynQZBiUxLCJhmyDebIEU0rFkq/UKkGjxIQm03YHAJA==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr20867799wmc.117.1593701213215;
        Thu, 02 Jul 2020 07:46:53 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:52 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Pawel Jez <pjez@cadence.com>, Peter Chen <peter.chen@nxp.com>
Subject: [PATCH 17/30] usb: cdns3: gadget: Fix a bunch of kernel doc issues
Date:   Thu,  2 Jul 2020 15:46:12 +0100
Message-Id: <20200702144625.2533530-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Mainline misspelled function argument descriptions.  Also one
formatting issue with a missing '@' identifier.

Fixes the following W=1 build warnings:

 drivers/usb/cdns3/gadget.c:653: warning: Function parameter or member 'priv_ep' not described in 'cdns3_wa2_descmissing_packet'
 drivers/usb/cdns3/gadget.c:653: warning: Excess function parameter 'priv_dev' description in 'cdns3_wa2_descmissing_packet'
 drivers/usb/cdns3/gadget.c:1088: warning: Function parameter or member 'request' not described in 'cdns3_ep_run_transfer'
 drivers/usb/cdns3/gadget.c:2574: warning: Function parameter or member 'priv_ep' not described in '__cdns3_gadget_ep_set_halt'
 drivers/usb/cdns3/gadget.c:2574: warning: Excess function parameter 'ep' description in '__cdns3_gadget_ep_set_halt'
 drivers/usb/cdns3/gadget.c:2595: warning: Function parameter or member 'priv_ep' not described in '__cdns3_gadget_ep_clear_halt'
 drivers/usb/cdns3/gadget.c:2595: warning: Excess function parameter 'ep' description in '__cdns3_gadget_ep_clear_halt'
 drivers/usb/cdns3/gadget.c:2898: warning: Function parameter or member 'priv_dev' not described in 'cdns3_init_eps'
 drivers/usb/cdns3/gadget.c:2898: warning: Excess function parameter 'cdns3' description in 'cdns3_init_eps'
 drivers/usb/cdns3/gadget.c:3210: warning: Function parameter or member 'cdns' not described in 'cdns3_gadget_init'

Cc: Pawel Laszczak <pawell@cadence.com>
Cc: Pawel Jez <pjez@cadence.com>
Cc: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/cdns3/gadget.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 5e24c2e57c0d8..bfb1cbd492892 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -644,7 +644,7 @@ static void cdns3_wa2_remove_old_request(struct cdns3_endpoint *priv_ep)
 
 /**
  * cdns3_wa2_descmissing_packet - handles descriptor missing event.
- * @priv_dev: extended gadget object
+ * @priv_ep: extended gadget object
  *
  * This function is used only for WA2. For more information see Work around 2
  * description.
@@ -1080,6 +1080,7 @@ static int cdns3_ep_run_stream_transfer(struct cdns3_endpoint *priv_ep,
 /**
  * cdns3_ep_run_transfer - start transfer on no-default endpoint hardware
  * @priv_ep: endpoint object
+ * @request: request object
  *
  * Returns zero on success or negative value on failure
  */
@@ -2568,7 +2569,7 @@ int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
 /**
  * __cdns3_gadget_ep_set_halt Sets stall on selected endpoint
  * Should be called after acquiring spin_lock and selecting ep
- * @ep: endpoint object to set stall on.
+ * @priv_ep: endpoint object to set stall on.
  */
 void __cdns3_gadget_ep_set_halt(struct cdns3_endpoint *priv_ep)
 {
@@ -2589,7 +2590,7 @@ void __cdns3_gadget_ep_set_halt(struct cdns3_endpoint *priv_ep)
 /**
  * __cdns3_gadget_ep_clear_halt Clears stall on selected endpoint
  * Should be called after acquiring spin_lock and selecting ep
- * @ep: endpoint object to clear stall on
+ * @priv_ep: endpoint object to clear stall on
  */
 int __cdns3_gadget_ep_clear_halt(struct cdns3_endpoint *priv_ep)
 {
@@ -2890,7 +2891,7 @@ static void cdns3_free_all_eps(struct cdns3_device *priv_dev)
 
 /**
  * cdns3_init_eps Initializes software endpoints of gadget
- * @cdns3: extended gadget object
+ * @priv_dev: extended gadget object
  *
  * Returns 0 on success, error code elsewhere
  */
@@ -3202,7 +3203,7 @@ static int cdns3_gadget_resume(struct cdns3 *cdns, bool hibernated)
 /**
  * cdns3_gadget_init - initialize device structure
  *
- * cdns: cdns3 instance
+ * @cdns: cdns3 instance
  *
  * This function initializes the gadget.
  */
-- 
2.25.1

