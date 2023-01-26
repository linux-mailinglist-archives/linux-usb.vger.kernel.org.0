Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57F1E67D670
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jan 2023 21:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231812AbjAZUbw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 15:31:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbjAZUbv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 15:31:51 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 9A5BC4DBF5
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 12:31:46 -0800 (PST)
Received: (qmail 276643 invoked by uid 1000); 26 Jan 2023 15:31:45 -0500
Date:   Thu, 26 Jan 2023 15:31:45 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Explicit status phase for DWC3
Message-ID: <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 26, 2023 at 07:31:34PM +0000, Thinh Nguyen wrote:
> On Thu, Jan 26, 2023, Dan Scally wrote:
> > Hi Thinh
> > 
> > On 26/01/2023 00:20, Thinh Nguyen wrote:
> > > On Tue, Jan 24, 2023, Dan Scally wrote:
> > > > Hi Thinh
> > > > 
> > > > 
> > > > I'm trying to update the DWC3 driver to allow the status phase of a
> > > > transaction to be explicit; meaning the gadget driver has the choice to
> > > > either Ack or Stall _after_ the data phase so that the contents of the data
> > > > phase can be validated. I thought that I should be able to achieve this by
> > > > preventing dwc3_ep0_xfernotready() from calling dwc3_ep0_do_control_status()
> > > > (relying on an "explicit_status" flag added to the usb_request to decide
> > > > whether or not to do so) and then calling it manually later once the data
> > > > phase was validated by the gadget driver (or indeed userspace). A very
> > > > barebones version of my attempt to do that looks like this:
> > > > 
> > > We shouldn't do this. At the protocol level, there must be better ways
> > > to do handshake than relying on protocol STALL _after_ the data stage.
> > > Note that not all controllers support this.
> > 
> > 
> > Maybe I'm misunderstanding, but isn't this how the USB spec expects it to
> > work? Reading "Reporting Status Results (8.5.3.1)" in the USB 2.0 spec for
> > the status stage in a control write it says "The function responds with
> > either a handshake or a zero-length data packet to indicate its current
> > status", and the handshake can be either STALL or NAK. If we can't do this,
> > how else can we indicate to the host that the data sent during a control out
> > transfer is in some way invalid?
> > 
> 
> My concern is from the documentation note[*] added from this commit:
> 579c2b46f74 ("USB Gadget: documentation update")

When the gadget subsystem was originally designed, it made no allowance 
for sending a STALL in the status stage.  The UDC drivers existing at 
that time would automatically send their own zero-length status packet 
when the control data was received.

Drivers written since then have copied that approach.  They had to, if 
they wanted to work with the existing gadget drivers.  So the end result 
is that fully supporting status stalls will require changing pretty much 
every UDC driver.

As for whether the UDC hardware has support...  I don't know.  Some of 
the earlier devices might not, but I expect that the more popular recent 
designs would provide a way to do it.

Alan Stern
