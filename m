Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3283486B6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 02:54:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbhCYBx7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 21:53:59 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42664 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239808AbhCYBx3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 21:53:29 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BC66FC00CA;
        Thu, 25 Mar 2021 01:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1616637208; bh=oHO16XXDZKRsF5chZAYj+JouyekvmIjuuKxBdxkQs4U=;
        h=Date:From:Subject:To:Cc:From;
        b=HcCjne20LwS5t6xj2YOno+4NaOMNcdS49fhWVMU48oAhOa9bg7mdZCpRg7uvjyWVU
         mR0WoI6rPgEbdzdUex6Z0LwfwCWhuLFRmxHMeCfZOYehCTDBrY+2GTollECxKmT66m
         lvVQmoxVjM6zIHVI7Ujmhr5+roQkpFKlvddbRr3bKMljflVu0d5jyvbef2EPlYzWxO
         KSPIksVF0vf4Jrw5ebA9NdNM5QaQUNsBerviHbKLmjuvJOQjCbCcP0xBDou6ezARt8
         Wr0sO++WmnD4d9DwfBjQe6WmYN2ErXMmvgtoO9xlgcbNfWQ8AVyLgUSqfB73z05o8R
         BU2vDnh+nWfDw==
Received: from lab-vbox (unknown [10.205.139.29])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 57FDDA00A4;
        Thu, 25 Mar 2021 01:53:27 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 24 Mar 2021 18:53:26 -0700
Date:   Wed, 24 Mar 2021 18:53:26 -0700
Message-Id: <cb38aa7dec109a8965691b53039a8b317d026189.1616636706.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: trace: Print register read and write offset
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently dwc3 only prints the virtual address of a register when doing
register read/write. However, these hashed addresses are difficult to read.
Also, since we use %p, we may get some useless (___ptrval___) prints if the
address is not randomized enough. Let's include the register offset to help
read the register read and write tracepoints.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/trace.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/trace.h b/drivers/usb/dwc3/trace.h
index 97f4f1125a41..3cbeb9854532 100644
--- a/drivers/usb/dwc3/trace.h
+++ b/drivers/usb/dwc3/trace.h
@@ -32,8 +32,10 @@ DECLARE_EVENT_CLASS(dwc3_log_io,
 		__entry->offset = offset;
 		__entry->value = value;
 	),
-	TP_printk("addr %p value %08x", __entry->base + __entry->offset,
-			__entry->value)
+	TP_printk("addr %p offset %04x value %08x",
+		__entry->base + __entry->offset,
+		__entry->offset,
+		__entry->value)
 );
 
 DEFINE_EVENT(dwc3_log_io, dwc3_readl,

base-commit: 049d3db625a652e23488db88b6104de4d5b62f16
-- 
2.28.0

