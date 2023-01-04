Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8F365DCF6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 20:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235015AbjADTj4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 14:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235270AbjADTjx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 14:39:53 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E4D5C1DDE5
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 11:39:52 -0800 (PST)
Received: (qmail 479192 invoked by uid 1000); 4 Jan 2023 14:39:51 -0500
Date:   Wed, 4 Jan 2023 14:39:51 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <Y7XWB0GzEL5cv6lM@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
 <20230104164900.31a3243d@meshulam.tesarici.cz>
 <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
 <20230104174731.5527b1ed@meshulam.tesarici.cz>
 <Y7WxltobCK0zQz9k@rowland.harvard.edu>
 <20230104182750.1529bd78@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104182750.1529bd78@meshulam.tesarici.cz>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 06:27:50PM +0100, Petr Tesařík wrote:
> On Wed, 4 Jan 2023 12:04:22 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> > At this point the host sends a Get-Device-Status request to the device 
> > (not shown in the log).
> > 
> >  [...]  
> > 
> > The fact that the host is retrying means that the status request got an 
> > error.  Unfortunately the log message doesn't say sort of error 
> > occurred.
> 
> OK, I see. The URB indicates success, but there is no data:
> 
> 45	0.432232	host	1.50.0	USB	64	GET STATUS Request
> 46	0.432659	1.50.0	host	USB	64	GET STATUS Response
> 
> Frame 46: 64 bytes on wire (512 bits), 64 bytes captured (512 bits) on interface usbmon1, id 0
> USB URB
>     [Source: 1.50.0]
>     [Destination: host]
>     URB id: 0xffff98b4383c8d80
>     URB type: URB_COMPLETE ('C')
>     URB transfer type: URB_CONTROL (0x02)
>     Endpoint: 0x80, Direction: IN
>     Device: 50
>     URB bus id: 1
>     Device setup request: not relevant ('-')
>     Data: present ('\0')
>     URB sec: 1672851450
>     URB usec: 569060
>     URB status: Success (0)
>     URB length [bytes]: 0
>     Data length [bytes]: 0
> -------------------------^
> This should be 2, and the device should send a 16-bit status word. Hm.
> 
>     [Request in: 45]
>     [Time from request: 0.000427000 seconds]
>     Unused Setup Header
>     Interval: 0
>     Start frame: 0
>     Copy of Transfer Flags: 0x00000200, Dir IN
>     Number of ISO descriptors: 0
> 
> While I do agree that the Samsung phone download mode USB stack
> implementation is crappy, multiple models and many users are affected. I
> wonder what would be a sensible workaround in heimdall and/or libusb...
> 
> Setting a global module parameter does not sound great.

Another option would be to create a short udev script that would write 
"on" to the power/control attribute file (thereby turning autosuspend 
off) whenever it sees a new USB device with the vendor and product IDs 
of your phone.  That seems like a very practical solution.

Alan Stern
