Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E14D3B76F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403917AbfFJOcC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:32:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403909AbfFJOcC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jun 2019 10:32:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 049D9207E0;
        Mon, 10 Jun 2019 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560177121;
        bh=PflKnKesGg+9fNq7sv5L6D9e+WaFR8YsWYKtGeSSAhw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yohFkjt1R8XvxCnIXy0vs35fTPPV1vbUcgRqvhqVJEoAYu6ab7PM7pT6keh3OFZjM
         wXbsf1p8GmM+O4DRZCXhBM/tNKa166Kebplp0o2zwuSDNdB+qJrUh4h3cZqS50A+fO
         euOaVFT2pHXq18zTFsz5pOj2a/FlAnuN0ukpM2pI=
Date:   Mon, 10 Jun 2019 16:31:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.2-rc5
Message-ID: <20190610143152.GA23343@kroah.com>
References: <20190610134829.GA30830@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610134829.GA30830@localhost>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 10, 2019 at 03:48:29PM +0200, Johan Hovold wrote:
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.2-rc5

Pulled and pushed out, thanks.

greg k-h
