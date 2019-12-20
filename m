Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61B9112768C
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 08:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfLTHfk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 02:35:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:39624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfLTHfj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Dec 2019 02:35:39 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5F692467F;
        Fri, 20 Dec 2019 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576827339;
        bh=9g/P2q9d4GrNyMskupymOjeHFmKRBZTIcvdiadafjq0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aI8wXcZMZ2+WvY6DyFLpwR5MNXzhu0e180HxqvO2AYkmum8FpA3kzgc/FIlGFxMe1
         tiYiUu/y8GNesrcDJMsN0tFMjVkcJtgBWDTbL00cCV4RQ/hMPGJvpPRveuCjORQWGi
         zQS7C8oM70n/ODkKlHQofxbetCkz34u2YgpiIDvg=
Date:   Fri, 20 Dec 2019 08:35:37 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: EHCI: ehci-mv: drop pxa_ehci_type and unused device
 IDs
Message-ID: <20191220073537.GA2193408@kroah.com>
References: <20191220070202.239870-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191220070202.239870-1-lkundrak@v3.sk>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 20, 2019 at 08:02:02AM +0100, Lubomir Rintel wrote:
> A trivial cleanup.

How is dropping device ids a "trivial cleanup"?

Please be more descriptive as to why you are making a change.

Also, you sent a number of patches here and I do not know what order
they should be applied in.  Please resend them all as a numbered patch
series so that I have a clue what to do.

thanks,

greg k-h
