Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE3B485254
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jan 2022 13:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236546AbiAEMUK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jan 2022 07:20:10 -0500
Received: from cable.insite.cz ([84.242.75.189]:37783 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236544AbiAEMUK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jan 2022 07:20:10 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 3EE1EA1A3D405;
        Wed,  5 Jan 2022 13:20:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641385208; bh=MpL2iyVvTS72hkL3Q1tL8i7KB2Wr32Bhxvax72C75fk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kP3V5orW4LUBzuzHRUaLYJGZn6YM/16J3ItrLVi8o0u/nYMm32JoS1Uh3fgxScDyS
         Y+GUmYUHXIg6yrjhd+JuC3izF6EJa9SNeZev8z21N9pcmvvYKCJ3JpH9boQfPnenN5
         eE6/mSpyIHzG/MxKo4mlOaULmbBFxiH1LAXg04Os=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id e6uGQRnjE3AV; Wed,  5 Jan 2022 13:20:02 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 5B4C4A1A3D404;
        Wed,  5 Jan 2022 13:20:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641385202; bh=MpL2iyVvTS72hkL3Q1tL8i7KB2Wr32Bhxvax72C75fk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MVKBmK7TfYPy5XmipHyjrDtEoXFIY+sMa1QGHnDfTuazdcvngNR0fN28C8u47hzXx
         ImevYD9sAPCVrYTUBZq4xX3yTH3o5hp2Ckhzwh2G8V2OkZ0rNJUgOsxaf2ZRsWlP6b
         nDp1gJTKM7tZGKICeIbU5gQoMOHrW+ViTKYCZZNU=
Subject: Re: [PATCH v2 03/11] usb: gadget: f_uac2: Support multiple sampling
 rates
To:     John Keeping <john@metanate.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-4-pavel.hofman@ivitera.com> <YcHBocOvNkrMTnJM@donbot>
 <71a8efe9-e515-fe14-c4ec-34c97a16395e@ivitera.com> <YdRouHVKWDjea6D3@donbot>
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <7b135fce-d822-61e4-a2e0-e44ff9558fbd@ivitera.com>
Date:   Wed, 5 Jan 2022 13:20:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdRouHVKWDjea6D3@donbot>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dne 04. 01. 22 v 16:33 John Keeping napsal(a):
> On Wed, Dec 22, 2021 at 11:01:16AM +0100, Pavel Hofman wrote:
>>
>> Dne 21. 12. 21 v 12:59 John Keeping napsal(a):
>>> On Mon, Dec 20, 2021 at 10:11:22PM +0100, Pavel Hofman wrote:
>>>> From: Julian Scheel <julian@jusst.de>
>>>>
>>>> A list of sampling rates can be specified via configfs. All enabled
>>>> sampling rates are sent to the USB host on request. When the host
>>>> selects a sampling rate the internal active rate is updated.
>>>>
>>>> Config strings with single value stay compatible with the previous version.
>>>>
>>>> Multiple samplerates passed as configuration arrays to g_audio module
>>>> when built for f_uac2.
>>>>
>>>> Signed-off-by: Julian Scheel <julian@jusst.de>
>>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>>> ---
> [snip]
>>>>    };
>>>>    static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
>>>> @@ -166,7 +167,7 @@ static struct uac_clock_source_descriptor in_clk_src_desc = {
>>>>    	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
>>>>    	/* .bClockID = DYNAMIC */
>>>>    	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
>>>> -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
>>>> +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
>>>>    	.bAssocTerminal = 0,
>>>>    };
>>>> @@ -178,7 +179,7 @@ static struct uac_clock_source_descriptor out_clk_src_desc = {
>>>>    	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
>>>>    	/* .bClockID = DYNAMIC */
>>>>    	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
>>>> -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
>>>> +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
>>>>    	.bAssocTerminal = 0,
>>>>    };
>>>> @@ -635,12 +636,32 @@ struct cntrl_cur_lay3 {
>>>>    };
>>>>    struct cntrl_range_lay3 {
>>>> -	__le16	wNumSubRanges;
>>>>    	__le32	dMIN;
>>>>    	__le32	dMAX;
>>>>    	__le32	dRES;
>>>>    } __packed;
>>>> +#define ranges_size(c) (sizeof(c.wNumSubRanges) + c.wNumSubRanges \
>>>> +		* sizeof(struct cntrl_ranges_lay3))
>>>> +
>>>> +struct cntrl_ranges_lay3 {
>>>> +	__u16	wNumSubRanges;
>>>> +	struct cntrl_range_lay3 r[UAC_MAX_RATES];
>>>> +} __packed;
>>>
>>> These structures are now inconsistent between cntrl_range_lay2 and
>>> cntrl_range_lay3.  Would it be better to make these flex arrays?  I
>>> guess that will make the code that uses it more complicated, but at the
>>> moment it looks like these are trying to be generic while in reality
>>> being quite specific to the one place that uses them at the moment.
>>
>> I am afraid I do not know exactly how to do that. Please can you post an
>> example? The rate control requires u32 (u16 is too small). Thanks a lot.
> 
> After the change in this patch, we end up with:
> 
> 	struct cntrl_range_lay2 {
> 		__le16	wNumSubRanges;
> 		__le16	wMIN;
> 		__le16	wMAX;
> 		__le16	wRES;
> 	} __packed;
> 
> 	struct cntrl_range_lay3 {
> 		__le32	dMIN;
> 		__le32	dMAX;
> 		__le32	dRES;
> 	} __packed;
> 
> so there are two structures with similar names but totally different
> structure, which I think risks confusion in the future.
> 
> I wonder if DECLARE_UAC2_FEATURE_UNIT_DESCRIPTOR in linux/usb/audio-v2.h
> provides inspiration here, so potentially something like:
> 
> 	#define DECLARE_UAC2_CNTRL_RANGE_LAY3(n)	\
> 		struct uac2_cntrl_range_lay3_##n {	\
> 			__le16 wNumSubRanges;		\
> 			struct cntrl_range_le32 r[n];	\
> 		} __packed;
> 
> 	DECLARE_UAC2_CNTRL_RANGE_LAY3(UAC_MAX_RATES);

Thanks, I will try to follow your suggestion in the next patchset version.

> 
>>>> +static int get_max_srate(const int *srates)
>>>> +{
>>>> +	int i, max_srate = 0;
>>>> +
>>>> +	for (i = 0; i < UAC_MAX_RATES; i++) {
>>>> +		if (srates[i] == 0)
>>>> +			break;
>>>> +		if (srates[i] > max_srate)
>>>> +			max_srate = srates[i];
>>>> +	}
>>>> +	return max_srate;
>>>> +}
>>>> +
>>>>    static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>>>    	struct usb_endpoint_descriptor *ep_desc,
>>>>    	enum usb_device_speed speed, bool is_playback)
>>>> @@ -667,11 +688,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>>>    	if (is_playback) {
>>>>    		chmask = uac2_opts->p_chmask;
>>>> -		srate = uac2_opts->p_srate;
>>>> +		srate = get_max_srate(uac2_opts->p_srates);
>>>>    		ssize = uac2_opts->p_ssize;
>>>>    	} else {
>>>>    		chmask = uac2_opts->c_chmask;
>>>> -		srate = uac2_opts->c_srate;
>>>> +		srate = get_max_srate(uac2_opts->c_srates);
>>>>    		ssize = uac2_opts->c_ssize;
>>>>    	}
>>>> @@ -912,10 +933,10 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
>>>>    	} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
>>>>    		dev_err(dev, "Error: incorrect capture sample size\n");
>>>>    		return -EINVAL;
>>>> -	} else if (!opts->p_srate) {
>>>> +	} else if (!opts->p_srates[0]) {
>>>>    		dev_err(dev, "Error: incorrect playback sampling rate\n");
>>>>    		return -EINVAL;
>>>> -	} else if (!opts->c_srate) {
>>>> +	} else if (!opts->c_srates[0]) {
>>>>    		dev_err(dev, "Error: incorrect capture sampling rate\n");
>>>>    		return -EINVAL;
>>>>    	}
>>>> @@ -1210,7 +1231,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>>>>    	agdev->params.p_chmask = uac2_opts->p_chmask;
>>>>    	agdev->params.p_srate = uac2_opts->p_srate;
>>>> -	agdev->params.p_srates[0] = uac2_opts->p_srate;
>>>> +	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
>>>> +			sizeof(agdev->params.p_srates));
>>>>    	agdev->params.p_ssize = uac2_opts->p_ssize;
>>>>    	if (FUIN_EN(uac2_opts)) {
>>>>    		agdev->params.p_fu.id = USB_IN_FU_ID;
>>>> @@ -1222,7 +1244,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>>>>    	}
>>>>    	agdev->params.c_chmask = uac2_opts->c_chmask;
>>>>    	agdev->params.c_srate = uac2_opts->c_srate;
>>>> -	agdev->params.c_srates[0] = uac2_opts->c_srate;
>>>> +	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
>>>> +			sizeof(agdev->params.c_srates));
>>>>    	agdev->params.c_ssize = uac2_opts->c_ssize;
>>>>    	if (FUOUT_EN(uac2_opts)) {
>>>>    		agdev->params.c_fu.id = USB_OUT_FU_ID;
>>>> @@ -1502,28 +1525,39 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>>>>    	u8 entity_id = (w_index >> 8) & 0xff;
>>>>    	u8 control_selector = w_value >> 8;
>>>>    	int value = -EOPNOTSUPP;
>>>> -	int p_srate, c_srate;
>>>> -
>>>> -	p_srate = opts->p_srate;
>>>> -	c_srate = opts->c_srate;
>>>>    	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
>>>>    		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
>>>> -			struct cntrl_range_lay3 r;
>>>> +			struct cntrl_ranges_lay3 rs;
>>>> +			int i;
>>>> +			int wNumSubRanges = 0;
>>>> +			int srate;
>>>> +			int *srates;
>>>>    			if (entity_id == USB_IN_CLK_ID)
>>>> -				r.dMIN = cpu_to_le32(p_srate);
>>>> +				srates = opts->p_srates;
>>>>    			else if (entity_id == USB_OUT_CLK_ID)
>>>> -				r.dMIN = cpu_to_le32(c_srate);
>>>> +				srates = opts->c_srates;
>>>>    			else
>>>>    				return -EOPNOTSUPP;
>>>> -
>>>> -			r.dMAX = r.dMIN;
>>>> -			r.dRES = 0;
>>>> -			r.wNumSubRanges = cpu_to_le16(1);
>>>> -
>>>> -			value = min_t(unsigned int, w_length, sizeof(r));
>>>> -			memcpy(req->buf, &r, value);
>>>> +			for (i = 0; i < UAC_MAX_RATES; i++) {
>>>> +				srate = srates[i];
>>>> +				if (srate == 0)
>>>> +					break;
>>>> +
>>>> +				rs.r[wNumSubRanges].dMIN = cpu_to_le32(srate);
>>>> +				rs.r[wNumSubRanges].dMAX = cpu_to_le32(srate);
>>>> +				rs.r[wNumSubRanges].dRES = 0;
>>>> +				wNumSubRanges++;
>>>> +				dev_dbg(&agdev->gadget->dev,
>>>> +					"%s(): clk %d: rate ID %d: %d\n",
>>>> +					__func__, entity_id, wNumSubRanges, srate);
>>>> +			}
>>>> +			rs.wNumSubRanges = cpu_to_le16(wNumSubRanges);
>>>> +			value = min_t(unsigned int, w_length, ranges_size(rs));
>>>> +			dev_dbg(&agdev->gadget->dev, "%s(): sending %d rates, size %d\n",
>>>> +				__func__, rs.wNumSubRanges, value);
>>>> +			memcpy(req->buf, &rs, value);
>>>>    		} else {
>>>>    			dev_err(&agdev->gadget->dev,
>>>>    				"%s:%d control_selector=%d TODO!\n",
>>>> @@ -1582,6 +1616,28 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>>>>    		return -EOPNOTSUPP;
>>>>    }
>>>> +static void uac2_cs_control_sam_freq(struct usb_ep *ep, struct usb_request *req)
>>>> +{
>>>> +	struct usb_function *fn = ep->driver_data;
>>>> +	struct g_audio *agdev = func_to_g_audio(fn);
>>>> +	struct f_uac2 *uac2 = func_to_uac2(fn);
>>>> +	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
>>>> +	u32 val;
>>>> +
>>>> +	if (req->actual != 4)
>>>> +		return;
>>>> +
>>>> +	val = le32_to_cpu(*((u32 *)req->buf));
>>>> +	dev_dbg(&agdev->gadget->dev, "%s val: %d.\n", __func__, val);
>>>> +	if (uac2->ctl_id == USB_IN_CLK_ID) {
>>>> +		opts->p_srate = val;
>>>
>>> Don't you need to hold opts->lock to change this?
>>> I'm not sure opts should be changed here though - that's the setup phase
>>> and this is "current state", so shouldn't it move to struct f_uac2?
>>
>> OK. I moved the current p_srate/c_srate from struct opts to f_uac2,
>> initialized with first value of opts->p_srates/c_srates[0] in afunc_bind.
>> The struct f_uac2 has no lock yet. Should I add the lock mutex to f_uac2 and
>> be locking f_uac2 access here in uac2_cs_control_sam_freq?
> 
> Could we move this into struct uac_rtd_params and use the existing lock
> there to guard it?
> 
> It would need accessor functions as that structure's local to u_audio.c,
> but there's already u_audio_set_playback_srate() so that isn't a big
> change.

I have already moved p_/c_srate from uac_params to uac_rtd_params in 
u_audio.c in the next version of the patchset. But IIUC the currently 
selected playback/capture rate is required within f_uac2 too, in 
in_rq_cur() in:

if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
	...
	if (entity_id == USB_IN_CLK_ID)
		c.dCUR = cpu_to_le32(p_srate);
	else if (entity_id == USB_OUT_CLK_ID)
		c.dCUR = cpu_to_le32(c_srate);
	...
}

Thanks,

Pavel.
