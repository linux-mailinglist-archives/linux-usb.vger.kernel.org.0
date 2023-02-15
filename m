Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2839269833E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Feb 2023 19:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbjBOSYj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Feb 2023 13:24:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBOSYi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Feb 2023 13:24:38 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id CA7B5F76F
        for <linux-usb@vger.kernel.org>; Wed, 15 Feb 2023 10:24:37 -0800 (PST)
Received: (qmail 990198 invoked by uid 1000); 15 Feb 2023 13:24:37 -0500
Date:   Wed, 15 Feb 2023 13:24:37 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Roger Quadros <rogerq@kernel.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: dwc3: gadget suspend/resume vs system suspend/resume
Message-ID: <Y+0jZScRX80mF8tS@rowland.harvard.edu>
References: <7e28eb10-f27b-682a-dfb3-fec3e70b01f6@kernel.org>
 <Y+z9NK6AyhvTQMir@rowland.harvard.edu>
 <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b530a74-0fb9-432b-b1d9-606a9694ce1e@kernel.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 15, 2023 at 07:29:52PM +0200, Roger Quadros wrote:
> I was more interested in this case where USB is suspended and then system suspends.
> Waking up the system on USB activity (while suspended) is taken care of by hardware.
> But I'm not sure if gadget driver will be up in time to respond to the request
> reasonably quickly. It would take a couple of seconds and is not hard time bound.
> Is this time mandated by the USB Spec or is it host implementation specific?

The USB spec doesn't say very much about it.  One part of the USB 2.0 
spec seems relevant; it says:

	9.2.6.2 Reset/Resume Recovery Time

	After a port is reset or resumed, the USB System Software is 
	expected to provide a “recovery” interval of 10 ms before the 
	device attached to the port is expected to respond to data 
	transfers. The device may ignore any data transfers during the 
	recovery interval.

	After the end of the recovery interval (measured from the end 
	of the reset or the end of the EOP at the end of the resume 
	signaling), the device must accept data transfers at any time.

Accepting a data transfer doesn't necessarily mean completing it, 
though.  The Linux USB core does send a request to a device 10 ms 
after resuming it, but the timeout period on this request is 5 seconds.  
This gives you some leeway.

Alan Stern
