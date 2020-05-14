Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5D01D353E
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgENPhn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:37:43 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46200 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPhn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:37:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04EFbWWG038791;
        Thu, 14 May 2020 10:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589470652;
        bh=9dmxYR59N72XLEGvzkJqaRIEeYqAerbSrGl6ao8cXvA=;
        h=Date:From:To:Subject:References:In-Reply-To;
        b=CWBh8ls8NgW5E0YGkl0+CvtqWd9zZO/zhDv8VzUVtwGA9ClWoT31N256QtkuiwoYg
         e40AS2ow3om3TMwsB3CvgL+y0QaTrXb5lfFgojM2MyEjw9xu6N0h8teh3Bdhkd2bxV
         c3Zpf5yJC8E4IL9DBbVn4hXNJERh3YFfRa1I0eec=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EFbWK0052374;
        Thu, 14 May 2020 10:37:32 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 10:37:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 10:37:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EFbVXE094744;
        Thu, 14 May 2020 10:37:31 -0500
Date:   Thu, 14 May 2020 10:37:31 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Alan Stern <stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200514153731.GC11463@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <20200513213620.21541-1-b-liu@ti.com>
 <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514150259.GB11463@iaqt7>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 10:02:59AM -0500, Bin Liu wrote:
> On Thu, May 14, 2020 at 10:40:53AM -0400, Alan Stern wrote:
> > On Thu, May 14, 2020 at 09:28:03AM -0500, Bin Liu wrote:
> > > On Wed, May 13, 2020 at 09:32:05PM -0400, Alan Stern wrote:
> > > > On Wed, May 13, 2020 at 04:36:20PM -0500, Bin Liu wrote:
> > > > > When a USB device attached to a hub got disconnected, MUSB controller
> > > > > generates RXCSR_RX_ERROR interrupt for the 3-strikes-out error.
> > > > > 
> > > > > Currently the MUSB host driver returns -EPROTO in current URB, then the
> > > > > USB device driver could immediately resubmit the URB which causes MUSB
> > > > > generate RXCSR_RX_ERROR interrupt again. This circle causes interrupt
> > > > > storm then the hub never got a chance to report the USB device detach.
> > > > > 
> > > > > To fix the interrupt storm, change the URB return code to -ESHUTDOWN for
> > > > > MUSB_RXCSR_H_ERROR interrupt, so that the USB device driver will not
> > > > > immediately resubmit the URB.
> > > > > 
> > > > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > > 
> > > > Strictly speaking, this is not the right thing to do.  It goes against 
> > > > the API described in error-codes.rst.  A better approach would be to fix 
> > > 
> > > error-codes.rst says:
> > > 
> > > -ESHUTDOWN              The device or host controller has been
> > > 			disabled due to some problem that could not
> > > 			be worked around, such as a physical
> > > 			disconnect.
> > > 
> > > So -ESHUTDOWN is applicable in this case - the device is disconnected
> > > behind a hub.
> > 
> > Yes, but you don't _know_ that the device was disconnected.  All you 
> > know is that there was a 3-strikes error.  Other problems can cause such 
> > errors (noise, for example).
> 
> Yes, I know this. But we don't have a solution then. I cannot add
> resubmit delay in those ~500 device drivers.

By the way I don't think noise could last long enough to cause 3-strikes
error. A shortest USB packet is about 3-bytes long, a noise should be
just a glitch, it won't last at least 3-bytes long to supress the bus
and 3 times on the exact timing when the host expecting a response
packet. I cannot think of any other reason which can cause the 3-strikes
error other than the device is off the bus.

-Bin.
