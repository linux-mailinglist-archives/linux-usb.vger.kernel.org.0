Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76B83ECF33
	for <lists+linux-usb@lfdr.de>; Mon, 16 Aug 2021 09:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234239AbhHPHQi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Aug 2021 03:16:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44506 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233751AbhHPHQh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Aug 2021 03:16:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F93B61A0C;
        Mon, 16 Aug 2021 07:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629098166;
        bh=Y41XkUCSpjgiwuJOhPwV/OS45mMmqoSiB851IzntZBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BDDYouqnYa2W3xEgyWG1mC3MDvPxx7nTSXhn9sib79aL1Z1Do07bE5eVQux4iKWsv
         7cx4sU5UsVTAyjZibnpnijrdRDxMktsN2Yob45lsAXZq/+hUlzGGVLFrqGYUsdlHhs
         tcpZiWwVX4id3+lMdzHK397i9KrJirSBqcCWSr94=
Date:   Mon, 16 Aug 2021 09:16:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jeaho Hwang <jhhwang@rtst.co.kr>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-rt-users@vger.kernel.org
Subject: Re: [PATCH] usb: chipidea: fix RT issue for udc
Message-ID: <YRoQtFiZgaDHruAJ@kroah.com>
References: <20210810060228.GA3326442@ubuntu>
 <20210816005205.GA3907@nchen>
 <YRn2GPsT8vB/NF/p@kroah.com>
 <CAJk_X9iiqHJJK3weqRgLVmYGKEhLnfeUv9iATWCk8xfFpTVHPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJk_X9iiqHJJK3weqRgLVmYGKEhLnfeUv9iATWCk8xfFpTVHPw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 16, 2021 at 04:10:46PM +0900, Jeaho Hwang wrote:
> 2021년 8월 16일 (월) 오후 2:22, Greg Kroah-Hartman <gregkh@linuxfoundation.org>님이 작성:
> >
> > On Mon, Aug 16, 2021 at 08:52:06AM +0800, Peter Chen wrote:
> > > On 21-08-10 15:02:28, Jeaho Hwang wrote:
> > > > hw_ep_prime sometimes fails if irq occurs while it rus on RT kernel.
> > > > to prevent local_irq_save should keep the function from irqs.
> > > >
> > > > I am not sure where is the best to submit this patch, between RT and USB
> > > > community so sending to both. thanks.
> > >
> > > Greg, do you have any suggestions about it, the RT kernel schedules the interrupt
> > > handler (top-half) out which causes the USB hardware atomic sequences are broken,
> > > these hardware operations needs to be executed within limited time.
> >
> > Try working with the RT developers on this.
> 
> Then do you think those kinds of patches should be applied to linux-rt
> instead of mainline?

Depends on the resulting patch, if it is something that works for
mainline, then we will take it, otherwise if it is rt-only and is not
acceptable for mainline at this point in time, then it needs to go to
the rt tree until someone fixes it up there such that it can be
accepted.

thanks,

greg k-h
