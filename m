Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BB54394A3
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 13:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbhJYLU7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 07:20:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:53896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230126AbhJYLU7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 Oct 2021 07:20:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C962B60238;
        Mon, 25 Oct 2021 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635160717;
        bh=lM7hS4l9qhcjd6y8dMuikuMZzl0+gJPK82cNHjz4p9g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lNzNr5igoxPsaEvJsaM+Bo52UKRDBAgihEaRuvG5T/lMbNjoQ9Wx+jMvsDs8Y8vDh
         2Q6y+vbMh563iCZxh3RPCcowocFll/qBcdqUwsfoEIr/R3kE9OUggutDgBdXdM7pnK
         p1M+D2UnFidiLApkXed1+fAxkRUsGXdXuCGW9Kvw=
Date:   Mon, 25 Oct 2021 13:18:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.16 merge window
Message-ID: <YXaSi6AI33fYWTUW@kroah.com>
References: <YXaPQ1p8c6PfTiOh@lahna>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXaPQ1p8c6PfTiOh@lahna>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 25, 2021 at 02:04:35PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:
> 
>   Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.16-rc1

Pulled in and pushed out, thanks!

greg k-h
