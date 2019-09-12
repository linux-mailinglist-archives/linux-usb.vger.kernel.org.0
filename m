Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 134D8B111E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 16:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732595AbfILO2w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 10:28:52 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48612 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1732512AbfILO2w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Sep 2019 10:28:52 -0400
Received: (qmail 2866 invoked by uid 2102); 12 Sep 2019 10:28:51 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Sep 2019 10:28:51 -0400
Date:   Thu, 12 Sep 2019 10:28:51 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Allen Blaylock <AllenB@epiloglaser.com>
cc:     Manu Gautam <mgautam@codeaurora.org>,
        Peter Chen <peter.chen@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET with hub and PCIe root hub
In-Reply-To: <Pine.LNX.4.44L0.1909121008160.1440-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1909121023190.1440-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 12 Sep 2019, Alan Stern wrote:

> On Wed, 11 Sep 2019, Allen Blaylock wrote:
> 
> > So I do see the PORT_TEST SetFeature Request and Response when I use tcpdump to
> > make a capture using usbmon. Unfortunately I am not as familiar with the raw
> > usbmon output or some of the diagnostics output by usbmon so I may be missing 
> > something. Here is a capture from the sysfs usbmon file:
> > 
> > a52efe00 268933702 C Ii:002:01 0 1 = 08
> > a52efe00 268933736 S Ii:002:01 -115 1 <
> > a546b700 268934005 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546b700 268934303 C Ci:002:00 0 4 = 01010100
> > a546b700 268934327 S Co:002:00 s 23 01 0010 0003 0000 0
> > a546b700 268934384 C Co:002:00 0 0
> > a546b700 268934438 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546b700 268934520 C Ci:002:00 0 4 = 01010000
> > a546b700 268980085 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546b700 268980332 C Ci:002:00 0 4 = 01010000
> > a546b700 269030091 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546b700 269030333 C Ci:002:00 0 4 = 01010000
> > a546b700 269080082 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546b700 269080335 C Ci:002:00 0 4 = 01010000
> > a546b280 269130094 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546b280 269130339 C Ci:002:00 0 4 = 01010000
> > a546b280 269130376 S Co:002:00 s 23 03 0004 0003 0000 0
> > a546b280 269130577 C Co:002:00 0 0
> > a546be00 269160091 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546be00 269160344 C Ci:002:00 0 4 = 03051000
> > a546be00 269160361 S Co:002:00 s 23 01 0014 0003 0000 0
> > a546be00 269160416 C Co:002:00 0 0
> > a546be00 269230118 S Ci:000:00 s 80 06 0100 0000 0040 64 <
> > a546be00 269230341 C Ci:000:00 0 18 = 12010002 00000040 0a1a0401 00010102 0301
> > a546be00 269230358 S Co:002:00 s 23 03 0004 0003 0000 0
> > a546be00 269230425 C Co:002:00 0 0
> > a546be00 269260104 S Ci:002:00 s a3 00 0000 0003 0004 4 <
> > a546be00 269260354 C Ci:002:00 0 4 = 03051000
> > a546be00 269260374 S Co:002:00 s 23 01 0014 0003 0000 0
> > a546be00 269260430 C Co:002:00 0 0
> > a546be00 269330097 S Co:000:00 s 00 05 0004 0000 0000 0
> > a546be00 269330372 C Co:000:00 0 0
> > a546b700 269380050 S Ci:004:00 s 80 06 0100 0000 0012 18 <
> > a546b700 269380327 C Ci:004:00 0 18 = 12010002 00000040 0a1a0401 00010102 0301
> > a546b700 269380360 S Ci:004:00 s 80 06 0200 0000 0009 9 <
> > a546b700 269380453 C Ci:004:00 0 9 = 09022e00 01010080 32
> > a546b700 269380468 S Ci:004:00 s 80 06 0200 0000 002e 46 <
> > a546b700 269380574 C Ci:004:00 0 46 = 09022e00 01010080 32090400 0004ff00 00000705 02020002 00070504 02000200
> > a546b700 269380608 S Ci:004:00 s 80 06 0300 0000 00ff 255 <
> > a546b700 269380701 C Ci:004:00 0 4 = 04030904
> > a546b700 269380717 S Ci:004:00 s 80 06 0302 0409 00ff 255 <
> > a546b700 269380824 C Ci:004:00 0 34 = 22035500 53004200 20004500 48004f00 53005400 20005400 45005300 54004500
> > a546b700 269380845 S Ci:004:00 s 80 06 0301 0409 00ff 255 <
> > a546b700 269380949 C Ci:004:00 0 34 = 22035500 53004200 20004500 48004f00 53005400 20005400 45005300 54004500
> > a546b700 269380968 S Ci:004:00 s 80 06 0303 0409 00ff 255 <
> > a546b700 269381074 C Ci:004:00 0 10 = 0a034900 4f005600 3300
> > a546b280 269381564 S Co:004:00 s 00 09 0001 0000 0000 0
> > a546b280 269381704 C Co:004:00 0 0
> > a560a000 269407637 S Co:002:00 s 23 03 0015 0403 0000 0
> > a560a000 269407869 C Co:002:00 -32 0
> > 
> > I was unable to make sense of it with the help of the usbmon.txt documentation
> > and will need some more time using wireshark and the output of tcpdump to get 
> > familiar with decoding the raw usbmon output.
> 
> Most of the usbmon output shows that a device was attached to port 3 of
> hub 2 and enumerated as usual over the course of about half a second.  
> 
> The very last two lines show the computer sending the hub a
> Set-Port-Test request on port 3 for test mode 4, which is Test Packet.  
> The hub's response is a STALL, indicating that the hub doesn't
> understand or doesn't implement this request.

I should add that the USB 2.0 spec includes the following text (from
section 11.24.2.13):

	Test mode of a downstream facing port can only be used in
	a well defined sequence of hub states. This sequence is
	defined as follows:

	1)  All enabled downstream facing ports of the hub containing
	    the port to be tested must be (selectively) suspended via 
	    the SetPortFeature(PORT_SUSPEND) request.  Each downstream 
	    facing port of the hub must be in the disabled, 
	    disconnected, or suspended state (see Figure 11-9).

So you can see the hub probably failed the request because a
non-suspended device was connected to port 3.  (And who knows what was 
attached to the other ports -- the usbmon trace doesn't say.)

Alan Stern

