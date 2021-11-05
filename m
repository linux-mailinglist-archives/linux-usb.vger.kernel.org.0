Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 133A64461E3
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 11:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233046AbhKEKFc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 06:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:51212 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233030AbhKEKFb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Nov 2021 06:05:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 454EA61244;
        Fri,  5 Nov 2021 10:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636106571;
        bh=dQub/VqOrPd+w4OC4xR8rceiheuQvrObH2ysv1UB16w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JZoh4vj1pkDMFqHrlrvCCcI7/izltOGw62nNT2EY0GHUaFjrP0oFGjvemOpw2y21z
         UhfAjcjvMS6ULZV1uEr4/cY0kcsL6BMdHtQujrf9CTdEIX1Itjgx9M4zQy7SXOxRDO
         kYyczzAty/y3E9g+KK6RZLbYABtVnTmt3ozowefc=
Date:   Fri, 5 Nov 2021 11:02:48 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] USB: serial: pl2303: Add new PID to support PL256X
 (TYPE_MP)
Message-ID: <YYUBSO/Jj+99btPr@kroah.com>
References: <20210622120906.743-1-charlesyeh522@gmail.com>
 <YQpx5Y6CZUP+u7LS@hovoldconsulting.com>
 <CAAZvQQ6q4Kg2iHkD4JefJ3r=pa9Gbz_y_5utgwSGQL_2HH7Ohg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ6q4Kg2iHkD4JefJ3r=pa9Gbz_y_5utgwSGQL_2HH7Ohg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 01, 2021 at 12:53:03PM +0800, Charles Yeh wrote:
> This issue can be closed.
> 
> Sorry, it took so long to reply...
> Finally, our company(Prolific) decided to change the new chip from
> "Class FFh (Vendor Specific)" to "Class 02h (Communications and CDC Control)"
> In this way, the chip's default support can be backward compatible
> with the lower version of the Linux kernel (such as 3.X / 4.X,...)

But is the device really compliant with the CDC specification?  If so,
wonderful, but if not, then:

> If there are customers who need RTS/CTS and other flow control in the future.
> We(Prolific) will provide patch file to support

That is very odd, we can take such a patch now in the kernel source tree
so that you will not have to deal with this for the thousands of
different companies wanting this.  Please submit the needed patch here
and we will be glad to review it.

When a person has to run a patched kernel, they loose the support of the
vendor they are getting their kernel from, so you would require anyone
who runs your changed driver to invalidate their vendor support
contract.  Not something that I am sure anyone would really want to do
"just" for a usb to serial device.

thanks,

greg k-h
