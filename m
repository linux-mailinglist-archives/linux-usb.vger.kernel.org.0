Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601D652448B
	for <lists+linux-usb@lfdr.de>; Thu, 12 May 2022 06:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348855AbiELEtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 May 2022 00:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348838AbiELEsy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 May 2022 00:48:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E9121A95E
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 21:48:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3FD76B826F0
        for <linux-usb@vger.kernel.org>; Thu, 12 May 2022 04:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E61C34100;
        Thu, 12 May 2022 04:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652330907;
        bh=OX6E3yuOrswPHESp/94zZqUWtHrCOljqhJ0TNII+VBo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GYa/e/HWzvRpX0I6bbPbSv20TVxkEnvwbMmFeAvBWwJzFvmGQedD+uxEh5t0wG8u+
         cFO8xJP6px222RW0gz6tn1HbIDoXneNY3BGbBUA9cDNzNgIyDpuAXMNI6Euo//IaeE
         Aw6Efu3XUjxfFKs3RmfqK1Yw2TGlMn+G3sKFr1lo=
Date:   Thu, 12 May 2022 06:48:22 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
Message-ID: <YnyRljpA1nA7dH/B@kroah.com>
References: <1652322094-20698-1-git-send-email-quic_linyyuan@quicinc.com>
 <YnyIok/ezG9csdJV@kroah.com>
 <DM8PR02MB8198AD3B061872DF43801E1AE3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB8198AD3B061872DF43801E1AE3CB9@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 12, 2022 at 04:20:32AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Thursday, May 12, 2022 12:10 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org
> > Subject: Re: [PATCH] usb: gadget: make f_loopback/f_sourcesink standalone
> > 
> > On Thu, May 12, 2022 at 10:21:34AM +0800, Linyu Yuan wrote:
> > > First remove lb_modinit() and lb_modexit() call from f_sourcesink as both
> > > function belong to f_loopback.c, also there is no need to export
> > > disable_endpoints() from f_sourcesink, change it to static type.
> > >
> > > After first step, we can use DECLARE_USB_FUNCTION_INIT() macro in
> > > f_sourcesink to create module init/exit function implicit as it only
> > > register/unregister one usb function driver.
> > >
> > > In f_loopback disable_loopback() function, just add two usb_ep_disable()
> > > call, it will safe to remove original disable_endpoints() call
> > > which belong to f_sourcesink, and it also safe to use macro
> > > DECLARE_USB_FUNCTION_INIT() for module init/exit purpose.
> > >
> > > Now it is safe to remove function prototype of lb_modinit(),
> > > lb_modexit() and disable_endpoints() from g_zero.h.
> > >
> > > Change Makefile to build f_loopback/f_sourcesink as standalone module.
> > 
> > This describes a lot of what you are doing, but not why you want to do
> > any of this.
> > 
> > Please read the kernel documentation for how to write a good kernel
> > changelog, as-is, I do not understand why this change should be accepted
> > at all.
> 
> Can you share more about it ? is it description reason or code change itself  ?

Here's the relevant text from my patch bot, which I should have
triggered for this submission, that explains it a lot better:

-----------

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

---------------

Does that help?

greg k-h
