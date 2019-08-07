Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB8FC848B2
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 11:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfHGJiZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 05:38:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:49004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726331AbfHGJiY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Aug 2019 05:38:24 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88370222FC;
        Wed,  7 Aug 2019 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565170704;
        bh=ZL4CgxPsKm2hvXd32f4E5XphLtZSOHjn+n6Wc2C3sVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2PMllsN3ttU4+lfJn1+DS0Rx2P6CuH5GiDlr2VqbLR0dFhl5wqposTNqmmEcGl4j5
         zH1hewgC/OwnK6/4ArG5GHaKFDq1lsWm3eEtm7pBcv5ZAD/ZO4sT8uu4ckiG539ZQu
         odXVAOIZQ4SHjmMfMkuzcK1dp2aHxdoVjlKuWKLE=
Date:   Wed, 7 Aug 2019 11:38:21 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     kbuild test robot <lkp@intel.com>
Cc:     linux-usb@vger.kernel.org, kbuild-all@01.org
Subject: Re: [PATCH] USB: phy: fsl-usb: convert platform driver to use
 dev_groups
Message-ID: <20190807093821.GB8326@kroah.com>
References: <20190806073235.25140-2-gregkh@linuxfoundation.org>
 <201908071732.O6r4Gxo9%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201908071732.O6r4Gxo9%lkp@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 07, 2019 at 05:01:22PM +0800, kbuild test robot wrote:
> Hi Greg,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on usb/usb-testing]
> [cannot apply to v5.3-rc3]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Greg-Kroah-Hartman/USB-phy-fsl-usb-convert-platform-driver-to-use-dev_groups/20190807-021855
> base:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> config: arm64-allyesconfig (attached as .config)
> compiler: aarch64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=arm64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All error/warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/kobject.h:20:0,
>                     from include/linux/module.h:17,
>                     from drivers/usb/phy/phy-fsl-usb.c:11:
> >> drivers/usb/phy/phy-fsl-usb.c:1050:18: error: 'fsl_otg_attrs_attrs' undeclared here (not in a function); did you mean 'fsl_otg_attrs_group'?
>     ATTRIBUTE_GROUPS(fsl_otg_attrs);
>                      ^

Argh, that's what i get for not compiling the code...

Will resend a fix...

thanks,

greg k-h
