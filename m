Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B69A3422108
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 10:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhJEIqh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 04:46:37 -0400
Received: from cable.insite.cz ([84.242.75.189]:36036 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230526AbhJEIqg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 Oct 2021 04:46:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C8625A1A3D403;
        Tue,  5 Oct 2021 10:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633423482; bh=/ZWWRzj4ELLzmrzMGAqK2AbIUtDwgPLjoYip1D8wGBY=;
        h=From:To:Cc:Subject:Date:From;
        b=MFb5nnK8yWglb3AmwZCoGF7MCUVxFX1CNv0xHc61uL6EjXefJafRYXRRck+RXsjsH
         PejFPazw9jbtA01/L6n7dUwWtmYGj6TDNPlu3QRyZrOA6Hf7yWSV/bhm0XkFw8qqys
         wlxmBGYpB2woSPKn3/PUdVRkmtBVJJryG8XVCeK8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hZyrhb0JavG7; Tue,  5 Oct 2021 10:44:37 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 41CA3A1A3D402;
        Tue,  5 Oct 2021 10:44:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1633423477; bh=/ZWWRzj4ELLzmrzMGAqK2AbIUtDwgPLjoYip1D8wGBY=;
        h=From:To:Cc:Subject:Date:From;
        b=isOafJMNGZdJCww1f7EHyTJCu4/Mm4foI3GFZZHJEF4cdl41xx82qWcfVglBZ5q6J
         VQlo7n9BoeBLxcYW3nDRuOY+F0ThilrKyniYWMymiaqe28NfS7VSIyPGLQVsVPpec9
         pLSGUyadU1FGllUNHAn/DaKIF5EpU/ZoBtdvcDJY=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize
Date:   Tue,  5 Oct 2021 10:44:36 +0200
Message-Id: <20211005084436.6812-1-pavel.hofman@ivitera.com>
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
Fixes: e89bb4288378 ("usb: gadget: u_audio: add real feedback
implementation")
Cc: stable@vger.kernel.org
Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
Tested-by: Jack Pham <jackp@codeaurora.org>
---
 drivers/usb/gadget/function/f_uac2.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 17a7ab2c799c..5c7eddf511e5 100644
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

