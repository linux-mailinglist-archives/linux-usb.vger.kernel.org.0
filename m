Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD2A250E164
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 15:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239562AbiDYNVH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Apr 2022 09:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232244AbiDYNVE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 09:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C57EC17E0A
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650892678;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=F2PgaWZZh6sxorKqqaB/dpK/JqPD+ZjSfvyBaKVztwM=;
        b=bePPznmE7vxx0lxQsq2wgXDmDnV2vjcJH9eaUzYlENAa4QR0VzN98vG3VMArU72yE0gJ9N
        3vV/FdPFZbz1lv/xjN8xp3MUjW2mqS6x6eqgdLtPLnLGVC84MdV4/TEamtVWYradx3qDAv
        yldGnkFgRSE7PDU+iJ4DfudPQb1n2WM=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-hISwHVKBN3mUdb1ZfzpqJw-1; Mon, 25 Apr 2022 09:17:56 -0400
X-MC-Unique: hISwHVKBN3mUdb1ZfzpqJw-1
Received: by mail-qv1-f71.google.com with SMTP id cy9-20020a05621418c900b004562be4402eso5196655qvb.6
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 06:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2PgaWZZh6sxorKqqaB/dpK/JqPD+ZjSfvyBaKVztwM=;
        b=kdKLeLC2/LyjqdTx2FVHXJ0DRU2KSORzjCSlP+mC1YuZB3YUNKmOrh2z+sMWgpxPbU
         YjBpJflKA6HlNSI8E1FM6Dwz/T1HZeBPP6IoyoH9Rv2EXYwO8F7BULzhE7gsgSv2LO1f
         kySPB7jov9MVW9grYR8C42xk73YkvA5pYoGk1JFncgvo+JFolV6Vk/yFjoJJIdqzb7A/
         +ZUJbi3Qz8B+FG6v09ca/11ZyQcNQID/68Zxgl2YH83tlMsoIdF5McS2sCHuBVcansPD
         gJ8IOt4LwhuSRRSZO6y07wB5PKOcycu28UGV6U3ZNxR+YUxKNEuCMx3DlCzgpKoN/6G9
         C5sw==
X-Gm-Message-State: AOAM533D2xOpUf9wx4JjABfxorAeHEHRUPeXcPwzry3Jslyr0zvqQFtb
        rq95UW93dQglM2fNCALBFFXT1mu4SzkDgDpsqtjMzL5LUizNPcvCFwK+RWEt8qVysLVOBu8sxs1
        pN7oYiiDmHEiNA0Dg5kHk
X-Received: by 2002:ac8:5352:0:b0:2f1:e912:f3f9 with SMTP id d18-20020ac85352000000b002f1e912f3f9mr11643247qto.296.1650892676072;
        Mon, 25 Apr 2022 06:17:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQgzBNN9rmG1bbdB9xJTi/6X6pUpJDRZnJCDr3FH5YDhQanwg1ClzbfkBLLRfQcVLFtYr26A==
X-Received: by 2002:ac8:5352:0:b0:2f1:e912:f3f9 with SMTP id d18-20020ac85352000000b002f1e912f3f9mr11643236qto.296.1650892675856;
        Mon, 25 Apr 2022 06:17:55 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i14-20020ac85e4e000000b002f364a81d79sm3084978qtx.4.2022.04.25.06.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 06:17:55 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        skhan@linuxfoundation.org, jakobkoschel@gmail.com,
        christophe.jaillet@wanadoo.fr, peter.chen@kernel.or,
        johan@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] usb: gadget: mv_udc_core: clean up comments
Date:   Mon, 25 Apr 2022 09:17:49 -0400
Message-Id: <20220425131749.1185511-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Spelling replacements
occure occur
reqest to request
acces to access

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/usb/gadget/udc/mv_udc_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index fdb17d86cd65..f0f8835ed1e2 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -758,7 +758,7 @@ static void mv_prime_ep(struct mv_ep *ep, struct mv_req *req)
 	/* clear active and halt bit, in case set from a previous error */
 	dqh->size_ioc_int_sts &= ~(DTD_STATUS_ACTIVE | DTD_STATUS_HALTED);
 
-	/* Ensure that updates to the QH will occure before priming. */
+	/* Ensure that updates to the QH will occur before priming. */
 	wmb();
 
 	bit_pos = 1 << (((ep_dir(ep) == EP_DIR_OUT) ? 0 : 16) + ep->ep_num);
@@ -1452,7 +1452,7 @@ udc_prime_status(struct mv_udc *udc, u8 direction, u16 status, bool empty)
 
 	req = udc->status_req;
 
-	/* fill in the reqest structure */
+	/* fill in the request structure */
 	if (empty == false) {
 		*((u16 *) req->req.buf) = cpu_to_le16(status);
 		req->req.length = 2;
@@ -2171,7 +2171,7 @@ static int mv_udc_probe(struct platform_device *pdev)
 		return -EBUSY;
 	}
 
-	/* we will acces controller register, so enable the clk */
+	/* we will access controller register, so enable the clk */
 	retval = mv_udc_enable_internal(udc);
 	if (retval)
 		return retval;
-- 
2.27.0

