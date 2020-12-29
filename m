Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 927822E6FAE
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 11:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgL2Kh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 05:37:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:33270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgL2Kh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 05:37:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1B83207C9;
        Tue, 29 Dec 2020 10:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609238235;
        bh=dQjtezn6ib+POINlHOH6TWd+1MDYxlHX1oXPPZ3Mhpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UsD7T7wXl/eMDHsaFEXDEfe3U0ThOqxPKIHFLDZRF9h4WjlJ0EfJEXN+c6/sqrOIu
         EHDJbwXLTHn+FcEWfZr3a/Etp6eXGXb4G7l135yNyrIL5NKuGwZYHaq/JHEmNQtZTG
         /r38pzrF95dWjspzm2orD8biMcYmgetkfYoWf47c=
Date:   Tue, 29 Dec 2020 11:38:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 8/8]
 drivers/usb/gadget/function/u_audio.c:248:9: warning: implicit conversion
 from 'unsigned long long' to 'unsigned long' changes value from 4294967296
 to 0
Message-ID: <X+sHKyfBnrT/8dIG@kroah.com>
References: <202012291638.QiDQi3Gs-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202012291638.QiDQi3Gs-lkp@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 29, 2020 at 04:38:44PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
> commit: 32510cf5e554e8f2cecafea8b8cc11daa4afb9e6 [8/8] usb: gadget: u_audio: factorize ssize to alsa fmt conversion
> config: arm-randconfig-r003-20201229 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project cee1e7d14f4628d6174b33640d502bff3b54ae45)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout 32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/usb/gadget/function/u_audio.c:248:9: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0 [-Wconstant-conversion]
>                    ret = SNDRV_PCM_FMTBIT_S24_3LE;
>                        ~ ^~~~~~~~~~~~~~~~~~~~~~~~
>    include/sound/pcm.h:170:34: note: expanded from macro 'SNDRV_PCM_FMTBIT_S24_3LE'
>    #define SNDRV_PCM_FMTBIT_S24_3LE        _SNDRV_PCM_FMTBIT(S24_3LE)
>                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/sound/pcm.h:139:39: note: expanded from macro '_SNDRV_PCM_FMTBIT'
>    #define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
>                                             ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.

I'm dropping this patch from my tree now, thanks.

greg k-h
