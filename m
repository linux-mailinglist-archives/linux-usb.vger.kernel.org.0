Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 647BB697FBC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 16:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjBOPlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 10:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbjBOPlm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 10:41:42 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3FF6D39CEB
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 07:41:41 -0800 (PST)
Received: (qmail 985086 invoked by uid 1000); 15 Feb 2023 10:41:40 -0500
Date:   Wed, 15 Feb 2023 10:41:40 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Message-ID: <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 11:40:15AM +0200, Roger Quadros wrote:
> Hi Thinh,
> 
> Currently dwc3 gadget disconnects from the bus in the system suspend 
> path. i.e. dwc3_gadget_suspend()->dwc3_disconnect_gadget().
> 
> Is it reasonable to expect dwc3 gadget to do a USB suspend instead of 
> a USB disconnect during system suspend?

Gadgets can't initiate a USB suspend.  Only the host can.

Did you mean to ask the opposite question?  I.e., is it reasonable for a 
dwc3 gadget to go into system suspend when it gets a USB suspend?

In general, it's easiest for gadgets to disconnect from the USB bus when 
their system suspends, if they aren't already in USB suspend.  This is 
because they would be unable to respond to requests from the host while 
sleeping.

> At USB resume, system can wake up and resume and then dwc3 gadget can 
> resume.
> 
> I'd like to know your opinion please if this is a reasonable 
> expectation or something just not possible to achieve. Thanks!

There can be exceptions, but it's a dicey thing.  The UDC hardware would 
have to be able to send handshake packets back to the host while 
remaining in low power, it would have to be able to generate a wakeup 
signal to bring its system back to full power, and the system would have 
to be able to resume in time for the gadget to respond to a request from 
the host before the request times out.

The situation is different if the gadget is already in USB suspend.  
Then it only needs to be able to wake up its system when it gets a USB 
resume signal.  But the system would still have to wake up reasonably 
quickly.

Alan Stern
