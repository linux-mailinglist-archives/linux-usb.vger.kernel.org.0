Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CE021B34C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 12:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbgGJKlQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 06:41:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:45072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726945AbgGJKkr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jul 2020 06:40:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A427B207DF;
        Fri, 10 Jul 2020 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594377647;
        bh=nTp80whjj6DejQJD0sEOCFcTUoowt9sbz1zPTvRvmKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r8QP8OB/Cig/M/T7IO5KBVCGBzRO2yLuACT3FwJbgRp1TTFPyYdhd01NMwLYLh60m
         aSEYi463iFKsp4tZQmOMq2Y1MtxitnCEQNpH8qzCGDDdAwVKTgsitZLc3c5nz5famS
         p2ZyhpnlBcGOrWJ1XXC66jRpf4t6qfGFcirDSp5A=
Date:   Fri, 10 Jul 2020 12:40:36 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.8-rc3
Message-ID: <20200710104036.GE1203263@kroah.com>
References: <87pn93ep85.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pn93ep85.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 10, 2020 at 11:41:46AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's my second pull request for the current merge window. Nothing
> major going on apart from the spinlock fix in legacy audio function and
> a memleak plug on gr_udc.
> 
> Patches have been cooking for quite a while. Let me know if you want
> anything to be changed
> 
> cheers
> 
> The following changes since commit af3cf0ac6805a36740089a5f200c28a04d452404:
> 
>   Merge tag 'usb-serial-5.8-rc5' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2020-07-08 17:10:17 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.8-rc3

Pulled and pushed out, thanks!

greg k-h
