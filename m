Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46D5447D7FD
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 20:50:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345312AbhLVTug (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 14:50:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbhLVTuf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Dec 2021 14:50:35 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92519C061574
        for <linux-usb@vger.kernel.org>; Wed, 22 Dec 2021 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Content-Type:
        References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID
        :Content-Description; bh=jGdMFYWjc9IS0ahz18QRjd2BzRCR5ghjnloEzesL3Q4=; b=xcW1
        55T4xhz3vHTct8hpxI0Djwp+49k0sMok+SnIaVx5dpqxgKfrqJatgfp0QK2uXyWdyo3LUNYmRGFY+
        bqfNws6kkiaEDa8t1ItKxRbly0v1MITlVVJaFArrJj3tkJuG/jitGvZUVtiDiZuBORkwwW6YExX5/
        P1V57/VZzFX0eaoMD1GlYH5PO8dXyK05D5+6vHjyEjqrAYphwNusfFABgKb/XxJMAdV/urUrJnP4q
        arvZWNO5b8yJ1M52ZnL6JcwSBhRqLXIUQdJB2MDJhHoBsiOk+wS2jOQsxQDdCaXpv0DI6QOIt3Vnm
        CHb0qV5ax7OQO+P9u1IHfY81xnhCnA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1n07d9-0000ZO-3m; Wed, 22 Dec 2021 19:50:31 +0000
Date:   Wed, 22 Dec 2021 19:50:30 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 11/11] usb: gadget: f_uac2: Determining bInterval for
 HS and SS
Message-ID: <20211222195030.4d37dbc7.john@metanate.com>
In-Reply-To: <fd9646e9-0d2b-6d53-863e-2184e038476a@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
        <20211220211130.88590-12-pavel.hofman@ivitera.com>
        <YcHIsR4AFaL9g6N2@donbot>
        <fd9646e9-0d2b-6d53-863e-2184e038476a@ivitera.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 22 Dec 2021 14:35:07 +0100
Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Dne 21. 12. 21 v 13:29 John Keeping napsal(a):
> > On Mon, Dec 20, 2021 at 10:11:30PM +0100, Pavel Hofman wrote:  
> >> So far bInterval for HS and SS was fixed at 4, disallowing faster 
> >> samplerates. The patch determines the largest bInterval (4 to 1) 
> >> for which the required bandwidth of the max samplerate fits the
> >> max allowed packet size. If the required bandwidth exceeds max 
> >> bandwidth for single-packet mode (ep->mc=1), bInterval is left at 
> >> 1.  
> > 
> > I'm not sure if this is desirable - there are more concerns around 
> > the interval than just whether the bandwidth is available.
> > 
> > The nice thing about having the HS/SS interval at 4 when the FS
> > value is 1 is that these both correspond to 1ms, which means the 
> > calculations for minimum buffer & period sizes are the same for 
> > FS/HS/SS.  
> 
> Please do you see any specific place in u_audio.c where the interval of
> 1ms is assumed?
> 
> * Buffer/period size max limits are fixed
> * Bufer min size is calculated from the max_packet_size
> * snd_pcm_period_elapsed() is called when the current request fill
> overlaps the period boundary:
> 
> if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
> 		snd_pcm_period_elapsed(substream);
> 
> 
> The fixed HS bInterval=4 severely limits the available bandwidth,
> disallowing even the very basic 192kHz/2ch/24bits config.

Yes, but the problem is if the device enumerates as full-speed the
capability is no longer there.

I agree that is unlikely to be a problem in real use, but I think it
deserves consideration.

For the last few years I've been using bInterval == 1 but I also have a
hack to disable full-speed operation completely.  In my case this is
because I want to minimise latency and with the 1ms interval for FS the
minimum ALSA period size is too large.

Basically, I agree with wanting a smaller bInterval, but I want it for a
different reason and I'd like to see a patch that addresses both our use
cases ;-)

> In f_uac2.c both HS/SS the max packet size, async EP OUT feedback value, 
> as well as async EP IN momentary packet size calculations already take 
> into account the bInterval of the respective endpoint.
> 
> I have been using bInterval < 4 in most of my tests for almost a year,
> testing packet sizes at up to 1024 bytes per 125us uframe, both
> directions, and the gadget has been bitperfect for samplerates up to
> 4MHz (including correctly working async feedback, tested on linux (up to 
> 4MHz) and windows 10 WASAPI exclusive (up to 1.5MHz). For larger 
> samplerates tests I increased the buffers like in the patch below but I 
> did it just in case to minimize probability of xruns. It's not part of 
> this patchset and should be configured dynamically too, if actually 
> needed at all:

This is another case of a different trade-off - I use PREEMPT_RT to
minimise xruns and run with a period of 16 samples.

> > How do FS transfers work if the bandwidth requirements necessitate a
> >  smaller interval for HS/SS?  Doesn't that mean the FS transfers
> > must be too big?  
> 
> Only UAC2 HS/SS bIntervals are dynamic with this patch, FS stays fixed
> at 1ms. For HS/SS  the max packet size is calculated together with the
> bInterval, so that the largest bInterval possible to fit the ISOC max
> packetsize limits is chosen.

I'd really like to see FS mode become unsupported when the packet size
is too big.  This is a slight issue right now (for 1023 vs 1024) but
this patch makes it significantly worse for the high bandwidth case.

Right now I have this patch which is a hack but does at least result in
an error for the host when trying to enable audio at FS.  It would be
really nice to properly handle this in the composite gadget core so that
the audio function is exposed only at HS/SS with proper
DT_OTHER_SPEED_CONFIG handling, but currently that code assumes that the
same number of descriptors is provided for each speed.

-- 8< --
diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 36fa6ef0581b..b4946409b38a 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1356,6 +1356,9 @@ afunc_set_alt(struct usb_function *fn, unsigned intf, unsigned alt)
 		return 0;
 	}
 
+	if (gadget->speed < USB_SPEED_HIGH && alt)
+		return -EINVAL;
+
 	if (intf == uac2->as_out_intf) {
 		uac2->as_out_alt = alt;
 
-- >8 --

> > I don't think there has ever been a check that the configured sample
> >  size, channel count and interval actually fit in the max packet
> > size for an endpoint.  Is that something that should be checked to
> > give an error on bind if the configuration can't work?  
> 
> The existing code has never had checks for any of that. Actually the
> dynamic bInterval calculation in this patch handles the bInterval and
> packetsize for configured parameters up to maximum ISOC bandwidth. Next 
> version of this patch will at least warn about exceeding the overall 
> available bandwidth.
> 
> There are many patches to go before the audio gadget becomes fool-proof,
> but at least it should be practically usable with these patches (when 
> finalized) and the gaudio controller example implementation.

Agreed, and I really appreciate the improvements you're making here.

The reason I suggested the new checks here is that it makes a lot of
sense if the bInterval value is exposed as part of the configfs
interface.  It means there's one extra value to set for high bandwidth
operation, rather than having it "just work", but I think the
latency/bandwidth tradeoffs here mean that there's no way for the kernel
to select the right value for all scenarios, so really we need to let
the user tell us what they want.


Regards,
John
