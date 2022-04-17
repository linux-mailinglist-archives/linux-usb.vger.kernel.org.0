Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81E1D5047D8
	for <lists+linux-usb@lfdr.de>; Sun, 17 Apr 2022 15:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234137AbiDQNJ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 17 Apr 2022 09:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234110AbiDQNJ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 17 Apr 2022 09:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EF1913A191
        for <linux-usb@vger.kernel.org>; Sun, 17 Apr 2022 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650200838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2NwAEZe2oe/eBcVmeVKeLZ3JZbCLX6HoW7jxxZnMSXo=;
        b=hwxvI1UU1bYqjgBBBzEj7SFX+dPDBA6JE0tWVGICmrJuSAbGzILyvoCLM/2q2J1e8mo8Xc
        i/9J5sxgdK0Q1vGYLRDnib7lbi5XS65Sw0iGqf+moZW2Cw93QT535EUt7IfEX2v4MvgQAT
        +q+ne64kDIiLtQ99mc8ZJp117rpQI6I=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-itppMqwwNRipgSDN42tXNA-1; Sun, 17 Apr 2022 09:07:17 -0400
X-MC-Unique: itppMqwwNRipgSDN42tXNA-1
Received: by mail-qv1-f69.google.com with SMTP id f18-20020ad442d2000000b0044642dd1d7eso3216022qvr.3
        for <linux-usb@vger.kernel.org>; Sun, 17 Apr 2022 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2NwAEZe2oe/eBcVmeVKeLZ3JZbCLX6HoW7jxxZnMSXo=;
        b=MiLoLwoNNjGhcDXV733zGbgPN+wFyKE6kF4vdsRBJsVFXAjdAm38pD1ew90k4GCMdu
         5XAIP7TZ26vswoJ/A4amkSyJTpKMJ4S0crd2WLcNN6+Hv81+cPesHpxkTaPccfzlwRup
         RFxvDZ37CjbVO1qyPiykBMseNxJzOpcgwyOnLSzRPfLDOTTR+Mm1Hs3PXAlgVr6wrLMH
         Cyju6U8uZ0zHEuYbUXQfOBq6Vdhsq97SeTvCkuEtmODIrherQFoJK43ChCFEE4uYDOmv
         v3QZlX3HkmlWrRtysJXIu7r/gceOJ+dVklCrHXU/iX8G2m2xMi+oSbXpKnMj+1zPqRxS
         xxNQ==
X-Gm-Message-State: AOAM531hSN/c84HhJRC/Eqa99HmtkT9TNfMtMhzKRpAbtN9S4RyRtHWv
        zxCniAgRWeuOAVU+GWdUsuLq6yKXmmIFP6poQTaYOEjGKQLNTp6j7QR3bV8uHTVR96UsYxjYK9R
        L57JqxTY5F0tN7J2PZG1A
X-Received: by 2002:ac8:764e:0:b0:2eb:d973:50bf with SMTP id i14-20020ac8764e000000b002ebd97350bfmr4337877qtr.70.1650200837191;
        Sun, 17 Apr 2022 06:07:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrP2i7t47KIvWqNguloCZux/VuEEyEN1n3q2TYFEbHP5vZgWRTRM5xPvnuLycqPfDYW6jDDQ==
X-Received: by 2002:ac8:764e:0:b0:2eb:d973:50bf with SMTP id i14-20020ac8764e000000b002ebd97350bfmr4337853qtr.70.1650200836938;
        Sun, 17 Apr 2022 06:07:16 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id i136-20020a379f8e000000b0069c7f8b69b8sm4583861qke.82.2022.04.17.06.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 06:07:16 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, waynec@nvidia.com,
        jakobkoschel@gmail.com, zhangqilong3@huawei.com,
        rikard.falkeborn@gmail.com, chunfeng.yun@mediatek.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH v2] usb: gadget: tegra-xudc: clean up comments
Date:   Sun, 17 Apr 2022 09:07:12 -0400
Message-Id: <20220417130712.3932247-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Spelling replacements
endpiont to endpoint
Compliacne to Compliance

Signed-off-by: Tom Rix <trix@redhat.com>
---
v2: restore cancelled, fix commit log

 drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d9c406bdb680..6d31ccf6aee5 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
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

