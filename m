Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4373D1D3735
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 19:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgENRA1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 13:00:27 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:55080 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbgENRA1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 13:00:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04EH0Ngo059254;
        Thu, 14 May 2020 12:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589475623;
        bh=GLRbLklUztjSDMQ1GV6YyicZCwhPBc8ldwcWA+jo/6w=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=B6k/87ftV+WZKaALGCsX5uK1Bh8475WCF0rFMRgpmyWir5sPVWoaCr1ocq/KvhgeU
         UOpGTwry4tmHULsIhwM/RhbDcTD/zsIz16Mp++5HXeFrfK038WkcgK6wSO9u93Um1P
         m5CqqeOFFyMk7MTi54GvBvHP5LXXIqYXG9XFSDtQ=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EH0N8D036232;
        Thu, 14 May 2020 12:00:23 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 12:00:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 12:00:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EH0N6P090334;
        Thu, 14 May 2020 12:00:23 -0500
Date:   Thu, 14 May 2020 12:00:23 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200514170023.GD11463@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <20200513213620.21541-1-b-liu@ti.com>
 <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514162604.GA9571@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 12:26:04PM -0400, Alan Stern wrote:
> On Thu, May 14, 2020 at 10:37:31AM -0500, Bin Liu wrote:
> > On Thu, May 14, 2020 at 10:02:59AM -0500, Bin Liu wrote:
> > > On Thu, May 14, 2020 at 10:40:53AM -0400, Alan Stern wrote:
> > > > On Thu, May 14, 2020 at 09:28:03AM -0500, Bin Liu wrote:
> > > > > On Wed, May 13, 2020 at 09:32:05PM -0400, Alan Stern wrote:
> > > > > > On Wed, May 13, 2020 at 04:36:20PM -0500, Bin Liu wrote:
> > > > > > > When a USB device attached to a hub got disconnected, MUSB controller
> > > > > > > generates RXCSR_RX_ERROR interrupt for the 3-strikes-out error.
> > > > > > > 
> > > > > > > Currently the MUSB host driver returns -EPROTO in current URB, then the
> > > > > > > USB device driver could immediately resubmit the URB which causes MUSB
> > > > > > > generate RXCSR_RX_ERROR interrupt again. This circle causes interrupt
> > > > > > > storm then the hub never got a chance to report the USB device detach.
> > > > > > > 
> > > > > > > To fix the interrupt storm, change the URB return code to -ESHUTDOWN for
> > > > > > > MUSB_RXCSR_H_ERROR interrupt, so that the USB device driver will not
> > > > > > > immediately resubmit the URB.
> > > > > > > 
> > > > > > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > > > > 
> > > > > > Strictly speaking, this is not the right thing to do.  It goes against 
> > > > > > the API described in error-codes.rst.  A better approach would be to fix 
> > > > > 
> > > > > error-codes.rst says:
> > > > > 
> > > > > -ESHUTDOWN              The device or host controller has been
> > > > > 			disabled due to some problem that could not
> > > > > 			be worked around, such as a physical
> > > > > 			disconnect.
> > > > > 
> > > > > So -ESHUTDOWN is applicable in this case - the device is disconnected
> > > > > behind a hub.
> > > > 
> > > > Yes, but you don't _know_ that the device was disconnected.  All you 
> > > > know is that there was a 3-strikes error.  Other problems can cause such 
> > > > errors (noise, for example).
> > > 
> > > Yes, I know this. But we don't have a solution then. I cannot add
> > > resubmit delay in those ~500 device drivers.
> > 
> > By the way I don't think noise could last long enough to cause 3-strikes
> > error. A shortest USB packet is about 3-bytes long, a noise should be
> > just a glitch, it won't last at least 3-bytes long to supress the bus
> > and 3 times on the exact timing when the host expecting a response
> > packet. I cannot think of any other reason which can cause the 3-strikes
> > error other than the device is off the bus.
> 
> Heh.  I heard from somebody (many years ago) about a setup where one of 
> his USB devices stopped working whenever he turned on the fluorescent 
> lights.

This could happen, noise comming in from the power supply, cheap power
supply and poor board design.

> Yes, I agree that noise is pretty uncommon, and the vast majority of 
> 3-strikes errors are caused by disconnection or device firmware bugs.  

I wasn't mean noise is uncommon, it is just it won't cause 3-strikes
error because the glitch is very short. I have seen many cases that
noise causing issues on MUSB due to poor board design especially on
those USB modem or WIFI projects.

> That's why I didn't NAK this patch.

Thanks.

> Still, it's worth pointing out that this change abuses the API (perhaps 
> mentioning it in a comment).  And it still would be preferable to fix 

Okay, I will add those notes in comment in v2.

> the drivers in question, impractical though that may be.  (I have a hard 
> time believing there are really 500 of them getting this wrong...)

I am not sure about it either, but yeah it is not practical to fix the
issue in device drivers. So far I have seen 3 reports of this issue:

1. with FTDI usb-serial adapter, the issue is in the usb serial generic
driver;

2. with a modem, the issue is in usb wwan driver as I fixed in the patch
I sent yesterday;

2. another modem, before I was able to locate the offending device
driver, the guy who reported the issue disappeared, and not responding
me.

-Bin.
