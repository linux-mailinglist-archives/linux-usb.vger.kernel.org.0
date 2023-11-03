Return-Path: <linux-usb+bounces-2497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B47E0589
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 16:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59538B21395
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 15:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A181BDF6;
	Fri,  3 Nov 2023 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GNn9k/ze"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E37ABA42
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 15:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305CDC433C8;
	Fri,  3 Nov 2023 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699025203;
	bh=XJ7Bs/+V7BeLxlzjtBTK45mi2154iurCY5DvcmsIQPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNn9k/ze+T4kYowcJM08Y+Pe5wNT1xDEiVm/6xMgv7d6s140j95A2jv5vgO+LVerr
	 hCJYyxPNv+dqin9hSHFCQDcWzL0HPIWQJ47YC6vKWymA2HMQhw7mvrVG4ebJYT7SOw
	 wu6okgxZ9s/kvQaPe+0YYvseaZxJjwps3V5K2Qmg=
Date: Fri, 3 Nov 2023 16:26:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	stern@rowland.harvard.edu, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com, s.shtylyov@omp.ru
Subject: Re: [PATCH v7 1/2] usb: xhci: Add timeout argument in address_device
 USB HCD callback
Message-ID: <2023110341-decode-atonable-64b4@gregkh>
References: <20231027152029.104363-1-hgajjar@de.adit-jv.com>
 <aa328f6d-be12-45ef-42dd-2b4dc0821771@linux.intel.com>
 <20231103151822.GA101660@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231103151822.GA101660@vmlxhi-118.adit-jv.com>

On Fri, Nov 03, 2023 at 04:18:22PM +0100, Hardik Gajjar wrote:
> On Mon, Oct 30, 2023 at 12:45:54PM +0200, Mathias Nyman wrote:
> > On 27.10.2023 18.20, Hardik Gajjar wrote:
> > > - The HCD address_device callback now accepts a user-defined timeout value
> > >    in milliseconds, providing better control over command execution times.
> > > - The default timeout value for the address_device command has been set
> > >    to 5000 ms, aligning with the USB 3.2 specification. However, this
> > >    timeout can be adjusted as needed.
> > > - The xhci_setup_device function has been updated to accept the timeout
> > >    value, allowing it to specify the maximum wait time for the command
> > >    operation to complete.
> > > - The hub driver has also been updated to accommodate the newly added
> > >    timeout parameter during the SET_ADDRESS request.
> > > 
> > > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > 
> > For the xhci parts
> > 
> > Reviewed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > 
> >
> 
> @Greg KH, Friendly reminder.

It is the m iddle of the merge window, my branches are closed for
obvious reasons until after -rc1 is out.  Please relax and wait for a
week or so _after_ -rc1 is out before worrying about anything.

thanks,

greg k-h

