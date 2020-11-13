Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B32912B2138
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 18:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgKMRAQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 12:00:16 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49051 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725941AbgKMRAQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 12:00:16 -0500
Received: (qmail 326105 invoked by uid 1000); 13 Nov 2020 12:00:15 -0500
Date:   Fri, 13 Nov 2020 12:00:15 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "g@rowland.harvard.edu" <g@rowland.harvard.edu>,
        Kyungtae Kim <kt0755@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Message-ID: <20201113170015.GD322940@rowland.harvard.edu>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
 <20201111194710.GA245264@rowland.harvard.edu>
 <20201112090042.GA19895@b29397-desktop>
 <20201112155905.GB276702@rowland.harvard.edu>
 <20201113100229.GB21517@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113100229.GB21517@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 13, 2020 at 10:02:58AM +0000, Peter Chen wrote:
> On 20-11-12 10:59:05, Alan Stern wrote:
> > This is why I think we will need to change the API.  There has to be a 
> > way to tell usb_composite_setup_continue() which SETUP it is being 
> > called for.  A new SETUP or a disconnect should invalidate the old 
> > SETUP, and then usb_composite_setup_continue() would ignore any calls 
> > that were for the old SETUP packet.
> > 
> 
> I think usb_composite_setup_continue logic has no issue, we only need to
> consider if changing WARN to DBG is necessary, FuzzUSB seems to be
> trigger panic for WARN.

Yes, changing the WARN to DBG will make FuzzUSB happy.  But I still 
think there is a logical flaw in the design of the API.

> See below message on its trace log
> > Kernel panic - not syncing: panic_on_warn set ...
> 
> 
> For new SETUP, current composite layer makes sure the pending request
> will not get the status since the stage request is only queued when
> cdev->delayed_status is 1.
> 
> But the UDC driver should make sure no new
> request if old request has not finished, consider the corner case that
> the new SETUP comes after the pending request calls usb_composite_setup_continue
> and queues the status stage, then, the two zero-length packets from device
> will be the bus, but host only wants get one. Meanwhile, there is only one
> request for composite device (see: usb_composite_dev.req), it means the
> composite layer can't handle multiple ep0 request.

That's right.  Unfortunately, I think fixing this will require changes 
to the UDC drivers as well as to the composite core.  Similar to what I 
said earlier, there will have to be a way for the composite core to tell 
the UDC driver which SETUP packet the zero-length status reply is meant 
for.

> For disconnect event, it is an unexpected event between SETUP(DATA) stage
> and status stage, and usb_composite_setup_continue just does nothing
> since the bus has already not at configured state.

Yes.  But there still is another problem in the API.

Suppose the host sends a Set-Interface request, and the function driver 
is not able to handle it (maybe a memory allocation fails).  The gadget 
should report this failure to the host by STALLing ep0.  But there is no 
way for the function driver to tell the composite core that the failure 
occurred!

You can see this problem in f_mass_storage.c.  If do_set_interface() 
encounters an error, it will return a negative error code.  But the 
caller (handle_exception()) ignores the return code!

When Dave Brownell designed the Gadget and Composite APIs, he really did 
not give sufficient thought to the issues involved in delayed responses 
to control-OUT transfers.

Alan Stern
