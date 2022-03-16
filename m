Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAFB14DB602
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357490AbiCPQVZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353824AbiCPQVV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:21 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C35A6D3B5
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:20:05 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 6so583155pgg.0
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DyBR7xQAXaZuPCsKjwy8hOfizYgRD0r3iSUyQaw9ZjA=;
        b=jhn9uT3vNcEu9losxG+d7dM3QdRDWlepsH67bgjyM8Ky6XAuv322MT2LlDBg3dHaqr
         aSPH6DDD3h75azSsFDacdD68wIBg2NscXWIoF4k12sj+UZbxQpBTCD6p1w3bOte733u9
         aYeNPTaGbSn1bAVKCivrrkHEuHSDVrvBtnXz6Jb+lBZnpZ/VUca9mfaxSSbxww3PIZoB
         Cxxq3XCn5o+RkoxDrlfJ8gHR7m1AbOIvrj/xmydWjw28E8EG8DhtBTsV5gLDRWSSSuJp
         ss+7I/xXZkVeGg6jkhkZo8+DdJQf31OUBGSG8Xjtl1H3oC14Y5uyZLlDggWg1T53OUf0
         xZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DyBR7xQAXaZuPCsKjwy8hOfizYgRD0r3iSUyQaw9ZjA=;
        b=ZBSe+jouy7NbzS8aF44fMv/jvyNI3DaSDHV1Sp56EcRtCgO5908iJVfJmNazwF9u/S
         nXkGj44OW1GG3oPPVkApj12myxSmCFwF2aAAnqNEtZPENL7OVIU35MgS1GMOpg0gdjRv
         Lt8ZCL0ipNg42qbx6s5/PfuBLMU7IjZyOblOg7q9rwrW27aSXArdhS90hzBpt0WppAKE
         lSL+ZnK6lM9h3+26kau1rdS3ecNMEPDgCm4wahNIrXD1WHS+Cyjt8MZddpEuMb+YDE5T
         7Mp13+KtM0mCcJG1eQN3zEHEqKLyG42qrPQXHEBeVEBhZ1q6yXSMh7xrJ/irpQVvnoAw
         boSQ==
X-Gm-Message-State: AOAM53189Gkhb8XoMyn6PTpHiuR/npC9yQnt9i9jzrr9c1w9A9e64tRD
        GFGddNJTPkF9yLK3yoPcP3E=
X-Google-Smtp-Source: ABdhPJyUNNE7RMdioIJ4wiJqv9RPC6cigkIriDE5GYZr3e0Vm8uXP0vz5B4uTLd40mg/fnQ7P3MhGQ==
X-Received: by 2002:a05:6a00:8cc:b0:4bc:3def:b616 with SMTP id s12-20020a056a0008cc00b004bc3defb616mr666031pfu.18.1647447604740;
        Wed, 16 Mar 2022 09:20:04 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:20:04 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v3 9/9] usb: rework usb_maxpacket() using usb_pipe_endpoint()
Date:   Thu, 17 Mar 2022 01:19:35 +0900
Message-Id: <20220316161935.2049-10-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220316161935.2049-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rework the body of usb_maxpacket() in order not to reinvent the wheel
and just rely on the usb_pipe_endpoint() helper function instead.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/usb.h | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 8127782aa7a1..653d34ff0999 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1971,19 +1971,7 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
 
 static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
 {
-	struct usb_host_endpoint	*ep;
-	unsigned			epnum = usb_pipeendpoint(pipe);
-
-	if (usb_pipeout(pipe))
-		ep = udev->ep_out[epnum];
-	else
-		ep = udev->ep_in[epnum];
-
-	if (!ep)
-		return 0;
-
-	/* NOTE:  only 0x07ff bits are for packet size... */
-	return usb_endpoint_maxp(&ep->desc);
+	return usb_endpoint_maxp(&usb_pipe_endpoint(udev, pipe)->desc);
 }
 
 /* translate USB error codes to codes user space understands */
-- 
2.34.1

