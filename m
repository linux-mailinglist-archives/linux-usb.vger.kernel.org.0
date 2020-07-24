Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7539E22BE9D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 09:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgGXHGn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 03:06:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbgGXHGn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 24 Jul 2020 03:06:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 06FBD2073E;
        Fri, 24 Jul 2020 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595574401;
        bh=+YLG2qLeBLkDNsiHP6bMhuRxbIR6vC8FzR2J5PtvCIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=11GlfwgFJOExQNvtnc+NnBxwoJa5wqaXIgfNXENAJcjRvqa1Dh9u8Zn9jmMODnHFy
         yxZF3xtAycwjsRccwKMSPOq/B4KeNw2ZhoXF+6e/7BILsgqDx467dWJ91FgxRZjRxB
         Xjg7EjXjcmAI7MWxsZES4t1eiwUE892vW4DnUQ+4=
Date:   Fri, 24 Jul 2020 09:06:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/27] xhci features for usb-next
Message-ID: <20200724070643.GH3880088@kroah.com>
References: <20200723144530.9992-1-mathias.nyman@linux.intel.com>
 <20200723150411.GA2529859@kroah.com>
 <be21534d-df11-c957-43eb-e64a05a45404@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be21534d-df11-c957-43eb-e64a05a45404@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 23, 2020 at 09:47:14PM +0300, Mathias Nyman wrote:
> On 23.7.2020 18.04, Greg KH wrote:
> > On Thu, Jul 23, 2020 at 05:45:03PM +0300, Mathias Nyman wrote:
> >> Hi Greg
> >>
> >> This series for usb-next is almost completely about decoupling and
> >> cleaning up relations between xhci, xhci debug capability (DbC),
> >> and the DbC tty support.
> >>
> >> Real motivation behind this is to later turn DbC into a proper device
> >> allowing us to bind different drivers to it, like dbctty.
> > 
> > I don't really understand why you want to do that, but ok :)
> 
> Well to be fair loading different drivers for DbC isn't the only motivation.
> 
> Just using the Linux device model solves issues we are currently seeing 
> when using DbC on systems with several xHCI controllers. The original DbC 
> implementation didn't take this into account. 

I thought when that was first merged no one cared :)

Nice to see that fixed here.

> And as a bigger picture DbC is just one extended capability. 
> xHC controller provides a list of support extended capabilities, each one
> with an ID and often a mmio region (inside xhci mmio range).
> We don't handle these consistently in the xhci driver, for example
> the role switch capability is currently turned into a platform device
> while the DbC capability support is squashed all into the xhci driver.
> 
> Long term idea here would be to create a extended capability bus where each
> capability is a device, (child of xhci device) and drivers for these match
> based on the capability ID.

Odd, but ok.

> > What is that going to help with?
> 
> The option to load other drivers for the DbC capability will help other
> developers to write "standard" Linux drivers that provide different interfaces
> than TTY to send data over DbC.
> 
> I don't fully understand these TTY limitations myself, but there is a strong push
> to implement this, and the task to provide the infrastructure for this landed
> on my table.

What other interface is asked for?  And yes, I would push back, what is
wrong with TTY here?  It should be the most "low overhead" interface
that works with common userspace tools that we have.

thanks,

greg k-h
