Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8A12722A4
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 13:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgIULgV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 07:36:21 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43665 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgIULgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 07:36:20 -0400
Received: by mail-lf1-f65.google.com with SMTP id y2so13581272lfy.10
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 04:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QeNREgn/VBFyeE24M7SC8hPxyEUzwzXz3H+WzHOfyA8=;
        b=L396xKC1E1IKeHA6Gk+i0JqY9AFOtA9HyBfpWp1qPmE0j8kkXHjnFu27B7IXpwQ/U5
         WHrxg+JwuGgM7T40//0svvfU0h0qtGmSeSgSwhrCF0iZmnjPlGIUfn4T5GLynyeky+nt
         fyjn22oi9K2iJ+H7BE4vHuNt2/dTjmE5Ye/gyxJ+1XrxxgTgnVOf0sGPIVc84x4A6RiP
         ltqrzXRYRPKEHLOTys7hMthdjU+Qggno46IbQBIUUZRH5Swcp8DZe4U7c0VNyw9hW3tp
         0EYRdYBQw2AMtt63cTSAiL6m24wkkz7zwXbdzhwWG0wST9Rh+p87zW1FlzLb/3hGuVJd
         FKBA==
X-Gm-Message-State: AOAM53071sTAnHWQvDO3bgYl1V7YCFp0D5FM3vVnHPY1c6rvo0emMGI5
        8tBTbNi22tAHWcp+FXSV5E/aHsKqH4U=
X-Google-Smtp-Source: ABdhPJyNVLRQzI97ecwBgfZ+VJ39XcfNVtbrzByEuP8eqyYGfQYGFUUUjMklj0sWNTAFJE6iEVYSBg==
X-Received: by 2002:ac2:4301:: with SMTP id l1mr14050269lfh.389.1600688178408;
        Mon, 21 Sep 2020 04:36:18 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id z10sm2497275lfa.10.2020.09.21.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:36:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@xi.terra>)
        id 1kKK79-0008OB-4S; Mon, 21 Sep 2020 13:36:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/4] Revert "cdc-acm: hardening against malicious devices"
Date:   Mon, 21 Sep 2020 13:35:22 +0200
Message-Id: <20200921113525.32187-2-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200921113525.32187-1-johan@kernel.org>
References: <20200921113525.32187-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This reverts commit 2ad9d544f2497a7bf239c34bd2b86fd19683dbb5.

Drop bogus sanity check; an interface in the active configuration will
always have a current altsetting assigned by USB core.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 7f6f3ab5b8a6..e28ac640ff9c 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1196,9 +1196,6 @@ static int acm_probe(struct usb_interface *intf,
 		return -EINVAL;
 	}
 
-	if (!intf->cur_altsetting)
-		return -EINVAL;
-
 	if (!buflen) {
 		if (intf->cur_altsetting->endpoint &&
 				intf->cur_altsetting->endpoint->extralen &&
@@ -1252,8 +1249,6 @@ static int acm_probe(struct usb_interface *intf,
 		dev_dbg(&intf->dev, "no interfaces\n");
 		return -ENODEV;
 	}
-	if (!data_interface->cur_altsetting || !control_interface->cur_altsetting)
-		return -ENODEV;
 
 	if (data_intf_num != call_intf_num)
 		dev_dbg(&intf->dev, "Separate call control interface. That is not fully supported.\n");
-- 
2.26.2

