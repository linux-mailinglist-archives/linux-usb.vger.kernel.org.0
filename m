Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 399AC227F9F
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 14:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgGUMK0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 08:10:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:40450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726904AbgGUMK0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Jul 2020 08:10:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ED20206E9;
        Tue, 21 Jul 2020 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595333425;
        bh=3ztHPLRuvAYHfMj85OVDvlDJGicrpYlIuLYbeLlVLZU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M8xJALv/Uwzsm1bwx969XgnrN3Dwp9D2rYnmhFU/VZ6buvNoK4bAY0+ip6PlOUSro
         N/AJ1zxnbd/621pghJ3QxHolgm0rGjgiYDyqmV58O22a+ipipSAfhzZnHg4kIR0YNq
         /K1hnhaWEFcnRbzq0xkoggzuRLp5DjvSk0oDESEQ=
Date:   Tue, 21 Jul 2020 14:09:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 changes for v5.9 merge window
Message-ID: <20200721120933.GA1826843@kroah.com>
References: <20200721114252.GD5180@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721114252.GD5180@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 21, 2020 at 02:42:52PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:
> 
>   Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.9

Pulled and pushed out, thanks.

> for you to fetch changes up to ef7e12078ab832c72315adcfa05e7a9498a5e109:
> 
>   thunderbolt: Fix old style declaration warning (2020-07-02 14:50:11 +0300)
> 
> ----------------------------------------------------------------
> thunderbolt: Changes for v5.9 merge window
> 
> This includes following Thunderbolt/USB4 changes for v5.9 merge window:
> 
>   * Improvements around NHI (Native Host Interface) HopID allocation
> 
>   * Improvements to tunneling and USB3 bandwidth management support
> 
>   * Add KUnit tests for path walking and tunneling
> 
>   * Initial support for USB4 retimer firmware upgrade
> 
>   * Implement Thunderbolt device firmware upgrade mechanism that runs
>     the NVM image authentication when the device is disconnected.
> 
>   * A couple of small non-critical fixes
> 
> ----------------------------------------------------------------
> 
> Please notice when merged with kunit-next tree there will be a build
> error because the one member (allocation) of struct kunit_resource was
> renamed with linux-next commit d4cdd146d0db ("kunit: generalize
> kunit_resource API beyond allocated resources"). Linux-next carries a
> fix that is at the end of this email to solve the issue (from Stephen
> Rothwell).
> 
> Let me know if you prefer that I merge kunit-next branch to my -next
> branch and resolve it there first.

Nah, that branch can worry about things when it gets to Linus :)

thanks,

greg k-h
