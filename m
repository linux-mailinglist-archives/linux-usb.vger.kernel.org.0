Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE7CA154841
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2020 16:41:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBFPl3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Feb 2020 10:41:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:60014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgBFPl2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 Feb 2020 10:41:28 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DD6E21775;
        Thu,  6 Feb 2020 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581003688;
        bh=getx8jCYY9DMV357owsT86p5lyapzeSeUE9DgzNKfRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=slvE/wQhSYuEnD+qD2E6XgyE8oFXlIiqCiYJ5mldAEV7fgq00+XJPX8esbQ6SAynD
         pD2dGpsI3PxGMvm2kUjqBhO0h0XvKjs2/Fg5t8OqsxGQF2caXtx3QkJzG6xJmsDs7V
         PLRfdz19tkovL+DBJW+qfPqg5Ay4kY6Tot8VXe5s=
Date:   Thu, 6 Feb 2020 16:41:25 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb:gadget:f_uac2: EP OUT is adaptive instead of async
Message-ID: <20200206154125.GA3752902@kroah.com>
References: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bd36708-0ade-fbd7-5eec-5b8df7b3f2ee@ivitera.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 06, 2020 at 02:22:47PM +0100, Pavel Hofman wrote:
> Hi,
> 
> The existing UAC2 implementation presents itself as asynchronous
> USB_ENDPOINT_SYNC_ASYNC https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L276
> + https://github.com/torvalds/linux/blob/master/drivers/usb/gadget/function/f_uac2.c#L285
> .
> 
> However:
> 1) The function does not define any feedback endpoint
> 
> 2) IMO in reality it is adaptive - the g_audio capture device accepts any
> data passed by the USB host, the USB host is the one which defines the data
> pace.
> 
> While Linux and reportedly OSX accept the async EP OUT without explicit
> feedback EP IN, Windows does not.
> 
> Simply changing USB_ENDPOINT_SYNC_ASYNC to USB_ENDPOINT_SYNC_ADAPTIVE for
> the FS and HS output endpoints fixes the windows problem and IMO corrects
> the config to reflect real function.
> 
> There are multiple projects underway adding the async feedback EP, but in
> the meantime I think the .bmAttributes information should be changed as
> above, making the device usable in Windows for everyone.
> 
> Thanks a lot for considering.

Patches work best, can you create them and test and then submit?

thanks,

greg k-h
