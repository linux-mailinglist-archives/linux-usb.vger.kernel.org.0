Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6231303DB
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2020 19:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgADSWS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jan 2020 13:22:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:38448 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgADSWS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jan 2020 13:22:18 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A05D2A31;
        Sat,  4 Jan 2020 19:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578162135;
        bh=SW2ZyqDEfgwUASqaFK+8qfjDaw34uxSE4X3GgiKnwyI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=axyDCm8m7kSBEtyJVDe6MyHwDEL2V6o/CA4l4g+4pLHjsEFiBtFsADgroPmDbA0h7
         kmahtvexl5pizLnGSBjZcsXofCGJhKcBx2lHl/M9fQJVOnBto25k9tKq6XCktAUuGD
         QgqN0kqL3VYwBmyIUviolMU1rS44H3cGvdQPB+L8=
Date:   Sat, 4 Jan 2020 20:22:05 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Roger Whittaker <Roger.Whittaker@suse.com>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200104182205.GB4906@pendragon.ideasonboard.com>
References: <20200102231124.GH4843@pendragon.ideasonboard.com>
 <Pine.LNX.4.44L0.2001031011250.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2001031011250.1560-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Fri, Jan 03, 2020 at 10:13:29AM -0500, Alan Stern wrote:
> On Fri, 3 Jan 2020, Laurent Pinchart wrote:
> 
> > I've investigated this a bit further.
> > 
> > UVC defines class-specific interface descriptors that are usually
> > located right after the standard interface descriptor in altsetting 0.
> > The uvcvideo driver accesses those descriptor through
> > intf->altsetting[0].extra. However, some devices insert an isochronous
> > endpoint descriptor with wMaxPAcketSize set to 0 between the standard
> > interface descriptor and the UVC class-specific interface descriptors.
> > 
> > Before your patch, these descriptors were recorded in the extra field of
> > the endpoint, as they're located right after it:
> > 
> > static int usb_parse_endpoint(struct device *ddev, int cfgno, int inum,
> >     int asnum, struct usb_host_interface *ifp, int num_ep,
> >     unsigned char *buffer, int size)
> > {
> > ...
> >         /* Skip over any Class Specific or Vendor Specific descriptors;
> >          * find the next endpoint or interface descriptor */
> >         endpoint->extra = buffer;
> >         i = find_next_descriptor(buffer, size, USB_DT_ENDPOINT,
> >                         USB_DT_INTERFACE, &n);
> >         endpoint->extralen = i;
> > ...
> > }
> > 
> > The uvcvideo driver looks at endpoint->extra when altsetting[0] has no
> > extra data.
> > 
> > With your patch, the endpoint is skipped, and the class-specific
> > interface descriptors are dropped with it. The uvcvideo driver can't
> > access them and fails.
> 
> Ah, a very tricky and unexpected interaction!
> 
> > One solution may be to add to altsetting[0].extra all the extra
> > class-specific descriptors, regardless of whether they're located before
> > or after endpoints. I however fear we may not always be able to identify
> > those descriptors properly, especially with the CS_INTERFACE descriptor
> > type being defined in class specifications, not in the USB core
> > specification. There's also a risk of breaking working devices if we do
> > so (the uvcvideo driver should be able to cope, but other drivers may
> > always look for descriptors in the endpoint).
> 
> With the patch I posted yesterday, everything should go back to working 
> the way it used to.  Have you had a chance to test it?

I don't have any camera affected by this issue, so I can't test it I'm
afraid. Roger, would you be able to give it a try ?

-- 
Regards,

Laurent Pinchart
