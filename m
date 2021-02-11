Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B6E3186B5
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 10:16:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhBKJPV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 04:15:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:40864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229705AbhBKJDi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 11 Feb 2021 04:03:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDD6364E08;
        Thu, 11 Feb 2021 09:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613034166;
        bh=toje9XjA7hPGFbcvbm2+Hg56n6gVz61TA+aTOG90wPo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQh3C5C8LzqHHJCJOXB99OdAeD5xdCmCISLGyGV180RrzZrsKQcguY8rfJf22ywNU
         C39UXGJ/JvNBJ/wQArfs3Fra4oJNgrahaFVUq1IIBGzt0HOklnGKNWSG8xo8iX6Zq1
         Xq7iRh1B0Zz8YJfmOtq1xaQyyiB5/CZ1Qvxlw0OE=
Date:   Thu, 11 Feb 2021 10:02:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Noam Liron <lnoam@marvell.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Yuval Shaia <yshaia@marvell.com>
Subject: Re: [EXT] Re: Enforce USB DMA allocations to specific range
Message-ID: <YCTysiR4awtVPtMb@kroah.com>
References: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
 <X+npQe45AXcsFGu1@kroah.com>
 <BYAPR18MB2741B58F5907F65C71ACF966B98C9@BYAPR18MB2741.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR18MB2741B58F5907F65C71ACF966B98C9@BYAPR18MB2741.namprd18.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Feb 11, 2021 at 08:38:40AM +0000, Noam Liron wrote:
> Hi Greg,
> 
> I am writing you again on the below subject, as I would like to get a
> "high level" opinion, and you are probably the most experienced ...

I am not a DMA expert at all, why not ask the dma developers instead?

> As I wrote below, I cannot rely on the DMA mask, as some USB
> allocation are not affected by it.

Why "some" and not "others"?  Perhaps you need to fix your platform code
to prevent that from happening instead?  Why is USB unique here?

> I thought of using private DMA pool that will be allocated where I
> need it (at the start of physical memory). However, this means adding
> specific ASIC code, which is less elegant.
> Do you think that's the right way?

I do not know your platform, only you do.

But I do think you should not be doing new development on 4.14, as that
is a very old and obsolete kernel and the dma code in the kernel has
changed a lot since 2017.

good luck!

greg k-h
