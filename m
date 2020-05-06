Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 542C51C65FD
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgEFCrR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:47:17 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35356 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgEFCrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:47:17 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E65E1439BE;
        Wed,  6 May 2020 02:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733237; bh=zOD6jbscIV0qhP8yifrHCULGQmM2lESM/VgvCcX/JVg=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=JELiGysPBMxQthJszBvsrbg9VqXaagG0F56IOtr8579PFYVCJcbUWVRiJ6VDaRYZK
         cpsoIMdgtYY1s4f6caFfn9fHv1EGJ36SHFvH33+Jsom7lyEy0hjhJS5hPW2DkRYUPK
         eRcqsCJd4dULFWGKkWDAY+4w64u2uVldDLQq3bpUnxAPYZ7+4Zxr7L7VjV7hgO+DJK
         Jkh/1W5cl2Z4vWVTruhuzPvgbCMZiCH7Au6A0IPZNzz4HOjkEKnzUwNjZoqUJHMx4r
         vCOlf3qtoHtaqmgVGwlR+0eOEIH7IzIn2va5pDoacZFdvatJVUAQdWlaUdrtdgwhe8
         h2vKWw7hC0zaQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id CF7A6A0252;
        Wed,  6 May 2020 02:47:15 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:47:15 -0700
Date:   Tue, 05 May 2020 19:47:15 -0700
Message-Id: <efa446e32df7021aef8bb7f4435b4995193d29ac.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 11/11] usb: dwc3: gadget: Use SET_EP_PRIME for NoStream
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC_usb32 v1.00a and later can use SET_EP_PRIME command to reinitiate a
stream. Use the command to handle NoStream rejection instead of ending
and restarting the endpoint.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.h   |  3 +++
 drivers/usb/dwc3/gadget.c | 13 ++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 4def088329c7..013f42a2b5dc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1161,6 +1161,9 @@ struct dwc3 {
 #define DWC31_REVISION_180A	0x3138302a
 #define DWC31_REVISION_190A	0x3139302a
 
+#define DWC32_REVISION_ANY	0x0
+#define DWC32_REVISION_100A	0x3130302a
+
 	u32			version_type;
 
 #define DWC31_VERSIONTYPE_ANY		0x0
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 0380f76151a1..fea4fde1b5e3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2844,9 +2844,16 @@ static void dwc3_gadget_endpoint_stream_event(struct dwc3_ep *dep,
 		 * hosts, force to reinitate the stream until the host is ready
 		 * instead of waiting for the host to prime the endpoint.
 		 */
-		dep->flags |= DWC3_EP_DELAY_START;
-		dwc3_stop_active_transfer(dep, true, true);
-		return;
+		if (DWC3_VER_IS_WITHIN(DWC32, 100A, ANY)) {
+			unsigned int cmd = DWC3_DGCMD_SET_ENDPOINT_PRIME;
+
+			dwc3_send_gadget_generic_command(dwc, cmd, dep->number);
+		} else {
+			dep->flags |= DWC3_EP_DELAY_START;
+			dwc3_stop_active_transfer(dep, true, true);
+			return;
+		}
+		break;
 	}
 
 out:
-- 
2.11.0

