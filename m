Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7201B18984D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2020 10:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbgCRJpe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Mar 2020 05:45:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:45894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727501AbgCRJpe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Mar 2020 05:45:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 467E220674;
        Wed, 18 Mar 2020 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584524733;
        bh=Wnmf77VkkMzkXtn8z7ONwjRsH3ZR1jKlb2R89GHyrd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X75dTwECBUHcooFp/pWOk0AOc8rwS8tA1AdT7JRFzigmdwsYwGuv49GunzfTa89uz
         a8ds2f9Te8OXQkaUL82Hl06Of6hpfAH1cJRKqUzkAvazRh/volmalxPG/hXDzFP8pc
         HStrNDmAJ34DpmIR2zKxt/KLiFt8tWR4TcSR4iKg=
Date:   Wed, 18 Mar 2020 10:45:31 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.6-rc7
Message-ID: <20200318094531.GA2015136@kroah.com>
References: <20200318084317.GA19665@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318084317.GA19665@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 18, 2020 at 09:43:17AM +0100, Johan Hovold wrote:
> The following changes since commit 2c523b344dfa65a3738e7039832044aa133c75fb:
> 
>   Linux 5.6-rc5 (2020-03-08 17:44:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.6-rc7

Pulled and pushed out, thanks.

greg k-h
