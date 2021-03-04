Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06EDF32D7EB
	for <lists+linux-usb@lfdr.de>; Thu,  4 Mar 2021 17:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238253AbhCDQfA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Mar 2021 11:35:00 -0500
Received: from netrider.rowland.org ([192.131.102.5]:35473 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S238076AbhCDQea (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Mar 2021 11:34:30 -0500
Received: (qmail 1615618 invoked by uid 1000); 4 Mar 2021 11:33:49 -0500
Date:   Thu, 4 Mar 2021 11:33:49 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Yiyu Zhu <danielzeltar@gmail.com>, Greg KH <greg@kroah.com>,
        linux-usb@vger.kernel.org
Subject: Re: kworker takes 100% core after unplugging usb c hub
Message-ID: <20210304163349.GC1612307@rowland.harvard.edu>
References: <CAGv7gkgb12vGPvZcSE0aVOpu32zSgxaayYreLvWs+vJc5EkQrA@mail.gmail.com>
 <YCTS9I5xTVBDvwax@kroah.com>
 <CAGv7gkjoNt9gx_VPfEj=tauKAOcnOd+-2pCXyCoR=GPcHj7jxw@mail.gmail.com>
 <YCUI0h7qkY2PuJcT@kroah.com>
 <CAGv7gki7J1NVX3ti6Qhe9AFLp0JYRTRsT35zpDBTxxQ=te7-sQ@mail.gmail.com>
 <b4ae0847-23a2-c3e3-3ef2-17efdfc792ba@linux.intel.com>
 <CAGv7gkgLVTvBaGTUFd00daN0PBoqj2MbFk0dwnWKRL2odzD-8g@mail.gmail.com>
 <5d3c5b2d-4752-7253-66f3-945c06f8a980@linux.intel.com>
 <CAGv7gkigBrghpO9gETuGBLf=Go3RCA4dU6Z4NRjfTMLUn-Cxgw@mail.gmail.com>
 <546b9137-3054-4cb3-b085-e0ea32885e8a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <546b9137-3054-4cb3-b085-e0ea32885e8a@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 04, 2021 at 06:31:47PM +0200, Mathias Nyman wrote:
> Hi
> 
> On 2.3.2021 8.25, Yiyu Zhu wrote:
> > Hi Mathias,
> > 
> > I did not set the correct printk value. Here is a recent dmesg showing
> > the hub connection and disconnection on Linux 5.11.0.
> > 
> ...
> > [ 1662.620564] usb usb3: usb wakeup-resume
> > [ 1662.620570] usb usb3: usb auto-resume
> > [ 1662.620585] hub 3-0:1.0: hub_resume
> > [ 1662.620607] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
> > [ 1662.620637] usb usb3-port1: over-current change #1
> > [ 1662.724578] hub 3-0:1.0: trying to enable port power on non-switchable hub
> > [ 1662.832221] usb usb3-port1: over-current condition
> > [ 1662.832237] usb usb3-port1: status 0008, change 0008, 12 Mb/s
> > [ 1662.832262] hub 3-0:1.0: state 7 ports 2 chg 0000 evt 0000
> > [ 1662.832277] hub 3-0:1.0: hub_suspend
> > [ 1662.832297] usb usb3: bus auto-suspend, wakeup 1
> > [ 1662.832307] usb usb3: bus suspend fail, err -16
> > [ 1662.832313] hub 3-0:1.0: hub_resume
> > [ 1662.832344] hub 3-0:1.0: state 7 ports 2 chg 0002 evt 0000
> > [ 1662.832363] usb usb3-port1: status 0008, change 0000, 12 Mb/s
> > [ 1662.832375] hub 3-0:1.0: hub_suspend
> > [ 1662.832388] usb usb3: bus auto-suspend, wakeup 1
> > [ 1662.832397] usb usb3: bus suspend fail, err -16
> > [ 1662.832402] hub 3-0:1.0: hub_resume
> (removed some messages from other buses from above snippet)
> 
> Looks like the suspend/resume loop is triggered by an over-current event.
> hub wq notices there is a over-current change, and an over-current status (two separate bits)
> hub wq clears the change bit, tries to resolve the over-current, fails, and continues.
> 
> This hub (roothub) has no other children or activity so it runtime suspends.
> After this the bus tries to suspend, but it fails as xhci bus_suspend() 
> returns -EBUSY if a port is in over-current state.
> 
> Hub is woken up. hub wq runs, this time there is no over-current change
> bit set as it was cleared earlier. The over-current status is still active. 
> Hub wq doesn't see any activity, hub is suspended -> try to suspend bus -> fail...
> 
> Solution is still unclear, maybe hub wq should react to over-current states,
> not just changes?

Your analysis seems to point to a hardware problem.  If nothing is 
plugged into the root hub, it should not report an over-current state.

Alan Stern
