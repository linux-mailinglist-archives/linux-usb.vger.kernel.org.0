Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C89B597EA8
	for <lists+linux-usb@lfdr.de>; Thu, 18 Aug 2022 08:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243696AbiHRGad (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Aug 2022 02:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243684AbiHRGac (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Aug 2022 02:30:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AF4979EB
        for <linux-usb@vger.kernel.org>; Wed, 17 Aug 2022 23:30:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26C4061620
        for <linux-usb@vger.kernel.org>; Thu, 18 Aug 2022 06:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A88C433D6;
        Thu, 18 Aug 2022 06:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660804230;
        bh=YlLXowC7cLnnvfTcKubd9gkklkLNA6HQwGfZY7Y2GLg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xBZMO/jeAX/A0/2wuRP4sLQjzNYBS6+752R1WA2ZyZi0ViX9/TmIYC6u9qnkqVNxO
         VQp+UL1qumgNlTZFf8Z9XMjU1YwJ4fdx92hiGhAddNjrsvB8IMQiO44xU1w5uTUEnx
         UhdZMJoOev6OeY51RuYqX0LzY8092gX/LK0O0bEw=
Date:   Thu, 18 Aug 2022 08:30:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yujie Liu <yujie.liu@intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        lkp@lists.01.org, kernel test robot <lkp@intel.com>
Subject: Re: [USB] 3a2b1036e8: WARNING:possible_recursive_locking_detected
Message-ID: <Yv3cgyNJDlFvuzW7@kroah.com>
References: <20220817070712.GA78093@inn2.lkp.intel.com>
 <113d66dd-b2b5-fa2e-fbd3-53c5a5666867@intel.com>
 <Yv1jFcPocWBkgL4v@rowland.harvard.edu>
 <8f500c8c-c0a1-7825-a70d-3c2690fee18b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f500c8c-c0a1-7825-a70d-3c2690fee18b@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 18, 2022 at 02:07:10PM +0800, Yujie Liu wrote:
> On 8/18/2022 05:52, Alan Stern wrote:
> > On Wed, Aug 17, 2022 at 04:43:01PM +0800, kernel test robot wrote:
> > > Greeting,
> > > 
> > > FYI, we noticed the following commit (built with gcc-11):
> > > 
> > > commit: 3a2b1036e8951328b7e59517408897c700a74871 ("USB: gadget: Fix use-after-free Read in usb_udc_uevent()")
> > > https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > 
> > How did you come by that combination?  The "USB: gadget: Fix
> > use-after-free Read in usb_udc_uevent()" patch is not supposed to be
> > applied to the 5.4.y kernel series.  It is only supposed to be applied
> > to kernels which have [a backported version of] commit fc274c1e9973
> > ("USB: gadget: Add a new bus for gadgets").
> > 
> > It's not surprising that you found an issue, applying that patch to a
> > kernel where it doesn't belong.
> 
> We happened to catch a v5.4.211-rc1 patch series yesterday, and it does
> include the "USB: gadget: Fix use-after-free Read in usb_udc_uevent()" patch.
> But now the head of linux-stable-rc/linux-5.4.y branch has been rebased to
> v5.4.210.
> 
> 
> da19aaf18f551 Linux 5.4.211-rc1
> ...
> 3a2b1036e8951 USB: gadget: Fix use-after-free Read in usb_udc_uevent()
> ...
> de0cd3ea700d1 (tag: v5.4.210, linux-stable-rc/linux-5.4.y) Linux 5.4.210
> 
> 
> Looks like we have some delay when updating the latest state of this tree.
> Sorry for this false report, we'll update our workflow to avoid similar
> cases in the future.

That commit was inproperly added to the stable trees and then later
dropped.

thanks,

greg k-h
