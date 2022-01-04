Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACCC4844A7
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 16:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbiADPdW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 10:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233544AbiADPdV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 10:33:21 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D2BC061784
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 07:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=Afi+Ptr3E/fV1WEq+2mFLajGVlp7taApFIdL+IwPa6U=; b=x+RkH
        KKX/B3frJ4FgKyRmoxN5bU0UvVTq2i3fgdkbzomJctt6DFseG9/XQ1SG/swWPdqulge08qOpOqQSy
        2y8aHiLgcEUEV9ehltG5Wo8QV1qxUCE3onvAKBn2rJHHXc6FdCCmvzmAX2JYkpfl5AQhGEdWvRdA4
        qz528WoZQSkvWCiVkGW6G2LYPkIo0HLYmMCSTyzEjdTaq4bV/PZuJCdUL7e9Jr1NptTHOAU9Pqhfv
        Z6+JgACjclaMexLTWbgXcd5Y83SSUzjDu9SkgohXjfef0HdoRiYcScgfMIz5NteVqvE9D2Cc33q0c
        BbNSZT2/xz0Yu2W6jUWN1NI37diqA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1n4loN-0008Ll-1d; Tue, 04 Jan 2022 15:33:19 +0000
Date:   Tue, 4 Jan 2022 15:33:17 +0000
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
Message-ID: <YdRovSviQ4IQ82zm@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-12-pavel.hofman@ivitera.com>
 <YcHIsR4AFaL9g6N2@donbot>
 <fd9646e9-0d2b-6d53-863e-2184e038476a@ivitera.com>
 <20211222195030.4d37dbc7.john@metanate.com>
 <61fcf11b-51dc-a0b9-6782-eaf4302af3ef@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61fcf11b-51dc-a0b9-6782-eaf4302af3ef@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 23, 2021 at 08:09:39AM +0100, Pavel Hofman wrote:
> 
> Dne 22. 12. 21 v 20:50 John Keeping napsal(a):
> > On Wed, 22 Dec 2021 14:35:07 +0100
> > Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> > 
> > > Dne 21. 12. 21 v 13:29 John Keeping napsal(a):
> > > > On Mon, Dec 20, 2021 at 10:11:30PM +0100, Pavel Hofman wrote:
> > > > > So far bInterval for HS and SS was fixed at 4, disallowing faster
> > > > > samplerates. The patch determines the largest bInterval (4 to 1)
> > > > > for which the required bandwidth of the max samplerate fits the
> > > > > max allowed packet size. If the required bandwidth exceeds max
> > > > > bandwidth for single-packet mode (ep->mc=1), bInterval is left at
> > > > > 1.
> > > > 
> > > > I'm not sure if this is desirable - there are more concerns around
> > > > the interval than just whether the bandwidth is available.
> > > > 
> > > > The nice thing about having the HS/SS interval at 4 when the FS
> > > > value is 1 is that these both correspond to 1ms, which means the
> > > > calculations for minimum buffer & period sizes are the same for
> > > > FS/HS/SS.
> > > 
> > > Please do you see any specific place in u_audio.c where the interval of
> > > 1ms is assumed?
> > > 
> > > * Buffer/period size max limits are fixed
> > > * Bufer min size is calculated from the max_packet_size
> > > * snd_pcm_period_elapsed() is called when the current request fill
> > > overlaps the period boundary:
> > > 
> > > if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
> > > 		snd_pcm_period_elapsed(substream);
> > > 
> > > 
> > > The fixed HS bInterval=4 severely limits the available bandwidth,
> > > disallowing even the very basic 192kHz/2ch/24bits config.
> > 
> > Yes, but the problem is if the device enumerates as full-speed the
> > capability is no longer there.
> > 
> > I agree that is unlikely to be a problem in real use, but I think it
> > deserves consideration.
> 
> Please can you elaborate more on that? If the device enumerates as FS, it's
> automatically limited to bInterval=1 fullspeed frame. Not much more to do,
> IIUC.

Say we have 8 channels of 32-bit audio at 96kHz which requires 3072000
bytes per second, and IIUC we need bInterval == 2 for this to work at
HS.

But for FS there is no way to provide that bandwidth, so if the gadget
happens to be connected to a host that is only capable of FS then the
configuration just doesn't work.  I think what actually happens given
the current code is that each packet ends up truncated and parts of the
audio data are just dropped.

> > For the last few years I've been using bInterval == 1 but I also have a
> > hack to disable full-speed operation completely.  In my case this is
> > because I want to minimise latency and with the 1ms interval for FS the
> > minimum ALSA period size is too large.
> > 
> > Basically, I agree with wanting a smaller bInterval, but I want it for a
> > different reason and I'd like to see a patch that addresses both our use
> > cases ;-)
> > 
> > > In f_uac2.c both HS/SS the max packet size, async EP OUT feedback value,
> > > as well as async EP IN momentary packet size calculations already take
> > > into account the bInterval of the respective endpoint.
> > > 
> > > I have been using bInterval < 4 in most of my tests for almost a year,
> > > testing packet sizes at up to 1024 bytes per 125us uframe, both
> > > directions, and the gadget has been bitperfect for samplerates up to
> > > 4MHz (including correctly working async feedback, tested on linux (up to
> > > 4MHz) and windows 10 WASAPI exclusive (up to 1.5MHz). For larger
> > > samplerates tests I increased the buffers like in the patch below but I
> > > did it just in case to minimize probability of xruns. It's not part of
> > > this patchset and should be configured dynamically too, if actually
> > > needed at all:
> > 
> > This is another case of a different trade-off - I use PREEMPT_RT to
> > minimise xruns and run with a period of 16 samples.
> > 
> > > > How do FS transfers work if the bandwidth requirements necessitate a
> > > >   smaller interval for HS/SS?  Doesn't that mean the FS transfers
> > > > must be too big?
> > > 
> > > Only UAC2 HS/SS bIntervals are dynamic with this patch, FS stays fixed
> > > at 1ms. For HS/SS  the max packet size is calculated together with the
> > > bInterval, so that the largest bInterval possible to fit the ISOC max
> > > packetsize limits is chosen.
> > 
> > I'd really like to see FS mode become unsupported when the packet size
> > is too big.  This is a slight issue right now (for 1023 vs 1024) but
> > this patch makes it significantly worse for the high bandwidth case.
> 
> I am afraid I do not understand what the patch makes worse. For FS it always
> yields bInterval=1 and the corresponding maxPacketSize, a calculation of
> which has not been changed by the patch.

See my comment above - before the difference was really 1023 vs 1024 so
it's possible to hit a problematic configuration but it's a smaller
window.

I really think we should avoid a configuration that mostly works but
fails in surprising ways (for example, working at HS but resulting in
corrupt data at FS because there just isn't sufficient bandwidth for the
sample rate, sample size and channel configuration selected).

> > Right now I have this patch which is a hack but does at least result in
> > an error for the host when trying to enable audio at FS.  It would be
> > really nice to properly handle this in the composite gadget core so that
> > the audio function is exposed only at HS/SS with proper
> > DT_OTHER_SPEED_CONFIG handling, but currently that code assumes that the
> > same number of descriptors is provided for each speed.
> > 
> > -- 8< --
> > diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> > index 36fa6ef0581b..b4946409b38a 100644
> > --- a/drivers/usb/gadget/function/f_uac2.c
> > +++ b/drivers/usb/gadget/function/f_uac2.c
> > @@ -1356,6 +1356,9 @@ afunc_set_alt(struct usb_function *fn, unsigned intf, unsigned alt)
> >   		return 0;
> >   	}
> > +	if (gadget->speed < USB_SPEED_HIGH && alt)
> > +		return -EINVAL;
> > +
> >   	if (intf == uac2->as_out_intf) {
> >   		uac2->as_out_alt = alt;
> > -- >8 --
> > 
> > > > I don't think there has ever been a check that the configured sample
> > > >   size, channel count and interval actually fit in the max packet
> > > > size for an endpoint.  Is that something that should be checked to
> > > > give an error on bind if the configuration can't work?
> > > 
> > > The existing code has never had checks for any of that. Actually the
> > > dynamic bInterval calculation in this patch handles the bInterval and
> > > packetsize for configured parameters up to maximum ISOC bandwidth. Next
> > > version of this patch will at least warn about exceeding the overall
> > > available bandwidth.
> > > 
> > > There are many patches to go before the audio gadget becomes fool-proof,
> > > but at least it should be practically usable with these patches (when
> > > finalized) and the gaudio controller example implementation.
> > 
> > Agreed, and I really appreciate the improvements you're making here.
> > 
> > The reason I suggested the new checks here is that it makes a lot of
> > sense if the bInterval value is exposed as part of the configfs
> > interface.  It means there's one extra value to set for high bandwidth
> > operation, rather than having it "just work", but I think the
> > latency/bandwidth tradeoffs here mean that there's no way for the kernel
> > to select the right value for all scenarios, so really we need to let
> > the user tell us what they want.
> 
> OK. IMO it could be easily resolved by having the upper bInterval limit for
> the largest-fitting bInterval check of my patch configurable by new configfs
> max_bint, defaulting to the existing value of 4. I would leave the default
> (4), minimizing CPU load, you would set max_bint=1, minimizing latency. Any
> max_bint value in between would work, while still having available the
> automated calculation if lower bint value was required for the given
> parameters.
> 
> In addition, the final check dev_warn can be chanched to dev_err + returning
> EINVAL, providing the discussed sanity check. The check would work for FS as
> well as for HS/SS.
> 
> This change could be split to three patches:
> 
> 1. the automated calculation with fixed max_bint=4 - my current patch,
> dev_warn if max_size_bw > max_size_ep, max_size_bw limited to max_size_ep,
> no error, only warning.
> 
> 2. adding the uac2_opts max_bint, using in set_ep_max_packet_size_bint
> 
> 3. turning the sanity check warning to failing error: changing the dev_warn
> in the final check to dev_err+ returning error.
> 
> So the final version could look like this:

This sounds good to me.

But I think you'll hit the FS vs HS bandwidth issue described above when
trying anything that requires a lower bInterval ;-)

I really think the answer to this is an extra patch/series that disables
operation at full speed when more bandwidth is required.  Ideally that
would include enhancing the gadget core to support different descriptors
for different speeds (which is already somewhat supported as other speed
config descriptors are returned correctly, but IIRC there's an
assumption that the number of descriptors is the same across all
speeds).

> static int set_ep_max_packet_size_bint(struct device *dev, const struct
> f_uac2_opts *uac2_opts,
> 	struct usb_endpoint_descriptor *ep_desc,
> 	enum usb_device_speed speed, bool is_playback)
> {
> 	u16 max_size_bw, max_size_ep;
> 	u8 bint;
> 
> 	switch (speed) {
> 	case USB_SPEED_FULL:
> 		max_size_ep = 1023;
> 		// fixed
> 		bint = 1;
> 		max_size_bw = get_max_bw_for_bint(uac2_opts, bint, 1000, is_playback);
> 		break;
> 
> 	case USB_SPEED_HIGH:
> 	case USB_SPEED_SUPER:
> 		max_size_ep = 1024;
> 		// checking bInterval from max configured bInterval to 1 if the required
> bandwidth fits
> 		for (bint = uac2_opts->max_bint; bint > 0; --bint) {
> 			max_size_bw = get_max_bw_for_bint(uac2_opts, bint, 8000, is_playback);
> 			if (max_size_bw <= max_size_ep)
> 				break;
> 		}
> 		break;
> 
> 	default:
> 		return -EINVAL;
> 	}
> 
> 	if (max_size_bw > max_size_ep) {
> 		dev_err(dev,
> 			"Req. maxpcktsize %d at bInterval 1= > max ISOC %d, cannot comply!\n",
> 			max_size_bw, max_size_ep);
> 		return -EINVAL;
> 	}
> 
> 	ep_desc->wMaxPacketSize = cpu_to_le16(max_size_bw);
> 	ep_desc->bInterval = bint;
> 
> 	return 0;
> }
