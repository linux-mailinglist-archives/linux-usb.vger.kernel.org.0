Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3982DE24EC
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 23:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392028AbfJWVH3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 17:07:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44741 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392016AbfJWVH3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Oct 2019 17:07:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id q21so13666867pfn.11
        for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2019 14:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTdZZnlA7EABBBAHUknV0T6AXSDyE/LhNtrQ1WO3UbI=;
        b=XcUqdG2izYOn+mbHak6wx+UZELo+hDTuO/+fxjKpVKHu0vitTZdRpxSAWCiL288QOM
         Y4sQAcicvH5dezcg14hGy1Asu7I5ifDnXHph8pEEYigQaild/ZOsD1de9jXymX4iAo4U
         YtPkllEHsNkBl1XYV8p60uhU9i8FsE8WCeV/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hTdZZnlA7EABBBAHUknV0T6AXSDyE/LhNtrQ1WO3UbI=;
        b=dp9X8gOSGk5a1LF7mv/qH5cE9Z+rGcKaq2b19/Oz/ba+OHfr418bB33unSKvZnuP8/
         3IzJNqA/fq3Xuwlipgg39wUs4/2yFn60IkP3YCCmQvOgHBpY/BqPkW9GvhTB8YyrO53D
         YL/VKabLqYmYrXauw1oWPXmow2/QUXESUp3YNNW73C5go8EYaqBDlrNJzmwscTk81nyc
         QBpzydNKZ31I2hJPkMc5QsD8LBqLM/D1ajFE0vobmib17F+vAhahMje8FytKBXDJeA0X
         yTWnCXdqLLGCKZfqHwFPjqrHXdEr21b/9L+OYa1H0t0rgL6SOzD+b8Mp+0/7q0+EoccN
         3Yxw==
X-Gm-Message-State: APjAAAUx0T3L7xuFRQ88ZKFNWdA9Q/AriFYRLGc+lA+poO+m0RvuEVUu
        ZbPAObR8y0K2de1xqGDfsFxLmA==
X-Google-Smtp-Source: APXvYqxIMniSNwAkzc2lHxYvMbXHhVnLpxKHVTcbtv205RmdruWuesi6Yx4Fs/+BBpFofGh5PgQlew==
X-Received: by 2002:a63:3d41:: with SMTP id k62mr11959835pga.129.1571864848131;
        Wed, 23 Oct 2019 14:07:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id z12sm26529195pfj.41.2019.10.23.14.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 14:07:27 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-rockchip@lists.infradead.org, stefan.wahren@i2se.com,
        mka@chromium.org, Alexandru M Stan <amstan@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: dwc2: Fix NULL qh in dwc2_queue_transaction
Date:   Wed, 23 Oct 2019 14:06:31 -0700
Message-Id: <20191023140530.v2.1.I9850aab29e945168070b0a9c50c421d5485e7d97@changeid>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alexandru M Stan <amstan@chromium.org>

When a usb device disconnects in a certain way, dwc2_queue_transaction
still gets called after dwc2_hcd_cleanup_channels.

dwc2_hcd_cleanup_channels does "channel->qh = NULL;" but
dwc2_queue_transaction still wants to dereference qh.
This adds a check for a null qh.

Signed-off-by: Alexandru M Stan <amstan@chromium.org>
[dianders: rebased to mainline]
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
While testing a newer version of the Linux kernel on rk3288-veyron
devices we saw a bunch of crashes reported in dwc2_queue_transaction()
where chan->qh was NULL [1].  I don't know how to reproduce those
crashes myself, but I noticed that in our 3.14 kernel we had a patch
that probably fixed it.  That patch was sent upstream ages ago [2] but
never landed.  Here I've rebased the patch.  While I haven't
reproduced the crash myself, it seems fairly likely that this will fix
the problem.

[1] https://crbug.com/1017388
[2] https://lore.kernel.org/r/1442952651-4341-2-git-send-email-amstan@chromium.org

Changes in v2:
- Rebased to mainline

 drivers/usb/dwc2/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 81afe553aa66..b90f858af960 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -2824,7 +2824,7 @@ static int dwc2_queue_transaction(struct dwc2_hsotg *hsotg,
 		list_move_tail(&chan->split_order_list_entry,
 			       &hsotg->split_order);
 
-	if (hsotg->params.host_dma) {
+	if (hsotg->params.host_dma && chan->qh) {
 		if (hsotg->params.dma_desc_enable) {
 			if (!chan->xfer_started ||
 			    chan->ep_type == USB_ENDPOINT_XFER_ISOC) {
-- 
2.23.0.866.gb869b98d4c-goog

