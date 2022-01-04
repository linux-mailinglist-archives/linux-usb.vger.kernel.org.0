Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EAF34844A6
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 16:33:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233550AbiADPdR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 10:33:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiADPdQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 10:33:16 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E177DC061761
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 07:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=8fTHL6i2PC4oHjpr92mM8rpgnsnG0x59C4cveFIusx8=; b=EmXcN
        C9UdQBrLG4AeQdd2SU6XZl2Z4Db9fGsPbvDqYMjfXs/HRpSOxtXWhGpx5MgWn0nBO4fagWzsSh9SB
        3RLWJ/hA48IAxjkJXZN9JzT3zHVFffDuzoy6uNmouWrxkxOmHRFsjMa9MKkF5egDOmTcxEnza4gwS
        BBvxxmTGt8srr7mQM9yacCc5BPcLUqy8NQQV07RgA8vS6dWgiDDKU/OMpBHa6oQ/y1bVBD3oLrSjs
        yurKfeUmKXupiADsFRcJtsH0qhGxFVBCZVciDc8dzuyyrLdOBPjADF6rsCzNoKr9IWjsiNjV7d6HM
        guCsRJGGpb8cobo2h3HDOiBoXZLnA==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1n4loH-0008La-AQ; Tue, 04 Jan 2022 15:33:13 +0000
Date:   Tue, 4 Jan 2022 15:33:12 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 03/11] usb: gadget: f_uac2: Support multiple sampling
 rates
Message-ID: <YdRouHVKWDjea6D3@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-4-pavel.hofman@ivitera.com>
 <YcHBocOvNkrMTnJM@donbot>
 <71a8efe9-e515-fe14-c4ec-34c97a16395e@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71a8efe9-e515-fe14-c4ec-34c97a16395e@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 22, 2021 at 11:01:16AM +0100, Pavel Hofman wrote:
> 
> Dne 21. 12. 21 v 12:59 John Keeping napsal(a):
> > On Mon, Dec 20, 2021 at 10:11:22PM +0100, Pavel Hofman wrote:
> > > From: Julian Scheel <julian@jusst.de>
> > > 
> > > A list of sampling rates can be specified via configfs. All enabled
> > > sampling rates are sent to the USB host on request. When the host
> > > selects a sampling rate the internal active rate is updated.
> > > 
> > > Config strings with single value stay compatible with the previous version.
> > > 
> > > Multiple samplerates passed as configuration arrays to g_audio module
> > > when built for f_uac2.
> > > 
> > > Signed-off-by: Julian Scheel <julian@jusst.de>
> > > Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> > > ---
[snip]
> > >   };
> > >   static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
> > > @@ -166,7 +167,7 @@ static struct uac_clock_source_descriptor in_clk_src_desc = {
> > >   	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
> > >   	/* .bClockID = DYNAMIC */
> > >   	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
> > > -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
> > > +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
> > >   	.bAssocTerminal = 0,
> > >   };
> > > @@ -178,7 +179,7 @@ static struct uac_clock_source_descriptor out_clk_src_desc = {
> > >   	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
> > >   	/* .bClockID = DYNAMIC */
> > >   	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
> > > -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
> > > +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
> > >   	.bAssocTerminal = 0,
> > >   };
> > > @@ -635,12 +636,32 @@ struct cntrl_cur_lay3 {
> > >   };
> > >   struct cntrl_range_lay3 {
> > > -	__le16	wNumSubRanges;
> > >   	__le32	dMIN;
> > >   	__le32	dMAX;
> > >   	__le32	dRES;
> > >   } __packed;
> > > +#define ranges_size(c) (sizeof(c.wNumSubRanges) + c.wNumSubRanges \
> > > +		* sizeof(struct cntrl_ranges_lay3))
> > > +
> > > +struct cntrl_ranges_lay3 {
> > > +	__u16	wNumSubRanges;
> > > +	struct cntrl_range_lay3 r[UAC_MAX_RATES];
> > > +} __packed;
> > 
> > These structures are now inconsistent between cntrl_range_lay2 and
> > cntrl_range_lay3.  Would it be better to make these flex arrays?  I
> > guess that will make the code that uses it more complicated, but at the
> > moment it looks like these are trying to be generic while in reality
> > being quite specific to the one place that uses them at the moment.
> 
> I am afraid I do not know exactly how to do that. Please can you post an
> example? The rate control requires u32 (u16 is too small). Thanks a lot.

After the change in this patch, we end up with:

	struct cntrl_range_lay2 {
		__le16	wNumSubRanges;
		__le16	wMIN;
		__le16	wMAX;
		__le16	wRES;
	} __packed;

	struct cntrl_range_lay3 {
		__le32	dMIN;
		__le32	dMAX;
		__le32	dRES;
	} __packed;

so there are two structures with similar names but totally different
structure, which I think risks confusion in the future.

I wonder if DECLARE_UAC2_FEATURE_UNIT_DESCRIPTOR in linux/usb/audio-v2.h
provides inspiration here, so potentially something like:

	#define DECLARE_UAC2_CNTRL_RANGE_LAY3(n)	\
		struct uac2_cntrl_range_lay3_##n {	\
			__le16 wNumSubRanges;		\
			struct cntrl_range_le32 r[n];	\
		} __packed;

	DECLARE_UAC2_CNTRL_RANGE_LAY3(UAC_MAX_RATES);

> > > +static int get_max_srate(const int *srates)
> > > +{
> > > +	int i, max_srate = 0;
> > > +
> > > +	for (i = 0; i < UAC_MAX_RATES; i++) {
> > > +		if (srates[i] == 0)
> > > +			break;
> > > +		if (srates[i] > max_srate)
> > > +			max_srate = srates[i];
> > > +	}
> > > +	return max_srate;
> > > +}
> > > +
> > >   static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
> > >   	struct usb_endpoint_descriptor *ep_desc,
> > >   	enum usb_device_speed speed, bool is_playback)
> > > @@ -667,11 +688,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
> > >   	if (is_playback) {
> > >   		chmask = uac2_opts->p_chmask;
> > > -		srate = uac2_opts->p_srate;
> > > +		srate = get_max_srate(uac2_opts->p_srates);
> > >   		ssize = uac2_opts->p_ssize;
> > >   	} else {
> > >   		chmask = uac2_opts->c_chmask;
> > > -		srate = uac2_opts->c_srate;
> > > +		srate = get_max_srate(uac2_opts->c_srates);
> > >   		ssize = uac2_opts->c_ssize;
> > >   	}
> > > @@ -912,10 +933,10 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
> > >   	} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
> > >   		dev_err(dev, "Error: incorrect capture sample size\n");
> > >   		return -EINVAL;
> > > -	} else if (!opts->p_srate) {
> > > +	} else if (!opts->p_srates[0]) {
> > >   		dev_err(dev, "Error: incorrect playback sampling rate\n");
> > >   		return -EINVAL;
> > > -	} else if (!opts->c_srate) {
> > > +	} else if (!opts->c_srates[0]) {
> > >   		dev_err(dev, "Error: incorrect capture sampling rate\n");
> > >   		return -EINVAL;
> > >   	}
> > > @@ -1210,7 +1231,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
> > >   	agdev->params.p_chmask = uac2_opts->p_chmask;
> > >   	agdev->params.p_srate = uac2_opts->p_srate;
> > > -	agdev->params.p_srates[0] = uac2_opts->p_srate;
> > > +	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
> > > +			sizeof(agdev->params.p_srates));
> > >   	agdev->params.p_ssize = uac2_opts->p_ssize;
> > >   	if (FUIN_EN(uac2_opts)) {
> > >   		agdev->params.p_fu.id = USB_IN_FU_ID;
> > > @@ -1222,7 +1244,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
> > >   	}
> > >   	agdev->params.c_chmask = uac2_opts->c_chmask;
> > >   	agdev->params.c_srate = uac2_opts->c_srate;
> > > -	agdev->params.c_srates[0] = uac2_opts->c_srate;
> > > +	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
> > > +			sizeof(agdev->params.c_srates));
> > >   	agdev->params.c_ssize = uac2_opts->c_ssize;
> > >   	if (FUOUT_EN(uac2_opts)) {
> > >   		agdev->params.c_fu.id = USB_OUT_FU_ID;
> > > @@ -1502,28 +1525,39 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
> > >   	u8 entity_id = (w_index >> 8) & 0xff;
> > >   	u8 control_selector = w_value >> 8;
> > >   	int value = -EOPNOTSUPP;
> > > -	int p_srate, c_srate;
> > > -
> > > -	p_srate = opts->p_srate;
> > > -	c_srate = opts->c_srate;
> > >   	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
> > >   		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
> > > -			struct cntrl_range_lay3 r;
> > > +			struct cntrl_ranges_lay3 rs;
> > > +			int i;
> > > +			int wNumSubRanges = 0;
> > > +			int srate;
> > > +			int *srates;
> > >   			if (entity_id == USB_IN_CLK_ID)
> > > -				r.dMIN = cpu_to_le32(p_srate);
> > > +				srates = opts->p_srates;
> > >   			else if (entity_id == USB_OUT_CLK_ID)
> > > -				r.dMIN = cpu_to_le32(c_srate);
> > > +				srates = opts->c_srates;
> > >   			else
> > >   				return -EOPNOTSUPP;
> > > -
> > > -			r.dMAX = r.dMIN;
> > > -			r.dRES = 0;
> > > -			r.wNumSubRanges = cpu_to_le16(1);
> > > -
> > > -			value = min_t(unsigned int, w_length, sizeof(r));
> > > -			memcpy(req->buf, &r, value);
> > > +			for (i = 0; i < UAC_MAX_RATES; i++) {
> > > +				srate = srates[i];
> > > +				if (srate == 0)
> > > +					break;
> > > +
> > > +				rs.r[wNumSubRanges].dMIN = cpu_to_le32(srate);
> > > +				rs.r[wNumSubRanges].dMAX = cpu_to_le32(srate);
> > > +				rs.r[wNumSubRanges].dRES = 0;
> > > +				wNumSubRanges++;
> > > +				dev_dbg(&agdev->gadget->dev,
> > > +					"%s(): clk %d: rate ID %d: %d\n",
> > > +					__func__, entity_id, wNumSubRanges, srate);
> > > +			}
> > > +			rs.wNumSubRanges = cpu_to_le16(wNumSubRanges);
> > > +			value = min_t(unsigned int, w_length, ranges_size(rs));
> > > +			dev_dbg(&agdev->gadget->dev, "%s(): sending %d rates, size %d\n",
> > > +				__func__, rs.wNumSubRanges, value);
> > > +			memcpy(req->buf, &rs, value);
> > >   		} else {
> > >   			dev_err(&agdev->gadget->dev,
> > >   				"%s:%d control_selector=%d TODO!\n",
> > > @@ -1582,6 +1616,28 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
> > >   		return -EOPNOTSUPP;
> > >   }
> > > +static void uac2_cs_control_sam_freq(struct usb_ep *ep, struct usb_request *req)
> > > +{
> > > +	struct usb_function *fn = ep->driver_data;
> > > +	struct g_audio *agdev = func_to_g_audio(fn);
> > > +	struct f_uac2 *uac2 = func_to_uac2(fn);
> > > +	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
> > > +	u32 val;
> > > +
> > > +	if (req->actual != 4)
> > > +		return;
> > > +
> > > +	val = le32_to_cpu(*((u32 *)req->buf));
> > > +	dev_dbg(&agdev->gadget->dev, "%s val: %d.\n", __func__, val);
> > > +	if (uac2->ctl_id == USB_IN_CLK_ID) {
> > > +		opts->p_srate = val;
> > 
> > Don't you need to hold opts->lock to change this?
> > I'm not sure opts should be changed here though - that's the setup phase
> > and this is "current state", so shouldn't it move to struct f_uac2?
> 
> OK. I moved the current p_srate/c_srate from struct opts to f_uac2,
> initialized with first value of opts->p_srates/c_srates[0] in afunc_bind.
> The struct f_uac2 has no lock yet. Should I add the lock mutex to f_uac2 and
> be locking f_uac2 access here in uac2_cs_control_sam_freq?

Could we move this into struct uac_rtd_params and use the existing lock
there to guard it?

It would need accessor functions as that structure's local to u_audio.c,
but there's already u_audio_set_playback_srate() so that isn't a big
change.


John
