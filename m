Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 593426B0E20
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 17:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjCHQFu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 11:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjCHQFe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 11:05:34 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 88AE4457DB
        for <linux-usb@vger.kernel.org>; Wed,  8 Mar 2023 08:04:01 -0800 (PST)
Received: (qmail 494990 invoked by uid 1000); 8 Mar 2023 11:04:00 -0500
Date:   Wed, 8 Mar 2023 11:04:00 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [RFC PATCH 2/2] usb: core: hub: avoid reset hub during probe
Message-ID: <5c2c600b-7406-4944-9f59-bae65306e581@rowland.harvard.edu>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
 <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
 <72b4e199-4e23-487e-a9cd-8d41993d4944@rowland.harvard.edu>
 <dc7af7b0-1e63-6662-3465-a4ec79cc265d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7af7b0-1e63-6662-3465-a4ec79cc265d@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 08, 2023 at 01:54:15PM +0800, Linyu Yuan wrote:
> 
> On 3/4/2023 12:05 AM, Alan Stern wrote:
> > On Fri, Mar 03, 2023 at 05:28:38PM +0800, Linyu Yuan wrote:
> > > When start probe hub, during INIT, INTT2, INIT3 stage, when link state
> > > change to inactive, currently it will reset the device, maybe it will
> > > trigger warning in usb_submit_urb() due to urb->hcpriv is still active.
> > You need to explain this in much greater detail.
> > 
> > 	What will reset the device?
> > 
> > 	What is the code path for this reset?
> 
> will share more code path.
> 
> 
> > 
> > 	Why will urb->hcpriv still be active?
> 
> 
> still can't explain, that's why add patch#1 to get more urb infol
> 
> 
> > > Add a flag name init_stage to avoid reset the device.
> > Why do you want to avoid resetting the device?
> 
> 
> at INIT stage, external hub still under enumeration process, i think there
> is no need to reset.
> 
> 
> > 
> > Doesn't the reset code already include a check for whether the device is
> > disconnected?
> 
> 
> the problem is port is inactive state, but device still in software connect
> state,
> 
> there is no disconnect check in reset code.
> 
> 
> > 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> > > ---

> > > @@ -5699,7 +5716,8 @@ static void port_event(struct usb_hub *hub, int port1)
> > >   			dev_dbg(&port_dev->dev, "do warm reset, full device\n");
> > >   			usb_unlock_port(port_dev);
> > >   			usb_lock_device(udev);
> > > -			usb_reset_device(udev);
> > > +			if (!port_child_avoid_reset(udev))
> > > +				usb_reset_device(udev);
> > >   			usb_unlock_device(udev);
> > Doesn't usb_lock_device() already prevent this code from running during
> > the INIT, INIT2, and INIT3 stages of hub preparation?
> 
> 
> as it use some delay worker to complete the INIT stage, as i know it will
> not lock device
> 
> when worker is not start.
> 
> do you have any better suggestion about this point ?

I can't offer any suggestions because I don't understand the problem you 
want to fix, or how your patch is meant to work.

Alan Stern
