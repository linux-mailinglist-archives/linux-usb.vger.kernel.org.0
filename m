Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51C5D282469
	for <lists+linux-usb@lfdr.de>; Sat,  3 Oct 2020 16:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgJCOBI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Oct 2020 10:01:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgJCOBI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 3 Oct 2020 10:01:08 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22909206F8;
        Sat,  3 Oct 2020 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601733667;
        bh=olA6r0nMCbKhHm2P2noLS3evnoiQTyzUBW5Mlz49kt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PSqnxN9zkVNlrgSf+v9QRfVv/9z2R6ed7joEMU/4/puWgGyo82NpAzFFiVZTXLv7H
         O5VVqlbSp0IPH6oRXhcTWqVnmTQ29VOstsCCl4QvGIhUzQa1kgNcrpiY/TcJ7E6L3i
         0HB7zsKTKjm2ov8A3Yw8LC8/tuBj0KLfV8l70E1Y=
Date:   Sat, 3 Oct 2020 16:00:50 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB changes for v5.10
Message-ID: <20201003140050.GB3187@kroah.com>
References: <878scnygxb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878scnygxb.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 03, 2020 at 09:14:40AM +0300, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Here's the big gadget pull request. Patches have been around for quite a
> while and I think all the little linux-next problems have been found.
> 
> Let me know if you want anything to be changed.
> 
> cheers
> 
> The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:
> 
>   Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-v5.10

Looks good, pulled and pushed out now, thanks.

greg k-h
