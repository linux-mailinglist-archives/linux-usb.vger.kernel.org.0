Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7751DB9DE
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 18:40:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgETQk4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 12:40:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:41029 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726545AbgETQk4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 12:40:56 -0400
Received: (qmail 13031 invoked by uid 1000); 20 May 2020 12:40:55 -0400
Date:   Wed, 20 May 2020 12:40:55 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200520164055.GB11084@rowland.harvard.edu>
References: <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
 <20200514170023.GD11463@iaqt7>
 <20200514185549.GA22428@rowland.harvard.edu>
 <20200519171255.GE11463@iaqt7>
 <20200519200158.GA1339@rowland.harvard.edu>
 <20200520143112.GB15845@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520143112.GB15845@iaqt7>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > Then do you think we should change the API?
> > 
> > Right now it's a little too complicated.  There's no real reason for 
> > EPROTO, EILSEQ, and ETIME to be different codes.  And now you seem to be 
> > suggesting that we should fold them all into ESHUTDOWN.
> 
> I haven't studied all the USB error code enough to suggest this. I am
> only changing to ESHUTDOWN in musb driver because I know this 3-strikes
> error should only be caused by USB device disabled, which is the
> definition of ESHUTDOWN in error-code.rst.

You should spend a little time studying the error-codes document.  
EPROTO, EILSEQ, and ETIME describe different kinds of errors that all 
fall into the 3-strikes category.

Alan Stern
