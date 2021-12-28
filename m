Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF1C480B05
	for <lists+linux-usb@lfdr.de>; Tue, 28 Dec 2021 16:58:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbhL1P57 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Dec 2021 10:57:59 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:57256 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbhL1P56 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Dec 2021 10:57:58 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 50EBAB8115C
        for <linux-usb@vger.kernel.org>; Tue, 28 Dec 2021 15:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680B3C36AE7;
        Tue, 28 Dec 2021 15:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640707075;
        bh=vXHBDkJZspwUt54gwkvHHRWzac9FU4uJF9NXI1sdKPE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dLKiJacxVo9zRMHrocumsF0DuBc1HoHsudig0maq3BrugRpJtgVl0WsEnn6DE3vX+
         7ATDnEdhspgtgN7rjXiHe4ZV9v0kH9wOXf/PejssiMzvCumHkWzkKH3jQt+lGANmHl
         kpW4Ss9DrMTnCzTd+QnYJ1R2ec5dBSD73i5YWV3A=
Date:   Tue, 28 Dec 2021 16:57:52 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian <tostc6@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: PROBLEM: USB stops working
Message-ID: <Ycs0AJDaRkJwTZI9@kroah.com>
References: <2d6aeefb-97ea-c6e9-0824-a918f6ec5b4c@gmail.com>
 <083d3bab-df88-d2e2-9334-c8367da39e7b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <083d3bab-df88-d2e2-9334-c8367da39e7b@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 28, 2021 at 04:05:18PM +0100, Christian wrote:
> [1.] One line summary of the problem: USB stops working
> 
> [2.] Full description of the problem/report:
> 
> I have this problem when using the Steam client so I'm not sure if this is
> kernel related or not, but please see my notice at the end of this section.
> 
> When Steam is only running in the background, my entire system sound usually
> cracks. This occurs on both Steam and non-Steam games. All my USB devices
> stop working for a second. So when I write something, some letters do not
> appear on the screen, and sometimes my mouse clicks are not recognized
> either. As soon as I close steam completely, the problems are gone.
> Sometimes my entire USB driver crashes so I have to restart my computer to
> get it working again.

Is there any kernel log messages happening when this occurs?

You can look at them by typing 'dmesg' in a console window.

You say something crashes, what is the message when that happens?

And can you reproduce this without the nvidia drivers loaded?

thanks,

greg k-h
