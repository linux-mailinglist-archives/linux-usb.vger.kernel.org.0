Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F7E1DBCC7
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 20:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgETSZi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 14:25:38 -0400
Received: from netrider.rowland.org ([192.131.102.5]:55687 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726826AbgETSZi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 14:25:38 -0400
Received: (qmail 17522 invoked by uid 1000); 20 May 2020 14:25:36 -0400
Date:   Wed, 20 May 2020 14:25:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200520182536.GB15590@rowland.harvard.edu>
References: <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
 <20200514170023.GD11463@iaqt7>
 <20200514185549.GA22428@rowland.harvard.edu>
 <20200519171255.GE11463@iaqt7>
 <20200519200158.GA1339@rowland.harvard.edu>
 <20200520143112.GB15845@iaqt7>
 <20200520164055.GB11084@rowland.harvard.edu>
 <20200520180550.GD15845@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520180550.GD15845@iaqt7>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 01:05:50PM -0500, Bin Liu wrote:
> On Wed, May 20, 2020 at 12:40:55PM -0400, Alan Stern wrote:
> > > > Then do you think we should change the API?
> > > > 
> > > > Right now it's a little too complicated.  There's no real reason for 
> > > > EPROTO, EILSEQ, and ETIME to be different codes.  And now you seem to be 
> > > > suggesting that we should fold them all into ESHUTDOWN.
> > > 
> > > I haven't studied all the USB error code enough to suggest this. I am
> > > only changing to ESHUTDOWN in musb driver because I know this 3-strikes
> > > error should only be caused by USB device disabled, which is the
> > > definition of ESHUTDOWN in error-code.rst.
> > 
> > You should spend a little time studying the error-codes document.  
> > EPROTO, EILSEQ, and ETIME describe different kinds of errors that all 
> > fall into the 3-strikes category.
> 
> But not all device drivers, except the 3 I found, treat EPROTO as fatal,
> and I cannot fix it in all the device drivers. The only thing I can do
> at this moment is changing the MUSB HCD driver to return ESHUTDOWN which
> still follows the document, kind of.

Think long-term.  Yes, for now you're focused on changing the MUSB HCD.  
But what should happen in the future?

At some point we all need to stop reacting and start making some 
deliberate plans.  This issue is bigger than one patch or one driver.

Alan Stern
