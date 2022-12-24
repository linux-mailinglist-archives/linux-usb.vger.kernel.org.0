Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAA4655AAC
	for <lists+linux-usb@lfdr.de>; Sat, 24 Dec 2022 17:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbiLXQAa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Dec 2022 11:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiLXQA2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Dec 2022 11:00:28 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id BCD46DF38
        for <linux-usb@vger.kernel.org>; Sat, 24 Dec 2022 08:00:26 -0800 (PST)
Received: (qmail 177398 invoked by uid 1000); 24 Dec 2022 11:00:25 -0500
Date:   Sat, 24 Dec 2022 11:00:25 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Dmitrii Pasechnik <dima.pasechnik@cs.ox.ac.uk>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6ciGZ1D0Hcb6Uua@rowland.harvard.edu>
References: <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6Fc2Fz8w4KoX952@kroah.com>
 <Y6HLqYpxwT+v3BgX@hilbert>
 <Y6ITkWEb25Si4zts@rowland.harvard.edu>
 <35B854FE-1F32-47FD-8ED1-CDE033327531@cs.ox.ac.uk>
 <Y6TLJ94ubE4tOTev@rowland.harvard.edu>
 <Y6WmAXzpCd7Jj3rS@cs.ox.ac.uk>
 <Y6XAwjr96YKAMSt/@rowland.harvard.edu>
 <Y6Y8j9pvgevaKd1l@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Y8j9pvgevaKd1l@hilbert>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 23, 2022 at 11:41:03PM +0000, Dmitrii Pasechnik wrote:
> On Fri, Dec 23, 2022 at 09:52:50AM -0500, Alan Stern wrote:
> > On Fri, Dec 23, 2022 at 12:58:41PM +0000, Dmitrii Pasechnik wrote:
> > > On Thu, Dec 22, 2022 at 04:24:55PM -0500, Alan Stern wrote:
> > > > A bit off to the side from the main point of this thread, but...
> > > > 
> > > > On Thu, Dec 22, 2022 at 10:32:09AM +0000, Dima Pasechnik wrote:
> > > > > 
> > > > > 
> > > > > On 20 December 2022 19:57:05 WET, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > >> USB Interfaces: MSD, CDC, HID, WebUSB
> > > > > >
> > > > > >Which agrees with the information on the web site.  I have no idea what 
> > > > > >WebUSB is supposed to be.
> > > > > 
> > > > > WebUSB is a JavaScript API, supported by Chromium -derived browsers (Firefox not there yet)
> > > > > 
> > > > > https://en.wikipedia.org/wiki/WebUSB
> > > > 
> > > > The Wikipedia article agrees with you that WebUSB is a JavaScript API.  
> > > > As such, it is used for communication between web browsers and 
> > > > JavaScript programs.
> > > 
> > > No, it's used by browsers (which  run JavaScript code in them) to
> > > communicate with USB hardware. Or, if you like,
> > > standalone JavaScript programs to communicate with USB hardware. 
> > > Let me copy from the wiki here:
> > > 
> > > ---------------------------------
> > > A Universal Serial Bus, or a USB is an industry standard [...]
> > > WebUSB is a set of API calls that enable access to these hardware
> > > devices from web pages. WebUSB is developed by the World Wide Web
> > > Consortium(W3C).[1] The webUSB API provides a safe, and developer
> > > familiar means of communication to edges devices from web pages. The
> > > webUSB API integrates into existing USB libraries and shortens the
> > > development cycle for integrating new devices into the web environment
> > > by not needing to wait for browser support for these devices.
> > > 
> > > Early versions of webUSB came out around as an alternative to Flash,
> > > Chrome Serial, and other custom approaches to connecting browsers to
> > > hardware. WebUSB aims to solve the four goals of any interface being;
> > > fast to make, cross platform, look good, accessibility.
> > > 
> > > >  Not for communication between programs and USB 
> > > > devices.  So I don't understand why a USB device needs to be concerned 
> > > > about it.
> > > 
> > > I hope the above explains.
> > 
> > Actually, it's ambiguous.
> > 
> > The article says that WebUSB is an API used by JavaScript programs when 
> > they want to interact with a USB device.  Which means it is something 
> > that JavaScript programs can know about and interact with.  Fine.
> > 
> > But the article doesn't say what happens on the device's side of the 
> > conversation.  Does the WebUSB framework use some special messages when 
> > communicating with a USB device, so it will only work with devices which 
> > support WebUSB's protocol, or does it use plain ordinary USB messages 
> > which any USB device will support?
> > 
> > To put it another way, do USB devices need to have specialized firmware 
> > in order to be compatible with WebUSB, or will WebUSB work with all USB 
> > devices?  If the latter is true then why does the BBC micro:bit device 
> > have a special WebUSB interface?  Does the extra interface provide some 
> > sort of device-specific information which WebUSB can make use of but 
> > which isn't essential?
> 
> here is what I could find about the device side of WebUSB: https://web.dev/build-for-webusb/
> Basically, WebUSB support offers some extras, e.g. one can get a
> specific pop-up with a URL in it (supplied by the board) in the web browser as
> the device is plugged in the USB port.
> 
> Also, on the software side, this: https://developer.chrome.com/articles/usb/
> is more informative than the Wikipedia article.
> And here is how WebUSB-capable device is meant to talk ot the machine
> it's plugged in: https://wicg.github.io/webusb/#webusb-platform-capability-descriptor

Those are very helpful, thank you.

Interestingly, none of those documents mentions anything about having a 
special WebUSB interface in the configuration.  The WebUSB information 
on a device is accessed using standard or vendor-specific control 
messages with the device (not an interface) as recipient.  So the 
question of why the micro:bit has a WebUSB interface remains a 
mystery...

Alan Stern
