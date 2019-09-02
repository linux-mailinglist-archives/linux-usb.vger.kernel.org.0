Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67B24A5BD2
	for <lists+linux-usb@lfdr.de>; Mon,  2 Sep 2019 19:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfIBR2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Sep 2019 13:28:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726275AbfIBR2T (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Sep 2019 13:28:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE12121670;
        Mon,  2 Sep 2019 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567445296;
        bh=NORXpO/RkFRq14VzTF9zUY+rap/+StXem0rPMIj2/pk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iXYwCywkDI56LsxDfApKO9MDZKYOScQjoIUsB7XIDPZTNnxKO3a1H9+isn2tq9ObV
         FZUwjpWbA28Sj1dDI0zjux0KOlieVPbnrwKqa57ffTFLqdZtF/yINoCITEIvBTM31e
         VA5Za/1JplcqZBlQyLzXG6vZ7CSAB+IUnonVofAY=
Date:   Mon, 2 Sep 2019 19:28:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB changes for v5.4 merge window
Message-ID: <20190902172813.GA16175@kroah.com>
References: <87o907uia3.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o907uia3.fsf@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 30, 2019 at 12:14:28PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's my pull request for the next merge window. The biggest chunk is
> the addition of Cadence USB3 DRD Driver which, finally, compiles on x86,
> ARM and ARM64 without any issues. I haven't gotten any failure reports
> from 0-day either.
> 
> Relevant changes have been testing on platforms I have access to. Most
> importantly the generalization of the dwc3 control request decoders
> didn't cause any visible regressions that I could trigger.
> 
> Let me know if you want anything to be changed.
> 
> cheers
> 
>  ____________ 
> < New Driver >
>  ------------ 
>         \   ^__^
>          \  (oo)\_______
>             (__)\       )\/\
>                 ||----w |
>                 ||     ||
> 
> The following changes since commit e21a712a9685488f5ce80495b37b9fdbe96c230d:
> 
>   Linux 5.3-rc3 (2019-08-04 18:40:12 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.4
> 
> for you to fetch changes up to 18a93cd38be3e69ac5b067c570a78a369b79e31d:
> 
>   usb: gadget: net2280: Add workaround for AB chip Errata 11 (2019-08-30 09:27:33 +0300)
> 
> ----------------------------------------------------------------
> USB: Changes for v5.4 merge window
> 
> With only 45 non-merge commits, we have a small merge window from the
> Gadget perspective.
> 
> The biggest change here is the addition of the Cadence USB3 DRD
> Driver. All other changes are small, non-critical fixes or smaller new
> features like the improvement to BESL handling in dwc3.
> 
> Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>

Pulled and pushed out, thanks.

greg k-h
