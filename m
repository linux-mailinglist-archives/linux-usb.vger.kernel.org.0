Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6896D1DF48E
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2020 06:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgEWEPT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 23 May 2020 00:15:19 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:36036 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEWEPT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 23 May 2020 00:15:19 -0400
X-Greylist: delayed 524 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 May 2020 00:15:18 EDT
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49TVCt3Ltgz9vfWP
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2020 04:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id snXNKMWHeiSf for <linux-usb@vger.kernel.org>;
        Fri, 22 May 2020 23:06:34 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49TVCt1jS4z9vfWN
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 23:06:34 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49TVCt1jS4z9vfWN
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49TVCt1jS4z9vfWN
Received: by mail-il1-f200.google.com with SMTP id a13so10402291ila.9
        for <linux-usb@vger.kernel.org>; Fri, 22 May 2020 21:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=RPdQH9bGg+tp3swT8p0ZiImqN6KEu/f5mLVYnX6GO/Y=;
        b=D9AciJXYu9te3MKvvx3Vrxic0LSV8CCCRPUKc372vSJUR74/g7r4iI5p05cmFmQiV1
         ysD9JUQHj1V3nW7PBkdClcvvFOzfkukI+H5/F63kl3S8XVngYd1TjcLp4EV/7YgiGmuh
         uo5MdZE5z033J74M5bBWC2touXBVPuBzgR9oJE7gyag16qjY6KtWGtFioTwRC9NxbWgy
         YzygIediGgAyCuUjJIYD/xuOUZHf9Tfl/uNTgtYMGbHHZ2fWpeBI8g1cimwolvJ0O+HK
         3pgYjXnJzhY3wyi4xFJ2wdzP5JBh5tg82iEWrW9wBPR0o3w3jr6sx6ZsiNNQGEHaPVEV
         R1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RPdQH9bGg+tp3swT8p0ZiImqN6KEu/f5mLVYnX6GO/Y=;
        b=otZDGl6zXbjYab7RDNqnB+Rm30ysBRTHYSdMIWxsvRaeGIx+9ACqPlMdZ8ulkVvHYP
         nSJG45sO7ukRrblsrMdJKXS3wsFcnqEKRBd1eNiXP3NuAGJPHPadDZZ+G6Kc7jnAGPRF
         tFLnef4mNOPtxsd10o8ONuuxwK+dAh3MewknnhljDmsBH1RX5qyl480w9H9tlmh2lg/x
         Nx2I5I8zsr47m+cYIWSrL3kWujMriVkjiLCjad9PEKQvsbIkLNIpolmYQ2vct8jfmNh7
         +3soTU4J7D3NtxmEyvQNuhLLWjEjVPPsKxQ2JMVTw7SuU60Y7T/XWaWcoVcvi3g6N7fE
         Iecw==
X-Gm-Message-State: AOAM532g+oWj6zLmYWCF0hkmhbJst9X5gtYFHByBieCLyKgPKRVsie+R
        MNy8BBf38WsOmJoKZDsCsOEoBp2i/hSyLCi88S+lhqKMmr42cOPOu+OhViuJsEBt+MO4J27/bAQ
        WZ+5Rw8Gs2dvx8M0Qj1wDN3kE
X-Received: by 2002:a6b:6a13:: with SMTP id x19mr5654288iog.175.1590206793714;
        Fri, 22 May 2020 21:06:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAGpqevIbvr1Yy5SpRJxo3PF6hWA4iFFPC1HPZLor3MUhsp/FXd/t9+V6pzYTrUbk6nqQkKw==
X-Received: by 2002:a6b:6a13:: with SMTP id x19mr5654269iog.175.1590206793324;
        Fri, 22 May 2020 21:06:33 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id p1sm5435927ilq.67.2020.05.22.21.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 21:06:32 -0700 (PDT)
From:   wu000273@umn.edu
To:     balbi@kernel.org
Cc:     gregkh@linuxfoundation.org, clabbe@baylibre.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH] usb: gadget: fix potential double-free in m66592_probe.
Date:   Fri, 22 May 2020 23:06:25 -0500
Message-Id: <20200523040625.21888-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

m66592_free_request() is called under label "err_add_udc"
and "clean_up", and m66592->ep0_req is not set to NULL after
first free, leading to a double-free. Fix this issue by
setting m66592->ep0_req to NULL after the first free.

Fixes: 0f91349b89f3 ("usb: gadget: convert all users to the new udc infrastructure")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/usb/gadget/udc/m66592-udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index 75d16a8902e6..931e6362a13d 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1667,7 +1667,7 @@ static int m66592_probe(struct platform_device *pdev)
 
 err_add_udc:
 	m66592_free_request(&m66592->ep[0].ep, m66592->ep0_req);
-
+	m66592->ep0_req = NULL;
 clean_up3:
 	if (m66592->pdata->on_chip) {
 		clk_disable(m66592->clk);
-- 
2.17.1

