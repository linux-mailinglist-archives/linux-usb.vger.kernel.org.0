Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1F8135D28
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 16:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732530AbgAIPqd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 10:46:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:43128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728293AbgAIPqd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 10:46:33 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 82F592067D;
        Thu,  9 Jan 2020 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578584793;
        bh=sYZtkBBoBfP32KtLm6hChjUFQPnxZwOrEJFm48tRQt4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0txmMl51Zfkw9KnkMykWpjpKN003D7ncgDrG5d2gBOiZwocdzCeMnKPuY/7yldFnO
         EV/mV0jlFSxuAR6vHQF/TnNYUbfxLd9gk6suVtQ4QvSTQVZKPgEkRNq85LHXBWL6z6
         ATjFb8943t26hTp0CN4vRXA57N9ijGU2A+DLjNpI=
Date:   Thu, 9 Jan 2020 16:46:30 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Keiya Nobuta <nobuta.keiya@fujitsu.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: core: hub: Improved device recognition on remote
 wakeup
Message-ID: <20200109154630.GA549548@kroah.com>
References: <20200109051448.28150-1-nobuta.keiya@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200109051448.28150-1-nobuta.keiya@fujitsu.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 09, 2020 at 02:14:48PM +0900, Keiya Nobuta wrote:
> If hub_activate() is called before D+ has stabilized after remote
> wakeup, the following situation might occur:
> 
>          __      ___________________
>         /  \    /
> D+   __/    \__/
> 
> Hub  _______________________________
>           |  ^   ^           ^
>           |  |   |           |
> Host _____v__|___|___________|______
>           |  |   |           |
>           |  |   |           \-- Interrupt Transfer (*3)
>           |  |    \-- ClearPortFeature (*2)
>           |   \-- GetPortStatus (*1)
>           \-- Host detects remote wakeup
> 
> - D+ goes high, Host starts running by remote wakeup
> - D+ is not stable, goes low
> - Host requests GetPortStatus at (*1) and gets the following hub status:
>   - Current Connect Status bit is 0
>   - Connect Status Change bit is 1
> - D+ stabilizes, goes high
> - Host requests ClearPortFeature and thus Connect Status Change bit is
>   cleared at (*2)
> - After waiting 100 ms, Host starts the Interrupt Transfer at (*3)
> - Since the Connect Status Change bit is 0, Hub returns NAK.
> 
> In this case, port_event() is not called in hub_event() and Host cannot
> recognize device. To solve this issue, flag change_bits even if only
> Connect Status Change bit is 1 when got in the first GetPortStatus.
> 
> This issue occurs rarely because it only if D+ changes during a very
> short time between GetPortStatus and ClearPortFeature. However, it is
> fatal if it occurs in embedded system.
> 
> Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
> ---
>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)

Is this something that should go into 5.5-final and the stable trees?
Or is it ok for 5.6-rc1?

thanks,

greg k-h
