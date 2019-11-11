Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD4BF74C6
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 14:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfKKN1t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 08:27:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:40602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726832AbfKKN1t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Nov 2019 08:27:49 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B5F812196E;
        Mon, 11 Nov 2019 13:27:48 +0000 (UTC)
Date:   Mon, 11 Nov 2019 14:27:46 +0100
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/11] USB: serial: mos7840: type detection and clean ups
Message-ID: <20191111132746.GA450958@kroah.com>
References: <20191107132904.2379-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191107132904.2379-1-johan@kernel.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 07, 2019 at 02:28:53PM +0100, Johan Hovold wrote:
> The mos7840 device-type detection is fragile and cannot generally be
> relied upon (e.g. as recently reported for Moxa UPort 2210 which was
> detected as a four-port device).
> 
> The first couple of patches adds support for encoding known chip
> features in the device-id table, and documents the underlying
> assumptions for the mcs7810-detection hack.
> 
> Turns out we have a lot of legacy cruft in this driver, and the
> remaining patches rips that out.
> 
> Johan
> 
> 
> Johan Hovold (11):
>   USB: serial: mos7840: clean up device-type handling
>   USB: serial: mos7840: document MCS7810 detection hack
>   USB: serial: mos7840: fix probe error handling
>   USB: serial: mos7840: rip out broken interrupt handling
>   USB: serial: mos7840: drop redundant urb context check
>   USB: serial: mos7840: drop paranoid port checks
>   USB: serial: mos7840: drop paranoid serial checks
>   USB: serial: mos7840: drop serial struct accessor
>   USB: serial: mos7840: drop port driver data accessors
>   USB: serial: mos7840: drop read-urb check
>   USB: serial: mos7840: drop port open flag
> 
>  drivers/usb/serial/mos7840.c | 770 +++++------------------------------
>  1 file changed, 102 insertions(+), 668 deletions(-)

Nice cleanups:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
