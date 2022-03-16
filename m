Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1064DB5FF
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 17:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357515AbiCPQVY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 12:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357503AbiCPQVU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 12:21:20 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D126D4FA
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:20:03 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id s8so4360767pfk.12
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IYm0xrEfQCLBvqWht5ahAv+lSz1UlH3ACTq5MZ064P0=;
        b=XPyn+ehW9DJVy6/OCfscxNvpluITLGWmHyPV2yGdhxKZj+cGNPJD6bmzFPG0H1A1KA
         SzYZdnHljt9R6hYs1/holfNiSe19kbngdiQfdA63e3dJHEDvBjbclJOnFGQ3F9bFUs3+
         E6bVk5penW0Q3gfkx4tPctYcUe2AaVWYOeXDkYazQyS+oOzgn6GvKexNz84MolqB763O
         EgyJhgV5Ee0BLVY+4KRDsoT1a8rPVeXaECU0bleqfhPEWuIQ5CHrF6lMNIofCOU5x6Zi
         nWbsG97HZQwDZod3LcCL8InlNWU4GTi/dYDA4uLjHxuKtJOgt33rSXr4n1xEr7nSvskR
         qN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IYm0xrEfQCLBvqWht5ahAv+lSz1UlH3ACTq5MZ064P0=;
        b=cvO+biF5KjINMF2Ifg6yUiy1Bf0HojPOBPG6wzz6vXm9mD0gEbw59sxTA1n4zxs+Zd
         wgRN2kufLfJ3Bo8b2sGAFJ/gXb2y3+wP9BUzw3MKKh1ZmZnanI8fpLatbAMiCvGTbZCn
         CyAZOyKbnyUO21g/vg9EG8VP4iZR3L29iQXYvROKsxFM3AeBBVSglUA7ZYlpRlU9iQjg
         NLFisHYx5q7BFNQ0dsqO6fTgpaoul4sDHsT76+ywXiMc65mK7sXsK9A3eE8BtuwIDhJ4
         t7CStQyO9qL+CxplRv7mlm5XKaiGAUkudLzbtrQYDVyrPeAUz7cb8hKkUD9v1qMuZ+Bc
         vJYg==
X-Gm-Message-State: AOAM530oyXq5OqldgkCUHEJM5y/zMWKylIKO4RXP+aCcM2pVp7MbwO6p
        8Mxeu4kHZiPB/mDCu+FR6wg=
X-Google-Smtp-Source: ABdhPJxSw66KA066WisllxvzlMHJzvlUAx13tD6dGHd9tOHqOc4DSxYZtzr96Y8ElcTC3LdGKjZgtA==
X-Received: by 2002:a05:6a00:2485:b0:4f7:37cd:d040 with SMTP id c5-20020a056a00248500b004f737cdd040mr3500pfv.55.1647447603068;
        Wed, 16 Mar 2022 09:20:03 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id mt15-20020a17090b230f00b001bf191e6f08sm2988374pjb.9.2022.03.16.09.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 09:20:02 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v3 8/9] usb: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 01:19:34 +0900
Message-Id: <20220316161935.2049-9-mailhol.vincent@wanadoo.fr>
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

Now that all users of usb_maxpacket() have been migrated to only use
two arguments, remove the third variadic argument which was introduced
for the transition.

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 include/linux/usb.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 572e136f6314..8127782aa7a1 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1969,8 +1969,7 @@ usb_pipe_endpoint(struct usb_device *dev, unsigned int pipe)
 	return eps[usb_pipeendpoint(pipe)];
 }
 
-static inline u16 usb_maxpacket(struct usb_device *udev, int pipe,
-				/* int is_out deprecated */ ...)
+static inline u16 usb_maxpacket(struct usb_device *udev, int pipe)
 {
 	struct usb_host_endpoint	*ep;
 	unsigned			epnum = usb_pipeendpoint(pipe);
-- 
2.34.1

