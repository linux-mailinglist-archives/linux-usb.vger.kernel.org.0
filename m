Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6014DBEE6
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 07:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiCQGGG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 02:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiCQGF4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 02:05:56 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7859CDCA8F
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:37:40 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id b188so4600189oia.13
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ceem6RmP/yEqjGNLoTEsmJ4aPRMMWZNmndo0Vukg9II=;
        b=Uh0pYOZ0PGTaA5tApNxJCok5Q0c5eO0syIRU2q354Kx2FYqXqS3HLNn3A2YY9ZeTLU
         5vwuslGlonqzGPngcr+DCrbVbvbHb3+URilfVGiXCKBFysFhCQzeGG/JKd/X1Uv1QPHC
         +Qpwfi8rB4pvGMNhTDWLXtROEOMlaYwyzNrSYmDTmqAXfavwiytTsS7YNpl6wf4+CLCY
         WdRlAcrnFlIyv5VVLLbMxPS0uhXQuts5qTHWg4re2BtsKOGFkZRq2vRyfewm3Q7zM//g
         aj5K2a6DWylFJvDs/GKpyUaTHKYhwQ+5TPubLWUEbsGTIgHfVcls6OOEyYS/AtdqKnU0
         gRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=ceem6RmP/yEqjGNLoTEsmJ4aPRMMWZNmndo0Vukg9II=;
        b=ZPvW/SRDSyDIGbO88DCvLm4ceWSogIYpQWWoZMunvglaDYG6jNhOgNZKnecF0buEUs
         z6spErKNQicQ1xxy15Fiy+KCeqKOfNCGagpLANrBd7fmh8JXSIx8/kfINHf/QnZ7bHCz
         CLKukr/dTYK0rrR/Lr6pndhyamX1vlHGMgf80gWWWW5qMdr6XHZIb8mffk6V0N3iFJxq
         XeLGOYCWoDQARU5QyxjjQPzUec3urNYSges+qNVdtMRE2nXg2jCnn964hxJZk5boepMt
         S0g2URct3KfZJlfAlIVMQhjEArti1DNN1UEIqUTMSnm2RXQBbnEV60hrJvBGyf1UJCTd
         gAtw==
X-Gm-Message-State: AOAM532UKC0K+h2pk2phIoqeRaLLdKJAIuDh+g9JZY43KGnIyMtjSIVi
        MOpw39gIeOteIF4PNtgV8QYSFOXUalU2qg==
X-Google-Smtp-Source: ABdhPJzFBH8+ijIomMbZc5BqEdet4RmW3hQyc7e4TumYZZ90DTAH8P5feGg76Fpkamg1aSrh9AVqnA==
X-Received: by 2002:a17:90a:5797:b0:1bc:56a9:f6c8 with SMTP id g23-20020a17090a579700b001bc56a9f6c8mr13853390pji.12.1647489350433;
        Wed, 16 Mar 2022 20:55:50 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:49 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v4 9/9] usb: rework usb_maxpacket() using usb_pipe_endpoint()
Date:   Thu, 17 Mar 2022 12:55:14 +0900
Message-Id: <20220317035514.6378-10-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
 <20220317035514.6378-1-mailhol.vincent@wanadoo.fr>
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

Rework the body of usb_maxpacket() and just rely on the
usb_pipe_endpoint() helper function to retrieve the host endpoint
instead of doing it by hand.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/usb.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 8127782aa7a1..60bee864d897 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1971,13 +1971,7 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
 
 static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
 {
-	struct usb_host_endpoint	*ep;
-	unsigned			epnum = usb_pipeendpoint(pipe);
-
-	if (usb_pipeout(pipe))
-		ep = udev->ep_out[epnum];
-	else
-		ep = udev->ep_in[epnum];
+	struct usb_host_endpoint *ep = usb_pipe_endpoint(udev, pipe);
 
 	if (!ep)
 		return 0;
-- 
2.34.1

