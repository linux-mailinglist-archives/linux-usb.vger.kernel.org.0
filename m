Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA51D17FCEB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2020 14:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729885AbgCJNYh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Mar 2020 09:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgCJM6z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Mar 2020 08:58:55 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE8402467D;
        Tue, 10 Mar 2020 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583845134;
        bh=ZBMgcPbP3wxgjFwxzZhy0vyba5otvsXz9ItW6/9bml8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=njbnNr8AHnWPRicAIzghvD1XpZHYMQY4x/iJ9J7mg9VVAE0m/Vut3kaJLlKx0v1wJ
         oN+KXQqUQ5IWsG06yJEh3bKEXAUHrQiJNv7K5useJw7nf3abD8zXTIfZ0yxzyXvWLf
         I3UmabrBSpb19iyudhU1qhBrs7V0DVx73J4MzAEQ=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Pratham Pratap <prathampratap@codeaurora.org>,
        John Stultz <john.stultz@linaro.org>
Subject: [PATCH 5.5 072/189] usb: dwc3: gadget: Update chain bit correctly when using sg list
Date:   Tue, 10 Mar 2020 13:38:29 +0100
Message-Id: <20200310123646.891832602@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310123639.608886314@linuxfoundation.org>
References: <20200310123639.608886314@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Pratham Pratap <prathampratap@codeaurora.org>

commit dad2aff3e827b112f27fa5e6f2bf87a110067c3f upstream.

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
Cc: stable <stable@vger.kernel.org> #4.20+
Signed-off-by: Pratham Pratap <prathampratap@codeaurora.org>
[jstultz: Slight tweak to remove sg_is_last() usage, reworked
          commit message, minor comment tweak]
Signed-off-by: John Stultz <john.stultz@linaro.org>
Link: https://lore.kernel.org/r/20200302214443.55783-1-john.stultz@linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/usb/dwc3/gadget.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1068,7 +1068,14 @@ static void dwc3_prepare_one_trb_sg(stru
 		unsigned int rem = length % maxp;
 		unsigned chain = true;
 
-		if (sg_is_last(s))
+		/*
+		 * IOMMU driver is coalescing the list of sgs which shares a
+		 * page boundary into one and giving it to USB driver. With
+		 * this the number of sgs mapped is not equal to the number of
+		 * sgs passed. So mark the chain bit to false if it isthe last
+		 * mapped sg.
+		 */
+		if (i == remaining - 1)
 			chain = false;
 
 		if (rem && usb_endpoint_dir_out(dep->endpoint.desc) && !chain) {


