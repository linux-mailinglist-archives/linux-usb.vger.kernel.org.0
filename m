Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44E7552AFA
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 08:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240339AbiFUG3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 02:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbiFUG3b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 02:29:31 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D1D2DEC
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 23:29:30 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id f8so11644638plo.9
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 23:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ieMMxNb32u8rqRkh889jVNDjEAgq9XUnyAud+zBRr1M=;
        b=fPtdpQtAF2e6GiiNsCecvCpMGf42X+WPLzZR8uiYj153wp6fBf04NR+NH+xgiWsXZ+
         CKGKQLRJAEeHelDi8b8sw643FOY9w8QyAzlVo3H8DBdW7IfDMMho5vXvRHqxDJ460q2O
         MdjCb+6rXlRp9RXkkze490uusMX9HYw4aRM6bLoQMc7DOT2StDwH6H/8TssggSOk4U6c
         +ah7uyZr9GWuQhUqBNhuGnfvTCR+C3F/PXyG5KzyuyqV0nxh4au4lSNhab6u45O5BexK
         4bpNcbAEnvCB17QysO5TBq4rFq6osyVB0ooNDceI4W2NRE29l92WvkaP0+TbAqgt/Xst
         rRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ieMMxNb32u8rqRkh889jVNDjEAgq9XUnyAud+zBRr1M=;
        b=6Llif14EB0H7Q8ebg6aB01APnqAORf14Hx6bpi0WSoxBixWmwulCI2wZeHJ04AV5Hq
         loGI/yZqM06wboZrPzEFd33eYTX5liqc/G2JMQg5nuyDd+KC7oXuLJf3fbz4K49We96X
         5fHDwZEM9m7Nf1tGsm12mK6fnbkFVJ4kOXKug1gB8z1v0gHx+0PxeOGEbN/oEuyg6pKu
         icQLOzmzE4LxR57PvQ6RXK41FOrqtjKQeIQ9x5HATPXHDrIT0JZcTquPfaUrqP2BICwn
         rc+WO+MP9otrnuhntEZsLbo8jMQuQw6xQkM16wYYMjAX2U2BSHgyvrFOY9tCyNyRRqSq
         K0BA==
X-Gm-Message-State: AJIora8p6zvSCPHT5sodSm4eO7E/KgCyVM2yzAthRt84phzLjkBed4S+
        03w4d01ofqXIOW8PCXtuISN9iiZFig9new==
X-Google-Smtp-Source: AGRyM1tgB7QIC+1mVVjGqZvp69wNiD7XQeDC1kItARUt6J/Xse0nyLTVyBYOegl+YFnJZvsiIQRRXQ==
X-Received: by 2002:a17:903:32d1:b0:169:6ed:afa5 with SMTP id i17-20020a17090332d100b0016906edafa5mr25231288plr.31.1655792969651;
        Mon, 20 Jun 2022 23:29:29 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id c11-20020a62f84b000000b0051844a64d3dsm10241847pfm.25.2022.06.20.23.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 23:29:29 -0700 (PDT)
Date:   Mon, 20 Jun 2022 23:29:25 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     Greg KH <greg@kroah.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-q: Fix
 ehci_submit_single_step_set_feature annotation typo
Message-ID: <20220621062925.GA698414@ubuntu>
References: <20220620213621.GA694104@ubuntu>
 <YrFfmEeaxbbhxK0p@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrFfmEeaxbbhxK0p@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From 3ba1bf7eb8e672fcd5be65080a265d3428d1303a Mon Sep 17 00:00:00 2001
From: Hyunwoo Kim <imv4bel@gmail.com>
Date: Mon, 20 Jun 2022 14:30:10 -0700
Subject: [PATCH] usb: host: ehci-q: Fix ehci_submit_single_step_set_feature annotation typo

I found the "argument" typo.
It seems that "argument" is more correct than "arguement".

Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 drivers/usb/host/ehci-q.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index 1163af6fad77..807e64991e3e 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -1162,7 +1162,7 @@ submit_async (
  * This is done in two parts: first SETUP req for GetDesc is sent then
  * 15 seconds later, the IN stage for GetDesc starts to req data from dev
  *
- * is_setup : i/p arguement decides which of the two stage needs to be
+ * is_setup : i/p argument decides which of the two stage needs to be
  * performed; TRUE - SETUP and FALSE - IN+STATUS
  * Returns 0 if success
  */
--
2.25.1

Dear Greg,

I'm sending the patch back because the greg email bot emailed me.
I don't think there was anything wrong with the patch format.
Did I receive an email saying my patch was in the wrong format because 
my patch was a minor typo fix and the description was too short?

I'm sorry if I did something wrong.

Regards,
Hyunwoo Kim.
