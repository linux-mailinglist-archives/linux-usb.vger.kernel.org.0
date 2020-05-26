Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0891B5C2C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 15:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgDWNKI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 09:10:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:46596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbgDWNKI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Apr 2020 09:10:08 -0400
Received: from localhost (unknown [117.99.83.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D33B2076C;
        Thu, 23 Apr 2020 13:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587647407;
        bh=MrQ+RugElkiTg9LS3wQOxTE4aNNFTFJUQOB/dDU+5CQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AfAUNrxEz39CiNj1NAA5PSI+xEO/tfJFTFAkkF6Pf5hL5qVQkrkykiobJ+iHeU1Sj
         QpSZgBb/jJID6xz1gRuflsOrbhpJhUi6Bt5lE49yrFbJn1B0qjiULC4J/oesIJxmHq
         BgkPy1gIo3Y4TIOfXIqwEfMSIkVSDLPJre3RTcsU=
Date:   Thu, 23 Apr 2020 18:40:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/5] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20200423131000.GJ72691@vkoul-mobl>
References: <20200414164152.2786474-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414164152.2786474-1-vkoul@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14-04-20, 22:11, Vinod Koul wrote:
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> 
> This includes patches from Christian which supported these controllers w/o
> ROM and later my patches for ROM support and debugfs hook for rom erase and
> export of xhci-pci functions.

Any feedback Mathias ?

> 
> Changes in v9:
>  Make fw load a sync call and have single instance of probe execute,
>    elimating probe/remove races
>  Add quirk for renesas and use that for loading
> 
> Changes in v8:
>  Fix compile error reported by Kbuild-bot by making usb_hcd_pci_probe() take
>  const struct hc_driver * as argument
> 
> Changes in v7:
>  Make a single module which removes issues with module loading
>  Keep the renesas code in renesas file
>  Add hc_driver as argument for usb_hcd_pci_probe and modify hdc drivers to
>    pass this and not use driver_data
>  Use driver data for fw name
>  Remove code to check if we need to load firmware or not
>  remove multiple fw version support, we can do that with symlink in
>    userspace
> 
> Changes in v6:
>  Move the renesas code into a separate driver which invokes xhci-pci functions.
> 
> Changes in v5:
>  Added a debugfs rom erase patch, helps in debugging
>  Squashed patch 1 & 2 as requested by Mathias
> 
> Changes in v4:
>  Rollback the delay values as we got device failures
> 
> Changes in v3:
>   Dropped patch 2 as discussed with Christian
>   Removed aligned 8 bytes check
>   Change order for firmware search from highest version to lowest
>   Added entry for new firmware for device 0x14 as well
>   Add tested by Christian
> 
> Changes in v2:
>   used macros for timeout count and delay
>   removed renesas_fw_alive_check
>   cleaned renesas_fw_callback
>   removed recurion for renesas_fw_download
>   added MODULE_FIRMWARE
>   added comment for multiple fw order
> 
> Christian Lamparter (1):
>   usb: renesas-xhci: Add the renesas xhci driver
> 
> Vinod Koul (4):
>   usb: hci: add hc_driver as argument for usb_hcd_pci_probe
>   usb: xhci: Add support for Renesas controller with memory
>   usb: renesas-xhci: Add ROM loader for uPD720201
>   usb: xhci: provide a debugfs hook for erasing rom
> 
>  drivers/usb/core/hcd-pci.c          |   7 +-
>  drivers/usb/host/Makefile           |   3 +-
>  drivers/usb/host/ehci-pci.c         |   6 +-
>  drivers/usb/host/ohci-pci.c         |   9 +-
>  drivers/usb/host/uhci-pci.c         |   8 +-
>  drivers/usb/host/xhci-pci-renesas.c | 740 ++++++++++++++++++++++++++++
>  drivers/usb/host/xhci-pci.c         |  47 +-
>  drivers/usb/host/xhci-pci.h         |  16 +
>  drivers/usb/host/xhci.h             |   1 +
>  include/linux/usb/hcd.h             |   3 +-
>  10 files changed, 817 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/usb/host/xhci-pci-renesas.c
>  create mode 100644 drivers/usb/host/xhci-pci.h
> 
> -- 
> 2.25.1

-- 
~Vinod
