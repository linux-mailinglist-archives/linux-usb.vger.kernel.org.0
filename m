Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F20F3C6E58
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 12:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbhGMKZg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 06:25:36 -0400
Received: from cable.insite.cz ([84.242.75.189]:49812 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235143AbhGMKZg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 13 Jul 2021 06:25:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 4C290A1A3D401;
        Tue, 13 Jul 2021 12:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626171765; bh=T6CrVXl9ZlcszfywyfzDRi5/SjRLZ9Q+cyAFKXeJRP0=;
        h=To:Cc:From:Subject:Date:From;
        b=XUq6SDdz8mYQxSdqMVRrBOR6Y3VVRBk0yrQvgfEJ9aaMwtuy/7ddx1vKBKIrYM9Ee
         2NHYtJSWJMhvMB9YyM3gqf6td0uKQi7nrJpUqIAwLXGGV2lQfnIMCeUa2gugYYw7Mk
         ffvS5p8Bh1XBraByi9Kjxny/RVC/0JPwohsLp6CU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id x1P75clv3_NO; Tue, 13 Jul 2021 12:22:39 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 9EDE5A1A3D400;
        Tue, 13 Jul 2021 12:22:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1626171759; bh=T6CrVXl9ZlcszfywyfzDRi5/SjRLZ9Q+cyAFKXeJRP0=;
        h=To:Cc:From:Subject:Date:From;
        b=rAlpwHzP961tCMxxNCj54D/Idnp9PpBmVr8svchFUk17Vvfpaxm5A99t8Eao27SGK
         4XnqVSa9t8qWTNsLQj3HUQhVFLwCaTh4HWgPbcu0Qgei+aJZMqzF1HaVvzON84gsLR
         EzbG1YaMYPudvVknTpUcnMYEuTLph2Z048KPLh6I=
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Subject: usb:gadget:u_audio: Regression in [v3,3/3] usb: gadget: u_audio: add
 real feedback implementation - wMaxPacketSize calculation
Message-ID: <f861e345-3642-5bfa-0ce7-a5cd34204613@ivitera.com>
Date:   Tue, 13 Jul 2021 12:22:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I am testing the three Ruslan's async feedback patches as modified by 
Jerome and I hit a regression in windows 10 enumeration.

Ruslan posted an already accepted patch 
https://github.com/torvalds/linux/commit/789ea77310f0200c84002884ffd628e2baf3ad8a#diff-876615ece7fb56ce8d45fc70623bef9caa2548e810426f217fb785ffa10b33d5 
which allowed win10 enumeration.

Ruslan's async feedback patchset kept the change: 
https://patchwork.kernel.org/project/linux-usb/patch/1614603943-11668-5-git-send-email-ruslan.bilovol@gmail.com/

diff --git a/drivers/usb/gadget/function/f_uac2.c 
b/drivers/usb/gadget/function/f_uac2.c
index 72b42f8..91b22fb 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -506,6 +506,10 @@  static int set_ep_max_packet_size(const struct 
f_uac2_opts *uac2_opts,

  	max_size_bw = num_channels(chmask) * ssize *
  		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
+
+	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
+		max_size_bw = max_size_bw * FBACK_FREQ_MAX / 100;
+
  	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
  						    max_size_ep));


Jerome's rebase patch which was accepted recently changed the 
functionality to the original code:
https://patchwork.kernel.org/project/linux-usb/patch/20210603220104.1216001-4-jbrunet@baylibre.com/

diff --git a/drivers/usb/gadget/function/f_uac2.c 
b/drivers/usb/gadget/function/f_uac2.c
index 321e6c05ba93..ae29ff2b2b68 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -584,8 +584,11 @@  static int set_ep_max_packet_size(const struct 
f_uac2_opts *uac2_opts,
  		ssize = uac2_opts->c_ssize;
  	}

+	if (!is_playback && (uac2_opts->c_sync == USB_ENDPOINT_SYNC_ASYNC))
+		srate = srate * (1000 + uac2_opts->fb_max) / 1000;
+
  	max_size_bw = num_channels(chmask) * ssize *
-		((srate / (factor / (1 << (ep_desc->bInterval - 1)))) + 1);
+		DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 1)));
  	ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
  						    max_size_ep));

With this version my Win10 does not enumerate the USB AUDIO device, even 
if it has only EP-IN capability (i.e. is_playback = true). For my setup 
the EP-IN wMaxPacketSize is 192bytes vs. 196bytes in Ruslan's version, 
causing win10 reporting "The specified range could not be found in the 
range list."

A simple change makes Win10 enumerate both playback-only as well as 
duplex playback/capture async device:

diff --git a/drivers/usb/gadget/function/f_uac2.c 
b/drivers/usb/gadget/function/f_uac2.c
index ae29ff2b2b68..5ba778814796 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -588,7 +588,7 @@ static int set_ep_max_packet_size(const struct 
f_uac2_opts *uac2_opts,
                 srate = srate * (1000 + uac2_opts->fb_max) / 1000;

         max_size_bw = num_channels(chmask) * ssize *
-               DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval - 
1)));
+               (DIV_ROUND_UP(srate, factor / (1 << (ep_desc->bInterval 
- 1))) + 1);
         ep_desc->wMaxPacketSize = cpu_to_le16(min_t(u16, max_size_bw,
                                                     max_size_ep));


I do not know if this is the most correct solution but IMO a similar 
patch should be applied. I can send a proper patch mail if this solution 
is acceptable.

Thanks a lot,

Pavel.





