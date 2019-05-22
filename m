Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0215C26449
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 15:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbfEVNIQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 May 2019 09:08:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:51684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729071AbfEVNIQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 May 2019 09:08:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1AEA2089E;
        Wed, 22 May 2019 13:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558530495;
        bh=9hOhTQl2V7qn9hFkKXkCp9w2ZhYOgjQedIGLf96JzQY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vcPucwvGZg9LhY8UwPKC6LWciCKwEHCnKqZQhfFUF1/+x4VfFdM0ZATv19ra6ApSo
         k22iAxk1m8KCb/VaxKCzr+OfpUmegmBn1TaxEeTBWxgXLu0plERe/EpW/tNpwAJA6d
         4EI6PA3Mk8DpaDSiDDS53/cO613tiV4QQTnE2Ra8=
Date:   Wed, 22 May 2019 15:08:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Henry Lin <henryl@nvidia.com>, kbuild-all@01.org,
        linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     kbuild test robot <lkp@intel.com>
Subject: Re: [usb:usb-linus 12/16] drivers/usb/host/xhci-ring.c:676:19:
 warning: format '%ld' expects argument of type 'long int', but argument 3
 has type 'size_t {aka unsigned int}'
Message-ID: <20190522130812.GA28524@kroah.com>
References: <201905222054.UDLJMD50%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201905222054.UDLJMD50%lkp@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 22, 2019 at 08:54:56PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> head:   f7fac17ca925faa03fc5eb854c081a24075f8bad
> commit: 597c56e372dab2c7f79b8d700aad3a5deebf9d1b [12/16] xhci: update bounce buffer with correct sg num
> config: i386-randconfig-x018-201920 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         git checkout 597c56e372dab2c7f79b8d700aad3a5deebf9d1b
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/dma-mapping.h:7:0,
>                     from drivers/usb/host/xhci-ring.c:57:
>    drivers/usb/host/xhci-ring.c: In function 'xhci_unmap_td_bounce_buffer':
> >> drivers/usb/host/xhci-ring.c:676:19: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
>       xhci_warn(xhci, "WARN Wrong bounce buffer read length: %ld != %d\n",
>                       ^
>    include/linux/device.h:1400:22: note: in definition of macro 'dev_fmt'
>     #define dev_fmt(fmt) fmt
>                          ^~~
> >> drivers/usb/host/xhci.h:1920:2: note: in expansion of macro 'dev_warn'
>      dev_warn(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
>      ^~~~~~~~
> >> drivers/usb/host/xhci-ring.c:676:3: note: in expansion of macro 'xhci_warn'
>       xhci_warn(xhci, "WARN Wrong bounce buffer read length: %ld != %d\n",
>       ^~~~~~~~~
>    drivers/usb/host/xhci-ring.c: In function 'xhci_align_td':
>    drivers/usb/host/xhci-ring.c:3169:5: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'size_t {aka unsigned int}' [-Wformat=]
>         "WARN Wrong bounce buffer write length: %ld != %d\n",
>         ^
>    include/linux/device.h:1400:22: note: in definition of macro 'dev_fmt'
>     #define dev_fmt(fmt) fmt
>                          ^~~
> >> drivers/usb/host/xhci.h:1920:2: note: in expansion of macro 'dev_warn'
>      dev_warn(xhci_to_hcd(xhci)->self.controller , fmt , ## args)
>      ^~~~~~~~
>    drivers/usb/host/xhci-ring.c:3168:4: note: in expansion of macro 'xhci_warn'
>        xhci_warn(xhci,
>        ^~~~~~~~~

Can someone send me a follow-on patch to fix this up please?

thanks,

greg k-h
