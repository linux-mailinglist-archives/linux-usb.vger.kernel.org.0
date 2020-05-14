Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB7B1D3AB6
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 20:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgENS4X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 14:56:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:57248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729680AbgENS4V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 14:56:21 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA19220801;
        Thu, 14 May 2020 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589482580;
        bh=l2MrieZq0m4F03m5mNR7njvgfmxCZQPv9VqwZvp/KGw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dcOV/ObgOriAZajZu8nbHEl0smYdiGxLycDKi+k7GXB5wOrFWWuf364PajlPIHMNS
         C9GVQXuOHKpj/YNH5ykDykzzYaslA7gmbMradE12ogtPix9+tTKazVUYa1KGD8S+H2
         pZoL9ykieeegy1PDoLZxhZ9H/WLRh2ekdt33Be6s=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 24/27] USB: core: Fix misleading driver bug report
Date:   Thu, 14 May 2020 14:55:47 -0400
Message-Id: <20200514185550.21462-24-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514185550.21462-1-sashal@kernel.org>
References: <20200514185550.21462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Alan Stern <stern@rowland.harvard.edu>

[ Upstream commit ac854131d9844f79e2fdcef67a7707227538d78a ]

The syzbot fuzzer found a race between URB submission to endpoint 0
and device reset.  Namely, during the reset we call usb_ep0_reinit()
because the characteristics of ep0 may have changed (if the reset
follows a firmware update, for example).  While usb_ep0_reinit() is
running there is a brief period during which the pointers stored in
udev->ep_in[0] and udev->ep_out[0] are set to NULL, and if an URB is
submitted to ep0 during that period, usb_urb_ep_type_check() will
report it as a driver bug.  In the absence of those pointers, the
routine thinks that the endpoint doesn't exist.  The log message looks
like this:

------------[ cut here ]------------
usb 2-1: BOGUS urb xfer, pipe 2 != type 2
WARNING: CPU: 0 PID: 9241 at drivers/usb/core/urb.c:478
usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478

Now, although submitting an URB while the device is being reset is a
questionable thing to do, it shouldn't count as a driver bug as severe
as submitting an URB for an endpoint that doesn't exist.  Indeed,
endpoint 0 always exists, even while the device is in its unconfigured
state.

To prevent these misleading driver bug reports, this patch updates
usb_disable_endpoint() to avoid clearing the ep_in[] and ep_out[]
pointers when the endpoint being disabled is ep0.  There's no danger
of leaving a stale pointer in place, because the usb_host_endpoint
structure being pointed to is stored permanently in udev->ep0; it
doesn't get deallocated until the entire usb_device structure does.

Reported-and-tested-by: syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

Link: https://lore.kernel.org/r/Pine.LNX.4.44L0.2005011558590.903-100000@netrider.rowland.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/core/message.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 2e541a0296570..e33d23c2f6eab 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1081,11 +1081,11 @@ void usb_disable_endpoint(struct usb_device *dev, unsigned int epaddr,
 
 	if (usb_endpoint_out(epaddr)) {
 		ep = dev->ep_out[epnum];
-		if (reset_hardware)
+		if (reset_hardware && epnum != 0)
 			dev->ep_out[epnum] = NULL;
 	} else {
 		ep = dev->ep_in[epnum];
-		if (reset_hardware)
+		if (reset_hardware && epnum != 0)
 			dev->ep_in[epnum] = NULL;
 	}
 	if (ep) {
-- 
2.20.1

