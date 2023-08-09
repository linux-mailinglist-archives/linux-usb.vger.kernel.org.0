Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F319C776438
	for <lists+linux-usb@lfdr.de>; Wed,  9 Aug 2023 17:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbjHIPls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Aug 2023 11:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjHIPls (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Aug 2023 11:41:48 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DFF822111
        for <linux-usb@vger.kernel.org>; Wed,  9 Aug 2023 08:41:46 -0700 (PDT)
Received: (qmail 200266 invoked by uid 1000); 9 Aug 2023 11:35:04 -0400
Date:   Wed, 9 Aug 2023 11:35:04 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 36/37] drivers/usb/core/usb.c:648:18: warning:
 variable 'root_hub' set but not used
Message-ID: <d814a834-de95-486b-9c97-2a4f673700f4@rowland.harvard.edu>
References: <202308092350.HR4PVHUt-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308092350.HR4PVHUt-lkp@intel.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 09, 2023 at 11:11:29PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   f176638af476c6d46257cc3303f5c7cf47d5967d
> commit: 1e4c574225cc5a0553115e5eb5787d1474db5b0f [36/37] USB: Remove remnants of Wireless USB and UWB
> config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308092350.HR4PVHUt-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/usb/core/usb.c: In function 'usb_alloc_dev':
> >> drivers/usb/core/usb.c:648:18: warning: variable 'root_hub' set but not used [-Wunused-but-set-variable]
>      648 |         unsigned root_hub = 0;
>          |                  ^~~~~~~~

Odd.  I'm quite sure that I built this with no problems.  [Does some 
checking...]  Aha!  When I built it, I didn't use W=1. 

Greg, would you prefer a new version of this patch or a separate 
correction patch?

Alan Stern
