Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6704FFF7F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2019 08:27:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfKRH1j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Nov 2019 02:27:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:45964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfKRH1i (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 18 Nov 2019 02:27:38 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7853C20726;
        Mon, 18 Nov 2019 07:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574062058;
        bh=f8z87rRXBYKLBAXWfLoY7gOgyVc1dfrZu4U5QwzOWCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oOnzg5QitxK7IVofhNcI/e+JIMOgPXxULR6FtqBnDfIQNHU4+hMTK/OT112mM03E2
         O2DVeGk7/pLvxfr3Xkkv4rH7K3OlnmI4cgFaTayTcUhjiFOEkltqBHAzWhMdslN0Ac
         MknoyZQV+FJW+4dlr0cIfsyjyXR/EBP1hconGhGI=
Date:   Mon, 18 Nov 2019 08:26:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB changes for v5.5 merge window
Message-ID: <20191118072610.GB66760@kroah.com>
References: <87eey5psvq.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eey5psvq.fsf@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 18, 2019 at 09:04:41AM +0200, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's my pull request for v5.5 merge window. Let me know if you want
> anything to be changed.
> 
> Cheers
> 
> The following changes since commit 7d194c2100ad2a6dded545887d02754948ca5241:
> 
>   Linux 5.4-rc4 (2019-10-20 15:56:22 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.5

pulled and pushed out, thanks.

greg k-h
