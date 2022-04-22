Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F377E50B71A
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 14:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1447281AbiDVMT6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 08:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237402AbiDVMT6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 08:19:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E4055222
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 05:17:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E490861FE0
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 12:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D216C385A8;
        Fri, 22 Apr 2022 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650629824;
        bh=4ODAIy2t2wfbuEeetD4Uzk1Zj9Wlbds8/DsGr0qST14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FPHJa/hn52EbD2H/EtrsijTyp5v1H1aS+gpGsdtlrCVbND/7vEDkSOvaRgl/oJ8cf
         6HvaIqdb+xWdbvB58dTww8ycj4C2cssKT2aXLcU1dAn2o1bQyqeWA0OeytSt9sFnBc
         5sh/OJgYCRJAnw33cYy9aUmEfit5w4R+FhClA6H8=
Date:   Fri, 22 Apr 2022 14:17:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: Re: [PATCH v6 0/5] usb: gadget: configfs: new trace events
Message-ID: <YmKcvKTQ/UP7VQas@kroah.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
 <YmJqfzmz5N0I3n87@kroah.com>
 <DM8PR02MB81988A02C692B0760A73AF23E3F79@DM8PR02MB8198.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM8PR02MB81988A02C692B0760A73AF23E3F79@DM8PR02MB8198.namprd02.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 22, 2022 at 09:01:13AM +0000, Linyu Yuan (QUIC) wrote:
> > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Sent: Friday, April 22, 2022 4:43 PM
> > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org; Jack Pham
> > (QUIC) <quic_jackp@quicinc.com>
> > Subject: Re: [PATCH v6 0/5] usb: gadget: configfs: new trace events
> > 
> > On Thu, Apr 07, 2022 at 09:27:40AM +0800, Linyu Yuan wrote:
> > > Last year I try to add trace event support for usb gadget configfs [1],
> > > this time the idea is change a lot, the purpose is trace all user space
> > > operation to gadget configuration, include gadget and it's function.
> > 
> > But why?  Who will use this, and what for?
> 
> Thanks for review it.
> It is not used by user space, just for kernel gadget issue debugging.

So you use it in userspace?  How can you use a tracepoint from somewhere
else in the kernel?

> Like android, the user space is complicate to kernel developers,
> With this trace events, kernel development will understand
> What is simplified action happen from user space.

They do not need this, they can just use ftrace today.  Most of these
tracepoints you are putting in here are just for a "got to this
function!" type of thing, which ftrace can show you already.

What is the added benefit of these over ftrace?

thanks,

greg k-h
