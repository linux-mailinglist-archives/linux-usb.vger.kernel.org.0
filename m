Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96DF1D6086
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 13:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbgEPL2w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 May 2020 07:28:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgEPL2w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 May 2020 07:28:52 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4187820728;
        Sat, 16 May 2020 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589628531;
        bh=ywqfjkGnB77jZhHpT5lf1JCv2i3wB+loawHMXK7A7KY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gZs9urE7MqYdO6AFC0gmScW5O4RdZkKQhUlntZD3GvoTo/wi1fabkbgODuBSv1wq3
         /6GlzEFI81n80Nv7no4IfYjOdUIfHPPv2vKrxYSTMrIMkBjSLUIX8i9W5GpKxEZYAt
         OkdxcmBDRjEqb9DSxDsn1zv4SuQfGd+Va+kyiuT8=
Date:   Sat, 16 May 2020 13:28:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kbuild test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>
Cc:     Christian Lamparter <chunkeey@googlemail.com>,
        kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [usb:usb-next 56/58] include/linux/unaligned/access_ok.h:8:28:
 error: redefinition of 'get_unaligned_le16'
Message-ID: <20200516112846.GB133224@kroah.com>
References: <202005161756.KxL7u2ha%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202005161756.KxL7u2ha%lkp@intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 16, 2020 at 05:01:16PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
> head:   2478be82de44bee4346eb1f48d4cfa28cd99d2d0
> commit: 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3 [56/58] usb: renesas-xhci: Add the renesas xhci driver
> config: ia64-allmodconfig (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 8bd5741e3145e40c1e4f422fa5f1b9d7fe0644b3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day GCC_VERSION=9.3.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> In file included from drivers/usb/host/xhci-pci-renesas.c:9:
> >> include/linux/unaligned/access_ok.h:8:28: error: redefinition of 'get_unaligned_le16'
> 8 | static __always_inline u16 get_unaligned_le16(const void *p)
> |                            ^~~~~~~~~~~~~~~~~~
> In file included from arch/ia64/include/asm/unaligned.h:5,


Vinod, you need to include another .h file for this file to properly
define this function.

Can you make up a patch for that?

thanks,

greg k-h
