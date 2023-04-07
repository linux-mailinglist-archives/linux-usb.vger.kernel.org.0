Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DF46DA7E3
	for <lists+linux-usb@lfdr.de>; Fri,  7 Apr 2023 05:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbjDGDHv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Apr 2023 23:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbjDGDHt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Apr 2023 23:07:49 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E678683C0
        for <linux-usb@vger.kernel.org>; Thu,  6 Apr 2023 20:07:47 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-19f3c240c17so567385ad.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Apr 2023 20:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680836867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jny1t4aP2MW1cAWhzQxvg7zKF2Kee9upIHXowqdJtzI=;
        b=j/Ti1ynqQJNmTjDS+d8GP8j7a8fO3W54VaSvCYm3y57BC/lIFchkeRUCVUYrIMTz5S
         bAKFNhZJbMxSySvVJlESv83ufYCSMUuekE6UbVGXTh1OahC9umRU7s0B1eyaGNiIZBk0
         taAjAjGptagveCpB9A7MGpqhnUgzcC5yzUzQB84ERisnVvExLmxDvlD5A7z53ptFrz+X
         rpudp/J10VHnWYkam4OcMttS9ISDPZPtOxso3bOaj5tfQ4s1J7XGjQdvc9LkNHp5P0c6
         o9SiGkeflfe8Hk1Z/NCKiqsn9NS4IaGDR1BYjCz3KM+Aflx6Kxu338navntTFKn3kgwW
         SM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680836867;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jny1t4aP2MW1cAWhzQxvg7zKF2Kee9upIHXowqdJtzI=;
        b=J35rAV6oonb3Ux5VIb2BagXPfrblxeQs0qfqCThEcoVIp/GAWtZpatan7Fb+aP5Y3J
         /OcBCDqzGwzM4oAjPeWQTyi3tJku3Sm11rhJXywjPQ3SIoFNGrVDgj/ju8VEu1EaKqSD
         OyWSYsitE3flMjmmAQl2epWWuLQiwtxIfTqpJWaZjvjyax++0Pp8vQhGWIsM3RCqPlT1
         Eg5C8xecJHSAxdOoTXV6rGK+90TJEIRv8Xhu+QdmW0zvS1rRJSVFvRgqlvzgqqdfSS68
         Trk1f9Vnl/UWLucUnMqZ9G2Zs9gQd3CHbT3sazM1dNXGwSUAQlJ/exZSTNzGRyItZgo7
         BHOw==
X-Gm-Message-State: AAQBX9ehOGf5euAqopbTKSwzkIkesJjXc4IsGSm5RIs5dAadYFxJ5IWG
        b6nqiY/DJmQirzpLyB5D8qqcpFg1fuE=
X-Google-Smtp-Source: AKy350be1sEOh+6M9aqy+ybtuS/GmMLhzFo2do49rnvExQ4KURt72bS44XslbPlz6c9YKbR/Cb+UhCPaBCE=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a05:6a00:2da9:b0:625:cda5:c28c with SMTP id
 fb41-20020a056a002da900b00625cda5c28cmr570625pfb.6.1680836867446; Thu, 06 Apr
 2023 20:07:47 -0700 (PDT)
Date:   Fri,  7 Apr 2023 03:07:41 +0000
In-Reply-To: <20230407030741.3163220-1-badhri@google.com>
Mime-Version: 1.0
References: <20230407030741.3163220-1-badhri@google.com>
X-Mailer: git-send-email 2.40.0.577.gac1e443424-goog
Message-ID: <20230407030741.3163220-2-badhri@google.com>
Subject: [PATCH v4 2/2] usb: gadget: udc: core: Prevent redundant calls to pullup
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        colin.i.king@gmail.com, xuetao09@huawei.com,
        quic_eserrao@quicinc.com, water.zhangjiantao@huawei.com,
        peter.chen@freescale.com, balbi@ti.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_gadget_connect calls gadget->ops->pullup without checking whether
gadget->connected was previously set. Make this symmetric to
usb_gadget_disconnect by returning early if gadget->connected is
already set.

Cc: stable@vger.kernel.org
Fixes: 5a1da544e572 ("usb: gadget: core: do not try to disconnect gadget if it is not connected")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v3:
* none
Changes since v2:
* none
Changes since v1:
* Fixed commit message comments.
---
 drivers/usb/gadget/udc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index af92c2e8e10c..1c5403ce9e7c 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -703,6 +703,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
 		goto out;
 	}
 
+	if (gadget->connected)
+		goto out;
+
 	if (gadget->deactivated || !gadget->udc->started) {
 		/*
 		 * If gadget is deactivated we only save new state.
-- 
2.40.0.577.gac1e443424-goog

