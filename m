Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4285A761D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 08:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiHaGA3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 02:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiHaGAV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 02:00:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 768495F201
        for <linux-usb@vger.kernel.org>; Tue, 30 Aug 2022 23:00:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15A25616DD
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 06:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3323DC433D6;
        Wed, 31 Aug 2022 06:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661925618;
        bh=/Q6Tfs+lInYQRhLernni4ly8FKeBgkBd9ufFEun+unU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qXtxXl1PhHLJrrVTbvGdgQXlDCqjha4R6rAqJPEVotGXfnCD7+SA0AQ4B6WkudyDP
         DF4rsIaa8L2uJBTPZIyNwllDJtYEl3UoDQZRVlx9NURiRXb1DThTu8mblKv0SLkecN
         tI1gqQFLaDXXHE/sJkhPzGe5h8rBRn7zDsPrbwUw=
Date:   Wed, 31 Aug 2022 08:00:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     kernel test robot <lkp@intel.com>,
        Ard Biesheuvel <ardb@kernel.org>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [usb:usb-testing 29/47] drivers/usb/host/ehci-platform.c:56:19:
 warning: 'hcd_name' defined but not used
Message-ID: <Yw75Aa35sWOjKMN0@kroah.com>
References: <202208310007.6yJMsSYz-lkp@intel.com>
 <Yw5E7n+lNgz1ANEH@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yw5E7n+lNgz1ANEH@rowland.harvard.edu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 30, 2022 at 01:12:14PM -0400, Alan Stern wrote:
> On Wed, Aug 31, 2022 at 12:10:36AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   594b9411b4adceb59ca8a66997eec1eaa3756785
> > commit: 5cfdb45657c97315501316657e504298b381ceee [29/47] usb: reduce kernel log spam on driver registration
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220831/202208310007.6yJMsSYz-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
> > reproduce (this is a W=1 build):
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=5cfdb45657c97315501316657e504298b381ceee
> >         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> >         git fetch --no-tags usb usb-testing
> >         git checkout 5cfdb45657c97315501316657e504298b381ceee
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/host/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
> >       56 | static const char hcd_name[] = "ehci-platform";
> >          |                   ^~~~~~~~
> > --
> > >> drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
> >       44 | static const char hcd_name[] = "ohci-platform";
> >          |                   ^~~~~~~~
> 
> This is a side effect from Ard's patch removing the pr_info lines from 
> these drivers.  It will show up in some of the other drivers too (the 
> ones that don't initialize their own hc_driver structure).  The solution 
> is simply to remove the unused definitions.
> 
> Ard, do you want to write a fixup patch to do this?

I'll go fix it up...

thanks,

greg k-h
