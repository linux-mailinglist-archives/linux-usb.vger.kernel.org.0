Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11D91D3457
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgENPDB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:03:01 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:50886 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgENPDB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:03:01 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04EF30Uh033390;
        Thu, 14 May 2020 10:03:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589468580;
        bh=QWbmivzNo6xb5Yvz1JmANWCtfSscs8KNWzHa6puU/9w=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=IOhrIZWCVr+LzmH+JbrHUKqCU8NJV4WBRbieCGImBKyavk0HUxZQy4Uv57+2857h5
         R6xUkox5r8XZxHNNoWqx0JjwyLOgxB2BVFWvCkeNIE2/amHaSIcXGTkL8w3uAW95Ee
         5lur8ST7ZYwjHxwrt8H6tz7nnwjWwY8t+p36fW7Q=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04EF2xQe062016
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 May 2020 10:02:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 14
 May 2020 10:02:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 14 May 2020 10:02:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04EF2xM2002380;
        Thu, 14 May 2020 10:02:59 -0500
Date:   Thu, 14 May 2020 10:02:59 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200514150259.GB11463@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <20200513213620.21541-1-b-liu@ti.com>
 <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514144053.GC12181@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 10:40:53AM -0400, Alan Stern wrote:
> On Thu, May 14, 2020 at 09:28:03AM -0500, Bin Liu wrote:
> > On Wed, May 13, 2020 at 09:32:05PM -0400, Alan Stern wrote:
> > > On Wed, May 13, 2020 at 04:36:20PM -0500, Bin Liu wrote:
> > > > When a USB device attached to a hub got disconnected, MUSB controller
> > > > generates RXCSR_RX_ERROR interrupt for the 3-strikes-out error.
> > > > 
> > > > Currently the MUSB host driver returns -EPROTO in current URB, then the
> > > > USB device driver could immediately resubmit the URB which causes MUSB
> > > > generate RXCSR_RX_ERROR interrupt again. This circle causes interrupt
> > > > storm then the hub never got a chance to report the USB device detach.
> > > > 
> > > > To fix the interrupt storm, change the URB return code to -ESHUTDOWN for
> > > > MUSB_RXCSR_H_ERROR interrupt, so that the USB device driver will not
> > > > immediately resubmit the URB.
> > > > 
> > > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > 
> > > Strictly speaking, this is not the right thing to do.  It goes against 
> > > the API described in error-codes.rst.  A better approach would be to fix 
> > 
> > error-codes.rst says:
> > 
> > -ESHUTDOWN              The device or host controller has been
> > 			disabled due to some problem that could not
> > 			be worked around, such as a physical
> > 			disconnect.
> > 
> > So -ESHUTDOWN is applicable in this case - the device is disconnected
> > behind a hub.
> 
> Yes, but you don't _know_ that the device was disconnected.  All you 
> know is that there was a 3-strikes error.  Other problems can cause such 
> errors (noise, for example).

Yes, I know this. But we don't have a solution then. I cannot add
resubmit delay in those ~500 device drivers.

-Bin.
