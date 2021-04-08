Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26295357FE6
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 11:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhDHJur (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 05:50:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:46674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229686AbhDHJur (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 05:50:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B105D61158;
        Thu,  8 Apr 2021 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617875436;
        bh=e/FRnjd/5ClrN1r/m4tdfdOQvWHKIl6nbZTzS6xIaA8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=caIfGSnYU0Qn5RQoPIfxPVthHEnEQqUT5fak37ibpizmpWuiBHKYByJ5eo916rp2W
         fSVr1kzXpbz78ea3YsVTHKA4GgRRf/EkU8Ci+z0HGRHtqlhiY9l5B/3+KQT3iYzoZ8
         Wvkw0sIU+X+0eVfdOribzbBfsyWqyvNqn9A5QnoU=
Date:   Thu, 8 Apr 2021 11:50:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] Thunderbolt/USB4 fixes for v5.12-rc7
Message-ID: <YG7R6bBDY3V69DXu@kroah.com>
References: <20210408090021.GX2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408090021.GX2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 08, 2021 at 12:00:21PM +0300, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit a5e13c6df0e41702d2b2c77c8ad41677ebb065b3:
> 
>   Linux 5.12-rc5 (2021-03-28 15:48:16 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v5.12-rc7

Pulled and pushed out, thanks.

greg k-h
