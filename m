Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38412FC37
	for <lists+linux-usb@lfdr.de>; Thu, 30 May 2019 15:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbfE3NZX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 May 2019 09:25:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbfE3NZX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 May 2019 09:25:23 -0400
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net [67.88.213.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BA40323A6B;
        Thu, 30 May 2019 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559222722;
        bh=czGUOxUoIZK6bPxfLceHn7b3fcgAvKSb7bPVklGfBcY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Pp5c4g0gbc8yGe4qWEWI5IkCheLQXxGZeoJcg4v2h+2+Gre4m2RSszeQpW5yIP00M
         U7vQV8ErNsWN1FPFD6vWWXU9CNh16yTU2Jrs2Q97XpGwObbgNPQMSRm5Ji5tnU4mnd
         9zlunOn28+Cx9EdWPuezebkm23msCvGvShS8kR1E=
Date:   Thu, 30 May 2019 06:25:22 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Slow I/O on USB media
Message-ID: <20190530132522.GA21005@kroah.com>
References: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a9e1be71a2c6c940dac904752fdd34129745444.camel@unipv.it>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 30, 2019 at 03:18:14PM +0200, Andrea Vai wrote:
> Hi,
>   I have a problem as described at [1], sorry for misunderstanding the
> right place to report it.
> 
> The last kernel I can easily install and test was 5.0.17, but please
> tell me if I should install a newer version (or anything else I should
> do). I just tried installing 5.1.5 but suddenly stopped as I have
> problem in compilation (please be patient with me, because I am not an
> expert).
> 
> Here follows the bug report content:
> 
> I am experiencing slow I/O performance since kernel 5.0.1. File
> operations are roughly 10 times slower than they used to be using
> kernel up to 4.20. The problem is present when I use an USB pendrive,
> and does not happen when I copy a file from an internal SATA to
> another internal SATA hard disk.
> 
> You can see the discussion in the dar (backup software) mailing list
> [2], because I first noticed the problem using dar, but then
> discovered that also usual file operations such as "cp" suffer the
> same problem.
> 
> Steps to Reproduce:
> Copy a file (e.g. roughly 1GB) from an internal SATA HD to an USB
> pendrive using "cp", using kernel 5.0.1+
> 
> Actual Results:
> The file is copied in about 12 minutes
> 
> Expected Results:
> The file is copied in about 1 minute (as it happens with kernel up to
> 4.20.13)
> 
> Running Fedora 29 on a Desktop PC.
> Kernels found to be affected: e.g. 5.0.7, 5.0.9, 5.0.10, 5.0.13,
> 5.0.14, 5.0.17.

Any chance you can use 'git bisect' to find the offending commit?

And did you accidentally turn on "sync" for the filesystem?  How do you
know the old kernel really flushed the buffers out in 1 minute?  But 12
minutes is really long, did anything else change in your userspace
between the kernel changes as well?

thanks,

greg k-h
