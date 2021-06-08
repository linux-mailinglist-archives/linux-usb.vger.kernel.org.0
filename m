Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EB939F177
	for <lists+linux-usb@lfdr.de>; Tue,  8 Jun 2021 10:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhFHI45 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Jun 2021 04:56:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhFHI44 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Jun 2021 04:56:56 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB0EC061574
        for <linux-usb@vger.kernel.org>; Tue,  8 Jun 2021 01:54:49 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id c13so10303102plz.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Jun 2021 01:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kzn1DBDuCWN6JGVM3tPEhxEIyS/mBaVRs67U/hjc9dk=;
        b=fmcmKvL84jAk4LC8V2keVGmgZ+aSmOviu6kO1jsOVp9eIcNsj4TWPTV91uGQKa7DKP
         ghuOZYsuP1b5pP6IPtl57iD63CdznnNOsWDJ815zUGBZ82VNtZ3KiWtk8ykmOtk1algv
         eJPhJRb6Ikz8diCLPI+ZxnthA0Z6LGDggj5YCr/rD+IuLApvOyP6PaZcKTfv/Msx85Qm
         RMCRc2KSVd/JLk3p4gpmDB3sLvY52KDC3+2nGM9UfqgjN6oPg6bJETIfFPuKsQDOjh28
         mPDqN5zgLFQktVHZshq18WeBnNrMqHme8zlHkVCbN557TGc54G/BArQKjN0z6SLQTAha
         f3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kzn1DBDuCWN6JGVM3tPEhxEIyS/mBaVRs67U/hjc9dk=;
        b=PyXp/eu64URFBfQ6RHacRMlUFBKjdaSnCxn+IN0tGERlX9jRsmuvR9W7F7WsTNKays
         DPShvYh9MLUB0nEZspfKKrvZrPIDILypfF4XC9EHNLzuAz21OwaM+PMwjDi8FF/qPFg1
         19c37GvglaUzGwWzXHgAJ2Cyh4K2n+eubtUdWhI3ZcejiWpwzfdK9yjThBZrNF5wghQ2
         n5TDvZaqnv1ppSuzBczu93AAiknOaPtwRutexy1BtNZHlK4A4ExZC1G0CqoGGlD/1Bji
         ItkeY9octKUXO+7mOvjNZCQuuwyAX80SyWLX9QEakiYKMx39zMDOuAPkzC/2He/FF5BB
         SQrA==
X-Gm-Message-State: AOAM53358MtLP2sDZEXuOTA1rWAHLD3mc519WsG7CBSWfYJU4JqhomL4
        TKr1HTsB1E6UoiTbbjN96zM=
X-Google-Smtp-Source: ABdhPJyLGZD8VRHj7P0ktUBsFtwsahZ38XNnqR6yeIbijkFmal/OfINqE8auNrMukb/tm5GjwksGxg==
X-Received: by 2002:a17:90a:1b6b:: with SMTP id q98mr3830105pjq.53.1623142488572;
        Tue, 08 Jun 2021 01:54:48 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:0:34c3:22d8:b92a:ddfa])
        by smtp.gmail.com with ESMTPSA id w63sm10456910pfw.153.2021.06.08.01.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 01:54:48 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH] usb: f_ncm: only first packet of aggregate needs to start timer
Date:   Tue,  8 Jun 2021 01:54:38 -0700
Message-Id: <20210608085438.813960-1-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

The reasoning for this change is that if we already had
a packet pending, then we also already had a pending timer,
and as such there is no need to reschedule it.

This also prevents packets getting delayed 60 ms worst case
under a tiny packet every 290us transmit load, by keeping the
timeout always relative to the first queued up packet.
(300us delay * 16KB max aggregation / 80 byte packet =~ 60 ms)

As such the first packet is now at most delayed by 300us.

Under low transmit load, this will simply result in us sending
a shorter aggregate, as originally intended.

This patch has the benefit of greatly reducing (by ~10 factor
with 1500 byte frames aggregated into 16 kiB) the number of
(potentially pretty costly) updates to the hrtimer.

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 0d23c6c11a13..855127249f24 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1101,11 +1101,11 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 			ncm->ndp_dgram_count = 1;
 
 			/* Note: we skip opts->next_ndp_index */
-		}
 
-		/* Delay the timer. */
-		hrtimer_start(&ncm->task_timer, TX_TIMEOUT_NSECS,
-			      HRTIMER_MODE_REL_SOFT);
+			/* Start the timer. */
+			hrtimer_start(&ncm->task_timer, TX_TIMEOUT_NSECS,
+				      HRTIMER_MODE_REL_SOFT);
+		}
 
 		/* Add the datagram position entries */
 		ntb_ndp = skb_put_zero(ncm->skb_tx_ndp, dgram_idx_len);
-- 
2.32.0.rc1.229.g3e70b5a671-goog

