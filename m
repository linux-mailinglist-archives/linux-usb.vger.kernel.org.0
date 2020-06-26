Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA67020B460
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 17:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgFZPVe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 11:21:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:32944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgFZPVe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Jun 2020 11:21:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2EE9720773;
        Fri, 26 Jun 2020 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593184893;
        bh=nxdAYeGzgi/sUF7ooW87wfEcnLLdJMPgKdZxwsAPmgc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C6QEIAAKkC3o2nw96DRYHou3qJxt0LUGm9Kz4HT4umcbuYuBAMq0BZb4dSZNxJ8YS
         o4xWtECPgTndWEGwJLEnoa02zZLjyBQ2ZfJ7Fbpg1rgb4gZ8KqOI1mxyBA7jNHhc8O
         ompd0uqMgwoXV7snIkp+9Ad8ANOd6ibV3Gl/9qyw=
Date:   Fri, 26 Jun 2020 17:21:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB: fixes for v5.8-rc
Message-ID: <20200626152129.GA1406874@kroah.com>
References: <87bll65njd.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bll65njd.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 09:49:58AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's the first set of fixes for the current -rc cycle. Patches have
> been soaking for a while now.
> 
> Let me know if you want anything to be changed.
> 
> cheers
> 
> PS: your branch is in -rc1, mine is in -rc2. Would you prefer that I
> rebase or can you merge -rc2 on your usb-linus?
> 
> The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:
> 
>   Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.8-rc2

Now pulled and pushed out, thanks.

greg k-h
