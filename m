Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F326880AB
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 15:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232541AbjBBOxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 09:53:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjBBOwy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 09:52:54 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 972B659EF
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 06:52:37 -0800 (PST)
Received: (qmail 525724 invoked by uid 1000); 2 Feb 2023 09:52:36 -0500
Date:   Thu, 2 Feb 2023 09:52:36 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        rogerq@kernel.org
Subject: Re: Explicit status phase for DWC3
Message-ID: <Y9vONL8ZyQdEVkr0@rowland.harvard.edu>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
 <20230126235704.62d32y7y4sa4mmry@synopsys.com>
 <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43b077ad-c8cd-bb49-134d-1bd66bed0b84@ideasonboard.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 02, 2023 at 10:12:45AM +0000, Dan Scally wrote:
> (+CC roger as the author of the USB_GADGET_DELAYED_STATUS mechanism)
> 
> On 26/01/2023 23:57, Thinh Nguyen wrote:
> > We should already have this mechanism in place to do protocol STALL.
> > Please look into delayed_status and set halt.
> 
> 
> Thanks; I tried this by returning USB_GADGET_DELAYED_STATUS from the
> function's .setup() callback and later (after userspace checks the data
> packet) either calling usb_ep_queue() or usb_ep_set_halt() and it does seem
> to be working. This surprises me, as my understanding was that the purpose
> of USB_GADGET_DELAYED_STATUS  is to pause all control transfers including
> the data phase to give the function driver enough time to queue a request
> (and possibly only for specific requests). Regardless though I think the
> conclusion from previous discussions on this topic (see [1] for example) was
> that we don't want to rely on USB_GADGET_DELAYED_STATUS to do this which is
> why I had avoided it in the first place. A colleague made a series [2] some
> time ago that adds a flag to usb_request which function drivers can set when
> queuing the data phase request. UDC drivers then read that flag to decide
> whether to delay the status phase until after another usb_ep_queue(), and
> that's what I'm trying to implement here.
> 
> 
> [1] https://lkml.org/lkml/2018/10/10/138
> 
> [2] https://patchwork.kernel.org/project/linux-usb/patch/20190124030228.19840-5-paul.elder@ideasonboard.com/

I'm in favor of the explicit_status approach from [2].  In fact, there 
was a whole series of patches impementing this, and I don't think any of 
them were merged.

Keep in mind that there are two separate issues here:

	Status/data stage for a control-IN or 0-length control-OUT
	transfer.

	Status stage for a non-0-length control-OUT transfer.

The USB_GADGET_DELAYED_STATUS mechanism was meant to help with the 
first, not the second.  explicit_status was meant to help with the 
second; it may be able to help with both.

Alan Stern
