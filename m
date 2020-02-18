Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82EE1163783
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 00:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbgBRXvM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 18:51:12 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37154 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgBRXvM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 18:51:12 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so1714199pjb.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 15:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=H9Vy91VcgS2dfjojUgyTLRgs44OJ1u3F7tZb9F/g2s4=;
        b=XtjY32moCVDQQioAXHxahEf5oYVhgz+Ms4AFWGGTaFP4778HtoUNBVCZbW/C2qLolT
         kDIi0JZqXC7NMPPKTviR9qMq/uEd/2YzpTjSe9IaITXu8Pl4JEDP9qbdg7sIIRVZ//1i
         KtiroPgJmXpywPRGIY+tRmnl8PQ6+OMwaraP1VH0SOJ5WbBohMTNLRPRezZYc2qxq/sa
         2W6kvsh9Fs6Fpve+mm0yDRQIeZ7choax1gRTSiFCOkog4mfLEzJV9OH+KkcYvUUFNjHX
         S+Hc+3xvGjLdqBzUhHT2TzNGdEjWroRfLHHYpwd/TbZj2sO/pVmhcBrNVgTGZQBeSp5j
         XUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=H9Vy91VcgS2dfjojUgyTLRgs44OJ1u3F7tZb9F/g2s4=;
        b=Ye/vFLBw8Q8VQdQLCwqOuh1VEt1SEGTkWD+5kYoPEYsH3Uq6CzpSGpvnDJmQLXlq+1
         +Qc6an3crJ00nOlu2KTpFNPgCobXoe2SH5HMTLubFrZlc7Q9MI9s21lALe6xavHwM/T4
         b57gtOV+iusE5F8S6APH6R/5uGHS+lHlZ0UdT3B3AGeIpDuD6k8yMCpqKHUdx6qyA/JD
         +HKWkP4kItwDe0tJ6lsT2hFNze1gyERvFIDlJasSYm04vWOWSdEWQugSu0CThaDzy8ls
         IDc99qTbY1GhVuejp7QexCHPNP+6zAwM743P8OUeFhhR0cfLePin7Z2vK0HMP2HNtFre
         M37w==
X-Gm-Message-State: APjAAAWZUHD10xa1ZFjk6hSYM14PLdDDqIuRhIB5OXyyCgsKYuz7vozl
        fSYtMEty7xXeowh3BTIFtdJDDA==
X-Google-Smtp-Source: APXvYqxZ65WQ76i7D3Y4yE+ieYshnEw5upVN5/4FZ5xFsoWgY9MsPSPIm9vhiPRL+clNxV3M8q/PVw==
X-Received: by 2002:a17:90b:1256:: with SMTP id gx22mr5711887pjb.94.1582069871497;
        Tue, 18 Feb 2020 15:51:11 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id b1sm88455pgs.27.2020.02.18.15.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 15:51:10 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Pratham Pratap <prathampratap@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>, Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH] usb: dwc3: gadget: Update chain bit correctly when using sg list
Date:   Tue, 18 Feb 2020 23:51:04 +0000
Message-Id: <20200218235104.112323-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pratham Pratap <prathampratap@codeaurora.org>

If scatter-gather operation is allowed, a large USB request is split
into multiple TRBs. For preparing TRBs for sg list, driver iterates
over the list and creates TRB for each sg and mark the chain bit to
false for the last sg. The current IOMMU driver is clubbing the list
of sgs which shares a page boundary into one and giving it to USB driver.
With this the number of sgs mapped it not equal to the the number of sgs
passed. Because of this USB driver is not marking the chain bit to false
since it couldn't iterate to the last sg. This patch addresses this issue
by marking the chain bit to false if it is the last mapped sg.

At a practical level, this patch resolves USB transfer stalls
seen with adb on dwc3 based db845c, pixel3 and other qcom
hardware after functionfs gadget added scatter-gather support
around v4.20.

Credit also to Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
who implemented a very similar fix to this issue.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Yang Fei <fei.yang@intel.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Tejas Joglekar <tejas.joglekar@synopsys.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Pratham Pratap <prathampratap@codeaurora.org>
[jstultz: Slight tweak to remove sg_is_last() usage, reworked
          commit message, minor comment tweak]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/usb/dwc3/gadget.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 1b8014ab0b25..10aa511051e8 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1071,7 +1071,14 @@ static void dwc3_prepare_one_trb_sg(struct dwc3_ep *dep,
 		unsigned int rem = length % maxp;
 		unsigned chain = true;
 
-		if (sg_is_last(s))
+		/*
+		 * IOMMU driver is coalescing the list of sgs which shares a
+		 * page boundary into one and giving it to USB driver. With
+		 * this the number of sgs mapped it not equal to the the number
+		 * of sgs passed. Mark the chain bit to false if it is the last
+		 * mapped sg.
+		 */
+		if ((i == remaining - 1))
 			chain = false;
 
 		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {
-- 
2.17.1

