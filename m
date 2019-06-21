Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2624F4E07B
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 08:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfFUGRE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 02:17:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbfFUGRE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jun 2019 02:17:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29FE4208C3;
        Fri, 21 Jun 2019 06:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561097823;
        bh=LtLsHcIO+Y4Hyt28BA0WwAx1H0XSf13sggiAgxBdccw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QJk4FYEmfmVKKm8kTizUde/fxyLUOgiQipCTYfts/LhsBphciUJOo7Xti8jk2PT9g
         MgCIesIkKmPQa0zKtuchCNLxjycN0PckYR5o7gL9f7dMMQdNWN6spf9kor6zq+AuIt
         /2CmjL2/978ZxIYAb8QlSyyjiP+C0UN/zPzGe4OY=
Date:   Fri, 21 Jun 2019 08:16:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     dmg <dmg@turingmachine.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 46/46] drivers/usb//misc/adutux.c:375:4:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 5 has type 'size_t {aka unsigned int}'
Message-ID: <20190621061613.GA29018@kroah.com>
References: <201906202227.KeVsA81p%lkp@intel.com>
 <87wohgs3lh.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wohgs3lh.fsf@mn.cs.uvic.ca>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 20, 2019 at 08:01:30AM -0700, dmg wrote:
> 
> kbuild test robot <lkp@intel.com> writes:
> 
> [...]
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from include/linux/printk.h:332:0,
> >                     from include/linux/kernel.h:15,
> >                     from drivers/usb//misc/adutux.c:19:
> >    drivers/usb//misc/adutux.c: In function 'adu_read':
> >>> drivers/usb//misc/adutux.c:375:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t {aka unsigned int}' [-Wformat=]
> >        "%s : while, data_in_secondary=%lu, status=%d\n",
> 
> I am not sure what is the best way to address this warning.
> 
> size_t seems to be architecture dependent. On my computer (intel64)
> size_t is long unsigned int, but in this test it is int unsigned.
> 
> Are there any suggestions on what is the best way to deal with this?
> 
> casting size_t to long unsigned int will work, but it sounds kind of
> ugly.

As others have pointed out, there's a printk modifier for this.

I'll go drop your patch from my testing branch now, please fix up your
patch and resend.

thanks,

greg k-h
