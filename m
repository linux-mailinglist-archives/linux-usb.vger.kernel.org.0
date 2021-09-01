Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4443FDDBA
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 16:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245090AbhIAOTR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 10:19:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244902AbhIAOTR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 10:19:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 017F0610A8;
        Wed,  1 Sep 2021 14:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630505900;
        bh=IJxMAKLP5Bxw7aRSx29ZCnc2nw+PV8vc/jl2ZXjIH6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g0etgObVHv2tqtJgnY9CSexLEog27coORiX8SkGWuijtoocifVtysRd3Q2ON7oQ2e
         u1Y0/bDGE22LSzGN3Sr2mt29H51F4+ZRemMxEkvBWwlSvCfViePmIRfDViMaeaTwvs
         /2NzADCAWyo1ZcL41HbtJQHgNnJC58Tp14eII84w=
Date:   Wed, 1 Sep 2021 16:18:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.15-rc1
Message-ID: <YS+LqqKnyQzS/fCY@kroah.com>
References: <YS4A7ZJYrhRXb+PN@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS4A7ZJYrhRXb+PN@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 31, 2021 at 12:14:05PM +0200, Johan Hovold wrote:
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>   Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc1-2
> 
> for you to fetch changes up to a65ab973c1669d3edc27719527bb3906f7b09918:
> 
>   USB: serial: replace symbolic permissions by octal permissions (2021-08-26 09:38:27 +0200)
> 
> ----------------------------------------------------------------
> USB-serial updates for 5.15-rc1
> 
> Here are the USB serial updates for 5.15-rc1, including:
> 
>  - a couple of fixes for cp210x termios error handling
>  - retrieval of fw revisions for more cp210x types
>  - a switch to octal permissions for all module-parameter definitions
> 
> Included are also various clean ups.
> 
> All have been in linux-next with no reported issues.
> 

Ugh, this was late, I'll pull this in after Linus takes the request I
just sent him...

thanks,

greg k-h
