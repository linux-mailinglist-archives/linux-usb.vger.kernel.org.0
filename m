Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A2E7780F5
	for <lists+linux-usb@lfdr.de>; Thu, 10 Aug 2023 21:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235305AbjHJTDL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Aug 2023 15:03:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbjHJTDL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Aug 2023 15:03:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BBD62715
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 12:03:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1459D66730
        for <linux-usb@vger.kernel.org>; Thu, 10 Aug 2023 19:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2016DC433C7;
        Thu, 10 Aug 2023 19:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691694187;
        bh=DzcRYwtKITkTQIUZg4MJrkb81Su80+Gdk5RH6zaHA6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kPDNyKeTtC5BibIMr7O1PKR/JhRBJGC0zhPoBldMD734p7ORnJ1PZXGn/CavO0NNL
         yxTCdUhaEhdP3Wg3rM35Tj5vF/5V3dkt/oLJ2RqbSdmsg/+UfkYqATWNv3dupYcb98
         Vrr+G8h8tQzSvsjK+xFEr+elUgV/jO5u15OXuwHI=
Date:   Thu, 10 Aug 2023 21:03:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 36/37] drivers/usb/core/usb.c:648:18: warning:
 variable 'root_hub' set but not used
Message-ID: <2023081032-launch-unrigged-2a4b@gregkh>
References: <202308092350.HR4PVHUt-lkp@intel.com>
 <d814a834-de95-486b-9c97-2a4f673700f4@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d814a834-de95-486b-9c97-2a4f673700f4@rowland.harvard.edu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 09, 2023 at 11:35:04AM -0400, Alan Stern wrote:
> On Wed, Aug 09, 2023 at 11:11:29PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > head:   f176638af476c6d46257cc3303f5c7cf47d5967d
> > commit: 1e4c574225cc5a0553115e5eb5787d1474db5b0f [36/37] USB: Remove remnants of Wireless USB and UWB
> > config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092350.HR4PVHUt-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308092350.HR4PVHUt-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/usb/core/usb.c: In function 'usb_alloc_dev':
> > >> drivers/usb/core/usb.c:648:18: warning: variable 'root_hub' set but not used [-Wunused-but-set-variable]
> >      648 |         unsigned root_hub = 0;
> >          |                  ^~~~~~~~
> 
> Odd.  I'm quite sure that I built this with no problems.  [Does some 
> checking...]  Aha!  When I built it, I didn't use W=1. 
> 
> Greg, would you prefer a new version of this patch or a separate 
> correction patch?

A new version, let me go drop the three patches from you for this as you
found a different issue on the first one already.  Just resend a new
series please.

thanks,

greg k-h
