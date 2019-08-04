Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 985E880F79
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 01:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfHDXvG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 4 Aug 2019 19:51:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35015 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfHDXvF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 4 Aug 2019 19:51:05 -0400
Received: by mail-pg1-f195.google.com with SMTP id n4so3437155pgv.2
        for <linux-usb@vger.kernel.org>; Sun, 04 Aug 2019 16:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=olXaFrpEdLZqMN9JOoKWtdt/8Lm71+pOA/Ry/UvXsOQ=;
        b=ddOKAiNXHMr4nCfsp5eICF+uWxWzygdGJKtejR6ZCl70vV4OGbwTZ6ekly7OG3gEp8
         hx/EITziQELL7nvKEiMuPY3owI5Gya0NcQp2S2GatZJirt83BZUFXZj0lvkHYgYCunHv
         BVT0p243E1a3U/rXeUSpw5VeMN2PgJJsmOZmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=olXaFrpEdLZqMN9JOoKWtdt/8Lm71+pOA/Ry/UvXsOQ=;
        b=J2a/dkxQA2COkcaIjB32QugNhwn+ISXxiyrh36x0x+afr5oymaLyybF/HgNcUOL6j+
         rGGJA10iA2h3925XHCmtjv6QTtV2BSpE0+DrFh5e/GoCOM4zP1JLIcI5MK3W+QFm30LM
         vqJkfmR9Eu2fpnRh5qmtLn+16894PwF9HSuKehVmV3S8tHclbTMCQ1rdDMn1hiu8h5AB
         BdYfb/kGg70K5VE+O1OYQis+usKAckxnJk6eIzp8yXP6aCFVltyHBzjZ2YdTEzUaVRqF
         UBTe6+ruyIfCtWPKzqddI9CgtWcNQS2ZAJ3Yo34xBR3sNqMD9zdN1700AqVwZ/S9x4tm
         4RMw==
X-Gm-Message-State: APjAAAWiRWmeTWO8g6ZVYIwqXodgAp2n7Xte6lwMpEQuP+eHsJ3QS5KP
        pm06h3v8K9yhBAnJmS9X2lM=
X-Google-Smtp-Source: APXvYqx+FedGGxV46x4H4KqHSCl5xtvT7YUNXyZThOnyuFUP7CoEaCE2h/uxbYyc8XEiXDBw+vXmgw==
X-Received: by 2002:a63:484d:: with SMTP id x13mr133293793pgk.122.1564962665035;
        Sun, 04 Aug 2019 16:51:05 -0700 (PDT)
Received: from march.lan ([2601:647:4c01:5bf1::26f])
        by smtp.gmail.com with ESMTPSA id q22sm76434115pgh.49.2019.08.04.16.51.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 16:51:04 -0700 (PDT)
From:   gavinli@thegavinli.com
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        "Steinar H . Gunderson" <sesse@google.com>,
        Gavin Li <git@thegavinli.com>
Subject: [PATCH v1] usb: usbfs: fix double-free of usb memory upon submiturb error
Date:   Sun,  4 Aug 2019 16:50:44 -0700
Message-Id: <20190804235044.22327-1-gavinli@thegavinli.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Gavin Li <git@thegavinli.com>

Upon an error within proc_do_submiturb(), dec_usb_memory_use_count()
gets called once by the error handling tail and again by free_async().
Remove the first call.

Signed-off-by: Gavin Li <git@thegavinli.com>
---
 drivers/usb/core/devio.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index fa783531ee88..f026a0d54ce5 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -1789,8 +1789,6 @@ static int proc_do_submiturb(struct usb_dev_state *ps, struct usbdevfs_urb *uurb
 	return 0;
 
  error:
-	if (as && as->usbm)
-		dec_usb_memory_use_count(as->usbm, &as->usbm->urb_use_count);
 	kfree(isopkt);
 	kfree(dr);
 	if (as)
-- 
2.22.0

