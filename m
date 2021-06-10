Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE473A2901
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 12:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbhFJKIq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 06:08:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229910AbhFJKIp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 06:08:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0706C60FDA;
        Thu, 10 Jun 2021 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623319609;
        bh=1fRWWIsS0EzmFB2f6c4CQ2/VYD7gJ2/ox+YVPrSpBy8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y35lLmHQtdvE6shQv9Rzs8VFxcgBX6P3eU8r/80pzwbwyZV5HHSAlkGfljLbX9drb
         UV2PszxX7c6svsuwTiE4Jq1h3VSyPlR/M6lAz4aALYRimuLn5bRN9J1QgiLnsRV2QZ
         oBtStkOjHvCfMEB7P7Ei19Zi+bWdPwr9UENfNmF0=
Date:   Thu, 10 Jun 2021 12:06:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     kun peng <kunpeng0891@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb3.0: dwc3: isoc: missisoc while setting the USB transfer UVC
 data
Message-ID: <YMHkNhAy4pkePSWO@kroah.com>
References: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJa5FiHh3oWGt3qMRWTBRorENhsKNODTRd+0meK2qpYnMk6U8g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 10, 2021 at 04:52:19PM +0800, kun peng wrote:
> Hi ， I'm using the 4*A53 with DWC3 USB controller, my hardware to work
> like a USB camera and so make use of the USB 3.0 UVC gadget driver。
> usb3.0 isoc transfer with  missisoc -18，larger maxburst is set, the
> more -18 appears。
> but from trace info, the trb has been put in advance。

What exactly is the problem you are having here?

What is not working how you expect it to?

> test setting:
> dwc3 driver version：5.12

You mean kernel version?

thanks,

greg k-h
