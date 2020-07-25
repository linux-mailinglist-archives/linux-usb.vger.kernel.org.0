Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF0C22D69A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 12:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgGYKN1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 06:13:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:50134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbgGYKN1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Jul 2020 06:13:27 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F068A206D7;
        Sat, 25 Jul 2020 10:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595672006;
        bh=r8T2iq4wIaySUfq55B2rwgUFuxRnooCUrwPMe+L+YQk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M4aKV134GpdZXGxYOnW2XydKx1TnFrP4z9Ms2JiRx9hCigi52/TULfxoAHNBMhdd8
         rwVHQQA6r4OeleSkNxw1NNsvDs0DSN3WInmG5jcL+6kFvc7l3u0OXrDPWVJxru0VME
         P2QgeCNyW2Gt/uV2ogpqzuT6mEhCy5m/Jdi2uoV4=
Date:   Sat, 25 Jul 2020 12:13:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 03/12] usb: gadget: Expose sublink speed attributes
Message-ID: <20200725101326.GB1093846@kroah.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <500284ccf0353ee17a6bee8fa55011f801e17630.1595631457.git.thinhn@synopsys.com>
 <1595646889.23885.68.camel@mhfsdcap03>
 <d8539fd9-ffa6-824f-0347-71c73315d8a5@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8539fd9-ffa6-824f-0347-71c73315d8a5@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 03:33:39AM +0000, Thinh Nguyen wrote:
> Chunfeng Yun wrote:
> > On Fri, 2020-07-24 at 16:38 -0700, Thinh Nguyen wrote:
> >> The USB 3.2 specification supports dual-lane and different transfer
> >> rates for super-speed-plus. Devices operating in super-speed-plus can
> >> be gen2x1, gen1x2, or gen2x2.
> >>
> >> A gadget driver may need to know the gadget's sublink speeds to properly
> >> setup its transfer requests and describe its capability in its
> >> descriptors. To describe the transfer rate in super-speed-plus fully,
> >> let's expose the lane count and sublink speed attributes when operating
> >> in super-speed-plus.
> >>
> >> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >> ---
> >>   Changes in v3:
> >>   - None
> >>   Changes in v2:
> >>   - None
> >>
> >>   include/linux/usb/gadget.h | 20 ++++++++++++++++++++
> >>   1 file changed, 20 insertions(+)
> >>
> >> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> >> index 52ce1f6b8f83..bd982669609c 100644
> >> --- a/include/linux/usb/gadget.h
> >> +++ b/include/linux/usb/gadget.h
> >> @@ -339,6 +339,15 @@ struct usb_gadget_ops {
> >>    * @speed: Speed of current connection to USB host.
> >>    * @max_speed: Maximal speed the UDC can handle.  UDC must support this
> >>    *      and all slower speeds.
> >> + * @num_lanes: Number of lanes in use.
> >> + * @max_num_lanes: Maximum number of lanes the UDC supports.
> >> + * @ssac: Sublink speed attribute count. The number of sublink speed
> >> + *	attributes is ssac + 1.
> >> + * @sublink_speed: Array of sublink speed attributes the UDC supports. Sublink
> >> + *	speed attributes are paired, and an RX followed by a TX attribute.
> >> + * @speed_ssid: Current sublink speed attribute ID in use.
> >> + * @min_speed_ssid: Sublink speed attribute ID with the minimum speed.
> >> + * @max_speed_ssid: Sublink speed attribute ID with the maximum speed.
> >>    * @state: the state we are now (attached, suspended, configured, etc)
> >>    * @name: Identifies the controller hardware type.  Used in diagnostics
> >>    *	and sometimes configuration.
> >> @@ -406,6 +415,17 @@ struct usb_gadget {
> >>   	struct list_head		ep_list;	/* of usb_ep */
> >>   	enum usb_device_speed		speed;
> >>   	enum usb_device_speed		max_speed;
> >> +
> >> +	/* SSP only */
> >> +	unsigned			num_lanes;
> >> +	unsigned			max_num_lanes;
> >> +	unsigned			ssac;
> >> +#define USB_GADGET_MAX_SSAC 3
> >> +	struct usb_sublink_speed	sublink_speed[USB_GADGET_MAX_SSAC + 1];
> >> +	unsigned			speed_ssid;
> >> +	unsigned			min_speed_ssid;
> >> +	unsigned			max_speed_ssid;
> > checkpatch warning:
> >
> > WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
> 
> Yes, but I'd like to keep them consistent with the rest of the fields in 
> this structure.

No, do not do things that you know are wrong and will have to be cleaned
up in the future.  Unless you are trying to increase your patch count
for some reason, this is not ok.

thanks,

greg k-h
