Return-Path: <linux-usb+bounces-1479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDFF7C57FA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 17:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A801D1C20DE4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Oct 2023 15:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406BF208A2;
	Wed, 11 Oct 2023 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PPAaP+Hr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC6D1F18A
	for <linux-usb@vger.kernel.org>; Wed, 11 Oct 2023 15:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6320FC433C8;
	Wed, 11 Oct 2023 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697037809;
	bh=BQxbIoojRe7a+bdZcSee42aOrgRqHMWTJxldHf0gZ+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPAaP+HrInoey5eLi2YaVM/Cx66vS9WlfjCQ3GUcBWE1G0YFCn6U9AHa6eSpoDduf
	 wcmkV+Q4HTNuuqvv/ACv3QETWng9l3PdR1MCCIClkiPHEVL8ZMX945mJ2sL48gqyR4
	 nu+Bn7YlFOqP1vK2or5gBbKvPuc1+qdPIjOBGZJU=
Date: Wed, 11 Oct 2023 17:23:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
	yangyingliang@huawei.com, jinpu.wang@ionos.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	erosca@de.adit-jv.com
Subject: Re: [PATCH v3] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <2023101155-unframed-satirical-f7ec@gregkh>
References: <6b26db15-89a0-d455-5740-9abb1befa3a8@intel.com>
 <20231011085011.89198-1-hgajjar@de.adit-jv.com>
 <2023101117-colonize-jovial-893f@gregkh>
 <20231011120535.GA89684@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011120535.GA89684@vmlxhi-118.adit-jv.com>

On Wed, Oct 11, 2023 at 02:05:35PM +0200, Hardik Gajjar wrote:
> On Wed, Oct 11, 2023 at 11:02:27AM +0200, Greg KH wrote:
> > On Wed, Oct 11, 2023 at 10:50:11AM +0200, Hardik Gajjar wrote:
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
> > > 
> > > The quirk will set the timeout to 500 ms from 5 seconds.
> > > 
> > > To use the quirk, please write "vendor_id:product_id:p" to
> > > /sys/bus/usb/drivers/hub/module/parameter/quirks
> > > 
> > > For example,
> > > echo "0x2c48:0x0132:p" > /sys/bus/usb/drivers/hub/module/parameter/quirks"
> > > 
> > > Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> > > ---
> > > changes since version 1:
> > > 	- implement quirk instead of new API in xhci driver
> > > 
> > > changes since version 2:
> > > 	- Add documentation for the new quirk.
> > > 	- Define the timeout unit in milliseconds in variable names and function arguments.
> > > 	- Change the xHCI command timeout from HZ (jiffies) to milliseconds.
> > > 	- Add APTIV usb hub vendor and product ID in device quirk list
> > > 	- Adding some other comments for clarity
> > > ---
> > >  .../admin-guide/kernel-parameters.txt         |  3 +++
> > >  drivers/usb/core/hub.c                        | 13 ++++++++--
> > >  drivers/usb/core/quirks.c                     |  6 +++++
> > >  drivers/usb/host/xhci-mem.c                   |  2 ++
> > >  drivers/usb/host/xhci-ring.c                  | 11 ++++----
> > >  drivers/usb/host/xhci.c                       | 25 +++++++++++++------
> > >  drivers/usb/host/xhci.h                       |  6 +++--
> > >  include/linux/usb/hcd.h                       |  5 ++--
> > >  include/linux/usb/quirks.h                    |  3 +++
> > >  9 files changed, 56 insertions(+), 18 deletions(-)
> > > 
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index 0a1731a0f0ef..44732d179bce 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -6817,6 +6817,9 @@
> > >  					pause after every control message);
> > >  				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
> > >  					delay after resetting its port);
> > > +				p = USB_QUIRK_SHORT_DEVICE_ADDR_TIMEOUT ( Timeout
> > > +					of set_address command reduce from 5000 ms
> > > +					to 500 ms
> > 
> > No trailing ")" character?  And no need for the extra space after the
> > new "(" one, right?
> >
> 
> Okay, update it. Interestingly, the 'scripts/checkpatch.pl' is not reporting such warnings

checkpatch doesn't parse documentation like this, so don't expect it to
catch stuff here.

thanks,

greg k-h

