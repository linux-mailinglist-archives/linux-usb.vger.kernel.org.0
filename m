Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45785ACFF1
	for <lists+linux-usb@lfdr.de>; Mon,  5 Sep 2022 12:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236197AbiIEKS4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Sep 2022 06:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237327AbiIEKSP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Sep 2022 06:18:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D4E56BBA
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 03:17:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0B4611E3
        for <linux-usb@vger.kernel.org>; Mon,  5 Sep 2022 10:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8F1C433C1;
        Mon,  5 Sep 2022 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662373040;
        bh=zexbFhyo7ClmCsE1D0fdZxpmtAoMSQd9AuNjqNON82M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aj68C0Sp0XpukcZLiecZ77GZcBHShk4HM559dVqRveJMoxfMpfSj90pn+RojUuA6p
         fyVaQecMQvNBABnD07ZXSxPlbFFYO86xhBEPsQ7y8HjY1fwA2fJCX0LzwXvloBbJBl
         0sTW2z30g4486QGs1NBzJu4fV5FQDXukbfGJEt+8=
Date:   Mon, 5 Sep 2022 12:17:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [usb:usb-testing 29/47] drivers/usb/host/ehci-platform.c:56:19:
 warning: 'hcd_name' defined but not used
Message-ID: <YxXMrW06iuT5w2pf@kroah.com>
References: <202208310007.6yJMsSYz-lkp@intel.com>
 <Yw5E7n+lNgz1ANEH@rowland.harvard.edu>
 <Yw75Aa35sWOjKMN0@kroah.com>
 <CAMj1kXHaFa6GqPvXjuat6ccLt7D1V1XypbPH1F_TES-cLgx1Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHaFa6GqPvXjuat6ccLt7D1V1XypbPH1F_TES-cLgx1Ww@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 05, 2022 at 12:13:03PM +0200, Ard Biesheuvel wrote:
> On Wed, 31 Aug 2022 at 08:00, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, Aug 30, 2022 at 01:12:14PM -0400, Alan Stern wrote:
> > > On Wed, Aug 31, 2022 at 12:10:36AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > > head:   594b9411b4adceb59ca8a66997eec1eaa3756785
> > > > commit: 5cfdb45657c97315501316657e504298b381ceee [29/47] usb: reduce kernel log spam on driver registration
> > > > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220831/202208310007.6yJMsSYz-lkp@intel.com/config)
> > > > compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
> > > > reproduce (this is a W=1 build):
> > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=5cfdb45657c97315501316657e504298b381ceee
> > > >         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> > > >         git fetch --no-tags usb usb-testing
> > > >         git checkout 5cfdb45657c97315501316657e504298b381ceee
> > > >         # save the config file
> > > >         mkdir build_dir && cp config build_dir/.config
> > > >         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/host/
> > > >
> > > > If you fix the issue, kindly add following tag where applicable
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > >
> > > > All warnings (new ones prefixed by >>):
> > > >
> > > > >> drivers/usb/host/ehci-platform.c:56:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
> > > >       56 | static const char hcd_name[] = "ehci-platform";
> > > >          |                   ^~~~~~~~
> > > > --
> > > > >> drivers/usb/host/ohci-platform.c:44:19: warning: 'hcd_name' defined but not used [-Wunused-const-variable=]
> > > >       44 | static const char hcd_name[] = "ohci-platform";
> > > >          |                   ^~~~~~~~
> > >
> > > This is a side effect from Ard's patch removing the pr_info lines from
> > > these drivers.  It will show up in some of the other drivers too (the
> > > ones that don't initialize their own hc_driver structure).  The solution
> > > is simply to remove the unused definitions.
> > >
> > > Ard, do you want to write a fixup patch to do this?
> >
> > I'll go fix it up...
> >
> 
> Apologies for missing this, I was on vacation last week.
> 
> Is there anything that needs to be done at this point?

Yeah, my fixup patch was incomplete and I'll not have the chance to fix
it up for a few more days due to travel :(

So if you want to send a follow-on patch, like my fixup one but in more
places, that would be great!

thanks,

greg k-h
