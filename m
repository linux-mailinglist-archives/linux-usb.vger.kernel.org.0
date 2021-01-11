Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C02C2F211C
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 21:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388756AbhAKUsg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 15:48:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:38804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728354AbhAKUsg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 15:48:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB937222B6;
        Mon, 11 Jan 2021 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610398075;
        bh=n2YvYdIF5RgaEIxL8mJLX4Gw34GCEqp3YObWkqW8TV8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zbOjYl6U8JPtQeslWgLY1scwh7Xc1lkHqIp3QAbW3DmkvPYe+MIJBxk4ztr+m7GBu
         gZnbX83O4xlGGKKCWGrODGaTIsOowGqCIPaBAtsHZjaA4OfGdBzbyLN26tDXoq71Bz
         Nu+CVX7N/XjSTUcjQt/X8KMkSninIccd31iJ6jjw=
Date:   Mon, 11 Jan 2021 21:49:05 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, Mayank Rana <mrana@codeaurora.org>
Subject: Re: [PATCH] usb: typec: ucsi: Add support for USB role switch
Message-ID: <X/y5wXyOL9/ELzrz@kroah.com>
References: <20201217062047.13126-1-jackp@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201217062047.13126-1-jackp@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 16, 2020 at 10:20:47PM -0800, Jack Pham wrote:
> From: Mayank Rana <mrana@codeaurora.org>
> 
> UCSI already conveys the information about a port's connection
> status, whether it is operating in UFP or DFP mode, and whether the
> partner supports USB data or not. This information can be used to
> notify a dual-role controller to start up its host or peripheral
> mode accordingly. Add optional support for this by querying each
> port's fwnode to look for an associated USB role switch device.
> If present, call usb_role_switch_set() with the determined data
> role upon Connect Change or Connector Partner Change updates.
> 
> Signed-off-by: Mayank Rana <mrana@codeaurora.org>
> Signed-off-by: Jack Pham <jackp@codeaurora.org>
> ---
>  drivers/usb/typec/ucsi/ucsi.c | 55 +++++++++++++++++++++++++++++++++--
>  drivers/usb/typec/ucsi/ucsi.h |  3 ++
>  2 files changed, 55 insertions(+), 3 deletions(-)

This fails to apply to my usb-next branch of usb.git on git.kernel.org.
Can you rebase and resend, with Heikki's review added?

thanks,

greg k-h
