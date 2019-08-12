Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA9928A12C
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 16:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfHLOc6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 10:32:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:50268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfHLOc6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Aug 2019 10:32:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 88A4220665;
        Mon, 12 Aug 2019 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565620378;
        bh=Hycm/KwszMWzrheW2Jizs90ebCWNGMl1H4MMjCizZ88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tSRz/sn3Mjwi+0DeiSBg/AfHFGAgIWWY6/U+wIAbWkbhH+ty97E0s2peNrd55ph4H
         BHUegbzHtUWT8LsBBbsZFi5jMukSH3piH6Qe8HvBp4pfnIUQoQgCCw/VImEygBUOrS
         qY/1PFv0/4ZQeU1oOk0lcBL5bBH0ENO1ANlHoJfA=
Date:   Mon, 12 Aug 2019 16:32:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB fixes for v5.3-rc
Message-ID: <20190812143255.GC14068@kroah.com>
References: <87a7ceu2j4.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7ceu2j4.fsf@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 12, 2019 at 01:00:15PM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> here's a pull request for some fixes that I collected from linux-usb
> mailing list.
> 
> Let me know if you want anything to be changed.
> 
> Cheers
> 
> The following changes since commit d45331b00ddb179e291766617259261c112db872:
> 
>   Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-for-v5.3-rc4

Pulled and pushed out, thanks.

greg k-h
