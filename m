Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42F62B2CA7
	for <lists+linux-usb@lfdr.de>; Sat, 14 Nov 2020 11:21:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgKNKUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 05:20:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:39370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgKNKUU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Nov 2020 05:20:20 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B6B9A22252;
        Sat, 14 Nov 2020 10:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605349219;
        bh=r/on8D/3kby+cVwMFfYApSg52129KT3+E809/9HlpNk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZCmC4U94EyC9rtYAaOE281MwQxxTMelkL8TrYoltm3nJ6XT2vPx9q5kDr9DXynE9A
         9ZAiM+s/AcOAJpUVePo/DLg44eFCLDpLzZAnbD6gR3xElQG6TY2B4q+WZa4gpq7JS4
         N1n8BTl6P87si/knp3Kaiu2I1cIfPO/5Ctpb5fNA=
Date:   Sat, 14 Nov 2020 11:21:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] usb: Remove RUN_CONTEXT
Message-ID: <X6+vme6z6dpV8r2V@kroah.com>
References: <20201113212704.2243807-1-bigeasy@linutronix.de>
 <X68NBdTy2F/IeZ2Y@kroah.com>
 <20201114100856.ncwcel2zd76n7ocv@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114100856.ncwcel2zd76n7ocv@linutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 14, 2020 at 11:08:56AM +0100, Sebastian Andrzej Siewior wrote:
> On 2020-11-13 23:47:33 [+0100], Greg Kroah-Hartman wrote:
> > On Fri, Nov 13, 2020 at 10:27:04PM +0100, Sebastian Andrzej Siewior wrote:
> > > The last user of RUN_CONTEXT was removed in commit
> > >    97c17beb3b668 ("[PATCH] ehci-hcd (1/2):  portability (2.4), tasklet,")
> > 
> > I don't see that git commit id in Linus's tree, nor in my usb.git tree.
> > Where does it live?
> 
> As a archaeologist I have the history trees linked in my tree. This is
> from:
>    https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=97c17beb3b668c79ef5d056b3f687aa0be2d672f

Oh wow, didn't think to look back past 15 years :)

I'll go queue this up, thanks.

greg k-h
