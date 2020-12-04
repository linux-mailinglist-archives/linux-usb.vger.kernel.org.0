Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AA82CEE0C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Dec 2020 13:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbgLDM1C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Dec 2020 07:27:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:49432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbgLDM1B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Dec 2020 07:27:01 -0500
Date:   Fri, 4 Dec 2020 13:27:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607084781;
        bh=5ebofhpVPy4UKtYFXXHqpuhHZO5gUGMZqGFwE1rw1ss=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=nx7QIpJGKIOuusn60xqK9bgHOZ1+ofcFhhDTaZHP5FNlHKGEQTaxNmUOr4VhLVRyA
         gWLZg5rnSwtolOyR0ooEOGK1EBFctgltjDdE3Cxg9A7Kz0iEACF3NhWRkleSuXc2yz
         BylPcgfmcWtqyIHIeTJTdohcxC/xvejKZLi8Eb5k=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.10-rc7
Message-ID: <X8orORkm8jedQC8j@kroah.com>
References: <X8oaJPqNvhGB/2Sd@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8oaJPqNvhGB/2Sd@localhost>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 04, 2020 at 12:14:44PM +0100, Johan Hovold wrote:
> The following changes since commit 09162bc32c880a791c6c0668ce0745cf7958f576:
> 
>   Linux 5.10-rc4 (2020-11-15 16:44:31 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.10-rc7

Pulled and pushed out, thanks.

greg k-h
