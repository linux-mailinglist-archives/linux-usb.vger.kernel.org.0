Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C89A230DF0
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 17:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730824AbgG1PeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jul 2020 11:34:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:46522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730701AbgG1PeR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jul 2020 11:34:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 316B8206D4;
        Tue, 28 Jul 2020 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595950456;
        bh=GSRnivgGk0UFIbx4KNvNCb+TeGtPUIrUImRTsPTZqlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oGUDwyf76DM++H24TlFSmOrCeu/OtpGZZh+bz28gL8F18DGZnCnJStTkxTpIAxBmd
         rIkfukor4+NSM748YhHW0zmqVE8sp/PqSvEQfhN4QRWB5Q5T50ZNZErbdeXDl61GDr
         P0VUOvrRkrh25e5JSt9HRkU0yv6iC94AxXrFdvcw=
Date:   Tue, 28 Jul 2020 17:33:35 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.9-rc1
Message-ID: <20200728153335.GA3768595@kroah.com>
References: <20200728131508.GA14059@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728131508.GA14059@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 28, 2020 at 03:15:08PM +0200, Johan Hovold wrote:
> The following changes since commit 9cf6ffae380061b16b2b4269d4f2e1a50aa2508a:
> 
>   Merge 5.8-rc3 into usb-next (2020-06-29 08:22:27 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.9-rc1

Pulled and pushed out, thanks.

greg k-h
