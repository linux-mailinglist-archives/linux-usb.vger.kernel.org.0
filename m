Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65238253EC4
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 09:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728063AbgH0HPZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 03:15:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:48680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgH0HPY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 03:15:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE34A22BEA;
        Thu, 27 Aug 2020 07:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598512524;
        bh=G3vscis/STSa2/sHE+rHOyY//y2R6JMcHXEvNAmvFjc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yJE5N6v47+E0KRX01YAv96COO3XDT7VXEeKDw6FdFPRmrZlImwCdB6Gp3yYvqETQI
         ie8u9QidWO4l+3HhxaaMXrrfyeH//LZJ9N4FPnOZM2IYFA+4NPs1rrDaOfSopeTP6F
         DUlEY+96Bw+++8WPbVSYNsJFLjdbl+iP5zG+g60w=
Date:   Thu, 27 Aug 2020 09:15:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     Alex Dewar <alex.dewar90@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        accessrunner-general@lists.sourceforge.net,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <20200827071537.GA168593@kroah.com>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f2dc90-7852-eaf1-55d7-2c85cf954688@rasmusvillemoes.dk>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 27, 2020 at 08:42:06AM +0200, Rasmus Villemoes wrote:
> On 25/08/2020 00.23, Alex Dewar wrote:
> > kernel/cpu.c: don't use snprintf() for sysfs attrs
> > 
> > As per the documentation (Documentation/filesystems/sysfs.rst),
> > snprintf() should not be used for formatting values returned by sysfs.
> >
> 
> Sure. But then the security guys come along and send a patch saying
> "sprintf is evil, always pass a buffer bound". Perhaps with a side of
> "this code could get copy-pasted, better not promote the use of sprintf
> more than strictly necessary".
> 
> Can we have a sysfs_sprintf() (could just be a macro that does sprintf)
> to make it clear to the next reader that we know we're in a sysfs show
> method? It would make auditing uses of sprintf() much easier.

Code churn to keep code checkers quiet for pointless reasons?  What
could go wrong with that...

It should be pretty obvious to any reader that you are in a sysfs show
method, as almost all of them are trivially tiny and obvious.  Yes, it
doesn't help with those that make blanket statements like "sprintf is
evil", but I think that kind of just shows them that they shouldn't be
making foolish blanket statements like that :)

Anyway, we've had this for 20 years, if sysfs calls are the only left
remaining user of sprintf(), then I'll be glad to consider using a
"wrapper" function or macro.

thanks,

greg k-h
