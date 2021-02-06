Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E98BF311C04
	for <lists+linux-usb@lfdr.de>; Sat,  6 Feb 2021 08:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhBFHtT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Feb 2021 02:49:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:52046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229492AbhBFHtO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 6 Feb 2021 02:49:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D132964FBA;
        Sat,  6 Feb 2021 07:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612597714;
        bh=36HJ8WEgnbXLj3vqggXJ91+qX7tBAyfqOVHma0V58H8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BfDF1cwzZwHemiNSNK1HqUL2C3WVnEpUDzMInH1+VAAO4QNdc4DdmY2VqU6z5cyv/
         +sItuBZIH00bvgGSTDYoTtm4/gKN4zi6llja0MAbK/pS3qB+hRoEFspWbm45HSfbGu
         ZdIn6J8e8fOEd67ft6V67+h/XNkZx5Wn7qSfkhcvPGtH32DRUDh3GmZmy23Of+9hd1
         h7F2B+q80Pmb4U5bDYm4JJoCPjAmQhpRf4LTVEi/gUOSkWSfg0tNVdmVT6klwdctLm
         osE9Rc1MVd12nq66MKRKLdIzvblmdZZEtNNjEXQdJtxVOHHk49ilQDlSaYK4tbNWRM
         eRW5czALz9fhw==
Date:   Sat, 6 Feb 2021 15:48:29 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>
Cc:     pawell@cadence.com, a-govindraju@ti.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        lznuaa@gmail.com, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/1] usb: cdns3: add power lost support for system resume
Message-ID: <20210206074829.GB2648@b29397-desktop>
References: <20210202170121.29777-1-Frank.Li@nxp.com>
 <202102031214.AhcjqrgE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202102031214.AhcjqrgE-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-02-03 12:19:05, kernel test robot wrote:
> Hi Frank,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on peter.chen-usb/for-usb-next]
> [also build test ERROR on next-20210125]
> [cannot apply to v5.11-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Frank-Li/usb-cdns3-add-power-lost-support-for-system-resume/20210203-011535
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git for-usb-next
> config: riscv-allmodconfig (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/a41cbdf2c0138a8c317d84fa967c0ebcc5396dd3
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Frank-Li/usb-cdns3-add-power-lost-support-for-system-resume/20210203-011535
>         git checkout a41cbdf2c0138a8c317d84fa967c0ebcc5396dd3
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "cdns_power_is_lost" [drivers/usb/cdns3/cdns3.ko] undefined!
> 

Frank, would you please fix this build error as well as Pawel's
comments, then, send again.

-- 

Thanks,
Peter Chen

