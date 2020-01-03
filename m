Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46D512F99A
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 16:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbgACPNa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 10:13:30 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:34558 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727646AbgACPNa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jan 2020 10:13:30 -0500
Received: (qmail 1637 invoked by uid 2102); 3 Jan 2020 10:13:29 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Jan 2020 10:13:29 -0500
Date:   Fri, 3 Jan 2020 10:13:29 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
cc:     Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
In-Reply-To: <20200102231124.GH4843@pendragon.ideasonboard.com>
Message-ID: <Pine.LNX.4.44L0.2001031011250.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 3 Jan 2020, Laurent Pinchart wrote:

> I've investigated this a bit further.
> 
> UVC defines class-specific interface descriptors that are usually
> located right after the standard interface descriptor in altsetting 0.
> The uvcvideo driver accesses those descriptor through
> intf->altsetting[0].extra. However, some devices insert an isochronous
> endpoint descriptor with wMaxPAcketSize set to 0 between the standard
> interface descriptor and the UVC class-specific interface descriptors.
> 
> Before your patch, these descriptors were recorded in the extra field of
> the endpoint, as they're located right after it:
> 
> static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
>     int asnum, struct usb_host_interface *ifp, int num_ep,
>     unsigned char *buffer, int size)
> {
> ...
>         /* Skip over any Class Specific or Vendor Specific descriptors;
>          * find the next endpoint or interface descriptor */
>         endpoint->extra = buffer;
>         i = find_next_descriptor(buffer, size, USB_DT_ENDPOINT,
>                         USB_DT_INTERFACE, &n);
>         endpoint->extralen = i;
> ...
> }
> 
> The uvcvideo driver looks at endpoint->extra when altsetting[0] has no
> extra data.
> 
> With your patch, the endpoint is skipped, and the class-specific
> interface descriptors are dropped with it. The uvcvideo driver can't
> access them and fails.

Ah, a very tricky and unexpected interaction!

> One solution may be to add to altsetting[0].extra all the extra
> class-specific descriptors, regardless of whether they're located before
> or after endpoints. I however fear we may not always be able to identify
> those descriptors properly, especially with the CS_INTERFACE descriptor
> type being defined in class specifications, not in the USB core
> specification. There's also a risk of breaking working devices if we do
> so (the uvcvideo driver should be able to cope, but other drivers may
> always look for descriptors in the endpoint).

With the patch I posted yesterday, everything should go back to working 
the way it used to.  Have you had a chance to test it?

Alan Stern

