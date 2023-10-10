Return-Path: <linux-usb+bounces-1357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E157BF9A4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 13:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D8671C20D41
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 11:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CAD18C1D;
	Tue, 10 Oct 2023 11:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="x1XBN/GI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7060918C15
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 11:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D18BC433C8;
	Tue, 10 Oct 2023 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696937104;
	bh=YfSpTxm6D1i+VJgN9Z2T5sxR0IVtkWMSVzGsQYn0PY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=x1XBN/GIDNGzPcK+zoPBQcCd58F8U4L2sakI+FBrpgEewEUVRaKo846nvXXDUs2XO
	 g6IndLsC88TfRja2FPuZvS8HmOGmxt89M3+D7BHH82Wp6RTjA1RZamQ3yg1Hr0wPZ3
	 QkFhL5OH1nIAn6t0730FjX7uOiv8drqANLTAn5iI=
Date: Tue, 10 Oct 2023 13:25:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	yangyingliang@huawei.com, jinpu.wang@ionos.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com
Subject: Re: [PATCH v2] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <2023101054-thread-manliness-52a4@gregkh>
References: <--in-reply-to=20231006153808.9758-1-hgajjar@de.adit-jv.com>
 <20231009161402.104224-1-hgajjar@de.adit-jv.com>
 <2023100921-likeness-possible-032c@gregkh>
 <20231010103143.GA107162@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010103143.GA107162@vmlxhi-118.adit-jv.com>

On Tue, Oct 10, 2023 at 12:31:43PM +0200, Hardik Gajjar wrote:
> On Mon, Oct 09, 2023 at 07:43:09PM +0200, Greg KH wrote:
> > On Mon, Oct 09, 2023 at 06:14:02PM +0200, Hardik Gajjar wrote:
> > > Currently, the timeout for the set address command is fixed at
> > > 5 seconds in the xhci driver. This means the host waits up to 5
> > > seconds to receive a response for the set_address command from
> > > the device.
> > > 
> > > In the automotive context, most smartphone enumerations, including
> > > screen projection, should ideally complete within 3 seconds.
> > > Achieving this is impossible in scenarios where the set_address is
> > > not successful and waits for a timeout.
> > > 
> > > The shortened address device timeout quirks provide the flexibility
> > > to align with a 3-second time limit in the event of errors.
> > > By swiftly triggering a failure response and swiftly initiating
> > > retry procedures, these quirks ensure efficient and rapid recovery,
> > > particularly in automotive contexts where rapid smartphone enumeration
> > > and screen projection are vital.
> > 
> > So you have known-broken devices where you want a shorter error timeout?
> > But you don't list those devices in this patch adding the quirk
> > settings, shouldn't that be required, otherwise this looks like an
> > unused quirk.
> Yes, we have identified the device (hub) that is causing the issue. However,
> I would prefer not to force this timeout globally. Instead, I can dynamically
> control it by writing to the /sys/bus/usb/drivers/hub/module/parameter/quirks
> file from init.rc (Android) during the boot-up process.

Then add that device to the quirk list please so that everyone doesn't
have to figure this out on their own for that broken device.  That's why
we have a quirk list in the kernel.

> > >  static int xhci_setup_device(struct usb_hcd *hcd, struct usb_device *udev,
> > > -			     enum xhci_setup_dev setup)
> > > +			     enum xhci_setup_dev setup, int timeout)
> > 
> > What is the units of timeout here?
> The timeout is in jiffies. Should we consider adding 'jiffies' in the variable name
> for clarity? I searched the kernel source code but couldn't find a reference for the
> unit of timeout in jiffies.
> Nevertheless, I will add a comment in patch v3 for clarification.

You should not pass around jiffies in the kernel in an int, please pass
around a unit of time and then when you actually need to tell the kernel
to sleep, you can use the time to convert to whatever unit the delay
function needs.

> > > +/* short device address timeout */
> > > +#define USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT	BIT(16)
> > 
> > Don't you also need to have a Documentation/ update for the new
> > user/kernel api you are adding?
> > 
> When you recommend Documentation, I assume you suggest to add the
> detailed comment in quirks.h to clear intention of the change.

No, please document the info that you have in the changelog in someplace
where people will know what flag to use in the module option.  That's
already documented for the other flags somewhere, right?

thanks,

greg k-h

