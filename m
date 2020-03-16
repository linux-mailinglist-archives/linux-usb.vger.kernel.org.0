Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA49A1865A6
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 08:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729867AbgCPH0K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 03:26:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:50020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729662AbgCPH0K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Mar 2020 03:26:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7F2820663;
        Mon, 16 Mar 2020 07:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584343570;
        bh=h1FYaT1UBdegTD3IizwhaTxnMbeIHr6tKFiJOPo/5sA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0Me6eTB22r8oZTRioVku7RXbniYL+UzjuRxE5wFH71mfLpaBfm0nYBGnV010wOE9v
         l4wMI09KziG1hQ9pdVlVqt4swQu2MA2HqokRwTkKDKhxksdjz8zpe/KmGc4O86kD2q
         Su01geODtXPHOlnEKlx+uPkx6kt5dZ8BnTN8vWg8=
Date:   Mon, 16 Mar 2020 08:26:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB for v5.7 merge window
Message-ID: <20200316072604.GC3019942@kroah.com>
References: <87wo7lenor.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wo7lenor.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 15, 2020 at 03:45:56PM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Man... I did it! I managed to get through all 500+ patches in time. I
> can't believe it.
> 
> For everyone involved, I'm sorry for the delay, but I've been super busy
> at work. I genuinely apologize for this and will try to better plan my
> week to guarantee at least 3 hours a week to look at the mailing list.
> 
> Greg,
> 
> If you want anything to be changed, let me know.
> 
> Cheers
> 
> The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:
> 
>   Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git usb-for-v5.7

Hm, I hit the issue that Stephen also hit with the merge and build
breakage.

Then I hit this problem too:

Commit: 238d76021654 ("usb: dwc3: meson-g12a: Don't use ret uninitialized in dwc3_meson_g12a_otg_init")
	Fixes tag: Fixes: 729149c53f04 ("usb: dwc3: Add Amlogic A1 DWC3 glue")
	Has these problem(s):
	        - Target SHA1 does not exist

I'll "override" the failure in my scripts, as I don't want you to have
to rebase your tree, but something is odd there...

thanks,

greg k-h
