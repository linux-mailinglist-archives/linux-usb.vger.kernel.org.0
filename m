Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1707337AF2C
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 21:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhEKTQq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 15:16:46 -0400
Received: from netrider.rowland.org ([192.131.102.5]:59151 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S231454AbhEKTQq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 May 2021 15:16:46 -0400
Received: (qmail 909999 invoked by uid 1000); 11 May 2021 15:15:38 -0400
Date:   Tue, 11 May 2021 15:15:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210511191538.GC908414@rowland.harvard.edu>
References: <20210510152426.GE863718@rowland.harvard.edu>
 <87zgx2fskr.fsf@kernel.org>
 <20210510193849.GB873147@rowland.harvard.edu>
 <20210511025322.GA23868@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511025322.GA23868@nchen>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 11, 2021 at 10:53:22AM +0800, Peter Chen wrote:
> Hi Alan,
> 
> I fixed a similar issue for configfs, see 1a1c851bbd70
> ("usb: gadget: configfs: fix concurrent issue between composite APIs")

Yes, I see.  That is indeed the very same problem.

> It doesn't prevent disconnect callback, the disconnect callback will check
> if unbind has called. The same for .setup and .suspend. Did you see
> issues using configfs or legacy gadget? For legacy gadget, just like you said
> it is the second disconnect callback is called during the removal process,
> the first is called at usb_gadget_disconnect. It is not easy to prevent disconnect
> occurring, we could add some logic at composite_disconnect, and let it quit if it is
> called the second time.

I haven't seen the race occur in operation.  It was only theoretical; I 
noticed it while thinking about one of the commits that was just merged 
into the -stable kernels.

> It is hard to avoid usb_gadget_driver callback until usb_gadget_udc_stop has called,
> no matter bad hardware or threaded interrupts, my former solution is avoid
> dereferenced pointer issue, most of callbacks handling are useless if the gadget has already
> unbind, the only meaningful callback is disconnect, and we have already called it
> at usb_gadget_disconnect

Agreed.

I suppose we could do something similar for the composite driver, for 
gadgets that don't use configfs.  But what about legacy gadgets?  Are 
there any still around that don't use either configfs or the composite 
framework?

Alan Stern
