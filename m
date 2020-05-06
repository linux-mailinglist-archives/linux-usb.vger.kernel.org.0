Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC71C65FB
	for <lists+linux-usb@lfdr.de>; Wed,  6 May 2020 04:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgEFCrG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 22:47:06 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50106 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725900AbgEFCrF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 May 2020 22:47:05 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D9699C1324;
        Wed,  6 May 2020 02:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588733224; bh=x266bhHc995vTrO+GJqke9RLV7rizATihZjNwl6K25w=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=dq06K5ObXQO0Xip5N1m9Kka51dhGFPJgzltXfT4gdvuXmFx7vJM7kWpuqtAAIYgm4
         jl6NujnyTsLyhiaGT7hOLf3lXx6U6EGNed68eMyQfRf+fw3qVW6Q07/NiIK8rUI41T
         UNi3eOGXfzNknUd/MyjFUbPT+hgYy1Z+gq5DrU6SzZi1hsq0DqW9DCjxoPZDrevLcz
         EsN0I80mlmkr0gQYEDWb9AkPBgx7KT/ur9+CoDYmDSyNlVTyXjBQVY2Pd5d52+NRvH
         rQYYfWR2YhsZQ1z9ljo36TtqgZqdLRHbt4hr4OrbJ1WQ79Wj98GH7xIpk/FglEDmle
         GcZpXmlxEeSZQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A945FA006D;
        Wed,  6 May 2020 02:47:03 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 05 May 2020 19:47:03 -0700
Date:   Tue, 05 May 2020 19:47:03 -0700
Message-Id: <fa332b830c0bc51159eda9369f4c6e0e03ea721f.1588732815.git.thinhn@synopsys.com>
In-Reply-To: <cover.1588732815.git.thinhn@synopsys.com>
References: <cover.1588732815.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 09/11] usb: dwc3: gadget: Don't prepare beyond a transfer
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Don't prepare TRBs beyond a transfer. In DWC_usb32, its transfer burst
capability may try to read and use TRBs beyond the active transfer. For
other controllers, they don't process the next transfer TRBs until the
current transfer is completed. Explicitly prevent preparing TRBs ahead
for all controllers.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 97c6a5785725..07824b670440 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1231,6 +1231,14 @@ static void dwc3_prepare_trbs(struct dwc3_ep *dep)
 
 		if (!dwc3_calc_trbs_left(dep))
 			return;
+
+		/*
+		 * Don't prepare beyond a transfer. In DWC_usb32, its transfer
+		 * burst capability may try to read and use TRBs beyond the
+		 * active transfer instead of stopping.
+		 */
+		if (dep->stream_capable && req->request.is_last)
+			return;
 	}
 }
 
-- 
2.11.0

