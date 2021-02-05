Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712DA31052D
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 07:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbhBEGun (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 01:50:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:56366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231217AbhBEGu0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 01:50:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B0C264F40;
        Fri,  5 Feb 2021 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612507785;
        bh=s85dMwg+GO6SbZVBIHATXUrRp+nKovYwFl5YC4obN9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gEgsAkhGsu6SaEmKA++mwd6xrZVfSp15QJc2LBNSA2M1u9csK/V8rXHqc1S1LPupI
         VNsnxeuRbYTI6vO8R2F+twayWInOVVHRIipETzJvJHWf8KHGF79BZV554Lm40+7QWe
         AAfrI8tud6RssdMs1ZsEnzHtImJR42eZs9mzQ2tQ=
Date:   Fri, 5 Feb 2021 07:49:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v7 0/6] usb: Support USB 3.2 multi-lanes
Message-ID: <YBzqhlNeKf+lgA+8@kroah.com>
References: <cover.1611106162.git.Thinh.Nguyen@synopsys.com>
 <04cc67bd-29b0-91d7-6144-a3f4dc6661f9@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04cc67bd-29b0-91d7-6144-a3f4dc6661f9@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 05, 2021 at 02:39:41AM +0000, Thinh Nguyen wrote:
> Hi Felipe, Greg,
> 
> Thinh Nguyen wrote:
> > A USB SuperSpeed Plus device may operate at different speed and lane count
> > (i.e. gen2x2, gen1x2, or gen2x1). The DWC_usb32 IP supports SuperSpeed Plus
> > gen2x2. To support this, this series update a few things to the USB gadget
> > stack and dwc3 driver:
> >
> > * Accept and parse new maximum_speed devicetree property strings
> > * Introduce enum usb_ssp_rate to describe the speed in SuperSpeed Plus genXxY
> > * Capture the connected and max supported usb_ssp_rate
> > * Report the device sublink speeds base on the usb_ssp_rate in the BOS
> >   descriptor
> > * Introduce gadget ops to select SuperSpeed Plus various transfer rate and lane
> >   count
> > * Update dwc3 driver to support the above changes
> >
> > Changes in v7:
> >  - Greg picked up the first few patches of the series to his usb-testing
> >    branch. Rebase the remaining patches on Greg's usb-testing branch
> >
> > Changes in v6:
> >  - Rebase on Greg's usb-testing branch
> >  - Update cover letter and title since there are many updates
> >    * Previous version 5: https://lore.kernel.org/linux-usb/cover.1601001199.git.Thinh.Nguyen@synopsys.com/
> >  - To simplify things, use usb_ssp_rate enum to specify the signaling rate
> >    generation and lane count instead of separately tracking them.
> >  - Convert the sublink speed attributes to macros and move it to uapi
> >  - Remove usb_sublink_speed struct
> >  - Remove "usb: dwc3: gadget: Report sublink speed capability"
> >  - Update dwc3 to support the new changes
> >
> > Changes in v5:
> >  - Rebase on Felipe's testing/next branch
> >  - Changed Signed-off-by email to match From: email header
> >  - Add Rob's Reviewed-by
> >
> > Changes in v4:
> >  - Instead of using a single function to parse "maximum-speed" property for
> >    speed, gen X, and number of lanes, split those tasks to separate common
> >    functions
> >  - Revise DWC3 driver to use those new common functions
> >  - Fix checkpatch warnings for using "unsigned" rather than "unsigned int" and
> >    missing identifier name in udc_set_num_lanes_and_speed gadget ops
> >
> > Changes in v3:
> >  - Remove "num-lanes" and "lane-speed-mantissa-gbps" common properties
> >  - Remove "num-lanes" and "lane-speed-mantissa-gbps" properties validation in dwc3
> >  - Update "maximum-speed" to support variations of SSP Gen X x Y
> >  - Update common function to parse new strings for "maximum-speed"
> >  - Update commit messages for the new changes
> >
> > Changes in v2:
> >  - Move usb_sublink_speed attribute struct and enum to include/linux/usb/ch9.h
> >  - Use "num-lanes" and "lane-speed-mantissa-gbps" as common properties instead
> >  - Add common functions to get num-lanes and lsm properties
> >  - Fix missing gen1x2 sublink speed attribute check report in dwc3
> >
> >
> > Thinh Nguyen (6):
> >   dt-binding: usb: Include USB SSP rates in GenXxY
> >   usb: common: Parse for USB SSP genXxY
> >   usb: dwc3: core: Check maximum_speed SSP genXxY
> >   usb: dwc3: gadget: Implement setting of SSP rate
> >   usb: dwc3: gadget: Track connected SSP rate and lane count
> >   usb: dwc3: gadget: Set speed only up to the max supported
> >
> >  .../devicetree/bindings/usb/usb.yaml          |  3 +
> >  drivers/usb/common/common.c                   | 26 +++++-
> >  drivers/usb/dwc3/core.c                       | 37 +++++++++
> >  drivers/usb/dwc3/core.h                       |  9 +++
> >  drivers/usb/dwc3/gadget.c                     | 80 ++++++++++++++++++-
> >  include/linux/usb/ch9.h                       | 11 +++
> >  6 files changed, 162 insertions(+), 4 deletions(-)
> >
> >
> > base-commit: 7a79f1f7f7e75e532c5a803ab3ebf42a3e79497c
> 
> Let me know if there's any issue with these remaining patches. It'd be
> great if they can go on the "next" branch at some point.

I was waiting for Rob's review of the dt changes...
