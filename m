Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 712685045B1
	for <lists+linux-usb@lfdr.de>; Sun, 17 Apr 2022 00:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbiDPWmF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Apr 2022 18:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbiDPWmE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Apr 2022 18:42:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C221137031
        for <linux-usb@vger.kernel.org>; Sat, 16 Apr 2022 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650148769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BpOVvGdiVmOkFc6Vxt31zxMLOJ/JVW56iU3zr83wB70=;
        b=bZTdoS/1CJ3gH0qA6kcUItAJ8WpoHWkUpnQiNoT04RQbmr5k60KWp978ih/t1I0OwnOjYl
        RCC7U2CWufrG5AJKgS59kkvboTlba+cpC28jnsWCGlJm4kePcYIW8LcQSS0+U1ejpqfQfz
        qDWNTack5zOvBYrmIfZfPxkX0GpPxBQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-pB0ixknnPLm0BknTSOcLLQ-1; Sat, 16 Apr 2022 18:39:28 -0400
X-MC-Unique: pB0ixknnPLm0BknTSOcLLQ-1
Received: by mail-qk1-f200.google.com with SMTP id bk23-20020a05620a1a1700b0067b32f93b90so7726589qkb.16
        for <linux-usb@vger.kernel.org>; Sat, 16 Apr 2022 15:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BpOVvGdiVmOkFc6Vxt31zxMLOJ/JVW56iU3zr83wB70=;
        b=LhLSssiXLM7Tj5rfD/0NPqvzisW+mhndW8F8k65pgaimyshbaSQjXV4k9nZw7Jc4KZ
         XcDVyPYEeosBT+O/sXP9/e8tuCqowKeHHp0nU2s0g70O9QG6ww8vZ+jZPs1zVsaLElrR
         rZBXIJfjeAClXzLpklmlDsgJtXbyXISv4j8hA5au1rOVhrr2hsO4i2uTgpU3UYXMoSVJ
         LqT8UO/GN74WwjhmPFWb0TjOjJ+b7OFdla0Pg4kXM063i2ST1Ys8U+8OVRXm5fvFgfnU
         NhwZKZ2bKl5rhZQUs3JkRrNj42O+EfitktxuH6rOJr3ojkD5IZC6mzrllrpUyXikKjHi
         TdVg==
X-Gm-Message-State: AOAM533blUrOwU3z+JthsLREBptxTMYvXG9W0ICbhOuDQYRYGv8jx3aL
        0CSjLYzOlaH49zByxgosU0gA92m9p9sOJQTU1NTxZWXlNSTYBjrGSWjRSlA3RqF1NfE9LtJhrhO
        oEWMTc4nkTQik9VHR+ffp
X-Received: by 2002:ae9:eb87:0:b0:69e:75b3:6527 with SMTP id b129-20020ae9eb87000000b0069e75b36527mr2243517qkg.386.1650148768198;
        Sat, 16 Apr 2022 15:39:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDR9RLRp+qTWzVkbCtfQ9U7EuTs1Feo7WIWOwOFw1MB385IjzG7j183dip8VZh/DlKz9M7Wg==
X-Received: by 2002:ae9:eb87:0:b0:69e:75b3:6527 with SMTP id b129-20020ae9eb87000000b0069e75b36527mr2243503qkg.386.1650148767997;
        Sat, 16 Apr 2022 15:39:27 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 8-20020ac85948000000b002e1cd3fa142sm5346012qtz.92.2022.04.16.15.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 15:39:27 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, waynec@nvidia.com,
        rikard.falkeborn@gmail.com, zhangqilong3@huawei.com,
        jakobkoschel@gmail.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: gadget: tegra-xudc: clean up comments
Date:   Sat, 16 Apr 2022 18:39:21 -0400
Message-Id: <20220416223921.2881719-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Spelling replacements
cancelled to canceled
endpiont to endpoint
Compliance to Compliance

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d9c406bdb680..0aaf01e1551f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1330,7 +1330,7 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
 	bool pcs;
 
 	/*
-	 * Clear out all the TRBs part of or after the cancelled request,
+	 * Clear out all the TRBs part of or after the canceled request,
 	 * and must correct trb cycle bit to the last un-enqueued state.
 	 */
 	while (trb != &ep->transfer_ring[ep->enq_ptr]) {
@@ -1343,11 +1343,11 @@ static void squeeze_transfer_ring(struct tegra_xudc_ep *ep,
 			trb = ep->transfer_ring;
 	}
 
-	/* Requests will be re-queued at the start of the cancelled request. */
+	/* Requests will be re-queued at the start of the canceled request. */
 	ep->enq_ptr = req->first_trb - ep->transfer_ring;
 	/*
 	 * Retrieve the correct cycle bit state from the first trb of
-	 * the cancelled request.
+	 * the canceled request.
 	 */
 	ep->pcs = pcs_enq;
 	ep->ring_full = false;
@@ -1434,7 +1434,7 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 		return 0;
 	}
 
-	/* Halt DMA for this endpiont. */
+	/* Halt DMA for this endpoint. */
 	if (ep_ctx_read_state(ep->context) == EP_STATE_RUNNING) {
 		ep_pause(xudc, ep->index);
 		ep_wait_for_inactive(xudc, ep->index);
@@ -3423,7 +3423,7 @@ static void tegra_xudc_device_params_init(struct tegra_xudc *xudc)
 	}
 
 	/*
-	 * Compliacne suite appears to be violating polling LFPS tBurst max
+	 * Compliance suite appears to be violating polling LFPS tBurst max
 	 * of 1.4us.  Send 1.45us instead.
 	 */
 	val = xudc_readl(xudc, SSPX_CORE_CNT32);
-- 
2.27.0

