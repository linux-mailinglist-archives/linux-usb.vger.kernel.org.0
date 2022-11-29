Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E0F163BFC6
	for <lists+linux-usb@lfdr.de>; Tue, 29 Nov 2022 13:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbiK2MKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Nov 2022 07:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbiK2MKL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Nov 2022 07:10:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172522AA
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 04:10:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C65F4B81235
        for <linux-usb@vger.kernel.org>; Tue, 29 Nov 2022 12:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97FBC433D7;
        Tue, 29 Nov 2022 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1669723807;
        bh=mtnawcMuSzHzZ2UbQGo6aEgto2AHflhvObJh3ex0GDM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fwFjcrkJBs5NFqnXqn6st5NREIXm0i0OWjrMc0w1uQYOq/AzuksuttLVFPYfOq9RA
         wRbuPXu4mCZD3iLu/nmcypMkwxoDOlHVUIi85GDqnxx9y8Uq3jZ30k5Fz3OF60DEoZ
         ZGZXHu+kCLDRlYADxB6HpKbBa0JxIjK3YVBPv9cI=
Date:   Tue, 29 Nov 2022 13:10:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 2/23]
 drivers/usb/gadget/function/uvc_v4l2.c:266:3: warning: unannotated
 fall-through between switch labels
Message-ID: <Y4X2nGH+LJDM6dDV@kroah.com>
References: <202211290734.P9mHcjpl-lkp@intel.com>
 <Y4W6/0Ql3dI+ePXF@kroah.com>
 <Y4W7Xw6OA9GLzXmH@kroah.com>
 <Y4W7yKbiKzK4yKoV@kroah.com>
 <20221129101904.GM18924@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129101904.GM18924@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 29, 2022 at 11:19:04AM +0100, Michael Grzeschik wrote:
> On Tue, Nov 29, 2022 at 08:59:04AM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Nov 29, 2022 at 08:57:19AM +0100, Greg Kroah-Hartman wrote:
> > > On Tue, Nov 29, 2022 at 08:55:43AM +0100, Greg Kroah-Hartman wrote:
> > > > On Tue, Nov 29, 2022 at 07:22:43AM +0800, kernel test robot wrote:
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > > > > head:   465d4dd073f72a6348577ed0f7aa4aa00c9264bc
> > > > > commit: a6f523ee41bfe7ef71110d4ae556339d0520efdd [2/23] usb: gadget: uvc: add validate and fix function for uvc response
> > > >
> > > > Michael, I'll drop this commit from my tree now, please fix up and
> > > > resend.
> > > 
> > > Nevermind, I fixed it up myself, it was trivial.
> > 
> > And now ignore this, I've dropped it again based on Laurent's review.
> > 
> 
> Did you drop it because of the question why this is a good idea?

Yes.

> If so I will improve the commit message. IMHO it totally makes sense to
> have some sort of validation in the uvc gadget.
> 
> The version v7 he commented on was not the one you took on the
> usb-testing tree.

Ok, submit a new one so that everyone can agree please.

thanks,

greg k-h
