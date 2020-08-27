Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8784A254C5E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 19:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgH0Roz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Aug 2020 13:44:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:37978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726153AbgH0Roy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 27 Aug 2020 13:44:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 362BB2087E;
        Thu, 27 Aug 2020 17:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598550293;
        bh=hpmMkq3GeyF+UpchiZzraWqNMWLExGpqIZ25LroJiyU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M7CAwUNKs6TIYurhYZqJ1Jwrl1o+PIGfpyinvrl8/ij0BPtWw4uMmiWGhuM3og/Qc
         KgLQkJZm8pFtAwJ+2xllelQk3t2RVW7KO4IOJtT31nSt/QE/UggXAPpVMBvnzziMNQ
         TKH84t7MY+6sXF/dMEhXfRxFK91/URzVN8/nykTo=
Date:   Thu, 27 Aug 2020 19:45:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     David Laight <David.Laight@aculab.com>,
        'Alex Dewar' <alex.dewar90@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "accessrunner-general@lists.sourceforge.net" 
        <accessrunner-general@lists.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <20200827174506.GA705950@kroah.com>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <3e882693bb344424af37d4d35f3db605@AcuMS.aculab.com>
 <20200825082406.GB1335351@kroah.com>
 <202008270936.6FF344336@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008270936.6FF344336@keescook>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 27, 2020 at 09:49:04AM -0700, Kees Cook wrote:
> On Tue, Aug 25, 2020 at 10:24:06AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 25, 2020 at 08:12:05AM +0000, David Laight wrote:
> > > From: Alex Dewar
> > > > Sent: 24 August 2020 23:23
> > > > kernel/cpu.c: don't use snprintf() for sysfs attrs
> > > > 
> > > > As per the documentation (Documentation/filesystems/sysfs.rst),
> > > > snprintf() should not be used for formatting values returned by sysfs.
> > > > 
> > > > In all of these cases, sprintf() suffices as we know that the formatted
> > > > strings will be less than PAGE_SIZE in length.
> > > 
> > > Hmmmm....
> > > I much prefer to see bounded string ops.
> > > sysfs really ought to be passing through the buffer length.
> > 
> > No.
> 
> It really should, though. I _just_ got burned by this due to having
> a binattr sysfs reachable through splice[1]. Most sysfs things aren't
> binattr, but I've always considered this to be a weird fragility in the
> sysfs implementation.

binattr attributes do have the buffer size passed to it, for that very
reason :)

> > So this is designed this way on purpose, you shouldn't have to worry
> > about any of this, and that way, you don't have to "program
> > defensively", it all just works in a simple manner.
> 
> Later in this thread there's a suggestion to alter the API to avoid
> individual calls to sprintf(), which seems like a reasonable first step.

I always review any patches submitted, so if someone feels like tackling
this, wonderful!

thanks,

greg k-h
