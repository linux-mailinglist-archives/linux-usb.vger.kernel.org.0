Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336D91BFFF8
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 17:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgD3PSn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 11:18:43 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50917 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726419AbgD3PSn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 11:18:43 -0400
Received: (qmail 1937 invoked by uid 500); 30 Apr 2020 11:18:42 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 30 Apr 2020 11:18:42 -0400
Date:   Thu, 30 Apr 2020 11:18:42 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Vladimir Stankovic <vladimir.stankovic@displaylink.com>
cc:     gregkh@linuxfoundation.org, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mausb-host-devel@displaylink.com>
Subject: Re: [External] Re: [PATCH v5 5/8] usb: mausb_host: Introduce PAL
 processing
In-Reply-To: <8536b665-1e25-bd5a-4ca0-3f68233ff1be@displaylink.com>
Message-ID: <Pine.LNX.4.44L0.2004301112390.27217-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 30 Apr 2020, Vladimir Stankovic wrote:

> On 26.4.20. 22:56, Alan Stern wrote:
> > On Sun, 26 Apr 2020, Vladimir Stankovic wrote:
> > 
> >> On 26.4.20. 16:31, Alan Stern wrote:
> >>> On Sun, 26 Apr 2020, Vladimir Stankovic wrote:
> >>>
> >>>> On 26.4.20. 02:32, Alan Stern wrote:
> >>>>> On Sat, 25 Apr 2020 vladimir.stankovic@displaylink.com wrote:
> >>>>>
> >>>>>> Protocol adaptation layer (PAL) implementation has been added to
> >>>>>> introduce MA-USB structures and logic.
> >>>>>>
> >>>>>> Signed-off-by: Vladimir Stankovic <vladimir.stankovic@displaylink.com>
> >>>>>
> >>>>> ...
> >>>>>
> >>>>>> +	/*
> >>>>>> +	 * Masking URB_SHORT_NOT_OK flag as SCSI driver is adding it where it
> >>>>>> +	 * should not, so it is breaking the USB drive on the linux
> >>>>>> +	 */
> >>>>>> +	urb->transfer_flags &= ~URB_SHORT_NOT_OK;

...

> > Okay.  What SCSI driver does the comment refer to?  Is it something 
> > internal to DisplayLink or is it part of the regular Linux kernel?
> > 
> > Alan Stern
> > 
> Hi,
> 
> Comment was related to the SCSI driver that's part of regular Linux kernel -
> once the remote USB flash drive gets enumerated by host, it would appear as
> directly attached to host and then handled by the kernel.
> 
> With current implementation, following messages are being logged:
> 
> scsi 3:0:0:0: Direct-Access     Kingston DataTraveler 3.0 PMAP PQ: 0 ANSI: 6
> sd 3:0:0:0: Attached scsi generic sg2 type 0
> 
> after which the flash drive is usable/accessible from host side.

More context please.  Without the log messages preceding this one we 
can't tell whether the device is using the usb-storage driver or the 
uas driver.

Also, what makes you think the driver is setting the SHORT_NOT_OK flag
at the wrong time?  In fact, how can there be a wrong time?  
SHORT_NOT_OK is a valid flag to use with any control or bulk URB.

Alan Stern

