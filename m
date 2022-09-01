Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C71435A9FF8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 21:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbiIAT3p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 15:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232840AbiIAT3o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 15:29:44 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 014167FE6F
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 12:29:42 -0700 (PDT)
Received: (qmail 246521 invoked by uid 1000); 1 Sep 2022 15:29:41 -0400
Date:   Thu, 1 Sep 2022 15:29:41 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: Fix use-after-free Read in usb_udc_uevent()
Message-ID: <YxEIJc1J99i7i9Wy@rowland.harvard.edu>
References: <YtlbkmVGJyhO4kR6@rowland.harvard.edu>
 <000000000000acc0e905e4517fa0@google.com>
 <YtlrnhHyrHsSky9m@rowland.harvard.edu>
 <CGME20220808145736eucas1p234e56422bd7973d7f0676e74f03ba405@eucas1p2.samsung.com>
 <b2ba4245-9917-e399-94c8-03a383e7070e@samsung.com>
 <YvFxiXmPlJc9wLZT@rowland.harvard.edu>
 <YvQH7IMTIFO0OCnG@rowland.harvard.edu>
 <20220901192204.GA2268599@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901192204.GA2268599@francesco-nb.int.toradex.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 01, 2022 at 09:22:04PM +0200, Francesco Dolcini wrote:
> On Wed, Aug 10, 2022 at 03:33:00PM -0400, Alan Stern wrote:
> > On Mon, Aug 08, 2022 at 04:26:49PM -0400, Alan Stern wrote:
> > > On Mon, Aug 08, 2022 at 04:57:35PM +0200, Marek Szyprowski wrote:
> > > > Hi Alan,
> > > 
> > > Hi.
> > > 
> > > > This patch landed recently in linux-next as commit 2191c00855b0 ("USB: 
> > > > gadget: Fix use-after-free Read in usb_udc_uevent()"). Unfortunately it 
> > > > fixes the issue by introducing another one. It doesn't look very 
> > > > probable, but it would be nice to fix it to make the lock dependency 
> > > > checker happy.
> 
> Hi just bisected a different warning [1], triggered by the same patch and I
> was about to send a revert while I noticed you already have a fix more
> or less ready, it would be great if you could send it. Please find my
> tested-by afterward.

It has already been submitted:

https://lore.kernel.org/linux-usb/YwkfhdxA%2FI2nOcK7@rowland.harvard.edu/

Greg hasn't merged it yet, though.

Alan Stern
