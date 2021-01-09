Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6062EFEA7
	for <lists+linux-usb@lfdr.de>; Sat,  9 Jan 2021 09:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbhAIIkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 Jan 2021 03:40:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:43378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbhAIIkR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 9 Jan 2021 03:40:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E221720DD4;
        Sat,  9 Jan 2021 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610181576;
        bh=iuNAI3pk1SLsdAgTljOFAYsbERhp/qXVjYwUqechX5E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WjwNJ2EAXFvR7nHqnb0F0RbbT6VKWlAtkMPmatPHRiuaJvY5homWNSfUbAIj3CSxs
         G3zOU+I+nyJPipp1xpg5WDCxsYZTuCsWpVYj3alNPYMH6aZoST0zQ7+lbUX0cqxoXI
         g++9NJEVlod4kfr8S91APUbUAwYkPj+xqgjXQWoE=
Date:   Sat, 9 Jan 2021 09:39:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Eugene Korenevsky <ekorenevsky@astralinux.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] ehci: fix EHCI host controller initialization sequence
Message-ID: <X/lrxKfyGQTekKCN@kroah.com>
References: <20210108215504.GA27050@himera.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108215504.GA27050@himera.home>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jan 09, 2021 at 12:55:04AM +0300, Eugene Korenevsky wrote:
> According to EHCI spec, EHCI HCD clears USBSTS.HCHalted whenever USBCMD.RS=1.
> However, it is a good practice to wait some time after setting USBCMD.RS
> (approximately 100ms) until USBSTS.HCHalted become zero.
> 
> Instead, previous version of ehci_run() wrote 1 to USBCMD.RS, issued read to
> USBCMD and waited for 5 ms.
> That worked incorrectly at least at VirtualBox's EHCI virtual HCD and caused
> accidental hangs (bugzilla #211095).
> 
> This patch fixes #211095.

What is this number from?  Can you just provide a "Link:" tag?

thanks,

greg k-h
