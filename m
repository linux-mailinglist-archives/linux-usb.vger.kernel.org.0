Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 596F6416D4B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Sep 2021 10:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244559AbhIXIFb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Sep 2021 04:05:31 -0400
Received: from cable.insite.cz ([84.242.75.189]:58218 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244520AbhIXIDH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Sep 2021 04:03:07 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E9D24A1A3D401;
        Fri, 24 Sep 2021 10:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1632470433; bh=6X5eR3lSLjJO85Z/62ryGhy9hkQCDw0epa5j/kvBSYk=;
        h=From:To:Cc:Subject:Date:From;
        b=MvWS/rUNpgpQQZ51A9aGE76zSIDFoH7+fInsHNj51Z2w47L8QPBarBio+XiGHX8Gx
         IGTA9maaVIqHLwRhaAHTQLsUV/0HoRlsFO3Fh5/jJ7+eKPZHLPFdFcin6p9icykJqH
         fAxV3oSb2mCNxZtsfrkRC5MNe91PEs2+gzOOYSNM=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0wBA5kTnnYMQ; Fri, 24 Sep 2021 10:00:28 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 82DD5A1A3D400;
        Fri, 24 Sep 2021 10:00:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1632470428; bh=6X5eR3lSLjJO85Z/62ryGhy9hkQCDw0epa5j/kvBSYk=;
        h=From:To:Cc:Subject:Date:From;
        b=O1KZkZQNvsZYw0Odd4uspjhjx4Ce2df/7pblZ97qr+RcTTT/jE5XWtuOTjtQJTRjs
         H8ED9xSOsIRFbSpiDlAvV2xZ33KZckIB62hgtgNK6WiMcK5qQ56YGmTV0DvfWe/728
         PE+B5Qj7sIPkN5XqnNa6RfQOhFzMzJZTcU3C5MLo=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
Date:   Fri, 24 Sep 2021 10:00:27 +0200
Message-Id: <20210924080027.5362-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Async feedback patches broke enumeration on Windows 10 previously fixed
by commit 789ea77310f0 ("usb: gadget: f_uac2: always increase endpoint
max_packet_size by one audio slot").

While the existing calculation for EP OUT capture for async mode yields
size+1 frame due to uac2_opts->fb_max > 0, playback side lost the +1
feature.  Therefore the +1 frame addition must be re-introduced for
playback. Win10 enumerates the device only when both EP IN and EP OUT
max packet sizes are (at least) +1 frame.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
Tested-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index b9edc6787f79..f0da11409f81 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -665,11 +665,17 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
 		ssize = uac2_opts->c_ssize;
 	}
 
-	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
+	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC)) {
+	  // Win10 requires max packet size + 1 frame
 		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
-
-	max_size_bw = num_channels(chmask) * ssize *
-		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
+		// updated srate is always bigger, therefore DIV_ROUND_UP always yields +1
+		max_size_bw = num_channels(chmask) * ssize *
+			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))));
+	} else {
+		// adding 1 frame provision for Win10
+		max_size_bw = num_channels(chmask) * ssize *
+			(DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1))) + 1);
+	}
 	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
 						    max_size_ep));
 
-- 
2.25.1

