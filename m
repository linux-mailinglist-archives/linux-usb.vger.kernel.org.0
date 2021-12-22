Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0289D47D313
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 14:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245408AbhLVNfR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 08:35:17 -0500
Received: from cable.insite.cz ([84.242.75.189]:45657 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234173AbhLVNfQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 08:35:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 74647A1A3D401;
        Wed, 22 Dec 2021 14:35:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640180114; bh=JabI6qIAABBIw7h0ibtN49AXv3QjMa2s9YA35VwYf9g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=J8lBBSx0QL2PlwTj0eDgN4FZZ2/X9YQYvzXkEeFItUCvb932ESFAbOss3XlHpfM6A
         CymtU24M2lSZV5t287z7dPhxgwoWDwmW59998ULdAVDztVa80MV2mJYc+V33jydp8n
         49osmfv3dKoIPJ20VTTbhUmymzb9SL2XixIFA0Kc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id K_EXC9qBLFgN; Wed, 22 Dec 2021 14:35:09 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id C0CDEA1A3D400;
        Wed, 22 Dec 2021 14:35:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640180108; bh=JabI6qIAABBIw7h0ibtN49AXv3QjMa2s9YA35VwYf9g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=E+qsZfXRU1MmjUZ2wJ8BIhYYKn+QSc9nDc1iDREf2O2e4IwFHyKXalfE8/RrMlbpR
         HQHOQq62XwtNvgQ8JE8GlYBvh0Kz4dpwleaDC2M2c2qzdlkYsGLwNXotdhfcYQjzq3
         ZCOqo992rCgZF1KMOzpWhPAVJgLd3i+w0PbsR560=
Subject: Re: [PATCH v2 11/11] usb: gadget: f_uac2: Determining bInterval for
 HS and SS
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-12-pavel.hofman@ivitera.com> <YcHIsR4AFaL9g6N2@donbot>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <fd9646e9-0d2b-6d53-863e-2184e038476a@ivitera.com>
Date:   Wed, 22 Dec 2021 14:35:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcHIsR4AFaL9g6N2@donbot>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 21. 12. 21 v 13:29 John Keeping napsal(a):
> On Mon, Dec 20, 2021 at 10:11:30PM +0100, Pavel Hofman wrote:
>> So far bInterval for HS and SS was fixed at 4, disallowing faster 
>> samplerates. The patch determines the largest bInterval (4 to 1) 
>> for which the required bandwidth of the max samplerate fits the
>> max allowed packet size. If the required bandwidth exceeds max 
>> bandwidth for single-packet mode (ep->mc=1), bInterval is left at 
>> 1.
> 
> I'm not sure if this is desirable - there are more concerns around 
> the interval than just whether the bandwidth is available.
> 
> The nice thing about having the HS/SS interval at 4 when the FS
> value is 1 is that these both correspond to 1ms, which means the 
> calculations for minimum buffer & period sizes are the same for 
> FS/HS/SS.

Please do you see any specific place in u_audio.c where the interval of
1ms is assumed?

* Buffer/period size max limits are fixed
* Bufer min size is calculated from the max_packet_size
* snd_pcm_period_elapsed() is called when the current request fill
overlaps the period boundary:

if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
		snd_pcm_period_elapsed(substream);


The fixed HS bInterval=4 severely limits the available bandwidth,
disallowing even the very basic 192kHz/2ch/24bits config.

In f_uac2.c both HS/SS the max packet size, async EP OUT feedback value, 
as well as async EP IN momentary packet size calculations already take 
into account the bInterval of the respective endpoint.

I have been using bInterval < 4 in most of my tests for almost a year,
testing packet sizes at up to 1024 bytes per 125us uframe, both
directions, and the gadget has been bitperfect for samplerates up to
4MHz (including correctly working async feedback, tested on linux (up to 
4MHz) and windows 10 WASAPI exclusive (up to 1.5MHz). For larger 
samplerates tests I increased the buffers like in the patch below but I 
did it just in case to minimize probability of xruns. It's not part of 
this patchset and should be configured dynamically too, if actually 
needed at all:


diff --git a/drivers/usb/gadget/function/u_audio.c 
b/drivers/usb/gadget/function/u_audio.c
index 58e18952953b..1dedbf324141 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -23,8 +23,8 @@

  #include "u_audio.h"

-#define BUFF_SIZE_MAX  (PAGE_SIZE * 16)
-#define PRD_SIZE_MAX   PAGE_SIZE
+#define BUFF_SIZE_MAX  (PAGE_SIZE * 16 * 64)
+#define PRD_SIZE_MAX   PAGE_SIZE * 64
  #define MIN_PERIODS    4

  enum {
diff --git a/drivers/usb/gadget/function/u_uac2.h 
b/drivers/usb/gadget/function/u_uac2.h
index 8058217322f8..ae485913db46 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -30,7 +30,7 @@
  #define UAC2_DEF_MAX_DB                0               /* 0 dB */
  #define UAC2_DEF_RES_DB                (1*256)         /* 1 dB */

-#define UAC2_DEF_REQ_NUM 2
+#define UAC2_DEF_REQ_NUM 8
  #define UAC2_DEF_INT_REQ_NUM   10

  struct f_uac2_opts {


> 
> How do FS transfers work if the bandwidth requirements necessitate a
>  smaller interval for HS/SS?  Doesn't that mean the FS transfers
> must be too big?

Only UAC2 HS/SS bIntervals are dynamic with this patch, FS stays fixed
at 1ms. For HS/SS  the max packet size is calculated together with the
bInterval, so that the largest bInterval possible to fit the ISOC max
packetsize limits is chosen.

> 
> I don't think there has ever been a check that the configured sample
>  size, channel count and interval actually fit in the max packet
> size for an endpoint.  Is that something that should be checked to
> give an error on bind if the configuration can't work?

The existing code has never had checks for any of that. Actually the
dynamic bInterval calculation in this patch handles the bInterval and
packetsize for configured parameters up to maximum ISOC bandwidth. Next 
version of this patch will at least warn about exceeding the overall 
available bandwidth.

There are many patches to go before the audio gadget becomes fool-proof,
but at least it should be practically usable with these patches (when 
finalized) and the gaudio controller example implementation.

I will send the new patchset version with notes for each patch hopefully 
tomorrow.

Thanks a lot for your help,

Pavel.
