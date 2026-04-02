Return-Path: <linux-usb+bounces-35833-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DaUGuoXzmmnkgYAu9opvQ
	(envelope-from <linux-usb+bounces-35833-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:16:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3B5385009
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 09:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4393730B3AD1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 07:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF429386C3B;
	Thu,  2 Apr 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UFSAQhmP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A105737F000;
	Thu,  2 Apr 2026 07:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113837; cv=none; b=hoPRwjrIBOCEF3ceI+ymXdKFI45+q8GoNNmVq1240TuU2xjWI/cfJmYmH9l553PtGX6RJ/UqaAFjVOBZm05f61kR+9LNIIo6HC3x4JXWMDde260nSUCHQBfGGJsIZjuVJ67HjfcpptxlSRUspFqvQSBD+BLjxMvIwewRdb62+i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113837; c=relaxed/simple;
	bh=9yJyuT/SJkwKU+0+ZJyHL0OAOwGO+rPd25aIidvgN7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cBzDtOVEGArura19ajgbB/0rJAgOdaxo/TgHcSE0k7BCPqpu/wqg9/ltawniQSnSFk5AcRBV7Ym1bGL0fo+YBuhL6XYnSMRv+4YhFyFtUUq1EmvlBIMWV6Zc0JS9TE69eXZp9Usd0nycvzB+QRiEeRx3KRl3icsuOlg/BH6kwyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UFSAQhmP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFEBDC2BC9E;
	Thu,  2 Apr 2026 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775113837;
	bh=9yJyuT/SJkwKU+0+ZJyHL0OAOwGO+rPd25aIidvgN7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFSAQhmP+RPnaEAiNPGX0WP2sXlKzatOze+VRmFXRr0TIQ670Wo0MvmmuBUvhtabF
	 2ovyRzQozeomnvj2ihzN7cxQW3qZEAC+mZRStg8DbkR9HVCLF5Ja5nN+7gxQPBfDrU
	 oEhosVW/t/WoVhbuEnF/t7KCq/KoxyS2ywsn/EWc=
Date: Thu, 2 Apr 2026 09:10:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Xuetao (kirin)" <xuetao09@huawei.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	caiyadong@huawei.com, stable@kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <2026040232-wrinkly-replace-4fdf@gregkh>
References: <20260402021400.28853-1-xuetao09@huawei.com>
 <2026040241-purveyor-bakery-a9f1@gregkh>
 <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35833-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,huawei.com:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: CF3B5385009
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 02:59:35PM +0800, Xuetao (kirin) wrote:
> 
> 
> 在 2026/4/2 11:51, Greg KH 写道:
> > On Thu, Apr 02, 2026 at 10:14:00AM +0800, Tao Xue wrote:
> > > As specified in Section 4.14.2 of the xHCI Specification, the xHC
> > > reserves bandwidth for periodic endpoints according to bInterval and
> > > wBytesPerInterval (Max ESIT Payload).
> > > 
> > > Some peripherals report an invalid wBytesPerInterval in their device
> > > descriptor, which is either 0 or smaller than the actual data length
> > > transmitted. This issue is observed on ASIX AX88179 series USB 3.0
> > > Ethernet adapters.
> > > 
> > > These errors may lead to unexpected behavior on certain USB host
> > > controllers, causing USB peripherals to malfunction.
> > > 
> > > To address the issue, return max(wBytesPerInterval, max_payload) when
> > > calculating bandwidth reservation.
> > > 
> > > Fixes: 9238f25d5d32 ("USB: xhci: properly set endpoint context fields for periodic eps.")
> > > Cc: <stable@kernel.org>
> > > Signed-off-by: Tao Xue <xuetao09@huawei.com>
> > > ---
> > >   drivers/usb/core/usb.c | 9 ++++++++-
> > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > > index e9a10a33534c..8f2e05a5a015 100644
> > > --- a/drivers/usb/core/usb.c
> > > +++ b/drivers/usb/core/usb.c
> > > @@ -1125,6 +1125,8 @@ EXPORT_SYMBOL_GPL(usb_free_noncoherent);
> > >   u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
> > >   				      const struct usb_host_endpoint *ep)
> > >   {
> > > +	u32 max_payload;
> > > +
> > >   	if (!usb_endpoint_xfer_isoc(&ep->desc) &&
> > >   	    !usb_endpoint_xfer_int(&ep->desc))
> > >   		return 0;
> > > @@ -1135,7 +1137,12 @@ u32 usb_endpoint_max_periodic_payload(struct usb_device *udev,
> > >   			return le32_to_cpu(ep->ssp_isoc_ep_comp.dwBytesPerInterval);
> > >   		fallthrough;
> > >   	case USB_SPEED_SUPER:
> > > -		return le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval);
> > > +		max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst + 1);
> > > +		if (usb_endpoint_xfer_isoc(&ep->desc))
> > > +			return max_t(u32, max_payload * USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
> > > +					ep->ss_ep_comp.wBytesPerInterval);
> > > +		else
> > > +			return max_t(u32, max_payload, ep->ss_ep_comp.wBytesPerInterval);
> > 
> > You dropped the conversion from le16 to cpu?  Why?
> > 
> > thanks,
> > 
> > greg k-h
> 
> Hi Greg,
> 
> Thank you for the review.
> 
> 1、You're right, that was an oversight. I should keep the le16_to_cpu().
> Here's the corrected version:
> 
>     max_payload = usb_endpoint_maxp(&ep->desc) * (ep->ss_ep_comp.bMaxBurst +
> 1);
>     if (usb_endpoint_xfer_isoc(&ep->desc))
>         return max_t(u32, max_payload *
> USB_SS_MULT(ep->ss_ep_comp.bmAttributes),
>                         le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval));
>     else
>         return max_t(u32, max_payload,
> le16_to_cpu(ep->ss_ep_comp.wBytesPerInterval));

That's hard to follow as it is line-wrapped, just fix it up for your
next version and I'll be glad to review it then.

> 2、Following Alan's suggestion in another email, should I check whether
> wBytesPerInterval is a valid value and handle it in the
> usb_parse_ss_endpoint_companion() ?
> 
> However, when parsing the device descriptor, we do not know whether the
> actual data length transmitted by the peripheral is greater than
> wBytesPerInterval.
> 
> Therefore, would it be sufficient to only add a check for whether
> wBytesPerInterval is 0 in the existing flow, and if it is 0, set
> wBytesPerInterval to cpu_to_le16(max_tx) by default?

No, don't override a value given by a device.  Mark the descriptor as
invalid and fail attaching to the device.

> For example, modify it in the following way：
> 
>      if (le16_to_cpu(desc->wBytesPerInterval) > max_tx ||
> le16_to_cpu(desc->wBytesPerInterval) == 0) {
>         dev_notice(ddev, "%s endpoint with wBytesPerInterval of %d in "
>                 "config %d interface %d altsetting %d ep %d: "
>                 "setting to %d\n",
>                 usb_endpoint_xfer_isoc(&ep->desc) ? "Isoc" : "Int",
>                 le16_to_cpu(desc->wBytesPerInterval),
>                 cfgno, inum, asnum, ep->desc.bEndpointAddress,
>                 max_tx);
>         ep->ss_ep_comp.wBytesPerInterval = cpu_to_le16(max_tx);
>     }

There's nothing a user can do with this type of error, and yet the
kernel is supposed to fix it up?  We should just fail it and tell the
user then, like we do for other broken descriptors.

Did you find this issue with a real device, or is this just due to
fuzzing invalid descriptor values?

thanks,

greg k-h

