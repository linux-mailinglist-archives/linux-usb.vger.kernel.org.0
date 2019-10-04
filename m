Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8007FCBA49
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 14:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730152AbfJDMXZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 08:23:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:50662 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727451AbfJDMXZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 08:23:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1F5CB20867;
        Fri,  4 Oct 2019 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570191804;
        bh=ar2kC7rdtySGPENEprKl86d8tIFKKkGoZVS904bdgRo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hwmr8URfsWBbEZDx1sk4G2/yfJq1YWgLu5qnllnyhYQ9OpaosHy3eO6qbhE+ZQufY
         D8mRl5pd95qUKDkhQ2B4FXq/xbcx4OFlPfeghlyuEVH/UEoUG5ULhr3xYG6ghpQbas
         op0gwHyiPvawUvcWpIm2sXppYKXisZmw7PzEUmcU=
Date:   Fri, 4 Oct 2019 14:23:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        nkristam@nvidia.com, skomatineni@nvidia.com
Subject: Re: [PATCH v2 0/7] add Tegra194 XUSB host and pad controller support
Message-ID: <20191004122322.GB422178@kroah.com>
References: <20191004081941.4831-1-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004081941.4831-1-jckuo@nvidia.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 04, 2019 at 04:19:34PM +0800, JC Kuo wrote:
> Hi,
> 
> This series introduces support for Tegra194 XUSB host and pad
> controller. Tegra194 XUSB host and pad controller are highly
> similar to the controllers found on Tegra186. Therefore, it's
> possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.
> 
> JC Kuo (7):
>   xhci: tegra: Parameterize mailbox register addresses
>   usb: host: xhci-tegra: Add Tegra194 XHCI support
>   phy: tegra: xusb: Protect Tegra186 soc with config
>   phy: tegra: xusb: Add Tegra194 support
>   dt-bindings: phy: tegra: Add Tegra194 support
>   arm64: tegra: Add XUSB and pad controller on Tegra194
>   arm64: tegra: Enable XUSB host in P2972-0000 board

What changed from v1?  You need to put that somewhere, usually in the
patches themselves, below the --- line.

Or at the very least, in the cover letter.

Given that I can't find it anywhere here, I'll expect a v3 with that
information to be sent soon :(

thanks,

greg k-h
