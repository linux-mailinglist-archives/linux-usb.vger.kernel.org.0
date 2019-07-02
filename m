Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EEBF5D609
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 20:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfGBSUx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 14:20:53 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:52562 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGBSUx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 14:20:53 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62IKoRi010097;
        Tue, 2 Jul 2019 13:20:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562091650;
        bh=AX4MIz+VbdQTADGMbcF/Lpq+TtlpwtcPafUk+bqzh9Y=;
        h=Date:From:To:Subject:References:In-Reply-To;
        b=Ntf8SkzZjlvN8NcIRk7FTC1p0uf66jYeKUEL3emK/v6fdV5U2mJMpjVMMHHo8mGD/
         jh/V4Auioss0IDU8tQfOqSanGaJ+a5eM3W9YTIV86AMz8UxXfViHGTjZvepJ8hcx0u
         NDjh8muMpsNZV542UlHGy/etgWsYBq8ZtZp3bbkY=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62IKo3w005378
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jul 2019 13:20:50 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 13:20:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 13:20:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62IKoGT021147;
        Tue, 2 Jul 2019 13:20:50 -0500
Date:   Tue, 2 Jul 2019 13:20:50 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Jack Pham <jackp@codeaurora.org>, <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: configfs on dwc3: msc enum failed if three functions defined
Message-ID: <20190702182050.GB20724@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Jack Pham <jackp@codeaurora.org>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <20190422134357.GA2071@uda0271908>
 <20190425224456.GA27553@jackp-linux.qualcomm.com>
 <20190702144842.GA20724@uda0271908>
 <20190702165122.GA15112@jackp-linux.qualcomm.com>
 <20190702175013.GB2724@uda0271908>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190702175013.GB2724@uda0271908>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 02, 2019 at 12:50:13PM -0500, Bin Liu wrote:
> On Tue, Jul 02, 2019 at 09:51:22AM -0700, Jack Pham wrote:
> > Hi Bin,
> > 
> > On Tue, Jul 02, 2019 at 09:48:42AM -0500, Bin Liu wrote:
> > > Hi,
> > > 
> > > Sorry for the delay getting back on this. I was offline for quite some
> > > time.
> > > 
> > > On Thu, Apr 25, 2019 at 03:44:57PM -0700, Jack Pham wrote:
> > > > Hi Bin,
> > > > 
> > > > On Mon, Apr 22, 2019 at 08:43:57AM -0500, Bin Liu wrote:
> > > > > Hi Felipe,
> > > > > 
> > > > > I am having an issue with dwc3 on TI AM57x device, and would like to ask
> > > > > for your comments.
> > > > > 
> > > > > I use configfs to create a multi-function gadget on dwc3, mass_storage
> > > > > is the last function, it seems if I create 3 functions, the mass_storage
> > > > > enumeration will fail on the host. It works fine if only create 2
> > > > > functions.
> > > > > 
> > > > > The dwc3 tracepoints log shows after all the ep0 transfers for
> > > > > mass_storage, the very first epXin transfer is not complete - dwc3
> > > > > programmed the urb, but never generates RX completion event. This also
> > > > > matches the bus analyzer trace - dwc3 NAKs the very first IN token for
> > > > > ever.
> > > > > 
> > > > > I use the attached script to create the gadget, The macro FUNCS in the
> > > > > beginning of the script defines the functions to be created.
> > > > > 
> > > > > Any comments are appreciated.
> > > > 
> > > > A stab in the dark here but what is the value of GTXFIFOSIZ(X)[15:0]
> > > > for epXin on your device? Is it at least wMaxPacketSize? Depending on
> > > > the default hardware values it might be deficient as compared to the
> > > > working endpoint that gets assigned in your 2-function config.
> > > 
> > > Jack,
> > > 
> > > thanks for the pointer, it is indeed the issue on AM57x device.  The
> > > reset value of GTXFIFOSIZ for ep1~4 have size of 0x184, but ep5~15 have
> > > only size of 0x13 (which is 120 bytes), which is not enough for
> > > high-speed bulk xfers. I manually adjusted the fifo memory allocation,
> > > now my test case works.
> > 
> > Cool! I'm glad my suggestion was on the right track.
> >  
> > > Felipe,
> > > 
> > > Is there anything the dwc3 gadget driver can do to better handle this
> > > kind of devices, which don't have enough fifo buffers for all TX eps?
> > 
> > A long time ago...
> > 
> > commit bc5081617faeb3b2f0c126dc37264b87af7da47f
> > Author: Felipe Balbi <felipe.balbi@linux.intel.com>
> > Date:   Thu Feb 4 14:18:01 2016 +0200
> > 
> >     usb: dwc3: drop FIFO resizing logic
> > 
> >     That FIFO resizing logic was added to support OMAP5
> >     ES1.0 which had a bogus default FIFO size. I can't
> >     remember the exact size of default FIFO, but it was
> >     less than one bulk superspeed packet (<1024) which
> >     would prevent USB3 from ever working on OMAP5 ES1.0.
> > 
> >     However, OMAP5 ES1.0 support has been dropped by
> >     commit aa2f4b16f830 ("ARM: OMAP5: id: Remove ES1.0
> >     support") which renders FIFO resizing unnecessary.
> > 
> >     Tested-by: Kishon Vijay Abraham I <kishon@ti.com>
> >     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> > 
> > Prior to this there was a function dwc3_gadget_resize_tx_fifo(),
> > enabled via DT flag, which enumerated all the endpoints and
> > recalculated the TX FIFO sizes based on the transfer type of the
> > EPs' configuration.
> > 
> > Unfortunately some Qualcomm SoCs are still plagued by having
> > insufficient defaults, so we resort to carrying this function on our
> > downstream kernels. It seems TI AM57x still has this problem too?
> 
> Yes, it appears to be the case.

Wait, AM57x seems to be different. The issue mentioned in the commit
above is about bogus FIFO size, but GTXFIFOSIZ on AM57x are correct. it
is just that AM57x only has about total 13K+ FIFO memory, so only up to
4 TX endpoints which can have 3K FIFO, any use case which requires more
than 4 TX endpoints will fail.

So maybe the driver could have a sanity check on FIFO size when
allocating endpoints?

-Bin.
