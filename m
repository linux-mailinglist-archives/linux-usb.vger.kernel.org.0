Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4F32361F9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbfFEQ7B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jun 2019 12:59:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728570AbfFEQ7B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 Jun 2019 12:59:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 513C82075B;
        Wed,  5 Jun 2019 16:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559753940;
        bh=abNYLIeAra2a5OtLn3uGtszbHHq45rjOhZwqFwLARrM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Via+BNtdcdGV4661jr/rexdWSNRn9Z5QCyfxjT37ucMVWdpOJVEhZsEih82v259KY
         Kw+zx3uI63N2gVA8vuQEt8icFtKmo5SUd2DAwOPydrJ6lnBn0LgBc3bt/ErhTb4EIz
         SDsz6goeBocKjP8jeKIANfFAnLOkipt2x+w1Tgeg=
Date:   Wed, 5 Jun 2019 18:58:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190605165857.GA23286@kroah.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com>
 <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com>
 <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 05, 2019 at 04:36:23PM +1000, Vladimir Yerilov wrote:
> Good day Mr. Kroah-Hartman,
> 
> I've found the culprit commit. It took a while though but now I'm sure:
> 
> commit - brief decription - time - works (y) or not (n)
> 670784fb4ebe54434e263837390e358405031d9e - rc1 2019-05-20
> e260ad01f0aa9e96b5386d5cd7184afd949dc457 - rc0 2019-05-14 19:52:51 -0700 n
> 8ea5b2abd07e2280a332bd9c1a7f4dd15b9b6c13 - rc0 2019-05-09 19:35:41 -0700 n
> 54516da1ea859dd4f56ebba2e483d2df9d7c8a32 - rc0 2019-05-05 21:58:36 -0700 y
> 71ae5fc87c34ecbdca293c2a5c563d6be2576558 - rc0 2019-05-06 20:29:45 -0700 y
> 80f232121b69cc69a31ccb2b38c1665d770b0710 - rc0 2019-05-07 22:03:58 -0700 y
> a2d635decbfa9c1e4ae15cb05b68b2559f7f827c - rc0 2019-05-08 21:35:19 -0700 n
> 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a - rc0 2019-05-08 10:03:52 -0700 n
> 86dc59e39031fb0d366d5b1f92db015b24bef70b - rc0 2019-05-08 09:46:44 -0700 y
> 
> So 86dc59e39031fb0d366d5b1f92db015b24bef70b is the last working for
> me, and 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a is the breaking one:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.2-rc3&id=132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a

132d68d37d33 ("Merge tag 'usb-5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb")
is a merge point, which is odd, you should be able to drop down into
that and find the exact wrong commit.

what does 'git bisect log' show?

thanks,

greg k-h
