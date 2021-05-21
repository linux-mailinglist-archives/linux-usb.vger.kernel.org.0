Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C5838C7A4
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 15:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233933AbhEUNTA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 09:19:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:41566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232959AbhEUNS4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 09:18:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0ADE161261;
        Fri, 21 May 2021 13:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621603052;
        bh=NLGy84V3JKBs2U5z0IPT1MdF3mLzONZmZuCwY6Rp4V4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2A8SHvjDL4yMawZu/zYksz/ZO70IM9UkclJGplNKjRuz/EN2rfeR+2aQ6ee331Xj7
         T1rav4mVtLhoumkU1zZirXf1f7ktwA7k3IDcUi2FTazUtB2TNThxGVH5xVDJmQGd1S
         5Zyoyi+UF6kZCc9OaHDTn2g4/FmYO/DoXnle1FD8=
Date:   Fri, 21 May 2021 15:17:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Geoffrey D. Bennett" <g@b4.vu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] USB: usbfs: remove double evaluation of usb_sndctrlpipe()
Message-ID: <YKey6h3njaT7gfCI@kroah.com>
References: <20210521125856.116349-1-g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521125856.116349-1-g@b4.vu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 21, 2021 at 10:28:56PM +0930, Geoffrey D. Bennett wrote:
> usb_sndctrlpipe() is evaluated in do_proc_control(), saved in a
> variable, then evaluated again. Use the saved variable instead, to
> match the use of usb_rcvctrlpipe().
> 
> Fixes: 4c6e8971cbe0 ("USB: make the "usbfs_snoop" log more pertinent")

There is no bug here to "fix" this is just a cleanup.

Can you drop this and then properly cc: the needed developers when you
resend a v2?

thanks,

greg k-h
