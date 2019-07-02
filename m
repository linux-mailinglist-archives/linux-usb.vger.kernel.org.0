Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 973DF5D210
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 16:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbfGBOsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 10:48:46 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46256 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfGBOsq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 10:48:46 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62Emhbk034509;
        Tue, 2 Jul 2019 09:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562078923;
        bh=St5rNKb54j8OHwpnqLfi1htLncawFXF5WhUSpKmLjwg=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=k8J4WM8K1n4qKGpe3f7giqnWYShVAHejL3b10bUzhmsOYQICxOAJQ/G2KdSzkANFd
         nhaiHv2XVezRKrwBKajf1OahL8WZoi1qYCLoi7Yo8YN22fZn/Fro1OG/uRMQ8okAhW
         MDIobHhTnVkq6Dyp76gAJkl36PSjIFs7X5uiYciY=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62EmhDW005029
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jul 2019 09:48:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 09:48:42 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 09:48:42 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62EmgK3084215;
        Tue, 2 Jul 2019 09:48:42 -0500
Date:   Tue, 2 Jul 2019 09:48:42 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Jack Pham <jackp@codeaurora.org>
CC:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
Subject: Re: configfs on dwc3: msc enum failed if three functions defined
Message-ID: <20190702144842.GA20724@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Jack Pham <jackp@codeaurora.org>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <20190422134357.GA2071@uda0271908>
 <20190425224456.GA27553@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190425224456.GA27553@jackp-linux.qualcomm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Sorry for the delay getting back on this. I was offline for quite some
time.

On Thu, Apr 25, 2019 at 03:44:57PM -0700, Jack Pham wrote:
> Hi Bin,
> 
> On Mon, Apr 22, 2019 at 08:43:57AM -0500, Bin Liu wrote:
> > Hi Felipe,
> > 
> > I am having an issue with dwc3 on TI AM57x device, and would like to ask
> > for your comments.
> > 
> > I use configfs to create a multi-function gadget on dwc3, mass_storage
> > is the last function, it seems if I create 3 functions, the mass_storage
> > enumeration will fail on the host. It works fine if only create 2
> > functions.
> > 
> > The dwc3 tracepoints log shows after all the ep0 transfers for
> > mass_storage, the very first epXin transfer is not complete - dwc3
> > programmed the urb, but never generates RX completion event. This also
> > matches the bus analyzer trace - dwc3 NAKs the very first IN token for
> > ever.
> > 
> > I use the attached script to create the gadget, The macro FUNCS in the
> > beginning of the script defines the functions to be created.
> > 
> > Any comments are appreciated.
> 
> A stab in the dark here but what is the value of GTXFIFOSIZ(X)[15:0]
> for epXin on your device? Is it at least wMaxPacketSize? Depending on
> the default hardware values it might be deficient as compared to the
> working endpoint that gets assigned in your 2-function config.

Jack,

thanks for the pointer, it is indeed the issue on AM57x device.  The
reset value of GTXFIFOSIZ for ep1~4 have size of 0x184, but ep5~15 have
only size of 0x13 (which is 120 bytes), which is not enough for
high-speed bulk xfers. I manually adjusted the fifo memory allocation,
now my test case works.

Felipe,

Is there anything the dwc3 gadget driver can do to better handle this
kind of devices, which don't have enough fifo buffers for all TX eps?

-Bin.
