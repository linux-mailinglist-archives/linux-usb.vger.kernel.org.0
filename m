Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7A12F9DE2
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jan 2021 12:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390114AbhARLSV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jan 2021 06:18:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:57286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390064AbhARLRB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Jan 2021 06:17:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC9D3229CA;
        Mon, 18 Jan 2021 11:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610968420;
        bh=pAcNSWqR5YRVGOErrCQ1NR9P9H5lWByvE/049bY4OSY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dklJuHz8AQsb2JhLv7sUdmu2RYc0jgp3YHFd60fWdyhw76sTG7nmz7l+z6WLeiW3u
         RM/2ymG+kUZy90OyPjGXk6Og10/DSR3QnDHz5fkHPAxM/XCzc7byef5LO3146H07MC
         xFUxGtbKt0TvEA8O/4hSiatov0ZqeKBLW33TH5eMdsvF7odIRBkksp16rlW+ZHE6x9
         VS8pmI1GTNusVBw9RzQlCCr/Co0tcgrlQ43ueNdue6WFJsTETieaiqsOojdUm6UxT/
         VEoYcTyIRFCfA3C9yxhQc2lyAhC7psr7PGDIVhC8Q4XahVNt6QmarvEQ6J86gKhlpI
         auc9NFXBuRQYg==
Received: from johan by xi with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1l1STi-0001KQ-1w; Mon, 18 Jan 2021 12:13:46 +0100
From:   Johan Hovold <johan@kernel.org>
To:     linux-usb@vger.kernel.org
Cc:     Sheng Long Wang <china_shenglong@163.com>,
        Wang Sheng Long <shenglong.wang.ext@siemens.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/6] USB: serial: cp210x: set IXOFF thresholds
Date:   Mon, 18 Jan 2021 12:13:27 +0100
Message-Id: <20210118111331.5048-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210118111331.5048-1-johan@kernel.org>
References: <20210118111331.5048-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

At least CP2102 requires the XON/XOFF limits to be initialised in order
for software input flow control (IXOFF) to work. Specifically, XOFF is
never sent if the XOFF limit is left at its default value of zero.

Set the limits so that input is throttled when the FIFO free level drops
below 128 bytes and restarted when the FIFO fill level drops below 128
bytes.

Note that the threshold values have been chosen so that they can be used
also with CP2105 which has the smallest FIFO of the currently supported
device types (288 byte for the SCI port). If needed the limits can be
made device specific later.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/cp210x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 5bd14770065b..ee0139eb6636 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -1181,6 +1181,9 @@ static void cp210x_set_flow_control(struct tty_struct *tty,
 	else
 		flow_repl &= ~CP210X_SERIAL_AUTO_TRANSMIT;
 
+	flow_ctl.ulXonLimit = cpu_to_le32(128);
+	flow_ctl.ulXoffLimit = cpu_to_le32(128);
+
 	dev_dbg(&port->dev, "%s - ulControlHandshake=0x%08x, ulFlowReplace=0x%08x\n",
 			__func__, ctl_hs, flow_repl);
 
-- 
2.26.2

