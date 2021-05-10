Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CA7377EF7
	for <lists+linux-usb@lfdr.de>; Mon, 10 May 2021 11:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhEJJJY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 May 2021 05:09:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhEJJJY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 May 2021 05:09:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F7D3610A7;
        Mon, 10 May 2021 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620637699;
        bh=Gd3wk/HL/xE8DVeQDie++Ig7/q5VyCJBCXg5Yvr0TK4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lc22OHyWFVZK2b0L5KHg8u9rfBtaeeIVAYE5I88iOKfUvrFSr47IsQzdYZG/EuREO
         WPfEbBvdMH0BznY7nMKa2swIPkprOGgbkJm2vdhMr8vbtCim0ZmJaWMvpJBspLxrkW
         Q0rCTiRAJUkVozYnp6T8Eck9ZzEiTDDL83xZAT77ar9FW35n2vPx4gT952uv9WLcaQ
         UzDj4mHzKGtzczjxZeOa2a8QYJMC2WuSboGFWOM6hNCyCSYL09pC3k+9gw/O5gpozX
         Ef1dLqIFhv+UYVWLsRO9K/Ih5/iGwvgfGGRzGyvznjmc2yuPXOfFVDg1Gs8LzSUu8g
         ONafF68cozlHQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lg1tl-00086k-VC; Mon, 10 May 2021 11:08:22 +0200
Date:   Mon, 10 May 2021 11:08:21 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] usb: serial: option: add Telit LE910-S1 compositions
 0x7010, 0x7011
Message-ID: <YJj4BdSsQYzPkL0l@hovoldconsulting.com>
References: <20210428072634.5091-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210428072634.5091-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 28, 2021 at 09:26:34AM +0200, Daniele Palmas wrote:
> Add support for the following Telit LE910-S1 compositions:
> 
> 0x7010: rndis, tty, tty, tty
> 0x7011: ecm, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Hi Johan,
> 
> following the lsusb output, thanks.

Thanks, Daniele. Now applied.

Johan
