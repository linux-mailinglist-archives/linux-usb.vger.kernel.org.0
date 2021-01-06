Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E7EA2EC2CA
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 18:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbhAFRxV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 12:53:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:56018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbhAFRxT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Jan 2021 12:53:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D5D2B23123;
        Wed,  6 Jan 2021 17:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609955559;
        bh=53kc/3+u1ukXL11g12j8oP++BqPNcmxG+8uxueoPu6w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vrBZFgvezyb/2w/vSlmRL7SMXtyOMmaRVpXyWgRSt+tkkUA7CU1NT/LrefjQBtcuG
         lEUsnV97emn+HzppLsIxogZqClZW+FZuBGUHuDndSd8SNStuCUpm7cVg2di7l3MvRC
         gZVOV+FQtizWox1q6EWEyXtPBlzxABHVKc+Cg/Lg=
Date:   Wed, 6 Jan 2021 18:53:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 5.11-rc3
Message-ID: <X/X5M+J4sJ5wrNeY@kroah.com>
References: <X/WbS27KrQAbUgfK@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/WbS27KrQAbUgfK@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 06, 2021 at 12:13:15PM +0100, Johan Hovold wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.11-rc3

Pulled and pushed out, thanks,

greg k-h
