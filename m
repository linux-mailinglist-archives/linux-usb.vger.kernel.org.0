Return-Path: <linux-usb+bounces-22331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F3DA766CA
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 15:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C5563A7DFC
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 13:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3EB2116EB;
	Mon, 31 Mar 2025 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QAAWE3IY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8890017A2FA
	for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 13:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427477; cv=none; b=DONAJFUmKJ2FWvJ7h8XiY2PjZFYP++nGMnsGKnhAUqyfsQjIfOotXO7kzCc2RvVV/A9xyLnXGhccekLM0oM9zUIZuGr66T0sNWoTobDTN74DFe/CTS+YX+lc3TdGYE7CSMR3HhO073WhboCX15Kf0UBOsabqjPjjF5GkjIEPUkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427477; c=relaxed/simple;
	bh=dZBqzbntiCyW4C96FaZBIosZwXmLZtZGCIy2ah7LvwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9nzbflICojBuHp3G1o3QfV4Z6W8CE8QSJFGcuVdz/J4236NlAm2XUNKc84RoKyAl6GWTKse0pXQhsCRq36s5sJL2MLcGCcDuZ78Yt5jIs3pDGVIXfpJ+8ifPFXTXIbwih4MhPpJ09uI5mvjJvhrX4CvS24mj5p6tT6kUo8aEak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QAAWE3IY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7A4DC4CEE3;
	Mon, 31 Mar 2025 13:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743427477;
	bh=dZBqzbntiCyW4C96FaZBIosZwXmLZtZGCIy2ah7LvwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAAWE3IYKN+9dVpIEDr3CWSiM4H8EDXCLgxJg08sO11e1VkYWb2Eod0lGMKHoYrGU
	 b1YAUN4YBYWd3slv2jZxLE6c57UDvz0TEgs8BKo0MfhZVz3ph8459OSpvzOyg12ypV
	 2+wSSk3orlvj9v1IfyFSlPNpPC/flFeJW/IiZDjU=
Date: Mon, 31 Mar 2025 15:23:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Frode Isaksen <fisaksen@baylibre.com>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
	Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Invalidate io_data when USB request
 is dequeued or completed
Message-ID: <2025033133-crabmeat-collected-bfdd@gregkh>
References: <20250328161823.2240125-1-fisaksen@baylibre.com>
 <2025032835-sixtieth-unable-1548@gregkh>
 <bc6749c7-9169-4e1b-a1f5-3fe645ddb230@baylibre.com>
 <2025033129-sulphuric-doorknob-5568@gregkh>
 <8f6e57f0-990c-4b28-b6e2-f3987173ebbd@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f6e57f0-990c-4b28-b6e2-f3987173ebbd@baylibre.com>

On Mon, Mar 31, 2025 at 03:17:08PM +0200, Frode Isaksen wrote:
> On 3/31/25 10:57 AM, Greg KH wrote:
> > On Mon, Mar 31, 2025 at 10:18:29AM +0200, Frode Isaksen wrote:
> > > On 3/28/25 10:02 PM, Greg KH wrote:
> > > > On Fri, Mar 28, 2025 at 05:17:15PM +0100, Frode Isaksen wrote:
> > > > > From: Frode Isaksen <frode@meta.com>
> > > > > 
> > > > > Invalidate io_data by setting context to NULL when USB request is
> > > > > dequeued or completed, and check for NULL io_data in epfile_io_complete().
> > > > > The invalidation of io_data in req->context is done when exiting
> > > > > epfile_io(), since then io_data will become invalid as it is allocated
> > > > > on the stack.
> > > > > The epfile_io_complete() may be called after ffs_epfile_io() returns
> > > > > in case the wait_for_completion_interruptible() is interrupted.
> > > > > This fixes a use-after-free error with the following call stack:
> > > > > 
> > > > > Unable to handle kernel paging request at virtual address ffffffc02f7bbcc0
> > > > > pc : ffs_epfile_io_complete+0x30/0x48
> > > > > lr : usb_gadget_giveback_request+0x30/0xf8
> > > > > Call trace:
> > > > > ffs_epfile_io_complete+0x30/0x48
> > > > > usb_gadget_giveback_request+0x30/0xf8
> > > > > dwc3_remove_requests+0x264/0x2e8
> > > > > dwc3_gadget_pullup+0x1d0/0x250
> > > > > kretprobe_trampoline+0x0/0xc4
> > > > > usb_gadget_remove_driver+0x40/0xf4
> > > > > usb_gadget_unregister_driver+0xdc/0x178
> > > > > unregister_gadget_item+0x40/0x6c
> > > > > ffs_closed+0xd4/0x10c
> > > > > ffs_data_clear+0x2c/0xf0
> > > > > ffs_data_closed+0x178/0x1ec
> > > > > ffs_ep0_release+0x24/0x38
> > > > > __fput+0xe8/0x27c
> > > > > 
> > > > > Signed-off-by: Frode Isaksen <frode@meta.com>
> > > > > ---
> > > > > This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
> > > > > Also tested on T.I. AM62x board.
> > > > What commit id does this fix?  Should it go to stable?
> > > This has always been there, so the is no specific commit when this was
> > > added.
> > > 
> > > Will add the Cc tag to stable in v2.
> > > 
> > > > >    drivers/usb/gadget/function/f_fs.c | 5 +++++
> > > > >    1 file changed, 5 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> > > > > index 2dea9e42a0f8..f1be0a5c0bd0 100644
> > > > > --- a/drivers/usb/gadget/function/f_fs.c
> > > > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > > > @@ -738,6 +738,9 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
> > > > >    {
> > > > >    	struct ffs_io_data *io_data = req->context;
> > > > > +	if (WARN_ON(io_data == NULL))
> > > > > +		return;
> > > > If this happens you just crashed the box (remember about panic-on-warn,
> > > > which is still set in a few billion Linux systems these days...)
> > > > 
> > > > Just handle the issue properly, no need to dump the stack and crash a
> > > > device.
> > > OK, removing the WARN_ON for v2.
> > > > But, what keeps io_data from changing after you have checked it?  Where
> > > > is the lock here?
> > > There is no lock here, as I didn't want to introduce extra complexity (and
> > > bugs...). But this code has been running without a crash on millions of
> > > devices for more than a year.
> > The fix has?  Great, but again, you need to at least say why this value
> > will not change right after testing for it, otherwise you have just
> > reduced the race window, not removed it.
> 
> I agree that this is only reducing the race window and not eliminating it
> completely, but I have no idea how to fix this easily.

The comment in the code explains where the race can not happen, which
implies where it can happen, so perhaps that is a good start?

good luck!

greg k-h

