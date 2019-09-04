Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3228A8CDD
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 21:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732565AbfIDQSg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 12:18:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:54092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387546AbfIDQSf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 12:18:35 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D09921670;
        Wed,  4 Sep 2019 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567613914;
        bh=sC7d3G19my0wuRxGHnmv69/T4u7CkZZ7LnXonAOEEXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tQTTyOEWptIrKSMGw1x3kAdooYo19D5HbtO9PGefKmvKfrZXZSXRvTbzB8jZLCa6K
         1acFKpv414PG+K9kew6H+6UMQ0dFhd4bXL+9E+T9A4+9J4vsbs5OPahQuUDJ3DcFJH
         2PhhKCGM/JtbQgorcROOWnA1CEJuz/26fSWsMMK4=
Date:   Wed, 4 Sep 2019 18:18:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.4-rc1
Message-ID: <20190904161832.GB20662@kroah.com>
References: <20190904150356.GA24736@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904150356.GA24736@localhost>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 04, 2019 at 05:03:56PM +0200, Johan Hovold wrote:
> The following changes since commit d1abaeb3be7b5fa6d7a1fbbd2e14e3310005c4c1:
> 
>   Linux 5.3-rc5 (2019-08-18 14:31:08 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.4-rc1

Pulled and pushed out, thanks!

greg k-h
