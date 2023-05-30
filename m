Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A32B715813
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 10:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjE3IMZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 04:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbjE3IMY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 04:12:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3055FA1
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 01:12:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B97E5622A8
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 08:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98299C433EF;
        Tue, 30 May 2023 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685434342;
        bh=kS2mrF9PGWsWrlOTVBU5DsSqavsm9yK6eCyL/yUVQdA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hT8i55X18fceOYZKKWQnP6bPS7YnSx+o2E6LzcvnwydgAiBQmfW1kx0gae+wFbj1U
         /4n0oqrSJ3a4xFIWYRt1NcoECQ5xwODuHqzuNcDDe4+N4g1srXOhB9kH9Z2rQsN5I1
         IWLPsjZsPVkypfFxRIGogp/8IiZDrXQktr37ukL0=
Date:   Tue, 30 May 2023 09:12:19 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Minda Chen <minda.chen@starfivetech.com>,
        oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: Re: [usb:usb-testing 25/35] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST()
 instead
Message-ID: <2023053053-browsing-palpitate-5f87@gregkh>
References: <202305300608.8CuLyqAL-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305300608.8CuLyqAL-lkp@intel.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 30, 2023 at 06:14:21AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   046895105d9666ab56e86ce8dd9786f8003125c6
> commit: bfb46b424652a3396b92ca3c96c169ade9b45b8d [25/35] usb: cdns3: Add StarFive JH7110 USB driver
> config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230530/202305300608.8CuLyqAL-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=bfb46b424652a3396b92ca3c96c169ade9b45b8d
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout bfb46b424652a3396b92ca3c96c169ade9b45b8d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305300608.8CuLyqAL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for USB_STRAP_HOST() instead
> 
> 
> vim +23 drivers/usb/cdns3/cdns3-starfive.c
> 
>     22	
>   > 23	#define USB_STRAP_HOST			BIT(17)
>     24	#define USB_STRAP_DEVICE		BIT(18)
>     25	#define USB_STRAP_MASK			GENMASK(18, 16)
>     26	

I'm sorry, I don't understand this "warning" here.  There is no cdns3()
function anywhere, so why should it be "expected"?

thanks,

greg k-h
