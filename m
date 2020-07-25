Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D4422D6F8
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 13:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgGYLGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 07:06:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgGYLGp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 25 Jul 2020 07:06:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6107C206C1;
        Sat, 25 Jul 2020 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595675205;
        bh=24v9RnZwcgbbuaiHgxO43HazWz+grgtjMtf80yooINE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xGfB/e0NqEC+IdSoO3OWWOBiEc9GFtn1PAZgv4NVFVnWnr8+u6Hsx55Ud293o6Fre
         sUnvwigmvgl2HEIiay0juP+8C9iWfxVkocjPBUYb8aL2mL2xq82D8n31KtWhdvE42R
         uUdLHaCLkaA5iyOjtuhWgNJZpztsGT1rV3elygZU=
Date:   Sat, 25 Jul 2020 13:06:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Message-ID: <20200725110641.GB396778@kroah.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
 <20200725101235.GA1093846@kroah.com>
 <4c6bba0f-71fe-e96b-2be1-8177be2701da@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c6bba0f-71fe-e96b-2be1-8177be2701da@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 25, 2020 at 10:51:07AM +0000, Thinh Nguyen wrote:
> Greg Kroah-Hartman wrote:
> > On Fri, Jul 24, 2020 at 04:39:11PM -0700, Thinh Nguyen wrote:
> >> Add a new common function to parse maximum_speed property string for
> >> the specified number of lanes and transfer rate.
> >>
> >> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
> >> ---
> >> Changes in v3:
> >> - Add new function to parse "maximum-speed" for lanes and transfer rate
> >> - Remove separate functions getting num_lanes and transfer rate properties
> > No, why have you split this into a single function that for some reason
> > "can not fail"?
> 
> This patch was updated to read from a single property "maximum-speed" to 
> get the device speed, gen, and number of lanes. So we use a single 
> function to parse this property.
> 
> This came up from on Rob's comments:
> https://lore.kernel.org/linux-usb/f68f395c-0821-9e34-f6cf-75fa60c9a35b@synopsys.com/T/#mac3a4d0b1c02866e3bdbd6809506fbbee8bf84c2
> 
> https://lore.kernel.org/linux-usb/0818e876-ea5b-9ebc-7427-8e26b627e6b4@synopsys.com/T/#m87191333cb10a7f0caaf533bfa198724d33c2519
> 
> 
> >
> >> Changes in v2:
> >> - New commit
> >>
> >>   drivers/usb/common/common.c | 47 ++++++++++++++++++++++++++++++++++++++++++---
> >>   include/linux/usb/ch9.h     | 25 ++++++++++++++++++++++++
> >>   2 files changed, 69 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/usb/common/common.c b/drivers/usb/common/common.c
> >> index 1433260d99b4..53b4950c49e4 100644
> >> --- a/drivers/usb/common/common.c
> >> +++ b/drivers/usb/common/common.c
> >> @@ -77,18 +77,59 @@ const char *usb_speed_string(enum usb_device_speed speed)
> >>   }
> >>   EXPORT_SYMBOL_GPL(usb_speed_string);
> >>   
> >> -enum usb_device_speed usb_get_maximum_speed(struct device *dev)
> >> +void usb_get_maximum_speed_and_num_lanes(struct device *dev,
> >> +					 enum usb_device_speed *speed,
> >> +					 enum usb_phy_gen *gen,
> >> +					 u8 *num_lanes)
> > What is wrong with just having multiple different functions instead?
> 
> See my comment above.
> 
> 
> >
> >>   {
> >>   	const char *maximum_speed;
> >> +	enum usb_device_speed matched_speed = USB_SPEED_UNKNOWN;
> >> +	enum usb_phy_gen matched_gen = USB_PHY_GEN_UNKNOWN;
> >> +	u8 matched_num_lanes = 0;
> >>   	int ret;
> >>   
> >>   	ret = device_property_read_string(dev, "maximum-speed", &maximum_speed);
> >>   	if (ret < 0)
> >> -		return USB_SPEED_UNKNOWN;
> >> +		goto done;
> >>   
> >>   	ret = match_string(speed_names, ARRAY_SIZE(speed_names), maximum_speed);
> >> +	if (ret >= 0) {
> >> +		matched_speed = ret;
> >> +		goto done;
> >> +	}
> >> +
> >> +	if (strncmp("super-speed-plus-gen2x2", maximum_speed, 23) == 0) {
> >> +		matched_speed = USB_SPEED_SUPER_PLUS;
> >> +		matched_gen = USB_PHY_GEN_2;
> >> +		matched_num_lanes = 2;
> >> +	} else if (strncmp("super-speed-plus-gen2x1", maximum_speed, 23) == 0) {
> >> +		matched_speed = USB_SPEED_SUPER_PLUS;
> >> +		matched_gen = USB_PHY_GEN_2;
> >> +		matched_num_lanes = 1;
> >> +	} else if (strncmp("super-speed-plus-gen1x2", maximum_speed, 23) == 0) {
> > Where are all of these device properties documented?
> 
> It's coming from a single property "maximum-speed", documented in patch 
> 6/12  "usb: devicetree: Include USB SSP Gen X x Y"
> 
> https://lore.kernel.org/linux-usb/3bc4fb6a0d7c1a9ea4d5d9384ade26c9066c87d0.1595631457.git.thinhn@synopsys.com/T/#u
> 
> >
> >
> >
> >> +		matched_speed = USB_SPEED_SUPER_PLUS;
> >> +		matched_gen = USB_PHY_GEN_1;
> >> +		matched_num_lanes = 2;
> >> +	}
> >> +
> >> +done:
> >> +	if (speed)
> >> +		*speed = matched_speed;
> >> +
> >> +	if (num_lanes)
> >> +		*num_lanes = matched_num_lanes;
> >> +
> >> +	if (gen)
> >> +		*gen = matched_gen;
> >
> >
> >> +}
> >> +EXPORT_SYMBOL_GPL(usb_get_maximum_speed_and_num_lanes);
> >> +
> >> +enum usb_device_speed usb_get_maximum_speed(struct device *dev)
> >> +{
> >> +	enum usb_device_speed speed;
> >>   
> >> -	return (ret < 0) ? USB_SPEED_UNKNOWN : ret;
> >> +	usb_get_maximum_speed_and_num_lanes(dev, &speed, NULL, NULL);
> > Here's an example of why this isn't a good function.
> >
> > It isn't self-describing.  Why do you pass in 3 pointers yet the name
> > only contains 2 things?
> 
> Right... I can revise.
> 
> >
> > usb_get_maximum_speed_and_num_lanes_and_generation() shows that this is
> > not a good thing, right?
> >
> > Again, 3 different functions please.
> 
> Should we have 3 separate properties to describe the device? If so, this 
> was done in v2 of this series, but Rob has different ideas. Please advise.

I don't care about the properties, that should be independant of the
function call made to determine this information.  Don't let the data
formats force you to write horrible code :)

thanks,

greg k-h
