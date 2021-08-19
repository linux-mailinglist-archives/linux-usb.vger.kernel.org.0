Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615FB3F1C16
	for <lists+linux-usb@lfdr.de>; Thu, 19 Aug 2021 16:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240607AbhHSO7w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Aug 2021 10:59:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:46758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240563AbhHSO7u (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Aug 2021 10:59:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 004DE61053;
        Thu, 19 Aug 2021 14:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629385151;
        bh=3u5fV5W+DYzPMuMHRFgpF14TyLFyxVUqKgXoccP/CHw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AXUYZCBiqfXDjWoIORzIKoOCVd/D7VcN0rEiCjMWmM81rxRtn9HULyW8YK1sE4oX4
         jNyiI72aq7m1AYJmSqOrQrOTqSZY7riR8ePp7qm8g5K4cMbE8t18brxNMfCmPXr8ni
         Ergjw2yuBOZ3SYdQFDxwBrcZq/YMY4n8qDZXwBoY=
Date:   Thu, 19 Aug 2021 16:59:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     kernel test robot <lkp@intel.com>,
        clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 54/97] drivers/usb/isp1760/isp1760-hcd.c:735:2:
 warning: Value stored to 'scratch' is never read
 [clang-analyzer-deadcode.DeadStores]
Message-ID: <YR5xuManlukIAf3L@kroah.com>
References: <202108190619.wLK5u4fO-lkp@intel.com>
 <CDNBNHH65Z6Z.3P3H9W04XAHDB@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CDNBNHH65Z6Z.3P3H9W04XAHDB@arch-thunder>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 19, 2021 at 08:47:37AM +0100, Rui Miguel Silva wrote:
> Hi,
> On Wed Aug 18, 2021 at 11:09 PM WEST, kernel test robot wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   e4788edc730a0d2b26e1ae1f08fbb3f635b92dbb
> > commit: 7de14c88272c05d86fce83a5cead36832ce3a424 [54/97] usb: isp1760: remove debug message as error
> > config: riscv-randconfig-c006-20210818 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d2b574a4dea5b718e4386bf2e26af0126e5978ce)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install riscv cross compiling tool for clang build
> >         # apt-get install binutils-riscv64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=7de14c88272c05d86fce83a5cead36832ce3a424
> >         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> >         git fetch --no-tags usb usb-testing
> >         git checkout 7de14c88272c05d86fce83a5cead36832ce3a424
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv clang-analyzer 
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> >
> > clang-analyzer warnings: (new ones prefixed by >>)
> >                    ^      ~
> >    drivers/target/target_core_configfs.c:2627:23: warning: Value stored to 'alua_lu_gp_cg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
> >            struct config_group *alua_lu_gp_cg = &lu_gp->lu_gp_group;
> >                                 ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:2627:23: note: Value stored to 'alua_lu_gp_cg' during its initialization is never read
> >            struct config_group *alua_lu_gp_cg = &lu_gp->lu_gp_group;
> >                                 ^~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:2731:2: warning: Value stored to 'alua_lu_gp_ci' is never read [clang-analyzer-deadcode.DeadStores]
> >            alua_lu_gp_ci = &alua_lu_gp_cg->cg_item;
> >            ^               ~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:2731:2: note: Value stored to 'alua_lu_gp_ci' is never read
> >            alua_lu_gp_ci = &alua_lu_gp_cg->cg_item;
> >            ^               ~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:2748:25: warning: Value stored to 'lu_gp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
> >            struct t10_alua_lu_gp *lu_gp = container_of(to_config_group(item),
> >                                   ^~~~~
> >    drivers/target/target_core_configfs.c:2748:25: note: Value stored to 'lu_gp' during its initialization is never read
> >            struct t10_alua_lu_gp *lu_gp = container_of(to_config_group(item),
> >                                   ^~~~~
> >    drivers/target/target_core_configfs.c:3026:23: warning: Value stored to 'alua_tg_pt_gp_cg' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
> >            struct config_group *alua_tg_pt_gp_cg = &tg_pt_gp->tg_pt_gp_group;
> >                                 ^~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:3026:23: note: Value stored to 'alua_tg_pt_gp_cg' during its initialization is never read
> >            struct config_group *alua_tg_pt_gp_cg = &tg_pt_gp->tg_pt_gp_group;
> >                                 ^~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:3163:2: warning: Value stored to 'alua_tg_pt_gp_ci' is never read [clang-analyzer-deadcode.DeadStores]
> >            alua_tg_pt_gp_ci = &alua_tg_pt_gp_cg->cg_item;
> >            ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:3163:2: note: Value stored to 'alua_tg_pt_gp_ci' is never read
> >            alua_tg_pt_gp_ci = &alua_tg_pt_gp_cg->cg_item;
> >            ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/target/target_core_configfs.c:3179:28: warning: Value stored to 'tg_pt_gp' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
> >            struct t10_alua_tg_pt_gp *tg_pt_gp = container_of(to_config_group(item),
> >                                      ^~~~~~~~
> >    drivers/target/target_core_configfs.c:3179:28: note: Value stored to 'tg_pt_gp' during its initialization is never read
> >            struct t10_alua_tg_pt_gp *tg_pt_gp = container_of(to_config_group(item),
> >                                      ^~~~~~~~
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    6 warnings generated.
> >    drivers/misc/eeprom/at24.c:334:2: warning: Value stored to 'client' is never read [clang-analyzer-deadcode.DeadStores]
> >            client = at24_client->client;
> >            ^        ~~~~~~~~~~~~~~~~~~~
> >    drivers/misc/eeprom/at24.c:334:2: note: Value stored to 'client' is never read
> >            client = at24_client->client;
> >            ^        ~~~~~~~~~~~~~~~~~~~
> >    drivers/misc/eeprom/at24.c:397:2: warning: Value stored to 'client' is never read [clang-analyzer-deadcode.DeadStores]
> >            client = at24_client->client;
> >            ^        ~~~~~~~~~~~~~~~~~~~
> >    drivers/misc/eeprom/at24.c:397:2: note: Value stored to 'client' is never read
> >            client = at24_client->client;
> >            ^        ~~~~~~~~~~~~~~~~~~~
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    5 warnings generated.
> >    drivers/usb/isp1760/isp1760-core.c:490:2: warning: Value stored to 'udc_enabled' is never read [clang-analyzer-deadcode.DeadStores]
> >            udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
> >            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/usb/isp1760/isp1760-core.c:490:2: note: Value stored to 'udc_enabled' is never read
> >            udc_enabled = ((devflags & ISP1760_FLAG_ISP1763) ||
> >            ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    4 warnings generated.
> >    Suppressed 4 warnings (4 in non-user code).
> >    Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >    9 warnings generated.
> > >> drivers/usb/isp1760/isp1760-hcd.c:735:2: warning: Value stored to 'scratch' is never read [clang-analyzer-deadcode.DeadStores]
> >            scratch = isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
> >            ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> yeah, this is desired behaviour, this read is only to make sure  that
> we make something different than the pattern to test go over the bus.
> However I will take a look to this warning and other clang warnings
> that I am seeing in this report.

This is why I hate this type of warning, doing a read like this is
totally normal for drivers.  Compilers that think this is something they
can ignore or warn about are just wrong.

greg k-h
