Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEC81DB715
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 16:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgETObS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 10:31:18 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45020 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgETObP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 10:31:15 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KEVCW6013723;
        Wed, 20 May 2020 09:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589985072;
        bh=SGLF8APaXDRZ2FO/7rHFTeeLX/JqQZdlTXmvaR5BjRk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=vIub/xQ5itD2V8eGXzoVGXp1PC6ap9wKjwuThcu0y04ycafOYew/czSgx/aaP49wp
         ShzMcLsSfGr9Xl5HyuePq9YZgXZVak1zLgnYKRbzJduWTJ78d5UYBFmodAxg+B5xfX
         mDsZgFSbQeQSu3zUkbAMWXD0lAFlWbaBYI7Ka9Rs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KEVCWA070649;
        Wed, 20 May 2020 09:31:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 09:31:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 09:31:12 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KEVCKf051831;
        Wed, 20 May 2020 09:31:12 -0500
Date:   Wed, 20 May 2020 09:31:12 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200520143112.GB15845@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
 <20200514170023.GD11463@iaqt7>
 <20200514185549.GA22428@rowland.harvard.edu>
 <20200519171255.GE11463@iaqt7>
 <20200519200158.GA1339@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200519200158.GA1339@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 19, 2020 at 04:01:58PM -0400, Alan Stern wrote:
> On Tue, May 19, 2020 at 12:12:55PM -0500, Bin Liu wrote:
> > On Thu, May 14, 2020 at 02:55:49PM -0400, Alan Stern wrote:
> > > On Thu, May 14, 2020 at 12:00:23PM -0500, Bin Liu wrote:
> > > 
> > > > > Still, it's worth pointing out that this change abuses the API (perhaps 
> > > > > mentioning it in a comment).  And it still would be preferable to fix 
> > > > 
> > > > Okay, I will add those notes in comment in v2.
> > > > 
> > > > > the drivers in question, impractical though that may be.  (I have a hard 
> > > > > time believing there are really 500 of them getting this wrong...)
> > > > 
> > > > I am not sure about it either, but yeah it is not practical to fix the
> > > > issue in device drivers. So far I have seen 3 reports of this issue:
> > > > 
> > > > 1. with FTDI usb-serial adapter, the issue is in the usb serial generic
> > > > driver;
> > > 
> > > It shouldn't be hard to fix this.  We don't even need a delayed retry; 
> > > the driver can simply treat -EPROTO as an unrecoverable error, just like 
> > > -ESHUTDOWN.
> > 
> > This is just an example showing that it is not practical to fix the
> > problem in device drivers.
> > 
> > BTY, I just briefly searched the drivers/ folder, there are only three
> > drivers handle -EPROTO specifically in rx callback and bail out. So
> > seems most drivers do not care about -EPROTO.
> 
> Then do you think we should change the API?
> 
> Right now it's a little too complicated.  There's no real reason for 
> EPROTO, EILSEQ, and ETIME to be different codes.  And now you seem to be 
> suggesting that we should fold them all into ESHUTDOWN.

I haven't studied all the USB error code enough to suggest this. I am
only changing to ESHUTDOWN in musb driver because I know this 3-strikes
error should only be caused by USB device disabled, which is the
definition of ESHUTDOWN in error-code.rst.

-Bin.
