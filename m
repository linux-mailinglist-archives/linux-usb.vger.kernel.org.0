Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E9D1D41F5
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 02:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgEOAIl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 20:08:41 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:42622 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726125AbgEOAIl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 20:08:41 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B4F2F40081;
        Fri, 15 May 2020 00:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589501320; bh=XTiA55nDqmWMitpAH5aqFDWjxwxwza0YFXej4Tu3Qa0=;
        h=Date:From:Subject:To:Cc:From;
        b=IgdJTWRBRl164zGuAjRWqxNXRyhyhy/0RKDVvov8epe5i3snjGTdU/AYE3r0Ncl0l
         aDTxC7ykg0wrs5oSAvhDne0mH/wYkw6DhIhwx8aaqLPd1GtyQvbBIU1cLjrDTNETbn
         3RNVsIfk6ufxwkxHd8YgrcGz2UXZmzDUe3NuB6FeeQlDS/nnNOMWaafeUYVYlMaVVK
         BfnVpOAdnrPrjx81ZBANns0zSwisIfKCj5zFcV3BfXKVrmPAxFlWFs5rA0LfDYArcz
         YUly8pgHbOpA5KEiCkP9jM+BGQDFUOITHkIyik2W3GdPqi6u+6/uOslaT7JmgcHujh
         YuNfVNcPrGa9g==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 3B94DA006D;
        Fri, 15 May 2020 00:08:38 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Thu, 14 May 2020 17:08:38 -0700
Date:   Thu, 14 May 2020 17:08:38 -0700
Message-Id: <a13a2738dab5a37182396570db68440ed8ff2c6e.1589500544.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: Remove old comment
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the new IP version checking scheme, we're not using the bit 31 of
dwc->revision as a flag anymore. Remove the stale comment.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---

Hi Felipe,

Not sure what happened to the DWC_usb32 patch* when it was merged to your
testing/next branch, but the old comment was removed in that patch. You can
apply this or squash it to the patch "usb: dwc3: Add support for DWC_usb32 IP"
on your testing/next branch.

*Original patch:
https://patchwork.kernel.org/patch/11484297/

Thanks,
Thinh


 drivers/usb/dwc3/core.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index d800f8119195..013f42a2b5dc 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1153,10 +1153,6 @@ struct dwc3 {
 #define DWC3_REVISION_310A	0x5533310a
 #define DWC3_REVISION_330A	0x5533330a
 
-/*
- * NOTICE: we're using bit 31 as a "is usb 3.1" flag. This is really
- * just so dwc31 revisions are always larger than dwc3.
- */
 #define DWC31_REVISION_ANY	0x0
 #define DWC31_REVISION_110A	0x3131302a
 #define DWC31_REVISION_120A	0x3132302a
-- 
2.11.0

