Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 547054D0E30
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 04:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242497AbiCHDAz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 22:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244999AbiCHDAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 22:00:55 -0500
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3788B3B56E
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 19:00:00 -0800 (PST)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 36AEFC0A2F;
        Tue,  8 Mar 2022 02:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1646708399; bh=m6/GfkDH/MpQhKcai7eH+dsCJWpLLHhfTeu2C3Ndmqg=;
        h=Date:From:Subject:To:Cc:From;
        b=kJlKnO8B93eDddFYGpW+csjlpzVibmIFftbu+bpZT+E9WGAECrk5iPuwq9c3BG7GM
         mIGHKexl+73VoSnWDoCOXjNEdlRuY6z1F84v3FMTbymngD70V2x6iwgv9Xhax2IKzp
         oEmpRDmr0N80QrycP4bLyrCjGAMfaFnyUukHPn8kRLxmgKAw4vVZ3+u4dHgo/CXyKT
         3/lTNHlr0dYmccJGz4KDijQlseGG3DwVTqcEGBUIfj2sdgHG++8J1okYM9NZy9X8HR
         XEnjmO6vdWedGQcIzCIbujv0+ghXCWRj70tFNf6HTjEHXO8d6bgxLvcSJGUf4AuAyk
         dTFr5dvMUlGxQ==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id B64D1A0099;
        Tue,  8 Mar 2022 02:59:56 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Mon, 07 Mar 2022 18:59:56 -0800
Date:   Mon, 07 Mar 2022 18:59:56 -0800
Message-Id: <deb8146b8e1f7f8495ef2d5647017270934cb2d8.1646708142.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: dwc3: gadget: Give some time to schedule isoc
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Michael Grzeschik <mgr@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently the driver will schedule isoc transfers immediately on the
next interval, which is quite aggressive when the interval is 125us.
There's report that some platforms may need more time to process the
transfer, otherwise the controller may miss the first interval. Let's
keep it simple and give the controller at least 500us to schedule the
isoc transfer.

Link: https://lore.kernel.org/linux-usb/20220302143539.GI11577@pengutronix.de/
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index a0c883f19a41..eb88ef5dd16f 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -1830,7 +1830,13 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 	}
 
 	for (i = 0; i < DWC3_ISOC_MAX_RETRIES; i++) {
-		dep->frame_number = DWC3_ALIGN_FRAME(dep, i + 1);
+		int future_interval = i + 1;
+
+		/* Give the controller at least 500us to schedule transfers */
+		if (desc->bInterval < 3)
+			future_interval += 3 - desc->bInterval;
+
+		dep->frame_number = DWC3_ALIGN_FRAME(dep, future_interval);
 
 		ret = __dwc3_gadget_kick_transfer(dep);
 		if (ret != -EAGAIN)

base-commit: 98d107b84614a1c6b0b8009feae49c5fb0ef4758
-- 
2.28.0

