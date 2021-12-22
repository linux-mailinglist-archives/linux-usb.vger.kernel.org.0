Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B733A47CFAB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Dec 2021 11:01:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239658AbhLVKBZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Dec 2021 05:01:25 -0500
Received: from cable.insite.cz ([84.242.75.189]:42849 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234306AbhLVKBZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Dec 2021 05:01:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id BF94CA1A3D401;
        Wed, 22 Dec 2021 11:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640167283; bh=pETFJ9PxMAAK4Z1O89ZxkvJ7LBVoEZN/wCGzWqisFMc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Flp1VBXtMgmZCLQMkINLnq0zszUZSIWwaORQm5PviiyEsH3DBkcsTaWMseERdubqt
         Xu2CXIUfYil2lzKhuQG5H4ATwNdhxLALxJQ85RXegdljR+dPpQIH9/c5NFbMXvatTo
         SXXInxILE8g6GHOjnuD6zOIz74yQ2m1rn8g1yfl4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 2jbYfMJxu4H1; Wed, 22 Dec 2021 11:01:18 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id A9C63A1A3D400;
        Wed, 22 Dec 2021 11:01:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640167277; bh=pETFJ9PxMAAK4Z1O89ZxkvJ7LBVoEZN/wCGzWqisFMc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n+/jAZ4GDUx6Xvwcxee6IC23WXT8iybDbzWchWSs1N7IOM+cJGMb09DooDSj1sLC5
         /4MePbza/Bcgsl4obuWvlAK5NWU40aTDu0EWDlxLHKinmIgP18YeIeMZ8aclHOwguF
         /CZskWClGXQMMZ9zNVhAyJ3PIgpvVI4UYRf27bls=
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
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <71a8efe9-e515-fe14-c4ec-34c97a16395e@ivitera.com>
Date:   Wed, 22 Dec 2021 11:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcHBocOvNkrMTnJM@donbot>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Dne 21. 12. 21 v 12:59 John Keeping napsal(a):
> On Mon, Dec 20, 2021 at 10:11:22PM +0100, Pavel Hofman wrote:
>> From: Julian Scheel <julian@jusst.de>
>>
>> A list of sampling rates can be specified via configfs. All enabled
>> sampling rates are sent to the USB host on request. When the host
>> selects a sampling rate the internal active rate is updated.
>>
>> Config strings with single value stay compatible with the previous version.
>>
>> Multiple samplerates passed as configuration arrays to g_audio module
>> when built for f_uac2.
>>
>> Signed-off-by: Julian Scheel <julian@jusst.de>
>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>> ---
>>   .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
>>   Documentation/usb/gadget-testing.rst          |   4 +-
>>   drivers/usb/gadget/function/f_uac2.c          | 118 ++++++++++++++----
>>   drivers/usb/gadget/function/u_uac2.h          |  62 +++++++++
>>   drivers/usb/gadget/legacy/audio.c             |  28 +++--
>>   5 files changed, 177 insertions(+), 39 deletions(-)
>>
>> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
>> index c18113077889..928f60a31544 100644
>> --- a/Documentation/usb/gadget-testing.rst
>> +++ b/Documentation/usb/gadget-testing.rst
>> @@ -726,7 +726,7 @@ The uac2 function provides these attributes in its function directory:
>>   
>>   	================ ====================================================
>>   	c_chmask         capture channel mask
>> -	c_srate          capture sampling rate
>> +	c_srate          list of capture sampling rates (comma-separated)
>>   	c_ssize          capture sample size (bytes)
>>   	c_sync           capture synchronization type (async/adaptive)
>>   	c_mute_present   capture mute control enable
>> @@ -736,7 +736,7 @@ The uac2 function provides these attributes in its function directory:
>>   	c_volume_res     capture volume control resolution (in 1/256 dB)
>>   	fb_max           maximum extra bandwidth in async mode
>>   	p_chmask         playback channel mask
>> -	p_srate          playback sampling rate
>> +	p_srate          list of playback sampling rates (comma-separated)
>>   	p_ssize          playback sample size (bytes)
>>   	p_mute_present   playback mute control enable
>>   	p_volume_present playback volume control enable
>> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
>> index 1d6e426e5078..74e32bb146c7 100644
>> --- a/drivers/usb/gadget/function/f_uac2.c
>> +++ b/drivers/usb/gadget/function/f_uac2.c
>> @@ -70,6 +70,7 @@ struct f_uac2 {
>>   	/* Interrupt IN endpoint of AC interface */
>>   	struct usb_ep	*int_ep;
>>   	atomic_t	int_count;
>> +	int ctl_id;
> 
> Control for what?  This is assigned from a variable called clock_id, so
> shouldn't that be the name here?
> 
> I think this needs a comment to explain that it's transient state that
> is only valid during the handling of a single control request.

Fixed

> 
>>   };
>>   
>>   static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
>> @@ -166,7 +167,7 @@ static struct uac_clock_source_descriptor in_clk_src_desc = {
>>   	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
>>   	/* .bClockID = DYNAMIC */
>>   	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
>> -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
>> +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
>>   	.bAssocTerminal = 0,
>>   };
>>   
>> @@ -178,7 +179,7 @@ static struct uac_clock_source_descriptor out_clk_src_desc = {
>>   	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
>>   	/* .bClockID = DYNAMIC */
>>   	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
>> -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
>> +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
>>   	.bAssocTerminal = 0,
>>   };
>>   
>> @@ -635,12 +636,32 @@ struct cntrl_cur_lay3 {
>>   };
>>   
>>   struct cntrl_range_lay3 {
>> -	__le16	wNumSubRanges;
>>   	__le32	dMIN;
>>   	__le32	dMAX;
>>   	__le32	dRES;
>>   } __packed;
>>   
>> +#define ranges_size(c) (sizeof(c.wNumSubRanges) + c.wNumSubRanges \
>> +		* sizeof(struct cntrl_ranges_lay3))
>> +
>> +struct cntrl_ranges_lay3 {
>> +	__u16	wNumSubRanges;
>> +	struct cntrl_range_lay3 r[UAC_MAX_RATES];
>> +} __packed;
> 
> These structures are now inconsistent between cntrl_range_lay2 and
> cntrl_range_lay3.  Would it be better to make these flex arrays?  I
> guess that will make the code that uses it more complicated, but at the
> moment it looks like these are trying to be generic while in reality
> being quite specific to the one place that uses them at the moment.

I am afraid I do not know exactly how to do that. Please can you post an 
example? The rate control requires u32 (u16 is too small). Thanks a lot.

> 
>> +static int get_max_srate(const int *srates)
>> +{
>> +	int i, max_srate = 0;
>> +
>> +	for (i = 0; i < UAC_MAX_RATES; i++) {
>> +		if (srates[i] == 0)
>> +			break;
>> +		if (srates[i] > max_srate)
>> +			max_srate = srates[i];
>> +	}
>> +	return max_srate;
>> +}
>> +
>>   static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>   	struct usb_endpoint_descriptor *ep_desc,
>>   	enum usb_device_speed speed, bool is_playback)
>> @@ -667,11 +688,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>>   
>>   	if (is_playback) {
>>   		chmask = uac2_opts->p_chmask;
>> -		srate = uac2_opts->p_srate;
>> +		srate = get_max_srate(uac2_opts->p_srates);
>>   		ssize = uac2_opts->p_ssize;
>>   	} else {
>>   		chmask = uac2_opts->c_chmask;
>> -		srate = uac2_opts->c_srate;
>> +		srate = get_max_srate(uac2_opts->c_srates);
>>   		ssize = uac2_opts->c_ssize;
>>   	}
>>   
>> @@ -912,10 +933,10 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
>>   	} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
>>   		dev_err(dev, "Error: incorrect capture sample size\n");
>>   		return -EINVAL;
>> -	} else if (!opts->p_srate) {
>> +	} else if (!opts->p_srates[0]) {
>>   		dev_err(dev, "Error: incorrect playback sampling rate\n");
>>   		return -EINVAL;
>> -	} else if (!opts->c_srate) {
>> +	} else if (!opts->c_srates[0]) {
>>   		dev_err(dev, "Error: incorrect capture sampling rate\n");
>>   		return -EINVAL;
>>   	}
>> @@ -1210,7 +1231,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>>   
>>   	agdev->params.p_chmask = uac2_opts->p_chmask;
>>   	agdev->params.p_srate = uac2_opts->p_srate;
>> -	agdev->params.p_srates[0] = uac2_opts->p_srate;
>> +	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
>> +			sizeof(agdev->params.p_srates));
>>   	agdev->params.p_ssize = uac2_opts->p_ssize;
>>   	if (FUIN_EN(uac2_opts)) {
>>   		agdev->params.p_fu.id = USB_IN_FU_ID;
>> @@ -1222,7 +1244,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>>   	}
>>   	agdev->params.c_chmask = uac2_opts->c_chmask;
>>   	agdev->params.c_srate = uac2_opts->c_srate;
>> -	agdev->params.c_srates[0] = uac2_opts->c_srate;
>> +	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
>> +			sizeof(agdev->params.c_srates));
>>   	agdev->params.c_ssize = uac2_opts->c_ssize;
>>   	if (FUOUT_EN(uac2_opts)) {
>>   		agdev->params.c_fu.id = USB_OUT_FU_ID;
>> @@ -1502,28 +1525,39 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>>   	u8 entity_id = (w_index >> 8) & 0xff;
>>   	u8 control_selector = w_value >> 8;
>>   	int value = -EOPNOTSUPP;
>> -	int p_srate, c_srate;
>> -
>> -	p_srate = opts->p_srate;
>> -	c_srate = opts->c_srate;
>>   
>>   	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
>>   		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
>> -			struct cntrl_range_lay3 r;
>> +			struct cntrl_ranges_lay3 rs;
>> +			int i;
>> +			int wNumSubRanges = 0;
>> +			int srate;
>> +			int *srates;
>>   
>>   			if (entity_id == USB_IN_CLK_ID)
>> -				r.dMIN = cpu_to_le32(p_srate);
>> +				srates = opts->p_srates;
>>   			else if (entity_id == USB_OUT_CLK_ID)
>> -				r.dMIN = cpu_to_le32(c_srate);
>> +				srates = opts->c_srates;
>>   			else
>>   				return -EOPNOTSUPP;
>> -
>> -			r.dMAX = r.dMIN;
>> -			r.dRES = 0;
>> -			r.wNumSubRanges = cpu_to_le16(1);
>> -
>> -			value = min_t(unsigned int, w_length, sizeof(r));
>> -			memcpy(req->buf, &r, value);
>> +			for (i = 0; i < UAC_MAX_RATES; i++) {
>> +				srate = srates[i];
>> +				if (srate == 0)
>> +					break;
>> +
>> +				rs.r[wNumSubRanges].dMIN = cpu_to_le32(srate);
>> +				rs.r[wNumSubRanges].dMAX = cpu_to_le32(srate);
>> +				rs.r[wNumSubRanges].dRES = 0;
>> +				wNumSubRanges++;
>> +				dev_dbg(&agdev->gadget->dev,
>> +					"%s(): clk %d: rate ID %d: %d\n",
>> +					__func__, entity_id, wNumSubRanges, srate);
>> +			}
>> +			rs.wNumSubRanges = cpu_to_le16(wNumSubRanges);
>> +			value = min_t(unsigned int, w_length, ranges_size(rs));
>> +			dev_dbg(&agdev->gadget->dev, "%s(): sending %d rates, size %d\n",
>> +				__func__, rs.wNumSubRanges, value);
>> +			memcpy(req->buf, &rs, value);
>>   		} else {
>>   			dev_err(&agdev->gadget->dev,
>>   				"%s:%d control_selector=%d TODO!\n",
>> @@ -1582,6 +1616,28 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>>   		return -EOPNOTSUPP;
>>   }
>>   
>> +static void uac2_cs_control_sam_freq(struct usb_ep *ep, struct usb_request *req)
>> +{
>> +	struct usb_function *fn = ep->driver_data;
>> +	struct g_audio *agdev = func_to_g_audio(fn);
>> +	struct f_uac2 *uac2 = func_to_uac2(fn);
>> +	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
>> +	u32 val;
>> +
>> +	if (req->actual != 4)
>> +		return;
>> +
>> +	val = le32_to_cpu(*((u32 *)req->buf));
>> +	dev_dbg(&agdev->gadget->dev, "%s val: %d.\n", __func__, val);
>> +	if (uac2->ctl_id == USB_IN_CLK_ID) {
>> +		opts->p_srate = val;
> 
> Don't you need to hold opts->lock to change this?
> I'm not sure opts should be changed here though - that's the setup phase
> and this is "current state", so shouldn't it move to struct f_uac2?

OK. I moved the current p_srate/c_srate from struct opts to f_uac2, 
initialized with first value of opts->p_srates/c_srates[0] in 
afunc_bind. The struct f_uac2 has no lock yet. Should I add the lock 
mutex to f_uac2 and be locking f_uac2 access here in 
uac2_cs_control_sam_freq?

> 
>> +		u_audio_set_playback_srate(agdev, opts->p_srate);
>> +	} else if (uac2->ctl_id == USB_OUT_CLK_ID) {
>> +		opts->c_srate = val;
>> +		u_audio_set_capture_srate(agdev, opts->c_srate);
>> +	}
>> +}
>> +
>>   static void
>>   out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
>>   {
>> @@ -1633,6 +1689,7 @@ out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
>>   static int
>>   out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>>   {
>> +	struct usb_composite_dev *cdev = fn->config->cdev;
>>   	struct usb_request *req = fn->config->cdev->req;
>>   	struct g_audio *agdev = func_to_g_audio(fn);
>>   	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
>> @@ -1642,10 +1699,17 @@ out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>>   	u16 w_value = le16_to_cpu(cr->wValue);
>>   	u8 entity_id = (w_index >> 8) & 0xff;
>>   	u8 control_selector = w_value >> 8;
>> +	u8 clock_id = w_index >> 8;
>>   
>>   	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
>> -		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ)
>> +		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
>> +			dev_dbg(&agdev->gadget->dev,
>> +				"control_selector UAC2_CS_CONTROL_SAM_FREQ, clock: %d\n", clock_id);
>> +			cdev->gadget->ep0->driver_data = fn;
>> +			uac2->ctl_id = clock_id;
>> +			req->complete = uac2_cs_control_sam_freq;
>>   			return w_length;
>> +		}
>>   	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
>>   			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
>>   		memcpy(&uac2->setup_cr, cr, sizeof(*cr));
>> @@ -1839,10 +1903,10 @@ end:									\
>>   CONFIGFS_ATTR(f_uac2_opts_, name)
>>   
>>   UAC2_ATTRIBUTE(u32, p_chmask);
>> -UAC2_ATTRIBUTE(u32, p_srate);
>> +UAC_RATE2_ATTRIBUTE(p_srate);
> 
> UAC2_RATE_ATTRIBUTE() to match the pattern of the other values here?

Fixed

> 
>>   UAC2_ATTRIBUTE(u32, p_ssize);
>>   UAC2_ATTRIBUTE(u32, c_chmask);
>> -UAC2_ATTRIBUTE(u32, c_srate);
>> +UAC_RATE2_ATTRIBUTE(c_srate);
>>   UAC2_ATTRIBUTE_SYNC(c_sync);
>>   UAC2_ATTRIBUTE(u32, c_ssize);
>>   UAC2_ATTRIBUTE(u32, req_number);
>> @@ -1915,9 +1979,11 @@ static struct usb_function_instance *afunc_alloc_inst(void)
>>   				    &f_uac2_func_type);
>>   
>>   	opts->p_chmask = UAC2_DEF_PCHMASK;
>> +	opts->p_srates[0] = UAC2_DEF_PSRATE;
>>   	opts->p_srate = UAC2_DEF_PSRATE;
>>   	opts->p_ssize = UAC2_DEF_PSSIZE;
>>   	opts->c_chmask = UAC2_DEF_CCHMASK;
>> +	opts->c_srates[0] = UAC2_DEF_CSRATE;
>>   	opts->c_srate = UAC2_DEF_CSRATE;
>>   	opts->c_ssize = UAC2_DEF_CSSIZE;
>>   	opts->c_sync = UAC2_DEF_CSYNC;
>> diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
>> index e0c8e3513bfd..8058217322f8 100644
>> --- a/drivers/usb/gadget/function/u_uac2.h
>> +++ b/drivers/usb/gadget/function/u_uac2.h
>> @@ -14,6 +14,7 @@
>>   #define U_UAC2_H
>>   
>>   #include <linux/usb/composite.h>
>> +#include "uac_common.h"
>>   
>>   #define UAC2_DEF_PCHMASK 0x3
>>   #define UAC2_DEF_PSRATE 48000
>> @@ -35,9 +36,11 @@
>>   struct f_uac2_opts {
>>   	struct usb_function_instance	func_inst;
>>   	int				p_chmask;
>> +	int				p_srates[UAC_MAX_RATES];
>>   	int				p_srate;
>>   	int				p_ssize;
>>   	int				c_chmask;
>> +	int				c_srates[UAC_MAX_RATES];
>>   	int				c_srate;
>>   	int				c_ssize;
>>   	int				c_sync;
>> @@ -62,4 +65,63 @@ struct f_uac2_opts {
>>   	int				refcnt;
>>   };
>>   
>> +#define UAC_RATE2_ATTRIBUTE(name)					\
> 
> Why define this in the header?  UAC2_ATTRIBUTE() is in the .c file and
> this is only used in one place so no need for it to be in the .h.

Moved, renamed to UAC2_RATE_ATTRIBUTE.

Thanks,

Pavel.
