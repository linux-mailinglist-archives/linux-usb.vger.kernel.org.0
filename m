Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459F41DBD68
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 20:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgETS7X (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 14:59:23 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50924 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETS7X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 14:59:23 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KIxLbh044879;
        Wed, 20 May 2020 13:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590001161;
        bh=173hVH3ooEaNTJDeg0ZFoaFCIdVe9uzwY5Mr6pYJb1s=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=d/E1rcY7JEvcCvoTv6m5JKLAbet4XTBfV5IZ8FavaiYS7PmSrhiKtNe5isIktHiwQ
         QOgnFQlblgpV2K33Nhxr3I/Xqp07fjTpz9dVZcGdKazJYjVMi7queMJ2bSDUb4iceX
         ZMHnEpgK0/p5jjJ5u+QBtImssNZdjEzz7crPAQR0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KIxLrs116404
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 13:59:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 13:59:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 13:59:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KIxLd2010450;
        Wed, 20 May 2020 13:59:21 -0500
Date:   Wed, 20 May 2020 13:59:21 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200520185921.GE15845@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
 <20200514170023.GD11463@iaqt7>
 <20200514185549.GA22428@rowland.harvard.edu>
 <20200519171255.GE11463@iaqt7>
 <20200519200158.GA1339@rowland.harvard.edu>
 <20200520143112.GB15845@iaqt7>
 <20200520164055.GB11084@rowland.harvard.edu>
 <20200520180550.GD15845@iaqt7>
 <20200520182536.GB15590@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200520182536.GB15590@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 02:25:36PM -0400, Alan Stern wrote:
> On Wed, May 20, 2020 at 01:05:50PM -0500, Bin Liu wrote:
> > On Wed, May 20, 2020 at 12:40:55PM -0400, Alan Stern wrote:
> > > > > Then do you think we should change the API?
> > > > > 
> > > > > Right now it's a little too complicated.  There's no real reason for 
> > > > > EPROTO, EILSEQ, and ETIME to be different codes.  And now you seem to be 
> > > > > suggesting that we should fold them all into ESHUTDOWN.
> > > > 
> > > > I haven't studied all the USB error code enough to suggest this. I am
> > > > only changing to ESHUTDOWN in musb driver because I know this 3-strikes
> > > > error should only be caused by USB device disabled, which is the
> > > > definition of ESHUTDOWN in error-code.rst.
> > > 
> > > You should spend a little time studying the error-codes document.  
> > > EPROTO, EILSEQ, and ETIME describe different kinds of errors that all 
> > > fall into the 3-strikes category.
> > 
> > But not all device drivers, except the 3 I found, treat EPROTO as fatal,
> > and I cannot fix it in all the device drivers. The only thing I can do
> > at this moment is changing the MUSB HCD driver to return ESHUTDOWN which
> > still follows the document, kind of.
> 
> Think long-term.  Yes, for now you're focused on changing the MUSB HCD.  
> But what should happen in the future?
> 
> At some point we all need to stop reacting and start making some 
> deliberate plans.  This issue is bigger than one patch or one driver.

Yes, the issue big, not all device drivers treat the urb error status
properly. As the case #3 I mentioned earlier, even MUSB HCD returns
ESHUTDOWN, the interrupt storm still happens. Unfortunately before I
located the offending device driver, the remote setup is gone...

I agree with you, we probably should simply the number of the error code
based on the real usecases and the handlings in device drivers.

-Bin.
