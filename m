Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9FC05AA88C
	for <lists+linux-usb@lfdr.de>; Fri,  2 Sep 2022 09:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiIBHL6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Sep 2022 03:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiIBHL5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Sep 2022 03:11:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCE953D38
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 00:11:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97EBD62052
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 07:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDB0C433D6;
        Fri,  2 Sep 2022 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662102715;
        bh=e3wfoOXNqB4e9v10cVo1zs6I9Kg09agO+AMgKxziAzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mEKll9FhbTh9oHd/Q2Tl3dmrydkvsSAlKLldKBVUu4UcuSrw597ZBgoaxtP/uhXd2
         oPN+vmoo14I8A26/8r3kiy1cGYJXxtjxmnPdYCJOiu044cgzSegc2Kgf0MNHRWIxJh
         kuBuepVGx+2qfZnQXmXbCfq7xc68ySJ2YDYzdD2w=
Date:   Fri, 2 Sep 2022 09:11:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Piyush Mehta <piyush.mehta@amd.com>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [usb:usb-linus 33/42]
 drivers/usb/gadget/udc/udc-xilinx.c:502:25: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <YxGsuFERTuz0puLP@kroah.com>
References: <202209020044.CX2PfZzM-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209020044.CX2PfZzM-lkp@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 02, 2022 at 01:07:15AM +0800, kernel test robot wrote:
> Hi Piyush,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
> head:   a6aedb58a887aa2ea142ee914ff4030d019584bf
> commit: 8cb339f1c1f04baede9d54c1e40ac96247a6393b [33/42] usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
> config: arm-randconfig-s033-20220901 (https://download.01.org/0day-ci/archive/20220902/202209020044.CX2PfZzM-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.4-39-gce1a6720-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=8cb339f1c1f04baede9d54c1e40ac96247a6393b
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-linus
>         git checkout 8cb339f1c1f04baede9d54c1e40ac96247a6393b
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/usb/gadget/udc/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>

I've now reverted this offending commit.

Piyush, please fix up and resend a commit that works properly.

thanks,

greg k-h
