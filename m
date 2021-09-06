Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F41F401B53
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 14:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241544AbhIFMoi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Sep 2021 08:44:38 -0400
Received: from cable.insite.cz ([84.242.75.189]:34125 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241553AbhIFMoi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Sep 2021 08:44:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 21927A1A3D401;
        Mon,  6 Sep 2021 14:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1630932212; bh=JFldC+VRPHTIIhxyIRWMEy2290gelv6sZWXMlz2QFsY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Iewz6YuY6uhzfvdWsFgZfzil1nlBfcUd+tyV8XCspQPyA0L8IPCrnKkmFeSpeG5uX
         37OCF9U51kC7UlZBq/rKpn4tUfxcGR5oIQBRS/mKyOLZ7FNBjvEffFKPeylhjdKtFc
         LPj9kIRmi8C14l4Uu/KBbCdMePyj0hONRySNgaj4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VFfDWK2l8bmY; Mon,  6 Sep 2021 14:43:26 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 49116A1A3D400;
        Mon,  6 Sep 2021 14:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1630932206; bh=JFldC+VRPHTIIhxyIRWMEy2290gelv6sZWXMlz2QFsY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=nUrLxTbC6mLOyZj7aWaEbKobapOcCNHkhxgWWIbxUpvDF4VBpVOWwmy3r2Vxuqa24
         XOMv1KLTs7ZiOqO73Hu8LZBHR6EP4A91y1MROVa5Z3M86yQt0kVPv6uHpP/yP+vRdO
         iQ6GTJPi7gRzOHO+Vx1rB4Y32hFxfGv7AL5HTve4=
Subject: Re: uac2/hid gadget issues on Win10 hosts
To:     Jack Pham <jackp@codeaurora.org>
Cc:     "N. Chen" <takhv1@gmail.com>, linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <CADA1JhOe89Q7iQtb7vwK6utigpKfo+UfuW6o2GdMBMo5rAz7=A@mail.gmail.com>
 <9f719bb8-2a9a-4a97-f25a-660d38a29555@ivitera.com>
 <20210904074032.GC3515@jackp-linux.qualcomm.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <b11414f0-1783-192e-2b79-066dd4c814d0@ivitera.com>
Date:   Mon, 6 Sep 2021 14:43:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904074032.GC3515@jackp-linux.qualcomm.com>
Content-Type: multipart/mixed;
 boundary="------------9AE2F847D221C996D486D5EB"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------9AE2F847D221C996D486D5EB
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jack,

Dne 04. 09. 21 v 9:40 Jack Pham napsal(a):
> Hi Pavel,
> 
> On Mon, Aug 23, 2021 at 03:17:11PM +0200, Pavel Hofman wrote:
>> There is a problem with max packet size calculation for EP-IN. It has been
>> discussed here recently
>> https://www.spinics.net/lists/linux-usb/msg214615.html
>>
>> The simple change in the post above fixed Win10 enumeration for me and
>> another tester.
> 
> I faced the same error on Win10 and also tried the above patch and it
> worked for me as well.  Are you planning to send a formal patch for it?
> If so, you can add my
> 
> Tested-by: Jack Pham <jackp@codeaurora.org>
> 
>> Also, there is a problem with feedback value calculation which Win10 ignores
>> and keeps sending the same amount of samples. The fix is to send number of
>> samples per the actual packet, not per microframe for USB2. I have not
>> posted the attached patch as the whole patchset will most likely be reverted
>> for 5.15 https://www.spinics.net/lists/linux-usb/msg216042.html and I wanted
>> to wait till the situation works out to avoid confusion. In the attached
>> patch just change the ->c_srate_active to ->c_srate (the patch is on top of
>> more changes for switching between multiple samplerates).
> 
> It doesn't look like any of the feedback EP changes got reverted for
> 5.14 / 5.15-rc1 so it looks like the dust has settled.  Are you going to
> send the below patch formally as well?
> 

Thanks for testing the patch. I did not want to intrude into Jerome's 
plan. However, if Jerome is OK with the attached patch, I can submit it 
formally and continue with submitting more patches for Win10 support.

Thanks,

Pavel.

--------------9AE2F847D221C996D486D5EB
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usb-gadget-f_uac2-fixed-EP-IN-wMaxPacketSize.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-usb-gadget-f_uac2-fixed-EP-IN-wMaxPacketSize.patch"

From 26f5a49c2ddac2d5c52c4072bc756e7d15b47bc8 Mon Sep 17 00:00:00 2001
From: Pavel Hofman <pavel.hofman@ivitera.com>
Date: Mon, 6 Sep 2021 14:04:00 +0200
Subject: [PATCH] usb: gadget: f_uac2: fixed EP-IN wMaxPacketSize

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
index ae29ff2b2b68..bdc7e6e78455 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -584,11 +584,17 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
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


--------------9AE2F847D221C996D486D5EB--
