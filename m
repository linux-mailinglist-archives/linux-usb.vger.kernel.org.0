Return-Path: <linux-usb+bounces-2498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E30E7E058C
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 16:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EF751C21088
	for <lists+linux-usb@lfdr.de>; Fri,  3 Nov 2023 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69801BDF7;
	Fri,  3 Nov 2023 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fC+queIc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3751BDD8
	for <linux-usb@vger.kernel.org>; Fri,  3 Nov 2023 15:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698FFC433C8;
	Fri,  3 Nov 2023 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699025267;
	bh=p/DiDfiUtswqrFHT3cMsob/M/g+W2LgY1gl/ew9gAGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fC+queIcZU2LH4AFim+lu7T2gRZ6R17KqpWewCWomt/rvCqkexrYr+jGOcN8hjZoo
	 AVGZ5jGWN6DUmShdPFjXJ9iCW91m/ttGQzYXztjTxq6XbTm8tphRJ0Yav6UE5lwI64
	 Ba2vQNUMimspOCn7bo1IRPwE9p+2uCwIBrMy9+AE=
Date: Fri, 3 Nov 2023 16:27:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	stern@rowland.harvard.edu, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com, s.shtylyov@omp.ru
Subject: Re: [PATCH v7 1/2] usb: xhci: Add timeout argument in address_device
 USB HCD callback
Message-ID: <2023110305-decade-slacking-a36e@gregkh>
References: <20231027152029.104363-1-hgajjar@de.adit-jv.com>
 <aa328f6d-be12-45ef-42dd-2b4dc0821771@linux.intel.com>
 <20231103151822.GA101660@vmlxhi-118.adit-jv.com>
 <2023110341-decode-atonable-64b4@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023110341-decode-atonable-64b4@gregkh>

On Fri, Nov 03, 2023 at 04:26:37PM +0100, Greg KH wrote:
> On Fri, Nov 03, 2023 at 04:18:22PM +0100, Hardik Gajjar wrote:
> > On Mon, Oct 30, 2023 at 12:45:54PM +0200, Mathias Nyman wrote:
> > > On 27.10.2023 18.20, Hardik Gajjar wrote:
> > > > - The HCD address_device callback now accepts a user-defined timeout value
> > > >    in milliseconds, providing better control over command execution times.
> > > > - The default timeout value for the address_device command has been set
> > > >    to 5000 ms, aligning with the USB 3.2 specification. However, this
> > > >    timeout can be adjusted as needed.
> > > > - The xhci_setup_device function has been updated to accept the timeout
> > > >    value, allowing it to specify the maximum wait time for the command
> > > >    operation to complete.
> > > > - The hub driver has also been updated to accommodate the newly added
> > > >    timeout parameter during the SET_ADDRESS request.
> > > > 
> > > > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > > 
> > > For the xhci parts
> > > 
> > > Reviewed-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > 
> > >
> > 
> > @Greg KH, Friendly reminder.
> 
> It is the m iddle of the merge window, my branches are closed for
> obvious reasons until after -rc1 is out.  Please relax and wait for a
> week or so _after_ -rc1 is out before worrying about anything.

In the meantime, to make things go faster, please help review patches
from others on the mailing list so that when the merge window does open
back up, my queue will be much smaller and lighter and yours will be
closer to the top.

thanks,

greg k-h

