Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B7FF3FE241
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 20:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344407AbhIASRf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 14:17:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:53708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244653AbhIASRf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Sep 2021 14:17:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B52761054;
        Wed,  1 Sep 2021 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630520198;
        bh=PDc9ADPKjagCelgUd/yc4RuTpHpi6uylq87+Av2GXPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YefzJM3ewbNwkMhbSKb897N2XAV+QNMIa0yBB2DCS/pETY1cegaOESgmjaU7z7qx5
         zw45fydZLf4cW/O6EbbhinMmMLzNLK92IoRjtnpgzY1iY5vYnGu4UchXH9wO2DFEHK
         PMk+OaxphLnl56nQl5Go1IhTstn/ogP5KeNEmvjY=
Date:   Wed, 1 Sep 2021 20:14:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fix for 5.15-rc1
Message-ID: <YS/DA6361xS4vebY@kroah.com>
References: <YS3/OWl4ZlpRs1Eb@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS3/OWl4ZlpRs1Eb@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 31, 2021 at 12:06:49PM +0200, Johan Hovold wrote:
> The following changes since commit df7b16d1c00ecb3da3a30c999cdb39f273c99a2f:
> 
>   Revert "USB: serial: ch341: fix character loss at high transfer rates" (2021-08-25 09:13:33 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.15-rc1

Pulled and pushed out, thanks.

greg k-h
