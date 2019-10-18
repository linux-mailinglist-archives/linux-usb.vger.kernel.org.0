Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2115DD27B
	for <lists+linux-usb@lfdr.de>; Sat, 19 Oct 2019 00:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391090AbfJRWL2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 18:11:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:43610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390467AbfJRWKh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 18:10:37 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 085B222489;
        Fri, 18 Oct 2019 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571436636;
        bh=lP2pAvB6Rw5N/daorLa+suvXjl8IjHZIuTeSFUXi00A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GdSFKIRhRDeXlVJKytMIOQmCw5spDLRPU2tuR1FWquoCM8PItTROVnVtc8J0/0eWw
         yUD1K6Skn2Ys9tvta0BTEpHLf1B6AnZaayTSwOla4fFHl/WzJrrPhrfEiYvJdGwHld
         DDBZnZaib1ogwJ6Q3YIj16YZy8sUXTnSP+m9DVKQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 19/21] USB: usb-skeleton: fix use-after-free after driver unbind
Date:   Fri, 18 Oct 2019 18:10:05 -0400
Message-Id: <20191018221007.10851-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018221007.10851-1-sashal@kernel.org>
References: <20191018221007.10851-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Johan Hovold <johan@kernel.org>

[ Upstream commit 6353001852776e7eeaab4da78922d4c6f2b076af ]

The driver failed to stop its read URB on disconnect, something which
could lead to a use-after-free in the completion handler after driver
unbind in case the character device has been closed.

Fixes: e7389cc9a7ff ("USB: skel_read really sucks royally")
Signed-off-by: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/r/20191009170944.30057-3-johan@kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/usb-skeleton.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/usb-skeleton.c b/drivers/usb/usb-skeleton.c
index 545d09b8081d5..be0fc67ce4f39 100644
--- a/drivers/usb/usb-skeleton.c
+++ b/drivers/usb/usb-skeleton.c
@@ -593,6 +593,7 @@ static void skel_disconnect(struct usb_interface *interface)
 	dev->interface = NULL;
 	mutex_unlock(&dev->io_mutex);
 
+	usb_kill_urb(dev->bulk_in_urb);
 	usb_kill_anchored_urbs(&dev->submitted);
 
 	/* decrement our usage count */
-- 
2.20.1

