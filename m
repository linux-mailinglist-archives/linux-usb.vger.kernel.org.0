Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB11E47BF38
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 13:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237347AbhLUMAA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 07:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbhLUL77 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 06:59:59 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AD0C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 03:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
        Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description; bh=3XSVREnf9D2x1SOZwfRDEWO73F5c8Pn+GeyyJ8yYX5Y=; b=xTRUQ
        UYRaAt6VYZ5x7fSruZc+tkbZBgGiJKpU7gX59z14nsvsKdO5AfXgZXLxOrhdmdPORiq6A3a5X4TP/
        kbWPH3S4oL8RiMaA08E05INVqFcq+4SoH+9i+r9PLgNgAhGmGiUiTkeENuYK3q8xc9vNildJxcaZC
        SwxCsb3vLLnhSOslIvgiX39QfvpuUeTns4A2xigXtAGOt8k/R2qXpDYMLo7j4j84xhUycX5BWux8F
        WmWskDyg3/H2mr6DmYBHIQUl3Eo4yLdhxepHnexVIdUoztKqjwMS76pwMUXACz1ek5khaKppkFabo
        h7lcpMeF6+zGSlzbaH3BUt3xaNQ7Q==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mzdnm-00029t-TV; Tue, 21 Dec 2021 11:59:49 +0000
Date:   Tue, 21 Dec 2021 11:59:29 +0000
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
Message-ID: <YcHBocOvNkrMTnJM@donbot>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
 <20211220211130.88590-4-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211220211130.88590-4-pavel.hofman@ivitera.com>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 10:11:22PM +0100, Pavel Hofman wrote:
> From: Julian Scheel <julian@jusst.de>
> 
> A list of sampling rates can be specified via configfs. All enabled
> sampling rates are sent to the USB host on request. When the host
> selects a sampling rate the internal active rate is updated.
> 
> Config strings with single value stay compatible with the previous version.
> 
> Multiple samplerates passed as configuration arrays to g_audio module
> when built for f_uac2.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>
> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
> ---
>  .../ABI/testing/configfs-usb-gadget-uac2      |   4 +-
>  Documentation/usb/gadget-testing.rst          |   4 +-
>  drivers/usb/gadget/function/f_uac2.c          | 118 ++++++++++++++----
>  drivers/usb/gadget/function/u_uac2.h          |  62 +++++++++
>  drivers/usb/gadget/legacy/audio.c             |  28 +++--
>  5 files changed, 177 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
> index c18113077889..928f60a31544 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -726,7 +726,7 @@ The uac2 function provides these attributes in its function directory:
>  
>  	================ ====================================================
>  	c_chmask         capture channel mask
> -	c_srate          capture sampling rate
> +	c_srate          list of capture sampling rates (comma-separated)
>  	c_ssize          capture sample size (bytes)
>  	c_sync           capture synchronization type (async/adaptive)
>  	c_mute_present   capture mute control enable
> @@ -736,7 +736,7 @@ The uac2 function provides these attributes in its function directory:
>  	c_volume_res     capture volume control resolution (in 1/256 dB)
>  	fb_max           maximum extra bandwidth in async mode
>  	p_chmask         playback channel mask
> -	p_srate          playback sampling rate
> +	p_srate          list of playback sampling rates (comma-separated)
>  	p_ssize          playback sample size (bytes)
>  	p_mute_present   playback mute control enable
>  	p_volume_present playback volume control enable
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index 1d6e426e5078..74e32bb146c7 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -70,6 +70,7 @@ struct f_uac2 {
>  	/* Interrupt IN endpoint of AC interface */
>  	struct usb_ep	*int_ep;
>  	atomic_t	int_count;
> +	int ctl_id;

Control for what?  This is assigned from a variable called clock_id, so
shouldn't that be the name here?

I think this needs a comment to explain that it's transient state that
is only valid during the handling of a single control request.

>  };
>  
>  static inline struct f_uac2 *func_to_uac2(struct usb_function *f)
> @@ -166,7 +167,7 @@ static struct uac_clock_source_descriptor in_clk_src_desc = {
>  	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
>  	/* .bClockID = DYNAMIC */
>  	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
> -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
> +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
>  	.bAssocTerminal = 0,
>  };
>  
> @@ -178,7 +179,7 @@ static struct uac_clock_source_descriptor out_clk_src_desc = {
>  	.bDescriptorSubtype = UAC2_CLOCK_SOURCE,
>  	/* .bClockID = DYNAMIC */
>  	.bmAttributes = UAC_CLOCK_SOURCE_TYPE_INT_FIXED,
> -	.bmControls = (CONTROL_RDONLY << CLK_FREQ_CTRL),
> +	.bmControls = (CONTROL_RDWR << CLK_FREQ_CTRL),
>  	.bAssocTerminal = 0,
>  };
>  
> @@ -635,12 +636,32 @@ struct cntrl_cur_lay3 {
>  };
>  
>  struct cntrl_range_lay3 {
> -	__le16	wNumSubRanges;
>  	__le32	dMIN;
>  	__le32	dMAX;
>  	__le32	dRES;
>  } __packed;
>  
> +#define ranges_size(c) (sizeof(c.wNumSubRanges) + c.wNumSubRanges \
> +		* sizeof(struct cntrl_ranges_lay3))
> +
> +struct cntrl_ranges_lay3 {
> +	__u16	wNumSubRanges;
> +	struct cntrl_range_lay3 r[UAC_MAX_RATES];
> +} __packed;

These structures are now inconsistent between cntrl_range_lay2 and
cntrl_range_lay3.  Would it be better to make these flex arrays?  I
guess that will make the code that uses it more complicated, but at the
moment it looks like these are trying to be generic while in reality
being quite specific to the one place that uses them at the moment.

> +static int get_max_srate(const int *srates)
> +{
> +	int i, max_srate = 0;
> +
> +	for (i = 0; i < UAC_MAX_RATES; i++) {
> +		if (srates[i] == 0)
> +			break;
> +		if (srates[i] > max_srate)
> +			max_srate = srates[i];
> +	}
> +	return max_srate;
> +}
> +
>  static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>  	struct usb_endpoint_descriptor *ep_desc,
>  	enum usb_device_speed speed, bool is_playback)
> @@ -667,11 +688,11 @@ static int set_ep_max_packet_size(const struct f_uac2_opts *uac2_opts,
>  
>  	if (is_playback) {
>  		chmask = uac2_opts->p_chmask;
> -		srate = uac2_opts->p_srate;
> +		srate = get_max_srate(uac2_opts->p_srates);
>  		ssize = uac2_opts->p_ssize;
>  	} else {
>  		chmask = uac2_opts->c_chmask;
> -		srate = uac2_opts->c_srate;
> +		srate = get_max_srate(uac2_opts->c_srates);
>  		ssize = uac2_opts->c_ssize;
>  	}
>  
> @@ -912,10 +933,10 @@ static int afunc_validate_opts(struct g_audio *agdev, struct device *dev)
>  	} else if ((opts->c_ssize < 1) || (opts->c_ssize > 4)) {
>  		dev_err(dev, "Error: incorrect capture sample size\n");
>  		return -EINVAL;
> -	} else if (!opts->p_srate) {
> +	} else if (!opts->p_srates[0]) {
>  		dev_err(dev, "Error: incorrect playback sampling rate\n");
>  		return -EINVAL;
> -	} else if (!opts->c_srate) {
> +	} else if (!opts->c_srates[0]) {
>  		dev_err(dev, "Error: incorrect capture sampling rate\n");
>  		return -EINVAL;
>  	}
> @@ -1210,7 +1231,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>  
>  	agdev->params.p_chmask = uac2_opts->p_chmask;
>  	agdev->params.p_srate = uac2_opts->p_srate;
> -	agdev->params.p_srates[0] = uac2_opts->p_srate;
> +	memcpy(agdev->params.p_srates, uac2_opts->p_srates,
> +			sizeof(agdev->params.p_srates));
>  	agdev->params.p_ssize = uac2_opts->p_ssize;
>  	if (FUIN_EN(uac2_opts)) {
>  		agdev->params.p_fu.id = USB_IN_FU_ID;
> @@ -1222,7 +1244,8 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
>  	}
>  	agdev->params.c_chmask = uac2_opts->c_chmask;
>  	agdev->params.c_srate = uac2_opts->c_srate;
> -	agdev->params.c_srates[0] = uac2_opts->c_srate;
> +	memcpy(agdev->params.c_srates, uac2_opts->c_srates,
> +			sizeof(agdev->params.c_srates));
>  	agdev->params.c_ssize = uac2_opts->c_ssize;
>  	if (FUOUT_EN(uac2_opts)) {
>  		agdev->params.c_fu.id = USB_OUT_FU_ID;
> @@ -1502,28 +1525,39 @@ in_rq_range(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>  	u8 entity_id = (w_index >> 8) & 0xff;
>  	u8 control_selector = w_value >> 8;
>  	int value = -EOPNOTSUPP;
> -	int p_srate, c_srate;
> -
> -	p_srate = opts->p_srate;
> -	c_srate = opts->c_srate;
>  
>  	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
>  		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
> -			struct cntrl_range_lay3 r;
> +			struct cntrl_ranges_lay3 rs;
> +			int i;
> +			int wNumSubRanges = 0;
> +			int srate;
> +			int *srates;
>  
>  			if (entity_id == USB_IN_CLK_ID)
> -				r.dMIN = cpu_to_le32(p_srate);
> +				srates = opts->p_srates;
>  			else if (entity_id == USB_OUT_CLK_ID)
> -				r.dMIN = cpu_to_le32(c_srate);
> +				srates = opts->c_srates;
>  			else
>  				return -EOPNOTSUPP;
> -
> -			r.dMAX = r.dMIN;
> -			r.dRES = 0;
> -			r.wNumSubRanges = cpu_to_le16(1);
> -
> -			value = min_t(unsigned int, w_length, sizeof(r));
> -			memcpy(req->buf, &r, value);
> +			for (i = 0; i < UAC_MAX_RATES; i++) {
> +				srate = srates[i];
> +				if (srate == 0)
> +					break;
> +
> +				rs.r[wNumSubRanges].dMIN = cpu_to_le32(srate);
> +				rs.r[wNumSubRanges].dMAX = cpu_to_le32(srate);
> +				rs.r[wNumSubRanges].dRES = 0;
> +				wNumSubRanges++;
> +				dev_dbg(&agdev->gadget->dev,
> +					"%s(): clk %d: rate ID %d: %d\n",
> +					__func__, entity_id, wNumSubRanges, srate);
> +			}
> +			rs.wNumSubRanges = cpu_to_le16(wNumSubRanges);
> +			value = min_t(unsigned int, w_length, ranges_size(rs));
> +			dev_dbg(&agdev->gadget->dev, "%s(): sending %d rates, size %d\n",
> +				__func__, rs.wNumSubRanges, value);
> +			memcpy(req->buf, &rs, value);
>  		} else {
>  			dev_err(&agdev->gadget->dev,
>  				"%s:%d control_selector=%d TODO!\n",
> @@ -1582,6 +1616,28 @@ ac_rq_in(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>  		return -EOPNOTSUPP;
>  }
>  
> +static void uac2_cs_control_sam_freq(struct usb_ep *ep, struct usb_request *req)
> +{
> +	struct usb_function *fn = ep->driver_data;
> +	struct g_audio *agdev = func_to_g_audio(fn);
> +	struct f_uac2 *uac2 = func_to_uac2(fn);
> +	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
> +	u32 val;
> +
> +	if (req->actual != 4)
> +		return;
> +
> +	val = le32_to_cpu(*((u32 *)req->buf));
> +	dev_dbg(&agdev->gadget->dev, "%s val: %d.\n", __func__, val);
> +	if (uac2->ctl_id == USB_IN_CLK_ID) {
> +		opts->p_srate = val;

Don't you need to hold opts->lock to change this?

I'm not sure opts should be changed here though - that's the setup phase
and this is "current state", so shouldn't it move to struct f_uac2?

> +		u_audio_set_playback_srate(agdev, opts->p_srate);
> +	} else if (uac2->ctl_id == USB_OUT_CLK_ID) {
> +		opts->c_srate = val;
> +		u_audio_set_capture_srate(agdev, opts->c_srate);
> +	}
> +}
> +
>  static void
>  out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
>  {
> @@ -1633,6 +1689,7 @@ out_rq_cur_complete(struct usb_ep *ep, struct usb_request *req)
>  static int
>  out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>  {
> +	struct usb_composite_dev *cdev = fn->config->cdev;
>  	struct usb_request *req = fn->config->cdev->req;
>  	struct g_audio *agdev = func_to_g_audio(fn);
>  	struct f_uac2_opts *opts = g_audio_to_uac2_opts(agdev);
> @@ -1642,10 +1699,17 @@ out_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
>  	u16 w_value = le16_to_cpu(cr->wValue);
>  	u8 entity_id = (w_index >> 8) & 0xff;
>  	u8 control_selector = w_value >> 8;
> +	u8 clock_id = w_index >> 8;
>  
>  	if ((entity_id == USB_IN_CLK_ID) || (entity_id == USB_OUT_CLK_ID)) {
> -		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ)
> +		if (control_selector == UAC2_CS_CONTROL_SAM_FREQ) {
> +			dev_dbg(&agdev->gadget->dev,
> +				"control_selector UAC2_CS_CONTROL_SAM_FREQ, clock: %d\n", clock_id);
> +			cdev->gadget->ep0->driver_data = fn;
> +			uac2->ctl_id = clock_id;
> +			req->complete = uac2_cs_control_sam_freq;
>  			return w_length;
> +		}
>  	} else if ((FUIN_EN(opts) && (entity_id == USB_IN_FU_ID)) ||
>  			(FUOUT_EN(opts) && (entity_id == USB_OUT_FU_ID))) {
>  		memcpy(&uac2->setup_cr, cr, sizeof(*cr));
> @@ -1839,10 +1903,10 @@ end:									\
>  CONFIGFS_ATTR(f_uac2_opts_, name)
>  
>  UAC2_ATTRIBUTE(u32, p_chmask);
> -UAC2_ATTRIBUTE(u32, p_srate);
> +UAC_RATE2_ATTRIBUTE(p_srate);

UAC2_RATE_ATTRIBUTE() to match the pattern of the other values here?

>  UAC2_ATTRIBUTE(u32, p_ssize);
>  UAC2_ATTRIBUTE(u32, c_chmask);
> -UAC2_ATTRIBUTE(u32, c_srate);
> +UAC_RATE2_ATTRIBUTE(c_srate);
>  UAC2_ATTRIBUTE_SYNC(c_sync);
>  UAC2_ATTRIBUTE(u32, c_ssize);
>  UAC2_ATTRIBUTE(u32, req_number);
> @@ -1915,9 +1979,11 @@ static struct usb_function_instance *afunc_alloc_inst(void)
>  				    &f_uac2_func_type);
>  
>  	opts->p_chmask = UAC2_DEF_PCHMASK;
> +	opts->p_srates[0] = UAC2_DEF_PSRATE;
>  	opts->p_srate = UAC2_DEF_PSRATE;
>  	opts->p_ssize = UAC2_DEF_PSSIZE;
>  	opts->c_chmask = UAC2_DEF_CCHMASK;
> +	opts->c_srates[0] = UAC2_DEF_CSRATE;
>  	opts->c_srate = UAC2_DEF_CSRATE;
>  	opts->c_ssize = UAC2_DEF_CSSIZE;
>  	opts->c_sync = UAC2_DEF_CSYNC;
> diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
> index e0c8e3513bfd..8058217322f8 100644
> --- a/drivers/usb/gadget/function/u_uac2.h
> +++ b/drivers/usb/gadget/function/u_uac2.h
> @@ -14,6 +14,7 @@
>  #define U_UAC2_H
>  
>  #include <linux/usb/composite.h>
> +#include "uac_common.h"
>  
>  #define UAC2_DEF_PCHMASK 0x3
>  #define UAC2_DEF_PSRATE 48000
> @@ -35,9 +36,11 @@
>  struct f_uac2_opts {
>  	struct usb_function_instance	func_inst;
>  	int				p_chmask;
> +	int				p_srates[UAC_MAX_RATES];
>  	int				p_srate;
>  	int				p_ssize;
>  	int				c_chmask;
> +	int				c_srates[UAC_MAX_RATES];
>  	int				c_srate;
>  	int				c_ssize;
>  	int				c_sync;
> @@ -62,4 +65,63 @@ struct f_uac2_opts {
>  	int				refcnt;
>  };
>  
> +#define UAC_RATE2_ATTRIBUTE(name)					\

Why define this in the header?  UAC2_ATTRIBUTE() is in the .c file and
this is only used in one place so no need for it to be in the .h.
