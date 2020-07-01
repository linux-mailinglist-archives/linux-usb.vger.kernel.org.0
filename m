Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72865210A8F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 13:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730349AbgGALxS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 07:53:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730250AbgGALxR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 07:53:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26A8620663;
        Wed,  1 Jul 2020 11:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593604397;
        bh=tGFdpGZ+ooCmOElFBX4cKChlQwy9IWrwQVWgL5Fs1KI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pV8zYjSMT9dmkx2+Q2nzlaNcKtlv9X1wv4k3+qrVvSGK5pVEBEEwJAK0U6NccBgw7
         TVJq7KLD8PdlHzuIl+jpbtIQpYXeC3Rsvg+WbAKUj3VPJ1K1ZdiI1/6vXVMvimWKjU
         6CROrdS+ZvBFAWStRW3hEx/qEY7zBHkyIeHgrKjA=
Date:   Wed, 1 Jul 2020 13:53:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Lukas Wunner <lukas@wunner.de>, linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fix for v5.8-rc4
Message-ID: <20200701115304.GA2159061@kroah.com>
References: <20200701104427.GP5180@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701104427.GP5180@lahna.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 01, 2020 at 01:44:27PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:
> 
>   Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-fix-for-v5.8-rc4

Pulled and pushed out, thanks.

greg k-h
