Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4584C49F43D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jan 2022 08:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242889AbiA1HTR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jan 2022 02:19:17 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:52690 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbiA1HTQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jan 2022 02:19:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D33D1B824B1
        for <linux-usb@vger.kernel.org>; Fri, 28 Jan 2022 07:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE1BC340E0;
        Fri, 28 Jan 2022 07:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643354354;
        bh=V0sEDh7Dgnrz65pj7R1qnr/ZUxrI8u11Db7UmE+Iun0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x5unhc4Sbq7ge1fKF8Nk1dWhrN2sdgUInz5I+dqr/fznLTBRGXsLiP0UHkOBFlFE5
         61rUyAOODcp4zs1q8EXp79pwC/1/gjaKbbAxelgGKyy0HiQ8rTFrp50mJ2yGyQhfg0
         jAc7Y5fLMOC5vEgWGkyayItMZzGWl4kQrS32cp0s=
Date:   Fri, 28 Jan 2022 08:19:11 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rory Bolt <Rory.Bolt@kioxia.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Possible big endian bug in latest stable kernel
Message-ID: <YfOY71XYWdyDeENE@kroah.com>
References: <7d0dcfb5dd844a3d8e4f2458e5a55887@kioxia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d0dcfb5dd844a3d8e4f2458e5a55887@kioxia.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 27, 2022 at 05:33:27PM +0000, Rory Bolt wrote:
> 
> Hello Greg,
> 
> I used bisect to find the offending commit:
> 
> To my surprise, it appears to be only peripherally related to USB; it is in fact the change to drivers/regulators/core.c
> 
> I cannot explain how this only affects big endian operation, not little endian. I can only theorize that since the u-boot firmware is in little endian mode, it has already set up the regulators... however when I transition to big endian mode, I essentially re-init everything.
> 
> aarch64_be-test /usr/src/linux-5.15.14/drivers/regulator # diff core.c.orig core.c
> 1531c1531,1532
> <               if (rdev->supply_name && !rdev->supply)
> ---
> >               if (rdev->supply_name && !rdev->supply &&
> >                   !rdev->constraints->always_on)
> 
> I am uncertain if this patch is generally correct or not, hence my reluctance to post. It seems that rdev-supply is ALWAYS null and rdev->constraints->always_on is ALWAYS true for the RockPro64 board. My concern is that this may affect other platforms.
> 
> Should I post this to the general kernel mailing list? Is there another more appropriate list?

You point at a merge commit, but not the actual commit that causes the
problem within that merge commit.  I would cc: the developers involved
in that tree and point them at this git bisect run and work with them to
resolve this issue.

thanks,

greg k-h
