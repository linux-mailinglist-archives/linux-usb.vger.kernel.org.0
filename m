Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECC23A3CF1
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jun 2021 09:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhFKHYk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Jun 2021 03:24:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229960AbhFKHYk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Jun 2021 03:24:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 248B0610F8;
        Fri, 11 Jun 2021 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623396162;
        bh=Cp6fO+PCxm6STENol6t0PGRjjwkS1oKmhsU9cnhgiMQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IjIhNEiwUcfwP7aZCiJgMT1Pp5h7lSV48ImYVpdpeCjfKCqm9mZr5A1WC3wl68DXP
         kCD66XWAQ9VrKQIuSLyxFt675icStXvOyapMUwRHOvhOevGv77c0uBiACrU9bAtxXk
         azMCPjhRShEqRgqEa7JquXzxMPKFMi7QIvctlgUI=
Date:   Fri, 11 Jun 2021 09:22:40 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Joel Stanley <joel@jms.id.au>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org
Subject: Re: [usb:usb-linus 35/37] fsl_udc_core.c:undefined reference to
 `fsl_udc_clk_release'
Message-ID: <YMMPQIbXlkbNj0/U@kroah.com>
References: <202106110857.GQXdisAN-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106110857.GQXdisAN-lkp@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 11, 2021 at 08:07:05AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> head:   142d0b24c1b17139f1aaaacae7542a38aa85640f
> commit: e0e8b6abe8c862229ba00cdd806e8598cdef00bb [35/37] usb: gadget: fsl: Re-enable driver for ARM SoCs
> config: arm-defconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=e0e8b6abe8c862229ba00cdd806e8598cdef00bb
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-linus
>         git checkout e0e8b6abe8c862229ba00cdd806e8598cdef00bb
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Now reverted.
