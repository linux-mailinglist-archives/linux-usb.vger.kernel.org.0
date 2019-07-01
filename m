Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 273324CD69
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 14:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731651AbfFTMIZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 08:08:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:38528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730596AbfFTMIZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jun 2019 08:08:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E93232080C;
        Thu, 20 Jun 2019 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561032504;
        bh=Hu4fjtFx9KYIeiMqIRLLcDpAkiZGrzLLCm4nvrd1BlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rjWHoVLcgcLJJhpkJqHXWS2v8WcGC+lV6YhSOop3h+Nk7YF56eMv0f5noITVKDEA+
         14PRPi37MfxDDUB0wuAiwZ9BIG3tfTVcTFjwhO3JqOjSHOX8Pnz+49ZiQQTGWGYy39
         OYuXXRvq0dEsC5uqoyZKUOglPkYgSZOdYjBnq5Xg=
Date:   Thu, 20 Jun 2019 14:08:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: remove redundant 'default n' from Kconfig-s
Message-ID: <20190620120821.GA19295@kroah.com>
References: <CGME20190520141434eucas1p266520a2ef8db42b3deee004e1cba3a1f@eucas1p2.samsung.com>
 <79726177-d524-4f83-eeb2-18ae9b2e50cf@samsung.com>
 <874l4ngxl5.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874l4ngxl5.fsf@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 18, 2019 at 10:29:58AM +0300, Felipe Balbi wrote:
> Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com> writes:
> 
> > 'default n' is the default value for any bool or tristate Kconfig
> > setting so there is no need to write it explicitly.
> >
> > Also since commit f467c5640c29 ("kconfig: only write '# CONFIG_FOO
> > is not set' for visible symbols") the Kconfig behavior is the same
> > regardless of 'default n' being present or not:
> >
> >     ...
> >     One side effect of (and the main motivation for) this change is making
> >     the following two definitions behave exactly the same:
> >     
> >         config FOO
> >                 bool
> >     
> >         config FOO
> >                 bool
> >                 default n
> >     
> >     With this change, neither of these will generate a
> >     '# CONFIG_FOO is not set' line (assuming FOO isn't selected/implied).
> >     That might make it clearer to people that a bare 'default n' is
> >     redundant.
> >     ...
> >
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> Fine by me. Greg if you want to take this directly (since it touches
> things all over the place):
> 
> Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> 
> If you prefer that I put this in my pull request to you, just let me know.

I think I already took this :)
