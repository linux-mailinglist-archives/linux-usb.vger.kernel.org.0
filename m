Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34E62236C2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 10:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726930AbgGQIPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 04:15:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:34186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726201AbgGQIPv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jul 2020 04:15:51 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F075620737;
        Fri, 17 Jul 2020 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594973750;
        bh=qW1//TlZ1+D6q2mqJ18RGYITNThESsp+jCqhJOaVZ1M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1QE51XDHFOEz6aw21t2oairCXZu6lbePxuwluhclDCms/zRLBwO7rqiyA9DaVQSmL
         1DPGjXODptDRhB+6pXbOAXsWVxp9XDtBqes4XNHQAn7HNCKqBeud7gaCkCk9v+mI2E
         UjfK1xHQsD5YAKQ9+no5eM7PveWNYfODCz2veTic=
Date:   Fri, 17 Jul 2020 10:15:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 01/11] usb: ch9: Add sublink speed struct
Message-ID: <20200717081541.GA1026451@kroah.com>
References: <cover.1594935978.git.thinhn@synopsys.com>
 <90961eec3e1ed3c27e41e7169353cc295c551604.1594935978.git.thinhn@synopsys.com>
 <20200717063403.GC3238569@kroah.com>
 <91597893-51ce-734b-285d-29de2641d540@synopsys.com>
 <20200717073338.GB694429@kroah.com>
 <26854ca2-06b5-1876-eb64-2484dcf6cdfe@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26854ca2-06b5-1876-eb64-2484dcf6cdfe@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 17, 2020 at 07:47:03AM +0000, Thinh Nguyen wrote:
> Greg Kroah-Hartman wrote:
> > On Fri, Jul 17, 2020 at 07:06:10AM +0000, Thinh Nguyen wrote:
> >> Greg Kroah-Hartman wrote:
> >>> On Thu, Jul 16, 2020 at 02:58:36PM -0700, Thinh Nguyen wrote:
> >>>> USB 3.2 specification supports dual-lane for super-speed-plus. USB
> >>>> devices may operate at different sublink speeds. To avoid using magic
> >>>> numbers and capture the sublink speed better, introduce the
> >>>> usb_sublink_speed structure and various sublink speed attribute enum.
> >>>>
> >>>> See SSP BOS descriptor in USB 3.2 specification section 9.6.2.5
> >>>>
> >>>> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >>>> ---
> >>>>    include/uapi/linux/usb/ch9.h | 42 ++++++++++++++++++++++++++++++++++++++++++
> >>>>    1 file changed, 42 insertions(+)
> >>>>
> >>>> diff --git a/include/uapi/linux/usb/ch9.h b/include/uapi/linux/usb/ch9.h
> >>>> index 2b623f36af6b..d4fd403a3664 100644
> >>>> --- a/include/uapi/linux/usb/ch9.h
> >>>> +++ b/include/uapi/linux/usb/ch9.h
> >>>> @@ -1145,6 +1145,48 @@ enum usb_device_speed {
> >>>>    	USB_SPEED_SUPER_PLUS,			/* usb 3.1 */
> >>>>    };
> >>>>    
> >>>> +/* USB 3.2 sublink speed attributes */
> >>>> +
> >>>> +enum usb_lane_speed_exponent {
> >>>> +	USB_LSE_BPS = 0,
> >>>> +	USB_LSE_KBPS = 1,
> >>>> +	USB_LSE_MBPS = 2,
> >>>> +	USB_LSE_GBPS = 3,
> >>>> +};
> >>>> +
> >>>> +enum usb_sublink_type {
> >>>> +	USB_ST_SYMMETRIC_RX = 0,
> >>>> +	USB_ST_ASYMMETRIC_RX = 1,
> >>>> +	USB_ST_SYMMETRIC_TX = 2,
> >>>> +	USB_ST_ASYMMETRIC_TX = 3,
> >>>> +};
> >>>> +
> >>>> +enum usb_link_protocol {
> >>>> +	USB_LP_SS = 0,
> >>>> +	USB_LP_SSP = 1,
> >>>> +};
> >>>> +
> >>>> +/**
> >>>> + * struct usb_sublink_speed - sublink speed attribute
> >>>> + * @id: sublink speed attribute ID (SSID)
> >>>> + * @mantissa: lane speed mantissa
> >>>> + * @exponent: lane speed exponent
> >>>> + * @sublink type: sublink type
> >>>> + * @protocol: sublink protocol
> >>>> + *
> >>>> + * Super-speed-plus supports multiple lanes. Use the sublink speed attributes to
> >>>> + * describe the sublink speed.
> >>>> + *
> >>>> + * See USB 3.2 spec section 9.6.2.6 for super-speed-plus capability for more
> >>>> + * information.
> >>>> + */
> >>>> +struct usb_sublink_speed {
> >>>> +	u8				id;
> >>>> +	u16				mantissa;
> >>> You have to use the proper data types for crossing the user/kernel
> >>> boundry here.  That would be __u8 and __u16, right?
> >>>
> >>>> +	enum usb_lane_speed_exponent	exponent;
> >>>> +	enum usb_sublink_type		type;
> >>>> +	enum usb_link_protocol		protocol;
> >>> Are you _sure_ that an enum is the correct size for these fields?  How
> >>> can you guarantee this?  We do not use enums in this way for any other
> >>> field in this file for a reason...
> >>>
> >>> And did you look at the layout of this structure to verify it actually
> >>> matches what is on the wire with USB?  I think you need to add a packed
> >>> attribute to guarantee it.
> >> This struct is not intended to be packed to be sent over the bus. It's a
> >> simple struct for host and gadget driver use only. I intended to use
> >> enum to make it more clear not to be used that way. From your question,
> >> it's obviously not clear.
> > Then why are you putting it in this file?  This file is only for things
> > that are described in the USB spec that need to cross the user/kernel
> > boundry.
> 
> Ok, it seemed to fit here. I'll place it under /include/linux/usb.h then?

include/linux/usb/ch9.h perhaps?

> >> Otherwise, it may look something like this:
> >> struct usb_sublink_speed {
> >>           __u8    ssid:4;
> >>           __u8    lse:2;
> >>           __u8    st:2;
> >>           __u8    rsvd:6;
> >>           __u8    lp:2;
> > Are you sure those bit fields will work on big-endian systems?
> 
> No. Because of the way the bitfields are placed, it's a path to 
> unnecessary headache/bugs with boundary and endianness checks. That's 
> why I decided to go with the other solution.

That's good, but again, this is a uapi file, not a "normal" include file
in the kernel, you have to be careful about this.

greg k-h
