Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8F621A44E
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 18:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgGIQEQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 12:04:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:53218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgGIQEQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 12:04:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CCFAC2077D;
        Thu,  9 Jul 2020 16:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594310656;
        bh=ETBFJDSAFiCnqi5o09DJlz6wtvExixkBaqJ2uj3S558=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d4+muDx70wcoGY0GPoXT2Si9krBefbZ+yFeApfrWKrnHchLtjNNZSfyLUU0lhuA2d
         OKVVdoE9QaYPj6x1lqFD95NS8cSQYO6bJAaNl6FtWVa6tZ967z+hGualnWv8GixDS2
         fb1buMt8fx9Om/xNG5VAtCbW3Wsf4BRmyfU8+kGI=
Date:   Thu, 9 Jul 2020 18:04:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.com>
Cc:     linux-usb@vger.kernel.org, Pete Zaitcev <zaitcev@redhat.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Kris Katterjohn <katterjohn@gmail.com>
Subject: Re: [PATCH v4 2/2] usbmon: expose the usbmon structures and
 constants as an UAPI header.
Message-ID: <20200709160423.GB863447@kroah.com>
References: <20200705150225.21500-1-flameeyes@flameeyes.com>
 <20200706224415.2854-1-flameeyes@flameeyes.com>
 <20200706224415.2854-2-flameeyes@flameeyes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200706224415.2854-2-flameeyes@flameeyes.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 11:44:15PM +0100, Diego Elio Pettenò wrote:
> This allows applications to use the usbmon ioctl() without declaring the
> constants.
> 
> Update the documentation to reflect the new header.
> 
> Cc: linux-usb@vger.kernel.org
> Cc: Pete Zaitcev <zaitcev@redhat.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Kris Katterjohn <katterjohn@gmail.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Diego Elio Pettenò <flameeyes@flameeyes.com>
> ---
>  Documentation/usb/usbmon.rst |  70 ++++++++++++-----------
>  drivers/usb/mon/mon_bin.c    |  92 +-----------------------------
>  include/uapi/linux/usb/mon.h | 107 +++++++++++++++++++++++++++++++++++
>  3 files changed, 145 insertions(+), 124 deletions(-)
>  create mode 100644 include/uapi/linux/usb/mon.h

What changed from previous versions?  Always put that below the --- line
like the documentation asks you to.   Please do that when you resend
this series.

thanks,

greg k-h
