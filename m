Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6F5C345D2D
	for <lists+linux-usb@lfdr.de>; Tue, 23 Mar 2021 12:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbhCWLmG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Mar 2021 07:42:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230078AbhCWLli (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Mar 2021 07:41:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32DEC61920;
        Tue, 23 Mar 2021 11:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616499697;
        bh=qvPjF2Zi5q7AMurhTHoD2WqgEZmOpQYO9S7DC61qsJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gFOyPar/VZnuyTFea20gdiCsKWgXhEtNc1BoR8N2tBfisRj79SK2g9TDfIo9u6Bs4
         wyrYx72+0O7lCKA47OTAn5cvCQ0vtqpx+6iGToa1Mxy+vImEHqZYwC/EkmWLQRgtFU
         tFKn5zmUyPeR4NPF6jjr0kcsfX1aee6QZi0kgKmY=
Date:   Tue, 23 Mar 2021 12:41:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     "Hongren Zheng (Zenithal)" <i@zenithal.me>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Antonio Borneo <borneo.antonio@gmail.com>,
        matt mooney <mfm@muteddisk.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usbip: tools: add options and examples in man
 page related to device mode
Message-ID: <YFnT7+XTRvllqaMH@kroah.com>
References: <YE/FaQxejKplWwyL@Sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE/FaQxejKplWwyL@Sun>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 04:36:57AM +0800, Hongren Zheng (Zenithal) wrote:
> The commit e0546fd8b748b19d8edd1550530da8ebad6e4b31 implemented device
> mode for user space tools, however the corresponding options are not
> documented in man page.

When referring to commits in the kernel, they should be listed as:
e0546fd8b748 ("usbip: tools: Start using VUDC backend in usbip tools")
as the kernel documentation asks for.

Please fix up and resend.

thanks,

greg k-h
