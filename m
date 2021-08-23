Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA3323F4B88
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 15:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbhHWNSJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 09:18:09 -0400
Received: from cable.insite.cz ([84.242.75.189]:39663 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236499AbhHWNSI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 09:18:08 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 4D8AFA1A3D401;
        Mon, 23 Aug 2021 15:17:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629724645; bh=RhC0mxgfunhwb/OmfQfKQXQwRlStapNX4rrh29x54MI=;
        h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
        b=BTF2WDZPJMv30isCUmhRIERZ7+jX7NzqYmiD0XAMOG16U7uje1/X8VFDbB74YF19c
         ugUgM0fQHPAQ5BQPFO8/lhU9ZsG9Ew6C5WbwbGmCksAxIv6ATdzC7MFZfGVdSvSnnW
         0cEH5G1ThhshfTie6NppXg+YPcfpdiZsVLTKqNMc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id N2rxysxYXL6X; Mon, 23 Aug 2021 15:17:19 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 6BAD3A1A3D400;
        Mon, 23 Aug 2021 15:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629724639; bh=RhC0mxgfunhwb/OmfQfKQXQwRlStapNX4rrh29x54MI=;
        h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
        b=gfQYsdQoOtISIKwY9zZEhhwIC73zvDVbM0mIZCobz2F0zNu9Xv3csGYgUjWNGdcbk
         plEsferv9VvyninzFz5s6vum6+NPaxj9/ZfuvjyvK01evwmZf5Lhfb3l1YS3hbkOeX
         Zz051cr2ksL4DLcWBRMiKqF3XUqVsucn3tzPznqg=
Subject: Re: uac2/hid gadget issues on Win10 hosts
To:     "N. Chen" <takhv1@gmail.com>, linux-usb@vger.kernel.org
References: <CADA1JhOe89Q7iQtb7vwK6utigpKfo+UfuW6o2GdMBMo5rAz7=A@mail.gmail.com>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <9f719bb8-2a9a-4a97-f25a-660d38a29555@ivitera.com>
Date:   Mon, 23 Aug 2021 15:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CADA1JhOe89Q7iQtb7vwK6utigpKfo+UfuW6o2GdMBMo5rAz7=A@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------A2CA95071ADC4A4D0E349F0D"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------A2CA95071ADC4A4D0E349F0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tak,

Dne 23. 08. 21 v 13:45 N. Chen napsal(a):
> I'm attempting to create a composite gadget device that uses uac2 and
> hid functions (speakerphone), using the latest kernel branch
> (rpi-5.14.y) on a rpi4 device.
> Windows10 host does not recognize the device as an audio usb device.
> In order to get it recognized, I had to use c_sync in adaptive mode,
> as well as make the following adjustments:
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c
> b/drivers/usb/gadget/function/f_uac2.c
> index ae29ff2b2b68..74a221939ca0 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -177,7 +177,7 @@ static struct uac2_input_terminal_descriptor
> io_in_it_desc = {
> 
>          .bDescriptorSubtype = UAC_INPUT_TERMINAL,
>          /* .bTerminalID = DYNAMIC */
> -       .wTerminalType = cpu_to_le16(UAC_INPUT_TERMINAL_UNDEFINED),
> +       .wTerminalType = cpu_to_le16(UAC_INPUT_TERMINAL_MICROPHONE),
>          .bAssocTerminal = 0,
>          /* .bCSourceID = DYNAMIC */
>          .iChannelNames = 0,
> @@ -205,7 +205,7 @@ static struct uac2_output_terminal_descriptor
> io_out_ot_desc = {
> 
>          .bDescriptorSubtype = UAC_OUTPUT_TERMINAL,
>          /* .bTerminalID = DYNAMIC */
> -       .wTerminalType = cpu_to_le16(UAC_OUTPUT_TERMINAL_UNDEFINED),
> +       .wTerminalType = cpu_to_le16(UAC_OUTPUT_TERMINAL_SPEAKER),
>          .bAssocTerminal = 0,
>          /* .bSourceID = DYNAMIC */
>          /* .bCSourceID = DYNAMIC */
> @@ -216,7 +216,7 @@ static struct uac2_ac_header_descriptor ac_hdr_desc = {
>          .bLength = sizeof ac_hdr_desc,
>          .bDescriptorType = USB_DT_CS_INTERFACE,
> 
> -       .bDescriptorSubtype = UAC_MS_HEADER,
> +       .bDescriptorSubtype = UAC_HEADER,
>          .bcdADC = cpu_to_le16(0x200),
>          .bCategory = UAC2_FUNCTION_IO_BOX,
>          /* .wTotalLength = DYNAMIC */
> @@ -400,7 +400,7 @@ static struct usb_endpoint_descriptor fs_epin_desc = {
>          .bDescriptorType = USB_DT_ENDPOINT,
> 
>          .bEndpointAddress = USB_DIR_IN,
> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_SYNC,
>          /* .wMaxPacketSize = DYNAMIC */
>          .bInterval = 1,
>   };
> @@ -409,7 +409,7 @@ static struct usb_endpoint_descriptor hs_epin_desc = {
>          .bLength = USB_DT_ENDPOINT_SIZE,
>          .bDescriptorType = USB_DT_ENDPOINT,
> 
> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_SYNC,
>          /* .wMaxPacketSize = DYNAMIC */
>          .bInterval = 4,
>   };
> @@ -419,7 +419,7 @@ static struct usb_endpoint_descriptor ss_epin_desc = {
>          .bDescriptorType = USB_DT_ENDPOINT,
> 
>          .bEndpointAddress = USB_DIR_IN,
> -       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +       .bmAttributes = USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_SYNC,
>          /* .wMaxPacketSize = DYNAMIC */
>          .bInterval = 4,
>   };
> --

There is a problem with max packet size calculation for EP-IN. It has 
been discussed here recently
https://www.spinics.net/lists/linux-usb/msg214615.html

The simple change in the post above fixed Win10 enumeration for me and 
another tester.

Also, there is a problem with feedback value calculation which Win10 
ignores and keeps sending the same amount of samples. The fix is to send 
number of samples per the actual packet, not per microframe for USB2. I 
have not posted the attached patch as the whole patchset will most 
likely be reverted for 5.15 
https://www.spinics.net/lists/linux-usb/msg216042.html and I wanted to 
wait till the situation works out to avoid confusion. In the attached 
patch just change the ->c_srate_active to ->c_srate (the patch is on top 
of more changes for switching between multiple samplerates).

Best regards,

Pavel.

--------------A2CA95071ADC4A4D0E349F0D
Content-Type: text/x-patch; charset=UTF-8;
 name="0009-usb-gadget-u_audio-EP-OUT-bInterval-in-fback-frequen.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0009-usb-gadget-u_audio-EP-OUT-bInterval-in-fback-frequen.pa";
 filename*1="tch"

From 91dda032dd0958006a4e0a6f1f51526cefd95a1e Mon Sep 17 00:00:00 2001
From: Pavel Hofman <pavel.hofman@ivitera.com>
Date: Thu, 12 Aug 2021 18:03:36 +0200
Subject: [PATCH 9/9] usb: gadget: u_audio: EP-OUT bInterval in fback frequency

Tests have revealed that Win10 and OSX UAC2 drivers require
the feedback frequency to be based on the actual packet
interval instead of on the USB2 microframe. Otherwise they
ignore the feedback value. Linux snd-usb-audio driver
detects the applied bitshift automatically.

The patch increases the bitshift in feedback frequency
calculation with EP-OUT bInterval value.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
Tested-by: Henrik Enquist <henrik.enquist@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index a7896fbbab36..c70bdb565153 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -98,11 +98,13 @@ static const struct snd_pcm_hardware uac_pcm_hardware = {
 };
 
 static void u_audio_set_fback_frequency(enum usb_device_speed speed,
+          struct usb_ep *out_ep,
 					unsigned long long freq,
 					unsigned int pitch,
 					void *buf)
 {
 	u32 ff = 0;
+	const struct usb_endpoint_descriptor *ep_desc;
 
 	/*
 	 * Because the pitch base is 1000000, the final divider here
@@ -130,8 +132,13 @@ static void u_audio_set_fback_frequency(enum usb_device_speed speed,
 		 * byte fromat (that is Q16.16)
 		 *
 		 * ff = (freq << 16) / 8000
+		 *
+		 * Win10 and OSX UAC2 drivers require number of samples per packet
+		 * in order to honor the feedback value.
+		 * Linux snd-usb-audio detects the used bit shift automatically.
 		 */
-		freq <<= 4;
+		ep_desc = out_ep->desc;
+		freq <<= 4 + (ep_desc->bInterval - 1);
 	}
 
 	ff = DIV_ROUND_CLOSEST_ULL((freq * pitch), 1953125);
@@ -263,7 +270,7 @@ static void u_audio_iso_fback_complete(struct usb_ep *ep,
 		pr_debug("%s: iso_complete status(%d) %d/%d\n",
 			__func__, status, req->actual, req->length);
 
-	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+	u_audio_set_fback_frequency(audio_dev->gadget->speed, audio_dev->out_ep,
 				    params->c_srate_active, prm->pitch,
 				    req->buf);
 
@@ -578,7 +585,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	 * be meauserd at start of playback
 	 */
 	prm->pitch = 1000000;
-	u_audio_set_fback_frequency(audio_dev->gadget->speed,
+	u_audio_set_fback_frequency(audio_dev->gadget->speed, ep,
 				    params->c_srate_active, prm->pitch,
 				    req_fback->buf);
 
-- 
2.25.1


--------------A2CA95071ADC4A4D0E349F0D--
