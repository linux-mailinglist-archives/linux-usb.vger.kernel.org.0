Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390493E4F47
	for <lists+linux-usb@lfdr.de>; Tue, 10 Aug 2021 00:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236734AbhHIWc0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Aug 2021 18:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbhHIWc0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Aug 2021 18:32:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83AE7C0613D3
        for <linux-usb@vger.kernel.org>; Mon,  9 Aug 2021 15:32:05 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso2267764pjy.5
        for <linux-usb@vger.kernel.org>; Mon, 09 Aug 2021 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzjcRfEcACJvgTVpHXjAyUs8UkB1tiZkWLbrVQy12/Q=;
        b=lCeiJTQknowjGfNbQ7NgspnLemPOUVn1UFwleOgZ4LEWrQA4rxLT/TgvxY+b09YLAM
         8W2JTMDxAPXYwsa3HMlpXlo7bLCBE1FIJt4oScW8PSWY4IbA+tkRBuCIjWKKGE30HnzV
         5IL8ctqS7sgFHbHCXKBk/BtnYPBMbsLzMn9i5LKFzM+Q7mKl1fqYndx8Ayadu+zZEa0T
         zGzo2QrVXImVJPKmVB4nu5xYF+YV0OrMzbbP20/sPybAf9HXogBSvpHKIjakVElD8cd0
         eFFCg3qK2R89ox8dNg66yyRp6ikD5OQPfD7nUa8y8sSAEZNSNoTJluZFeNYS4+4CwixC
         exmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzjcRfEcACJvgTVpHXjAyUs8UkB1tiZkWLbrVQy12/Q=;
        b=tBw31FvtSQSnpeIus4n2wNXDpeXlwSjpxLzdkuJLd4PE2b+QX238l/oaE6YGVbma9T
         MxkFUzclgJkPIzjalcf2E1Z8YCQyWsW5ZGjAJSb40V7e4nXBADarU0pD2jTaJHRY1hdG
         SYfzu0P9U/IMIXh6jmGCRMkXrqjM4fC8YiXX1ZISnSQYW8YparnQA+VcW9DCPw06NDcC
         4sFhJxvPNca9Ls4NBS7/4qMrCaFV6YEQfU36a57zaRXxzH7bEhk9ac24c8W3zTSSjZHW
         cPVj8d9NFBgz8fP5p5r44hoVoyUxvvwdkSnqFKHsGcEygvCX/Ad6jBfBjTshLNGGslrM
         r3jg==
X-Gm-Message-State: AOAM5308sbYR0F+dCt8GWrWnPQ8av6Zx4PxF5zMoCCiYwmWPkCHUgQMV
        xIB8olUAcWLrLjqNdW7H5C/ELw==
X-Google-Smtp-Source: ABdhPJxElfD99iLkdqdtMOOjJGVjntQCDrUuzUrKYce2aY57R9QMXv0KBqjCPSJ4IkXYSZ+4NCvvUw==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id a1-20020a056a000c81b029030e21bf4c15mr26160813pfv.70.1628548325071;
        Mon, 09 Aug 2021 15:32:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id x26sm21276226pfm.77.2021.08.09.15.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:32:04 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <thinh.nguyen@synopsys.com>,
        Todd Kjos <tkjos@google.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Petri Gynther <pgynther@google.com>, linux-usb@vger.kernel.org
Subject: [RFC][PATCH] dwc3: gadget: Fix losing list items in dwc3_gadget_ep_cleanup_completed_requests()
Date:   Mon,  9 Aug 2021 22:31:59 +0000
Message-Id: <20210809223159.2342385-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CANcMJZCEVxVLyFgLwK98hqBEdc0_n4P0x_K6Gih8zNH3ouzbJQ@mail.gmail.com>
References: <CANcMJZCEVxVLyFgLwK98hqBEdc0_n4P0x_K6Gih8zNH3ouzbJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In commit d25d85061bd8 ("usb: dwc3: gadget: Use
list_replace_init() before traversing lists"), a local list_head
was introduced to process the started_list items to avoid races.

However, in dwc3_gadget_ep_cleanup_completed_requests() if
dwc3_gadget_ep_cleanup_completed_request() fails, we break early,
causing the items on the local list_head to be lost.

This issue showed up as problems on the db845c/RB3 board, where
adb connetions would fail, showing the device as "offline".

This patch tries to fix the issue by if we are returning early
we splice in the local list head back into the started_list
and return (avoiding an infinite loop, as the started_list is
now non-null).

Not sure if this is fully correct, but seems to work for me so I
wanted to share for feedback.

Cc: Wesley Cheng <wcheng@codeaurora.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: Thinh Nguyen <thinh.nguyen@synopsys.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: YongQin Liu <yongqin.liu@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Petri Gynther <pgynther@google.com>
Cc: linux-usb@vger.kernel.org
Fixes: d25d85061bd8 ("usb: dwc3: gadget: Use list_replace_init() before traversing lists")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b8d4b2d327b23..a73ebe8e75024 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2990,6 +2990,12 @@ static void dwc3_gadget_ep_cleanup_completed_requests(struct dwc3_ep *dep,
 			break;
 	}
 
+	if (!list_empty(&local)) {
+		list_splice_tail(&local, &dep->started_list);
+		/* Return so we don't hit the restart case and loop forever */
+		return;
+	}
+
 	if (!list_empty(&dep->started_list))
 		goto restart;
 }
-- 
2.25.1

