Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602B233B333
	for <lists+linux-usb@lfdr.de>; Mon, 15 Mar 2021 14:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhCONC6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 09:02:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:37450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229553AbhCONCb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 09:02:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC31D64EB3;
        Mon, 15 Mar 2021 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615813351;
        bh=s8r8MuvqJ9UWmruu6dUTtRYoO31pqSuatkp8G/BX3eU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IfBgN6ivI2d3ahNGwkBSXqLnaX+Fg+AIgaZXuNjuDb7UIIRW6r2IFKuY1T9FT6LO+
         dFADCuYgA2tK2/ZmV8dmBunZ4OPwFrJVbU0fTDubzy0g0YW7PU+AAvYUy0NvJbarb3
         L+FVoTUcaFOQGl/an4P+IEcieBZxEm1w4QkyiLnk=
Date:   Mon, 15 Mar 2021 14:02:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v5.12-rc4
Message-ID: <YE9a5aAgaAZ5LiN6@kroah.com>
References: <20210315115703.GL2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315115703.GL2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 15, 2021 at 01:57:03PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.12-rc4

Pulled and pushed out, thanks.

greg k-h
