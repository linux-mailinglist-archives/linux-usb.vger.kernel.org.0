Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A9A377F1
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 17:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729521AbfFFPar (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 11:30:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729359AbfFFP3y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Jun 2019 11:29:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A97820684;
        Thu,  6 Jun 2019 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559834993;
        bh=GbTOIXJRPAULPtQLGJJG/cjeEBIlSaoaSh+oZBIdyw4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1dyoigAZX9UFJPNi2HuTW08NuevAQLPJY03EbsiU3nWqVwYxIdf6ZhijJ7ORbVmGC
         wE5AGNemUWZ6MKCqhwiDVlhcr0GOdhCx69WCgQZ0RceBn/oosw9OjNNhCTxb27xQvH
         5zIqhn5yHLmATaycls7aQIi2xIZ3WzS3b1OsG7Rs=
Date:   Thu, 6 Jun 2019 17:29:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
Message-ID: <20190606152951.GA28997@kroah.com>
References: <Pine.LNX.4.44L0.1906061101180.1641-100000@iolanthe.rowland.org>
 <3D970B56-C8AE-4635-BE92-4FC6F7F8AF9D@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3D970B56-C8AE-4635-BE92-4FC6F7F8AF9D@digi.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 06, 2019 at 03:19:14PM +0000, Bollinger, Seth wrote:
> > On Jun 6, 2019, at 10:03 AM, Alan Stern <stern@rowland.harvard.edu> wrote:
> > 
> > EPERM means that the file descriptor was not opened with write access.  
> > It has nothing to do with reset failures.
> 
> Yes, I was confused by that as well so spent some time instrumenting the kernel.  It definitely is open for writing, and get’s by the initial f_mode check in devio.c:usbdev_do_ioctl.
> 
> Is it possibly a default error that’s returned when some deeper error is encountered?  Unfortunately I was unable to determine exactly where it was coming from...

ftrace is your friend :)

