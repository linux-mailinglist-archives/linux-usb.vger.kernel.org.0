Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580402C5069
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 09:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388709AbgKZI24 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 03:28:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:60364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726591AbgKZI24 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 03:28:56 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9C1D620872;
        Thu, 26 Nov 2020 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606379334;
        bh=5KvXGI9RFJSJyRMweSifK1RqHqlX24baGxqNq/n4EiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rz0R6dlG/wYGzKkon5TL5mSatmmC/5Ghn0hAQ1XO3Hi00GA+1BQxVBJi4pBN4hKV3
         nVc/Cewdm3WOtJiBzpoWcz8VA9bvHV8GnwFG4mvEv8T/dNi5zipQ2bICpRSl/UBJoc
         cJ/CCnAG7NR70B6xDqk0Bcad7FD3OdQMxJ7RMfkE=
Date:   Thu, 26 Nov 2020 09:29:59 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Al Cooper <alcooperx@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Jim Quinlan <jquinlan@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] serial: 8250: of: Check for
 CONFIG_SERIAL_8250_BCM7271
Message-ID: <X79nh3UUzZfH17Qs@kroah.com>
References: <20201120194305.8847-1-alcooperx@gmail.com>
 <20201120194305.8847-2-alcooperx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120194305.8847-2-alcooperx@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 20, 2020 at 02:43:03PM -0500, Al Cooper wrote:
> From: Jim Quinlan <jquinlan@broadcom.com>
> 
> This commit has of_platform_serial_probe() check specifically for the
> "brcm,bcm7271-uart" and whether its companion driver is enabled. If it
> is the case, and the clock provider is not ready, we want to make sure
> that when the 8250_bcm7271.c driver returns EPROBE_DEFER, we are not
> getting the UART registered via 8250_of.c.
> 
> Signed-off-by: Jim Quinlan <jquinlan@broadcom.com>
> ---

When forwarding on patches from others, always include your
signed-off-by: as well, to ensure that you have reviewed this and are ok
with it.  I can't take this as-is, sorry.

And why did you include linux-usb@vger for this patch series?

thanks,

greg k-h
