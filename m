Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE8C3A0E76
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 10:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237637AbhFIIHT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 04:07:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:56274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237582AbhFIIHC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 04:07:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA7916100A;
        Wed,  9 Jun 2021 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623225891;
        bh=M0iiK/pnYODjO2ZJcRJqhkvjcH8Jq13eqGDj81Bzjso=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kfz8ps7rAqQz22dHTHyZDZ/F2jf1jwgbQ7W0pKwdxFbOzxeg5zTc7/gTbkY5RMJrz
         CjcrurAF3N6rBkolsVQB2vk7toSmZUS13SM8Lq26W42MD+OUWDG9mXknmVUtYu/fn9
         gAgl0rpePGvf0KPxmxqfXy2tQpqlnUwYZsk/Esjk=
Date:   Wed, 9 Jun 2021 10:04:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.13-rc5
Message-ID: <YMB2HuI5mBpygbEl@kroah.com>
References: <YLtTOR0H2AU1QATc@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLtTOR0H2AU1QATc@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jun 05, 2021 at 12:34:33PM +0200, Johan Hovold wrote:
> The following changes since commit f8e8c1b2f782e7391e8a1c25648ce756e2a7d481:
> 
>   USB: serial: pl2303: add device id for ADLINK ND-6530 GC (2021-05-10 11:15:23 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.13-rc5

Pulled and pushed out, thanks.

greg k-h
