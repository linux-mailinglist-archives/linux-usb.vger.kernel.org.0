Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4454E241A
	for <lists+linux-usb@lfdr.de>; Mon, 21 Mar 2022 11:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346238AbiCUKSG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Mar 2022 06:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343986AbiCUKSE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Mar 2022 06:18:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3E1985BA;
        Mon, 21 Mar 2022 03:16:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6796F61312;
        Mon, 21 Mar 2022 10:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61C15C340E8;
        Mon, 21 Mar 2022 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1647857798;
        bh=hs1j1XdHsa05pKB9tDryge7782Yts0Xm0jU6E5GUFjI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wVpP7wlh0tnG5l/utlBmven3RHa4TNGl7gj8+PHlyjppHEssDj8f+6iLwINy+KQ0H
         JWKXpfKGdkBR5flmjRKV83rMbjXuTNZa0UmgKTgr0N9RxlY8ZcOlZsW3pYdOw2SBjE
         R9MsTdj5AINOUSSiD6Uy69uQslLz51jzexFXMSKA=
Date:   Mon, 21 Mar 2022 11:16:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jung Daehwan <dh10.jung@samsung.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Howard Yen <howardyen@google.com>,
        Jack Pham <jackp@codeaurora.org>,
        Puma Hsu <pumahsu@google.com>,
        "J . Avila" <elavila@google.com>, sc.suh@samsung.com
Subject: Re: [PATCH v3 0/4] support USB offload feature
Message-ID: <YjhQg4I7eYWXIfgr@kroah.com>
References: <CGME20220321090202epcas2p1bfa78db059c1f6f6acbbb015e4bf991c@epcas2p1.samsung.com>
 <1647853194-62147-1-git-send-email-dh10.jung@samsung.com>
 <YjhB7+AaEXvuUmdi@kroah.com>
 <20220321092409.GA62265@ubuntu>
 <YjhGKVKuPsKG80wZ@kroah.com>
 <20220321100631.GB62265@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220321100631.GB62265@ubuntu>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 21, 2022 at 07:06:31PM +0900, Jung Daehwan wrote:
> On Mon, Mar 21, 2022 at 10:32:25AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Mar 21, 2022 at 06:24:09PM +0900, Jung Daehwan wrote:
> > > On Mon, Mar 21, 2022 at 10:14:23AM +0100, Greg Kroah-Hartman wrote:
> > > > On Mon, Mar 21, 2022 at 05:59:50PM +0900, Daehwan Jung wrote:
> > > > > This patchset is for USB offload feature, which makes Co-processor to use
> > > > > some memories of xhci. Especially it's useful for USB Audio scenario.
> > > > > Audio stream would get shortcut because Co-processor directly write/read
> > > > > data in xhci memories. It could get speed-up using faster memory like SRAM.
> > > > > That's why this gives vendors flexibilty of memory management.
> > > > > Several pathches have been merged in AOSP kernel(android12-5.10) and I put
> > > > > together and split into 3 patches. Plus let me add user(xhci-exynos)
> > > > > module to see how user could use it.
> > > > > 
> > > > > To sum up, it's for providing xhci memories to Co-Processor.
> > > > > It would cover DCBAA, Device Context, Transfer Ring, Event Ring, ERST.
> > > > > It needs xhci hooks and to export some xhci symbols.
> > > > > 
> > > > > Changes in v2 :
> > > > > - Fix commit message by adding Signed-off-by in each patch.
> > > > > - Fix conflict on latest.
> > > > > 
> > > > > Changes in v3 :
> > > > > - Remove export symbols and xhci hooks which xhci-exynos don't need.
> > > > > - Modify commit message to clarify why it needs to export symbols.
> > > > > - Check compiling of xhci-exynos.
> > > > 
> > > > As I asked for in the previous submission, you MUST have a user for
> > > > these hooks, otherwise we can not accept them (nor would you WANT us to
> > > > accept them).  Please fix that up and add them to the next submission as
> > > > we can not do anything with this one.
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > > 
> > > 
> > > Hi greg,
> > > 
> > > I've submitted the user(xhci-exynos) together on the last patch of the patchset.
> > > You can see xhci-exynos uses these hooks and symbols.
> > > 
> > > [PATCH v3 4/4] usb: host: add xhci-exynos driver
> > 
> > Then this is not "offload" hooks at all.  They are merely "support
> > another xhci platform driver, right?
> 
> Yes, right.
> 
> > 
> > I see a lot of exports and function hooks added, are they _ALL_ used by
> > the xhci driver?  If so, please reword this series as it is not very
> > obvious at all what you are doing.
> 
> Yes, they are all used by the xhci driver. Is it OK for me to use "xhci-exynos"
> instead of "USB offload" on series like below?
> 
> [v3, 0/4] add xhci-exynos driver
> 
> This patchset is for support xhci-exynos driver....
> ....
> 
>   usb: host: export symbols for xhci-exynos to use xhci hooks
>   usb: host: add xhci hooks for xhci-exynos
>   usb: host: add some to xhci overrides for xhci-exynos
>   usb: host: add xhci-exynos driver

Yes, that makes much more sense.  What would you want to see if you had
to review such a series?

thanks,

greg k-h
