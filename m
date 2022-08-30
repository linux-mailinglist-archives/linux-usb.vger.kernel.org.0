Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0525A694F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 19:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiH3RM1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 13:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbiH3RMV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 13:12:21 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8F0F3B95B3
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 10:12:15 -0700 (PDT)
Received: (qmail 164303 invoked by uid 1000); 30 Aug 2022 13:12:14 -0400
Date:   Tue, 30 Aug 2022 13:12:14 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     kernel test robot <lkp@intel.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [usb:usb-testing 29/47] drivers/usb/host/ehci-platform.c:56:19:
 warning: 'hcd_name' defined but not used
Message-ID: <Yw5E7n+lNgz1ANEH@rowland.harvard.edu>
References: <202208310007.6yJMsSYz-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202208310007.6yJMsSYz-lkp@intel.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 31, 2022 at 12:10:36AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   594b9411b4adceb59ca8a66997eec1eaa3756785
> commit: 5cfdb45657c97315501316657e504298b381ceee [29/47] usb: reduce kernel log spam on driver registration
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220831/202208310007.6yJMsSYz-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=5cfdb45657c97315501316657e504298b381ceee
>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>         git fetch --no-tags usb usb-testing
>         git checkout 5cfdb45657c97315501316657e504298b381ceee
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/host/
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
>       56 | static const char hcd_name[] = "ehci-platform";
>          |                   ^~~~~~~~
> --
> >> drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
>       44 | static const char hcd_name[] = "ohci-platform";
>          |                   ^~~~~~~~

This is a side effect from Ard's patch removing the pr_info lines from 
these drivers.  It will show up in some of the other drivers too (the 
ones that don't initialize their own hc_driver structure).  The solution 
is simply to remove the unused definitions.

Ard, do you want to write a fixup patch to do this?

Alan Stern
