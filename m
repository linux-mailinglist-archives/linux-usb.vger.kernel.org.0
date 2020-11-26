Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0398A2C5BA1
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 19:09:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404715AbgKZSJr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 13:09:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:54822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404676AbgKZSJq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 13:09:46 -0500
Received: from localhost (82-217-20-185.cable.dynamic.v4.ziggo.nl [82.217.20.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B2ACA21D7E;
        Thu, 26 Nov 2020 18:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606414186;
        bh=l+ML/gM0MaklgpBNcmLG6VwzDWRbhWmTWpVYK6fwplg=;
        h=From:To:Cc:Subject:Date:From;
        b=1oLvVZNGn6vg5KA4LpCnv8hntPsx6unDPfbOTwuRVEraMElsghoNchm709t0+zOb9
         NKvc+Lm7yCwlC3iipbKVjnFp3CNzo9zvSxyOnehffcjzM/boiNIoKco4EwaNi4K9pa
         A4vq0tvdpfJeetarcVuLH4seuSl57aT4XAQolQh0=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will McVicker <willmcvicker@google.com>,
        EJ Hsu <ejh@nvidia.com>, Peter Chen <peter.chen@nxp.com>,
        stable <stable@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/4] USB: gadget: f_rndis: fix bitrate for SuperSpeed and above
Date:   Thu, 26 Nov 2020 19:09:34 +0100
Message-Id: <20201126180937.255892-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Will McVicker <willmcvicker@google.com>

Align the SuperSpeed Plus bitrate for f_rndis to match f_ncm's ncm_bitrate
defined by commit 1650113888fe ("usb: gadget: f_ncm: add SuperSpeed descriptors
for CDC NCM").

Cc: Felipe Balbi <balbi@kernel.org>
Cc: EJ Hsu <ejh@nvidia.com>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: stable <stable@vger.kernel.org>
Signed-off-by: Will McVicker <willmcvicker@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_rndis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_rndis.c b/drivers/usb/gadget/function/f_rndis.c
index 9534c8ab62a8..0739b05a0ef7 100644
--- a/drivers/usb/gadget/function/f_rndis.c
+++ b/drivers/usb/gadget/function/f_rndis.c
@@ -87,8 +87,10 @@ static inline struct f_rndis *func_to_rndis(struct usb_function *f)
 /* peak (theoretical) bulk transfer rate in bits-per-second */
 static unsigned int bitrate(struct usb_gadget *g)
 {
+	if (gadget_is_superspeed(g) && g->speed >= USB_SPEED_SUPER_PLUS)
+		return 4250000000U;
 	if (gadget_is_superspeed(g) && g->speed == USB_SPEED_SUPER)
-		return 13 * 1024 * 8 * 1000 * 8;
+		return 3750000000U;
 	else if (gadget_is_dualspeed(g) && g->speed == USB_SPEED_HIGH)
 		return 13 * 512 * 8 * 1000 * 8;
 	else
-- 
2.29.2

