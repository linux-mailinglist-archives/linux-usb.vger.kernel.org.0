Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19C6D286F44
	for <lists+linux-usb@lfdr.de>; Thu,  8 Oct 2020 09:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgJHHW0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Oct 2020 03:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgJHHW0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Oct 2020 03:22:26 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0D8C061755;
        Thu,  8 Oct 2020 00:22:26 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4C6N284dWnzQkKW;
        Thu,  8 Oct 2020 09:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        in-reply-to:content-disposition:content-type:content-type
        :mime-version:references:message-id:subject:subject:from:from
        :date:date:received; s=mail20150812; t=1602141741; bh=F3zl6R34j8
        XuyXiPkLvQN+72dc49XEvMfpEJa7+LlQc=; b=j2teyyaC0m4cyDgyBEll5h21mP
        xR4SrQvngYUfAsksHQLxWlIjVZ04z5sBBNnEn9iR4/d845gL5cfmX8kXXYHX9417
        RlWA7tLEIsDDFFT1TgK1yDCB/i8k9UFXBZK7DOjuQ2XMkbMTgBuO4AayELAC2GRP
        BhhOmrs23sCO5K97npogbSVNs6EES067wTaKQxhDaLOi5RBD4pajIaErSivluhyr
        0fKMbfC28rAaOgQ3a9O6wwnEZATfxLeZ6fV7bwDMdB/uDt9vKUNmSGWAlHWUlRwV
        soC/LeQMfjBAw2kJg8gIwf4v6NOzYZ8biZytn+IetVVMY4ndiMTDsOSNOPXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1602141742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MsE9L155w97UxlzVBtMihNM3sUIgsGa6NaXfRjav7Go=;
        b=ac7rpwCdd/zH/skA5ERuOU/cYvDuaYgVQ+t9tTztgOxN8UOUy0fJMjOR/Kb87Uya+zu8yp
        VsFULNqi4hOcA2l+afPap+sOqASMIPKobUir4kRO4t1WHQIEK+5hoKca6tTkspHriNXdMF
        4Oo6eccAjkNVFev4+a214rR/k4vQPfdPkOMNKFbqryxdxal8Yu/3TBuYdG9RwwqToBmb54
        7+GD8hhz5X5gjfMFpBYIULQekgsfRq/+cO3asjTNF500Sk+D4N3/XFmytjPOqhugXaKApd
        n3DSI7019lMEGY710LrIQhbbGjg7bXhuWS3PeM3BL7qllzgioj0nNZ5uvt6DuA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id OAruJgduMDiW; Thu,  8 Oct 2020 09:22:21 +0200 (CEST)
Date:   Thu, 8 Oct 2020 09:22:19 +0200
From:   Wilken Gottwalt <wilken.gottwalt@mailbox.org>
To:     linux-kernel@vger.kernel.org
Cc:     =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v2 2/2] usb: serial: option: add Cellient MPL200 card
Message-ID: <be90904f21494eaa8235db962829a8842025b22e.1602140720.git.wilken.gottwalt@mailbox.org>
References: <cover.1602140720.git.wilken.gottwalt@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1602140720.git.wilken.gottwalt@mailbox.org>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.52 / 15.00 / 15.00
X-Rspamd-Queue-Id: 93B8B1721
X-Rspamd-UID: e7e67e
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add usb ids of the Cellient MPL200 card.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@mailbox.org>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 0c6f160a214a..a65e620b2277 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -528,6 +528,7 @@ static void option_instat_callback(struct urb *urb);
 /* Cellient products */
 #define CELLIENT_VENDOR_ID			0x2692
 #define CELLIENT_PRODUCT_MEN200			0x9005
+#define CELLIENT_PRODUCT_MPL200			0x9025
 
 /* Hyundai Petatel Inc. products */
 #define PETATEL_VENDOR_ID			0x1ff4
@@ -1982,6 +1983,8 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM2, 0xff, 0x02, 0x01) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM2, 0xff, 0x00, 0x00) },
 	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MEN200) },
+	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MPL200),
+	  .driver_info = RSVD(1) | RSVD(4) },
 	{ USB_DEVICE(PETATEL_VENDOR_ID, PETATEL_PRODUCT_NP10T_600A) },
 	{ USB_DEVICE(PETATEL_VENDOR_ID, PETATEL_PRODUCT_NP10T_600E) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(TPLINK_VENDOR_ID, TPLINK_PRODUCT_LTE, 0xff, 0x00, 0x00) },	/* TP-Link LTE Module */
-- 
2.28.0

