Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F1F2B4A34
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 17:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730709AbgKPQA4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 11:00:56 -0500
Received: from netrider.rowland.org ([192.131.102.5]:57447 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730176AbgKPQAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 11:00:55 -0500
Received: (qmail 438375 invoked by uid 1000); 16 Nov 2020 11:00:53 -0500
Date:   Mon, 16 Nov 2020 11:00:53 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "g@rowland.harvard.edu" <g@rowland.harvard.edu>,
        Kyungtae Kim <kt0755@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Message-ID: <20201116160053.GB436089@rowland.harvard.edu>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
 <20201111194710.GA245264@rowland.harvard.edu>
 <20201112090042.GA19895@b29397-desktop>
 <20201112155905.GB276702@rowland.harvard.edu>
 <20201113100229.GB21517@b29397-desktop>
 <20201113170015.GD322940@rowland.harvard.edu>
 <20201116100152.GA28313@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116100152.GA28313@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 16, 2020 at 10:02:22AM +0000, Peter Chen wrote:
> On 20-11-13 12:00:15, Alan Stern wrote:
> > That's right.  Unfortunately, I think fixing this will require changes 
> > to the UDC drivers as well as to the composite core.  Similar to what I 
> > said earlier, there will have to be a way for the composite core to tell 
> > the UDC driver which SETUP packet the zero-length status reply is meant 
> > for.
> 
> It needs the composite layer to support multiple requests for EP0, the
> effort is big. It is better the real problem is reported, then, it has
> environment to test the solution. The reported FuzzUSB issue is not this issue.

WE don't really need to support multiple ep0 requests.  We just need to 
know whether a particular response was meant for the most recent 
ep0 transfer or for an earlier one.

For example, the UDC driver could keep a counter of SETUP packets, and 
it could pass this counter to the composite core's setup routine.  The 
status reply request could include the corresponding counter value, and 
the UDC driver could then ignore replies that are not meant for the most 
recent SETUP.

Of course, this would be a big API change, affecting all UDC and gadget 
drivers.  Maybe you can think of a better way to fix the problem.

> > Suppose the host sends a Set-Interface request, and the function driver 
> > is not able to handle it (maybe a memory allocation fails).  The gadget 
> > should report this failure to the host by STALLing ep0.  But there is no 
> > way for the function driver to tell the composite core that the failure 
> > occurred!
> > 
> > You can see this problem in f_mass_storage.c.  If do_set_interface() 
> > encounters an error, it will return a negative error code.  But the 
> > caller (handle_exception()) ignores the return code!
> > 
> > When Dave Brownell designed the Gadget and Composite APIs, he really did 
> > not give sufficient thought to the issues involved in delayed responses 
> > to control-OUT transfers.
> > 
> 
> We could add one parameter for usb_composite_setup_continue to indicate
> error occurred during function's deferred operation, and stall the ep0
> at usb_composite_setup_continue, do you think so?

That would work only if the function driver also had a way to tell the 
composite core which control transfer failed.

The basic problem is the race between a control status response and 
arrival of a new SETUP packet.  This race exists between the UDC driver 
and the gadget driver (that is, the composiste core), and between the 
composite core and the function drivers.

Alan Stern
