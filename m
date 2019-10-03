Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23F2CC9FA3
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 15:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730582AbfJCNmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 09:42:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:53524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730568AbfJCNmJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 09:42:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 891A220830;
        Thu,  3 Oct 2019 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570110128;
        bh=fMctNtMkOw8RdknRKwFQeiuKcz5Yj5swnSAkYyEn4EE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JYy6PD6kTcNTQwbpjBkyCV4peYUDYmuwZPDwOQCTPjbHPrHRWE/jalwqfXdYXNJFb
         bl6OBhycpE0w+wDnFjqXnj+TIHNtgsXwCi6/uIBYAgiSgqcUN0IwJZ/YxpOoT7jJbC
         34iORhDUtEH7zqbNOoq/oOq/Ajo5uBv1d27rR8VQ=
Date:   Thu, 3 Oct 2019 15:42:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Cesar Miquel <miquel@df.uba.ar>
Subject: Re: [PATCH] USB: rio500: Remove Rio 500 kernel driver
Message-ID: <20191003134205.GA2876749@kroah.com>
References: <6251c17584d220472ce882a3d9c199c401a51a71.camel@hadess.net>
 <3b91a9abd7489fc9bf866fff6f0daee39ccb7b1e.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b91a9abd7489fc9bf866fff6f0daee39ccb7b1e.camel@hadess.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 03, 2019 at 03:18:16PM +0200, Bastien Nocera wrote:
> On Mon, 2019-09-23 at 18:18 +0200, Bastien Nocera wrote:
> > The Rio500 kernel driver has not been used by Rio500 owners since 2001
> > not long after the rio500 project added support for a user-space USB stack
> > through the very first versions of usbdevfs and then libusb.
> > 
> > Support for the kernel driver was removed from the upstream utilities
> > in 2008:
> > https://gitlab.freedesktop.org/hadess/rio500/commit/943f624ab721eb8281c287650fcc9e2026f6f5db
> > 
> > Cc: Cesar Miquel <miquel@df.uba.ar>
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> Anything else I need to do to land this?

Patience, 5.4-rc1 just came out, my queue is 1500+ patches deep, I will
dig through it in the next week...

thanks,

greg k-h
