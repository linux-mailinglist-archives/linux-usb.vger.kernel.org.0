Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406C6CE7B0
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 17:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbfJGPfl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 11:35:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:45116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727745AbfJGPfl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 11:35:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 130CD206C2;
        Mon,  7 Oct 2019 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570462540;
        bh=xhnm/YTizcBQ8ArFYMT6zU0wuRZiazDJtCHc8nebQiQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c0iCnnTj3f1ZJRuxTEMqpvbuxrSQ53fGdYCT3fq7cgvTUc/TcXVzeX4hZKKmjmgQX
         6nTFQ2Qx60RIvch637jrKWbgURebGLL2YkKPwwffLyVcKgHuciJzA+UIyOAMDqJv4A
         /i+/Tp4H4/KlhPjKx6x97n44rS+YiD+O4gKOGlOU=
Date:   Mon, 7 Oct 2019 17:35:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Heinzelmann <heinzelmann.david@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20191007153538.GA985210@kroah.com>
References: <20191007084701.GA9937@dhe-pc>
 <Pine.LNX.4.44L0.1910071001230.1513-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1910071001230.1513-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 07, 2019 at 10:01:47AM -0400, Alan Stern wrote:
> On Mon, 7 Oct 2019, David Heinzelmann wrote:
> 
> > Hi,
> > 
> > I hope it all fits now.
> > 
> > David
> > 
> > 
> > From 8517ecfac0175aebba03bb0868dde652bc3c36e5 Mon Sep 17 00:00:00 2001
> > From: David Heinzelmann <heinzelmann.david@gmail.com>
> > Date: Fri, 4 Oct 2019 12:28:36 +0200
> > Subject: [PATCH v4] usb: hub: Check device descriptor before resusciation
> > 
> > If a device connected to an xHCI host controller disconnects from the USB bus
> > and then reconnects, e.g. triggered by a firmware update, then the host
> > controller automatically activates the connection and the port is enabled. The
> > implementation of hub_port_connect_change() assumes that if the port is
> > enabled then nothing has changed. There is no check if the USB descriptors
> > have changed. As a result, the kernel's internal copy of the descriptors ends
> > up being incorrect and the device doesn't work properly anymore.
> > 
> > The solution to the problem is for hub_port_connect_change() always to
> > check whether the device's descriptors have changed before resuscitating
> > an enabled port.
> > 
> > Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>
> 
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

David, can you resend this in a format that I can apply it in?

thanks,

greg k-h
