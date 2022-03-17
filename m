Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAC94DBF01
	for <lists+linux-usb@lfdr.de>; Thu, 17 Mar 2022 07:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbiCQGKj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Mar 2022 02:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiCQGKZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Mar 2022 02:10:25 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B55628BC0E
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:48:23 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id 13so3518002qvq.8
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 22:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IYm0xrEfQCLBvqWht5ahAv+lSz1UlH3ACTq5MZ064P0=;
        b=Asb/OGG6z6LgqCY1/QHCrenmF+fttJgehUYa8spTVlahGvRUcdCQScStm+FdZnX4OL
         zHfH5cRL5beGgYV7dFniAO88x9LF0aBZ7KJA7/MgVpVvY2qaweXcmQvTyBieQ55Jjx9H
         KclR20Dffv3dnW43HsdT2p1YducpRqmY8xWxgsMe0f0ojeciebrp7NFoKe+yeKPpKBSB
         iPHZa8N7PEDwR2oFG3egBnH4eKWB2faaaE/p6eqbrXyATFmCHmcaDK8EUjmT0ZxVGQTe
         liOgpfps43Sv2Hhj3vwk6XI0kJYYMEkDWcNzyVtegbc3K5ZUxsV04WpWQ+q3UZerxlph
         SFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=IYm0xrEfQCLBvqWht5ahAv+lSz1UlH3ACTq5MZ064P0=;
        b=Iz4JuycmJ2q2wxy55bKbvYNj+wW7CW3Mjk+/M0uWRda1emhy0MyXm4/5/OtLbdhgVT
         Nc53LODtKt1lastUa8HYPR+LFNouL/8x/PKZtJ2ecaeah5tLSHOcoPWcXcd77pevxuUQ
         zatI0xTWhPCOpdJNq+l4e3c/whLQfyi7ztmfa7lSsL0drHtUQazlYwER2jD62FsrxDdt
         1J4VGZUM8FMyol1YalGKf2JVvbQ5sCn/r/HC7EBBhqubR4Dst9YLGbSQv4qTI11i8miR
         6jLBccib7dJ/rNRWWYz4/jmkDfXRmiGi8wrZ9teyF4WcARJZnIl/PmctMHt/wZFAamUC
         cuAw==
X-Gm-Message-State: AOAM531Lq60t7aO5bkoNnlrSLWfQvJzwCqiJ/yNIInhWY9iXgqGrHc4L
        j411cuesKnplMi2YQWTx6+7FpnW1NGUZuQ==
X-Google-Smtp-Source: ABdhPJy7B32pblCApiKkAOzLiApuuudNBtu1mpTgziskeRiR46aXmlZBLe6vmSdCGysgqjRkPinmDw==
X-Received: by 2002:a17:903:1206:b0:151:7d67:2924 with SMTP id l6-20020a170903120600b001517d672924mr2635105plh.45.1647489348716;
        Wed, 16 Mar 2022 20:55:48 -0700 (PDT)
Received: from localhost.localdomain (124x33x176x97.ap124.ftth.ucom.ne.jp. [124.33.176.97])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b004f78e446ff5sm5096734pfv.15.2022.03.16.20.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 20:55:48 -0700 (PDT)
Sender: Vincent Mailhol <vincent.mailhol@gmail.com>
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [PATCH v4 8/9] usb: remove third argument of usb_maxpacket()
Date:   Thu, 17 Mar 2022 12:55:13 +0900
Message-Id: <20220317035514.6378-9-mailhol.vincent@wanadoo.fr>
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

