Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 451D95D4BD
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 18:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbfGBQv3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 12:51:29 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57872 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbfGBQv3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 12:51:29 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CA8E6607DF; Tue,  2 Jul 2019 16:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562086287;
        bh=7sXSc17bVAuf7CbORgrBmCFPSGy1FMafDntP+ShkZ+I=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=ElfqaMCmAQFZZuM27RVkXOa8ly7g9MpLoBzbACX3okex/JloyxueUstSWmRzJjrK4
         SH0MZX12YGhscuzdVwFpq7WB+NLDeRAnUaAfyG1VVHumngHLyjfMfTWKkGTEihD3EX
         6zkh5THCmvQUWJktPOgc4HrmEWsmrXMAt/y9Qqac=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 02D8460746;
        Tue,  2 Jul 2019 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562086287;
        bh=7sXSc17bVAuf7CbORgrBmCFPSGy1FMafDntP+ShkZ+I=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=ElfqaMCmAQFZZuM27RVkXOa8ly7g9MpLoBzbACX3okex/JloyxueUstSWmRzJjrK4
         SH0MZX12YGhscuzdVwFpq7WB+NLDeRAnUaAfyG1VVHumngHLyjfMfTWKkGTEihD3EX
         6zkh5THCmvQUWJktPOgc4HrmEWsmrXMAt/y9Qqac=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 02D8460746
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 2 Jul 2019 09:51:22 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: configfs on dwc3: msc enum failed if three functions defined
Message-ID: <20190702165122.GA15112@jackp-linux.qualcomm.com>
References: <20190422134357.GA2071@uda0271908>
 <20190425224456.GA27553@jackp-linux.qualcomm.com>
 <20190702144842.GA20724@uda0271908>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702144842.GA20724@uda0271908>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Bin,

On Tue, Jul 02, 2019 at 09:48:42AM -0500, Bin Liu wrote:
> Hi,
> 
> Sorry for the delay getting back on this. I was offline for quite some
> time.
> 
> On Thu, Apr 25, 2019 at 03:44:57PM -0700, Jack Pham wrote:
> > Hi Bin,
> > 
> > On Mon, Apr 22, 2019 at 08:43:57AM -0500, Bin Liu wrote:
> > > Hi Felipe,
> > > 
> > > I am having an issue with dwc3 on TI AM57x device, and would like to ask
> > > for your comments.
> > > 
> > > I use configfs to create a multi-function gadget on dwc3, mass_storage
> > > is the last function, it seems if I create 3 functions, the mass_storage
> > > enumeration will fail on the host. It works fine if only create 2
> > > functions.
> > > 
> > > The dwc3 tracepoints log shows after all the ep0 transfers for
> > > mass_storage, the very first epXin transfer is not complete - dwc3
> > > programmed the urb, but never generates RX completion event. This also
> > > matches the bus analyzer trace - dwc3 NAKs the very first IN token for
> > > ever.
> > > 
> > > I use the attached script to create the gadget, The macro FUNCS in the
> > > beginning of the script defines the functions to be created.
> > > 
> > > Any comments are appreciated.
> > 
> > A stab in the dark here but what is the value of GTXFIFOSIZ(X)[15:0]
> > for epXin on your device? Is it at least wMaxPacketSize? Depending on
> > the default hardware values it might be deficient as compared to the
> > working endpoint that gets assigned in your 2-function config.
> 
> Jack,
> 
> thanks for the pointer, it is indeed the issue on AM57x device.  The
> reset value of GTXFIFOSIZ for ep1~4 have size of 0x184, but ep5~15 have
> only size of 0x13 (which is 120 bytes), which is not enough for
> high-speed bulk xfers. I manually adjusted the fifo memory allocation,
> now my test case works.

Cool! I'm glad my suggestion was on the right track.
 
> Felipe,
> 
> Is there anything the dwc3 gadget driver can do to better handle this
> kind of devices, which don't have enough fifo buffers for all TX eps?

A long time ago...

commit bc5081617faeb3b2f0c126dc37264b87af7da47f
Author: Felipe Balbi <felipe.balbi@linux.intel.com>
Date:   Thu Feb 4 14:18:01 2016 +0200

    usb: dwc3: drop FIFO resizing logic

    That FIFO resizing logic was added to support OMAP5
    ES1.0 which had a bogus default FIFO size. I can't
    remember the exact size of default FIFO, but it was
    less than one bulk superspeed packet (<1024) which
    would prevent USB3 from ever working on OMAP5 ES1.0.

    However, OMAP5 ES1.0 support has been dropped by
    commit aa2f4b16f830 ("ARM: OMAP5: id: Remove ES1.0
    support") which renders FIFO resizing unnecessary.

    Tested-by: Kishon Vijay Abraham I <kishon@ti.com>
    Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

Prior to this there was a function dwc3_gadget_resize_tx_fifo(),
enabled via DT flag, which enumerated all the endpoints and
recalculated the TX FIFO sizes based on the transfer type of the
EPs' configuration.

Unfortunately some Qualcomm SoCs are still plagued by having
insufficient defaults, so we resort to carrying this function on our
downstream kernels. It seems TI AM57x still has this problem too?

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
