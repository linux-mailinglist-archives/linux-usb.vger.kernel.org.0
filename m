Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7CA552B37
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 08:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346086AbiFUGmt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 02:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346052AbiFUGmr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 02:42:47 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3226C1A813
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 23:42:47 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso773377pjz.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Brv0A33+OmHjorNQMxUqaD7c2sxIUHjXjQVCZiQWEVc=;
        b=CKViii4njBXytnctH1RCE0GVYfNRUG60FhAXsuFVF8t6bdShZV+1rOO/PCxb3bJsoo
         +rg1q8+5ZujMsa9oGR6l3ddN0B7iyI9Ru7/jEJ0h5iJixbaRjiH4pr2qHg5eroydnukf
         r+5vLVfoVvn9l1gSg9TPKzu8Uo90pIy6IcOhsSKepzk8JyuRe/XVpMAc/ZpAZ95KIUIu
         9GcgbWO7j2sNfxFmnaGUznc/QVK31KPjWw8p8ZGBaRlC3IpZHYwGzNuVEZL+4hqIDroA
         Q0hLuP5I+6OXyqkNVj8SbO7IELcr8T0SdTmuKOxLY9NJUiJEkrs7Q8V6FSEtyw9oUoru
         XVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Brv0A33+OmHjorNQMxUqaD7c2sxIUHjXjQVCZiQWEVc=;
        b=zo2PkMAL6A3Qk15ACARC9IEOHEooPwwbVjRZFmJTweMXVb5vOnjzImaX642i1ge7VK
         0X4T+aCWxy1BceUKnCw6b7iQA6qdaIMm03l5bbfiERji1lNXFetyS0JhovkhCn/RPMsJ
         lNgY9Ha6kjMwoa1LVB7bDaqWW7Aj+J7PWgglLygXxg5CBA2PSDgFSrsqH4YcKDaLdQXZ
         9miz70nxBZzw4yJBNEiMMqcBc73aVfi1qkJa4KNHfvrIdru8HW4O/CTmPfts3WigOus/
         n0U5T7phgJlbnTQg7aRWkR28zoW2vZF9VXxTeYw70uhzy1bcb2u+tnijekpKAvHpj3AA
         h66A==
X-Gm-Message-State: AJIora+RhbJoaV7zQILpOfYMbuxvHXolxaE9HplcJsLtS5riR994FG/w
        2VqoTTs7LAy/jwDzRCnm5Hzpb2Et3xDyAQ==
X-Google-Smtp-Source: AGRyM1ufL/dCME5fwjYyoFxEWGtD1uViiylA7Vl+Blg8QVrpLFyINA8gjRlVED3RcQMohNyHy+psyA==
X-Received: by 2002:a17:90a:5509:b0:1ec:caf4:b327 with SMTP id b9-20020a17090a550900b001eccaf4b327mr1917773pji.129.1655793766610;
        Mon, 20 Jun 2022 23:42:46 -0700 (PDT)
Received: from ubuntu ([175.124.254.119])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709026f1600b0015e8d4eb2c0sm9754260plk.266.2022.06.20.23.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 23:42:46 -0700 (PDT)
Date:   Mon, 20 Jun 2022 23:42:42 -0700
From:   Hyunwoo Kim <imv4bel@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-q: Fix
 ehci_submit_single_step_set_feature annotation typo
Message-ID: <20220621064242.GA698757@ubuntu>
References: <20220620213621.GA694104@ubuntu>
 <YrFfmEeaxbbhxK0p@kroah.com>
 <20220621062925.GA698414@ubuntu>
 <YrFmoyW3q2CPLpok@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrFmoyW3q2CPLpok@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

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

Send it back without headers.
Sorry to bother you.

Regards,
Hyunwoo Kim.
