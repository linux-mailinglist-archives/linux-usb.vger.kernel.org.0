Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90FDC486615
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jan 2022 15:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240133AbiAFOcr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jan 2022 09:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240116AbiAFOcr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jan 2022 09:32:47 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73752C061245
        for <linux-usb@vger.kernel.org>; Thu,  6 Jan 2022 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=0DXanY2cF6W+39WJQ6oN5e4TXfO6HcsCkWpE0wvAZmo=; b=1Syin
        IqKn4KGaN7UgD6rV3wLZD1tPdnlzxjTKvqaiTerNMCrJ5S9MkbaxoPuHNaNuEELRtfdR0P5SfPXxS
        C7lj8hFYB4VQN8OHdugx/I/48GnBBteIRAe1btM6LVOTKZ7z2ZmPYpRF7xsyekeNiEUVjB36/pG/W
        OCxqo8x5YfpeqWpED9o5ZAa85M4TmyvUtM2DgXaGWvVuhQcGg1F2PlpFm+47Gn6LAq91YlnSGfnrw
        YU/5X49YgPjGOjFamNEnZzFR9HhzCrb7kv/FI9b0eEPqL5VyE9xKSFZcWyzJTAKL75tO4w/vcYpaT
        PPSzxXou68YL0NcmDA0cTW+DeLcmQ==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1n5Too-0006hV-Le; Thu, 06 Jan 2022 14:32:42 +0000
Date:   Thu, 6 Jan 2022 14:32:41 +0000
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
Message-ID: <Ydb9iXxAukfp8GIe@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-12-pavel.hofman@ivitera.com>
 <YcHIsR4AFaL9g6N2@donbot>
 <fd9646e9-0d2b-6d53-863e-2184e038476a@ivitera.com>
 <20211222195030.4d37dbc7.john@metanate.com>
 <61fcf11b-51dc-a0b9-6782-eaf4302af3ef@ivitera.com>
 <YdRovSviQ4IQ82zm@donbot>
 <8bc1b7cb-1732-9802-bd95-7a298e7a4f49@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bc1b7cb-1732-9802-bd95-7a298e7a4f49@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 05, 2022 at 12:31:01PM +0100, Pavel Hofman wrote:
> 
> Dne 04. 01. 22 v 16:33 John Keeping napsal(a):
> > On Thu, Dec 23, 2021 at 08:09:39AM +0100, Pavel Hofman wrote:
> > > 
> > > Dne 22. 12. 21 v 20:50 John Keeping napsal(a):
> > > > On Wed, 22 Dec 2021 14:35:07 +0100
> > > > Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> > > > 
> > > > > Dne 21. 12. 21 v 13:29 John Keeping napsal(a):
> > > > > > On Mon, Dec 20, 2021 at 10:11:30PM +0100, Pavel Hofman wrote:
> > > > > > > So far bInterval for HS and SS was fixed at 4, disallowing faster
> > > > > > > samplerates. The patch determines the largest bInterval (4 to 1)
> > > > > > > for which the required bandwidth of the max samplerate fits the
> > > > > > > max allowed packet size. If the required bandwidth exceeds max
> > > > > > > bandwidth for single-packet mode (ep->mc=1), bInterval is left at
> > > > > > > 1.
> > > > > > 
> > > > > > I'm not sure if this is desirable - there are more concerns around
> > > > > > the interval than just whether the bandwidth is available.
> > > > > > 
> > > > > > The nice thing about having the HS/SS interval at 4 when the FS
> > > > > > value is 1 is that these both correspond to 1ms, which means the
> > > > > > calculations for minimum buffer & period sizes are the same for
> > > > > > FS/HS/SS.
> > > > > 
> > > > > Please do you see any specific place in u_audio.c where the interval of
> > > > > 1ms is assumed?
> > > > > 
> > > > > * Buffer/period size max limits are fixed
> > > > > * Bufer min size is calculated from the max_packet_size
> > > > > * snd_pcm_period_elapsed() is called when the current request fill
> > > > > overlaps the period boundary:
> > > > > 
> > > > > if ((hw_ptr % snd_pcm_lib_period_bytes(substream)) < req->actual)
> > > > > 		snd_pcm_period_elapsed(substream);
> > > > > 
> > > > > 
> > > > > The fixed HS bInterval=4 severely limits the available bandwidth,
> > > > > disallowing even the very basic 192kHz/2ch/24bits config.
> > > > 
> > > > Yes, but the problem is if the device enumerates as full-speed the
> > > > capability is no longer there.
> > > > 
> > > > I agree that is unlikely to be a problem in real use, but I think it
> > > > deserves consideration.
> > > 
> > > Please can you elaborate more on that? If the device enumerates as FS, it's
> > > automatically limited to bInterval=1 fullspeed frame. Not much more to do,
> > > IIUC.
> > 
> > Say we have 8 channels of 32-bit audio at 96kHz which requires 3072000
> > bytes per second, and IIUC we need bInterval == 2 for this to work at
> > HS.
> > 
> > But for FS there is no way to provide that bandwidth, so if the gadget
> > happens to be connected to a host that is only capable of FS then the
> > configuration just doesn't work.  I think what actually happens given
> > the current code is that each packet ends up truncated and parts of the
> > audio data are just dropped.
> 
> Yes. The current version will drop data for both FS (inevitably) and HS,
> eventhough there is no technical reason to drop data for HS as the bandwidth
> is available.
> 
> > 
> > > > For the last few years I've been using bInterval == 1 but I also have a
> > > > hack to disable full-speed operation completely.  In my case this is
> > > > because I want to minimise latency and with the 1ms interval for FS the
> > > > minimum ALSA period size is too large.
> > > > 
> > > > Basically, I agree with wanting a smaller bInterval, but I want it for a
> > > > different reason and I'd like to see a patch that addresses both our use
> > > > cases ;-)
> > > > 
> > > > > In f_uac2.c both HS/SS the max packet size, async EP OUT feedback value,
> > > > > as well as async EP IN momentary packet size calculations already take
> > > > > into account the bInterval of the respective endpoint.
> > > > > 
> > > > > I have been using bInterval < 4 in most of my tests for almost a year,
> > > > > testing packet sizes at up to 1024 bytes per 125us uframe, both
> > > > > directions, and the gadget has been bitperfect for samplerates up to
> > > > > 4MHz (including correctly working async feedback, tested on linux (up to
> > > > > 4MHz) and windows 10 WASAPI exclusive (up to 1.5MHz). For larger
> > > > > samplerates tests I increased the buffers like in the patch below but I
> > > > > did it just in case to minimize probability of xruns. It's not part of
> > > > > this patchset and should be configured dynamically too, if actually
> > > > > needed at all:
> > > > 
> > > > This is another case of a different trade-off - I use PREEMPT_RT to
> > > > minimise xruns and run with a period of 16 samples.
> > > > 
> > > > > > How do FS transfers work if the bandwidth requirements necessitate a
> > > > > >    smaller interval for HS/SS?  Doesn't that mean the FS transfers
> > > > > > must be too big?
> > > > > 
> > > > > Only UAC2 HS/SS bIntervals are dynamic with this patch, FS stays fixed
> > > > > at 1ms. For HS/SS  the max packet size is calculated together with the
> > > > > bInterval, so that the largest bInterval possible to fit the ISOC max
> > > > > packetsize limits is chosen.
> > > > 
> > > > I'd really like to see FS mode become unsupported when the packet size
> > > > is too big.  This is a slight issue right now (for 1023 vs 1024) but
> > > > this patch makes it significantly worse for the high bandwidth case.
> > > 
> > > I am afraid I do not understand what the patch makes worse. For FS it always
> > > yields bInterval=1 and the corresponding maxPacketSize, a calculation of
> > > which has not been changed by the patch.
> > 
> > See my comment above - before the difference was really 1023 vs 1024 so
> > it's possible to hit a problematic configuration but it's a smaller
> > window.
> 
> For me the problematic configuration is the one which does not work, which
> this feature actually tries to reduce (for HS).
> 
> > 
> > I really think we should avoid a configuration that mostly works but
> > fails in surprising ways (for example, working at HS but resulting in
> > corrupt data at FS because there just isn't sufficient bandwidth for the
> > sample rate, sample size and channel configuration selected).
> 
> 
> I understand your reasoning. See below.
> 
> > 
> > > > Right now I have this patch which is a hack but does at least result in
> > > > an error for the host when trying to enable audio at FS.  It would be
> > > > really nice to properly handle this in the composite gadget core so that
> > > > the audio function is exposed only at HS/SS with proper
> > > > DT_OTHER_SPEED_CONFIG handling, but currently that code assumes that the
> > > > same number of descriptors is provided for each speed.
> > > > 
> > > > -- 8< --
> > > > diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> > > > index 36fa6ef0581b..b4946409b38a 100644
> > > > --- a/drivers/usb/gadget/function/f_uac2.c
> > > > +++ b/drivers/usb/gadget/function/f_uac2.c
> > > > @@ -1356,6 +1356,9 @@ afunc_set_alt(struct usb_function *fn, unsigned intf, unsigned alt)
> > > >    		return 0;
> > > >    	}
> > > > +	if (gadget->speed < USB_SPEED_HIGH && alt)
> > > > +		return -EINVAL;
> > > > +
> > > >    	if (intf == uac2->as_out_intf) {
> > > >    		uac2->as_out_alt = alt;
> > > > -- >8 --
> > > > 
> > > > > > I don't think there has ever been a check that the configured sample
> > > > > >    size, channel count and interval actually fit in the max packet
> > > > > > size for an endpoint.  Is that something that should be checked to
> > > > > > give an error on bind if the configuration can't work?
> > > > > 
> > > > > The existing code has never had checks for any of that. Actually the
> > > > > dynamic bInterval calculation in this patch handles the bInterval and
> > > > > packetsize for configured parameters up to maximum ISOC bandwidth. Next
> > > > > version of this patch will at least warn about exceeding the overall
> > > > > available bandwidth.
> > > > > 
> > > > > There are many patches to go before the audio gadget becomes fool-proof,
> > > > > but at least it should be practically usable with these patches (when
> > > > > finalized) and the gaudio controller example implementation.
> > > > 
> > > > Agreed, and I really appreciate the improvements you're making here.
> > > > 
> > > > The reason I suggested the new checks here is that it makes a lot of
> > > > sense if the bInterval value is exposed as part of the configfs
> > > > interface.  It means there's one extra value to set for high bandwidth
> > > > operation, rather than having it "just work", but I think the
> > > > latency/bandwidth tradeoffs here mean that there's no way for the kernel
> > > > to select the right value for all scenarios, so really we need to let
> > > > the user tell us what they want.
> > > 
> > > OK. IMO it could be easily resolved by having the upper bInterval limit for
> > > the largest-fitting bInterval check of my patch configurable by new configfs
> > > max_bint, defaulting to the existing value of 4. I would leave the default
> > > (4), minimizing CPU load, you would set max_bint=1, minimizing latency. Any
> > > max_bint value in between would work, while still having available the
> > > automated calculation if lower bint value was required for the given
> > > parameters.
> > > 
> > > In addition, the final check dev_warn can be chanched to dev_err + returning
> > > EINVAL, providing the discussed sanity check. The check would work for FS as
> > > well as for HS/SS.
> > > 
> > > This change could be split to three patches:
> > > 
> > > 1. the automated calculation with fixed max_bint=4 - my current patch,
> > > dev_warn if max_size_bw > max_size_ep, max_size_bw limited to max_size_ep,
> > > no error, only warning.
> > > 
> > > 2. adding the uac2_opts max_bint, using in set_ep_max_packet_size_bint
> > > 
> > > 3. turning the sanity check warning to failing error: changing the dev_warn
> > > in the final check to dev_err+ returning error.
> > > 
> > > So the final version could look like this:
> > 
> > This sounds good to me.
> > 
> > But I think you'll hit the FS vs HS bandwidth issue described above when
> > trying anything that requires a lower bInterval ;-)
> 
> Well, the FS bandwidth is just too small, but IMO it's not a reason to limit
> HS too, as is limited now.
> 
> > 
> > I really think the answer to this is an extra patch/series that disables
> > operation at full speed when more bandwidth is required.  Ideally that
> > would include enhancing the gadget core to support different descriptors
> > for different speeds (which is already somewhat supported as other speed
> > config descriptors are returned correctly, but IIRC there's an
> > assumption that the number of descriptors is the same across all
> > speeds).
> 
> More patches in that area are certainly required.
> 
> What I can do:
> 
> * Separate the maxbandwidth patch series from the
> multiple-rates/rate-notification series to:
> 
> * patch 1 - the automated bint/maxPacketSize calculation with fixed
> max_bint=4 (for HS/SS), warning if bandwidth exceeded
> * patch 2 - adding the uac2_opts max_bint to allow lower latency (I already
> have this prepared)

I think I'd rather just provide the raw HS bInterval value here, any
userspace is already selecting all the parameters and given the
tradeoffs on (interrupt) load vs. latency I'd prefer to limit the magic
calculation here and give userspace full control.

> * patch 3 - failing f_uac2 load when requested params exceed HS/SS limits
> (for bInterval=1). The calculation method is always called for all FS/HS/SS
> now, so I cannot fail the FS check as it would break HS/SS.

But doesn't skipping the FS check break FS?

See below for discussion about the "proper" way to disable FS, but I
wonder if we could just patch afunc_set_alt() to return an error when
trying to switch to alt 1 at anything slower than HS.

That's a bit ugly, but I really doubt anyone is ever using FS these days
and the explicit failure is much nicer than just allowing data
corruption.

> I do not know how (and at what point) to disable operation for FS. Perhaps
> you could follow up with suitable patch, tested on your FS-capable HW?

You can use the max_speed configfs file to limit the gadget to full
speed for testing this (that's what I'm doing).  I think I've seen
you're using dwc2 and I know this works for dwc2, although you may need
to apply [1] from the list.

I've had a brief look and unfortunately it's not simple to properly
disable FS operation.  With one minor fix, passing NULL fs_descriptors
to usb_assign_descriptors() does basically work, but the generated
descriptors are now invalid because bNumInterfaces is incorrect.

Recalculating bNumInterfaces itself is easy, but if there are multiple
functions attached then the interfaces also need renumbering as they
must be contiguous starting from zero.  I don't see any way to handle
this renumbering without modifying every function driver, given that the
interface index may be used in fields like the interface association
descriptor's bFirstInterface.

[1] https://lore.kernel.org/linux-usb/20220106115731.1473909-1-john@metanate.com/
