Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983D5FEE7B
	for <lists+linux-usb@lfdr.de>; Sat, 16 Nov 2019 16:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730847AbfKPPvu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Nov 2019 10:51:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60616 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730843AbfKPPvs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 Nov 2019 10:51:48 -0500
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C1002084B;
        Sat, 16 Nov 2019 15:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573919507;
        bh=qpOfe/n+XafqdA3bd277vvX9ZgxGKO9nKXTsAQ4Xcxc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ONmA/lAxz8jkEnZ+iLubex0frOc7iY9P259auJUOQeQxJNaacTplkC1N016xqzlBh
         Z+e1S2R+BTX/M+dci62lE/2gvPoQJcdpBASZwqXKy7tLuSDLxgAYigL9kmDspq/KHQ
         gHh6uuPtI6xC+Cdc5tMZ0nQJVrhWu7yr3iuEK8xM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Mattias Jacobsson <2pi@mok.nu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 31/99] USB: misc: appledisplay: fix backlight update_status return code
Date:   Sat, 16 Nov 2019 10:49:54 -0500
Message-Id: <20191116155103.10971-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116155103.10971-1-sashal@kernel.org>
References: <20191116155103.10971-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mattias Jacobsson <2pi@mok.nu>

[ Upstream commit 090158555ff8d194a98616034100b16697dd80d0 ]

Upon success the update_status handler returns a positive number
corresponding to the number of bytes transferred by usb_control_msg.
However the return code of the update_status handler should indicate if
an error occurred(negative) or how many bytes of the user's input to sysfs
that was consumed. Return code zero indicates all bytes were consumed.

The bug can for example result in the update_status handler being called
twice, the second time with only the "unconsumed" part of the user's input
to sysfs. Effectively setting an incorrect brightness.

Change the update_status handler to return zero for all successful
transactions and forward usb_control_msg's error code upon failure.

Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/misc/appledisplay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index b8092bcf89a29..140af7754c1e6 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -160,8 +160,11 @@ static int appledisplay_bl_update_status(struct backlight_device *bd)
 		pdata->msgdata, 2,
 		ACD_USB_TIMEOUT);
 	mutex_unlock(&pdata->sysfslock);
-	
-	return retval;
+
+	if (retval < 0)
+		return retval;
+	else
+		return 0;
 }
 
 static int appledisplay_bl_get_brightness(struct backlight_device *bd)
-- 
2.20.1

