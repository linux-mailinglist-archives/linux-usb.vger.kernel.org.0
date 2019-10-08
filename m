Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2A9CCFA89
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2019 14:55:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730719AbfJHMzw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Oct 2019 08:55:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730555AbfJHMzv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Oct 2019 08:55:51 -0400
Received: from localhost (unknown [89.205.136.155])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 44DB120640;
        Tue,  8 Oct 2019 12:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570539349;
        bh=z33KO/q8zwb8lWlM35NNLhVKUL/yaPe2cRr4g9Uj2HI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=us6NDQre20+Fme8sPJzGWNa0Xw16PUY+p2aZu9DTaoSJZ/6/DVOBaUtNxcksFeiSf
         DDT52sQtkzXnSoGTDMD1IDMCeAnc3/lXpodcnOoe+1XSs978TzWfHQo1s7pAM+RWT9
         +gyDtNdXsDZgYGHcLLvEm+9ol8BxTmB4m7Il+oPA=
Date:   Tue, 8 Oct 2019 14:55:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Heinzelmann <heinzelmann.david@gmail.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: hub: Check device descriptor before resusciation
Message-ID: <20191008125546.GA2846493@kroah.com>
References: <20191007153538.GA985210@kroah.com>
 <20191008080901.17628-1-heinzelmann.david@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008080901.17628-1-heinzelmann.david@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 08, 2019 at 10:09:01AM +0200, David Heinzelmann wrote:
> If a device connected to an xHCI host controller disconnects from the USB bus
> and then reconnects, e.g. triggered by a firmware update, then the host
> controller automatically activates the connection and the port is enabled. The
> implementation of hub_port_connect_change() assumes that if the port is
> enabled then nothing has changed. There is no check if the USB descriptors
> have changed. As a result, the kernel's internal copy of the descriptors ends
> up being incorrect and the device doesn't work properly anymore.
> 
> The solution to the problem is for hub_port_connect_change() always to
> check whether the device's descriptors have changed before resuscitating
> an enabled port.
> 
> Signed-off-by: David Heinzelmann <heinzelmann.david@gmail.com>
> ---
> Changes in v4:
>  - changed commit description
> Changes in v3:
>  - changed commit message and description
>  - fix code style
> Changes in v2:
>  - fix logic error to handle return code from usb_get_device_descriptor()
>    properly
>  - fix line endings
> ---
>  drivers/usb/core/hub.c | 196 +++++++++++++++++++++++------------------
>  1 file changed, 111 insertions(+), 85 deletions(-)

What happened to Alan's ack?

v5?

thanks,

greg k-h
