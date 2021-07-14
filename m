Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C100C3C7EBE
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jul 2021 08:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238166AbhGNGyj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Jul 2021 02:54:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238104AbhGNGyj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 14 Jul 2021 02:54:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 827FF613B2;
        Wed, 14 Jul 2021 06:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626245507;
        bh=tWzM/nAg8eNclAWFOFTlsUjc9uWiLTSIVfdSSt10jL4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sRJOxyu/EdZaF04N9N1DlqaOt2cGHZmWOh4usfSdHsFkoquPVsjfvtUmOKIe0ftRU
         775JYYR3exPV1xcDXxSR9ymA5hulGZ9TxN0O+fp1LCFXwo7z6TBJEDO4RorDneLvYv
         r/jacMiOvCX0K5NFYc4RqxwAAqJK/nhtVILg4FPM=
Date:   Wed, 14 Jul 2021 08:51:44 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YO6JgOG7QQ+pTRv8@kroah.com>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
 <1625908395-5498-4-git-send-email-wcheng@codeaurora.org>
 <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
 <87czrmzjym.fsf@kernel.org>
 <e08dac42-e999-fd97-21ab-34cd70429f03@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e08dac42-e999-fd97-21ab-34cd70429f03@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 14, 2021 at 03:10:25AM +0000, Thinh Nguyen wrote:
> Felipe Balbi wrote:
> > 
> > Hi,
> > 
> > Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> >> Wesley Cheng wrote:
> >>> Some devices have USB compositions which may require multiple endpoints
> >>> that support EP bursting.  HW defined TX FIFO sizes may not always be
> >>> sufficient for these compositions.  By utilizing flexible TX FIFO
> >>> allocation, this allows for endpoints to request the required FIFO depth to
> >>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
> >>> a larger TX FIFO size results in better TX throughput.
> >>>
> >>> By introducing the check_config() callback, the resizing logic can fetch
> >>> the maximum number of endpoints used in the USB composition (can contain
> >>> multiple configurations), which helps ensure that the resizing logic can
> >>> fulfill the configuration(s), or return an error to the gadget layer
> >>> otherwise during bind time.
> >>>
> >>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> >>> ---
> >>>  drivers/usb/dwc3/core.c   |  15 +++
> >>>  drivers/usb/dwc3/core.h   |  16 ++++
> >>>  drivers/usb/dwc3/ep0.c    |   2 +
> >>>  drivers/usb/dwc3/gadget.c | 232 ++++++++++++++++++++++++++++++++++++++++++++++
> >>>  4 files changed, 265 insertions(+)
> >>>
> >>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> >>> index ba74ad7..b194aecd 100644
> >>> --- a/drivers/usb/dwc3/core.c
> >>> +++ b/drivers/usb/dwc3/core.c
> >>> @@ -1267,6 +1267,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >>>  	u8			rx_max_burst_prd;
> >>>  	u8			tx_thr_num_pkt_prd;
> >>>  	u8			tx_max_burst_prd;
> >>> +	u8			tx_fifo_resize_max_num;
> >>>  	const char		*usb_psy_name;
> >>>  	int			ret;
> >>>  
> >>> @@ -1282,6 +1283,13 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >>>  	 */
> >>>  	hird_threshold = 12;
> >>>  
> >>> +	/*
> >>> +	 * default to a TXFIFO size large enough to fit 6 max packets.  This
> >>> +	 * allows for systems with larger bus latencies to have some headroom
> >>> +	 * for endpoints that have a large bMaxBurst value.
> >>> +	 */
> >>> +	tx_fifo_resize_max_num = 6;
> >>> +
> >>>  	dwc->maximum_speed = usb_get_maximum_speed(dev);
> >>>  	dwc->max_ssp_rate = usb_get_maximum_ssp_rate(dev);
> >>>  	dwc->dr_mode = usb_get_dr_mode(dev);
> >>> @@ -1325,6 +1333,11 @@ static void dwc3_get_properties(struct dwc3 *dwc)
> >>>  				&tx_thr_num_pkt_prd);
> >>>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
> >>>  				&tx_max_burst_prd);
> >>> +	dwc->do_fifo_resize = device_property_read_bool(dev,
> >>> +							"tx-fifo-resize");
> >>> +	if (dwc->do_fifo_resize)
> >>> +		device_property_read_u8(dev, "tx-fifo-max-num",
> >>> +					&tx_fifo_resize_max_num);
> >>
> >> Why is this check here? The dwc->tx_fifo_resize_max_num should store
> >> whatever property the user sets. Whether the driver wants to use this
> > 
> > Ack!
> > 
> >> property should depend on "dwc->do_fifo_resize". Also why don't we have
> >> "snps," prefix to be consistent with the other properties?
> > 
> > Ack!
> > 
> >> Can we enforce to a single property? If the designer wants to enable
> >> this feature, he/she can to provide the tx-fifo-max-num. This would
> >> simplify the driver a bit. Since this is to optimize for performance,
> >> the user should know/want/test the specific value if they want to set
> >> for their setup and not hoping that the default setting not break their
> >> setup. So we can remove the "do_fifo_resize" property and just check
> >> whether tx_fifo_resize_max_num is set.
> > 
> > Ack!
> > 
> > All very valid points :-)
> > 
> 
> Looks like this series already landed in Greg's testing branch. Not sure
> how we usually handle this to address some of our concerns. Add fix
> patches on top of Greg's testing branch?

Yes please send patches on top of this series.

thanks,

greg k-h
