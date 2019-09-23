Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0999BBADBC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2019 08:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392986AbfIWGT2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Sep 2019 02:19:28 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38041 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387519AbfIWGT2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Sep 2019 02:19:28 -0400
Received: by mail-pl1-f193.google.com with SMTP id w10so6071902plq.5;
        Sun, 22 Sep 2019 23:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=FSU3MCvvt9SrOU32tQpypF1CMyN3s1bm+uJH59p32aY=;
        b=ZPwhE6tq7L7rs/uK0vuocCdJgByTMGMK1EAUq1Y0mIYVlskNVj6iHq3yFh4mQEBrZj
         WAiyR1oQ324og5pZ+cMhhpKCuam4pYdKRoQ/WCmjoKEqT+8YUU9sMbc4RiaDP1Is9svq
         KEd0G4sM/TWCZklEF8Idu51AYcO+lQ7hv2x4inI/rJvclrkNNTyXZBfw3cpxwMjR+Fzf
         38wS800TRO9ExSZb8SRvkBgTLOPvEHlUockUU8QmyRVe5KX4vRukouToA6EUCuw49uX6
         bxQv13gPJpe6tFxI3mCfcfWGZqALAiSoytQISAJsTwXwtmjN/Wvy7FVyMDoJAjJ3w5R1
         8GpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=FSU3MCvvt9SrOU32tQpypF1CMyN3s1bm+uJH59p32aY=;
        b=XgvIkIlk/mbN9e17lzJ3DhAKiZxXzJeCoEYOwI1td13MRagyzLdWLc2mw5lDv6nzzY
         vjhp6hjQuvY05IhmYMxydkVam+aPxwgm8apM1rT6ZtS2l26xgcM9wre4jX7swqCXfrgU
         srLcjR6wK+1DVOYkTuLpgTZWKRWD/XkiiZyIb4ZZXbY0nYLQOKxU8eXSZwT1kyFMpv0S
         5Q/46FiN7yxdiV8Sr7VkLvmWMoeI99BuBPjKRy7KC4wYvBg2xQMacd4NFpZXySEvAuAI
         pd2YgfFS2U86qXs/Ye1LqU8S8aAkaN+AoV85WDSwpJjQKgF6gXbB4GyXxU+6iINCvkUm
         WRiw==
X-Gm-Message-State: APjAAAVTkGeSWPAybsnY48RTXOPWf+TlttqZd5FSojlWnA5bdtOpUGR1
        lkicAxBUvf2NWtSpcAuGD18=
X-Google-Smtp-Source: APXvYqyC9GR0HpqS1gazmVx6n9bnXrYlo3ryRDV7CQQb7hnDBkqBxMxarmAx0THEpENhY1/XW1/Zew==
X-Received: by 2002:a17:902:8ec2:: with SMTP id x2mr20728016plo.250.1569219567483;
        Sun, 22 Sep 2019 23:19:27 -0700 (PDT)
Received: from LGEARND20B15 ([27.122.242.75])
        by smtp.gmail.com with ESMTPSA id c127sm10975311pfb.5.2019.09.22.23.19.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Sep 2019 23:19:26 -0700 (PDT)
Date:   Mon, 23 Sep 2019 15:19:21 +0900
From:   Austin Kim <austindh.kim@gmail.com>
To:     gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mathias.nyman@linux.intel.com, Thinh.Nguyen@synopsys.com,
        nsaenzjulienne@suse.de, jflat@chromium.org, malat@debian.org,
        dianders@chromium.org, austindh.kim@gmail.com
Subject: [PATCH] usb: hub: Minor refactoring in usb_hub_init()
Message-ID: <20190923061921.GA96726@LGEARND20B15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Normally when creation of workqueue fails, exception handling takes place
after the call to alloc_workqueue() is made.

But looking into usb_hub_init() function, 'return 0' statement is executed,
when alloc_workqueue() returns valid workqueue pointer.
       if (hub_wq)
               return 0;

This might make other Linux driver developers get confused 
because they could deduce that this is exceptional handling routine.

So perform minor refactoring by adding NULL pointer dereference check
routine right after the call to alloc_workqueue() is made.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 drivers/usb/core/hub.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index e8ebacc..0ddbfe6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5530,9 +5530,12 @@ int usb_hub_init(void)
 	 * over to the companion full-speed controller.
 	 */
 	hub_wq = alloc_workqueue("usb_hub_wq", WQ_FREEZABLE, 0);
-	if (hub_wq)
-		return 0;
+	if (unlikely(!hub_wq))
+		goto err_workqueue;
+
+	return 0;
 
+err_workqueue:
 	/* Fall through if kernel_thread failed */
 	usb_deregister(&hub_driver);
 	pr_err("%s: can't allocate workqueue for usb hub\n", usbcore_name);
-- 
2.6.2

