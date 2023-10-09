Return-Path: <linux-usb+bounces-1269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA47BE3ED
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 17:08:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F38E2815D6
	for <lists+linux-usb@lfdr.de>; Mon,  9 Oct 2023 15:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38F51358A4;
	Mon,  9 Oct 2023 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CHwUOMlG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91415171C0
	for <linux-usb@vger.kernel.org>; Mon,  9 Oct 2023 15:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55F6C433C7;
	Mon,  9 Oct 2023 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696864114;
	bh=r36vFBcTVq6uDwqhbi9cOT6hngO8r2QtiwqiCrlmXNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CHwUOMlGn4ZsfhhY017MjAYjRfs3e+y5m24/Jb/6p+qQ2Atb4GrKwEIhAcDi5mu/5
	 rFFCn0L34LW8V3B+gRZmtjA7L13IlSLN6OEDOKBiv0aMtl4UxGB/G3myMcfcqJMsu+
	 VTMbZOuEIuBa+fWi1RqAbA53ZxcEMtHsiK21xTio=
Date: Mon, 9 Oct 2023 17:08:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	onathan Corbet <corbet@lwn.net>,
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com,
	quic_jackp@quicinc.com
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
Message-ID: <2023100931-reward-justice-ed1c@gregkh>
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009142005.21338-2-quic_kriskura@quicinc.com>

On Mon, Oct 09, 2023 at 07:50:05PM +0530, Krishna Kurapati wrote:
> Currently the NCM driver restricts wMaxSegmentSize that indicates
> the datagram size coming from network layer to 1514.

I don't see that restriction in the existing driver, where does that
happen?

> However the spec doesn't have any limitation.

What spec?

> For P2P connections over NCM, increasing MTU helps increasing
> throughput.

While increasing latency, right?

> Add support to configure this value before configfs symlink is
> created. Also since the NTB Out/In buffer sizes are fixed at 16384
> bytes, limit the segment size to an upper cap of 15014. Set the
> default MTU size for the ncm interface during function bind before
> network interface is registered allowing MTU to be set in parity
> with wMaxSegmentSize.

Where does 15014 come from?

> 
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 51 +++++++++++++++++++++++++++++
>  drivers/usb/gadget/function/u_ncm.h |  2 ++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index feccf4c8cc4f..eab297b22200 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -103,6 +103,8 @@ static inline struct f_ncm *func_to_ncm(struct usb_function *f)
>  /* Delay for the transmit to wait before sending an unfilled NTB frame. */
>  #define TX_TIMEOUT_NSECS	300000
>  
> +#define MAX_DATAGRAM_SIZE	15014

Where does this magic value come from?  Please document it really really
well.

> +
>  #define FORMATS_SUPPORTED	(USB_CDC_NCM_NTB16_SUPPORTED |	\
>  				 USB_CDC_NCM_NTB32_SUPPORTED)
>  
> @@ -1408,6 +1410,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>  	ncm_opts = container_of(f->fi, struct f_ncm_opts, func_inst);
>  
>  	if (cdev->use_os_string) {
> +		ncm_opts->net->mtu = (ncm_opts->max_segment_size - ETH_HLEN);
>  		f->os_desc_table = kzalloc(sizeof(*f->os_desc_table),
>  					   GFP_KERNEL);
>  		if (!f->os_desc_table)
> @@ -1469,6 +1472,8 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>  
>  	status = -ENODEV;
>  
> +	ecm_desc.wMaxSegmentSize = ncm_opts->max_segment_size;
> +
>  	/* allocate instance-specific endpoints */
>  	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
>  	if (!ep)
> @@ -1569,11 +1574,56 @@ USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
>  /* f_ncm_opts_ifname */
>  USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(ncm);
>  
> +static ssize_t ncm_opts_max_segment_size_show(struct config_item *item,
> +					      char *page)
> +{
> +	struct f_ncm_opts *opts = to_f_ncm_opts(item);
> +	u32 segment_size;
> +
> +	mutex_lock(&opts->lock);
> +	segment_size = opts->max_segment_size;
> +	mutex_unlock(&opts->lock);
> +
> +	return sprintf(page, "%u\n", segment_size);

sysfs_emit()?

thanks,

greg k-h

