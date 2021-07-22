Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFDA83D2C2A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jul 2021 20:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhGVSLP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jul 2021 14:11:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:48524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhGVSLO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Jul 2021 14:11:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0249C60C41;
        Thu, 22 Jul 2021 18:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626979908;
        bh=k8r7CJK3rlg63C5dNUmwMFXv7s7rWbSj+s9ypXpzqMs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aAKs714RcQ+vD7rGIP44/9Fyb16L2JHuLiN9Fb/fCYAuhK6N4ZJyjDl6f/8qu7Ia+
         O+DPhMrJXX2PZslI5Kd7H+ZGp4EAskBAeUF4wRsWcG/QDmJBfaPMMOrDFaNdqHF+xh
         yqmjHCdVD8vv4KwdeAY+ZMTtMBGHUdZtevsY0SFs=
Date:   Thu, 22 Jul 2021 20:51:38 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.14-rc3
Message-ID: <YPm+OqnO/A0Gam1I@kroah.com>
References: <YPm2ORYfoMs60d9f@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPm2ORYfoMs60d9f@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 22, 2021 at 08:17:29PM +0200, Johan Hovold wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.14-rc3

Pulled and pushed out, thanks.

greg k-h
