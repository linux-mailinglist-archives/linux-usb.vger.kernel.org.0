Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2D11D12C3
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 14:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbgEMMdu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 08:33:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:41936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731785AbgEMMds (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 08:33:48 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BE9720659;
        Wed, 13 May 2020 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589373228;
        bh=MLu2xehcBMQjRdrSC09aHq7gWq6bxP82MsbZrjnz2k0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gp2NLqLhedJYsXvaSPREBwDsLap2oTGtY4+sJS5EO+VruqoCVlPwfTvpFNdWZJH6T
         zCkjYU5L3ApDcP+KBT/Y86yn1N0hCDBAdRjiwHyuKatijZkouofbnRpuLwt5+8h9Vx
         QXxal8/8oS6uRZl51Y1zCsrIF7QvH6ZRJgPa9O0g=
Date:   Wed, 13 May 2020 14:33:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.7-rc
Message-ID: <20200513123326.GA1043427@kroah.com>
References: <87v9l5le8v.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9l5le8v.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 09, 2020 at 11:11:12AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's another pull request for the current -rc cycle. We may have
> another pull request to add a few more fixes to the raw-gadget, but it
> depends on your reply to my query on that thread ;-)
> 
> cheers
> 
> The following changes since commit d5eeab8d7e269e8cfc53b915bccd7bd30485bcbf:
> 
>   Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi (2020-05-08 10:36:56 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git fixes-for-v5.7-rc5

Pulled and pushed out, thanks.

greg k-h
