Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7189B1E59E8
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 09:54:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgE1Hyn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 03:54:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:43882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbgE1Hyn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 May 2020 03:54:43 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F96320899;
        Thu, 28 May 2020 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590652482;
        bh=iA9LjDhDhDIKu6wbY/3jDwnrCTSdv1yDL8iqDaUyC5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pQlkUS2W3O31h5P1kbhppM+DWuZb7nHI1yfMY8Kt7b+UO1FW2MbLzDIlAQd7rjEoi
         7WoPeWgBt06Z1ixrV1L2ta058tVGB72uJbxCCNW58zrUx0pcMkMdyDDim0AU2FLc5L
         2GLSBlBv1QaIxbasMcAZTxefkxK6SQPmRe18OdIE=
Date:   Thu, 28 May 2020 09:54:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zebediah Figura <zfigura@codeweavers.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
Subject: Re: Bug 207877: ASMedia drive (174c:55aa) hangs in ioctl
 CDROM_DRIVE_STATUS when mounting a DVD
Message-ID: <20200528075440.GA2881385@kroah.com>
References: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d0b20b9-4735-bbed-bb50-72764aefd6d8@codeweavers.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 27, 2020 at 11:23:13PM -0500, Zebediah Figura wrote:
> Hello all,
> 
> I was asked to report this bug here. There's more details in the bug report,
> but it's been proposed that there's a deadlock between device_reset() in
> scsiglue.c and usb_stor_control_thread().

What bug report where?  Can you provide a link and the details here in
the email?

thanks,

greg k-h
