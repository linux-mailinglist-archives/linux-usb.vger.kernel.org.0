Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3082157FC
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jul 2020 15:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbgGFNHS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jul 2020 09:07:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:45628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729069AbgGFNHS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 Jul 2020 09:07:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2C67B2070C;
        Mon,  6 Jul 2020 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594040837;
        bh=Ov+r/pBeKpbQ0dIuO2vHfVrS6pIerUv2uCyxIMezj90=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ePxHPU2U+bJllopYL/Z5J51H2jX3puwREa9Iu/PnlCHf22mEuIREYuA3mLqBC+WQx
         3BJCuG0sFYgOnYqd1iZ5eJuLQURZRZoVwWdTP5hOO6BGku4ALo5gwf2YrmTO9LrI5N
         10BczfJ5LdPLg8+Xekjbo17PmDf9hjB4dt+MqPq4=
Date:   Mon, 6 Jul 2020 15:07:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kars Mulder <kerneldev@karsmulder.nl>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        David Laight <David.Laight@aculab.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Pavel Machek <pavel@denx.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH] usb: core: fix quirks_param_set() writing to a const
 pointer
Message-ID: <20200706130717.GA2276608@kroah.com>
References: <20200706103405.GA11622@kroah.com>
 <5e4e-5f032000-4f-47356f00@80491239>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e4e-5f032000-4f-47356f00@80491239>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 02:57:59PM +0200, Kars Mulder wrote:
> On Monday, July 06, 2020 12:34 CEST, Greg Kroah-Hartman wrote: 
> > That's a lot of stack space, is it really needed?  Can we just use a
> > static variable instead, or dynamically allocate this?
> 
> It is very possible to statically or dynamically allocate this.
> 
> Statically reserving an additional 128 bytes regardless of whether
> this feature is actually used feels a bit wasteful, so I'd prefer
> stack or dynamic allocation.
> 
> An earlier draft of my patch did dynamically allocate this memory;
> early discussion (https://lkml.org/lkml/2020/7/3/248) suggested that
> dynamic allocation has the disadvantage of introducing a new obscure
> error condition:
> 
> On Friday, July 03, 2020 10:13 CEST, David Laight wrote: 
> > The problem with strdup() is you get the extra (unlikely) failure path.
> > 128 bytes of stack won't be a problem if the function is (essentially)
> > a leaf.

Just test for memory allocation failure and handle it properly, it isn't
hard to do.

128 bytes on the stack can be a problem, don't get in the habit of doing
so please.

thanks,

greg k-h
