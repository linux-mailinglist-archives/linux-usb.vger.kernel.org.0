Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A63A519BCD8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2020 09:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387537AbgDBHjp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Apr 2020 03:39:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:53990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbgDBHjp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Apr 2020 03:39:45 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86B3A2078E;
        Thu,  2 Apr 2020 07:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585813185;
        bh=ZjPuGOkdVLwBrfawWlFcX/m9twGd3k4la2+NnvuzLgM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a5zf8eQk2O//Wb7f+OKHC9ulaN0TB48sGBNX1ZW7jqvwhf8CtRymMjq6ikxH6BeO9
         l5zAEvyjrSZ8oZRmaAc37DbZ9OVokeuVs89fbseA3uPsmiplFpr5zdU+F2Pdlb4JrO
         /f/lHJD3TMoTPKPAo4Emo11VJxqFALs9AWMpq43s=
Date:   Thu, 2 Apr 2020 09:39:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     massimo <maxcipo1@tin.it>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Usb_power_supply
Message-ID: <20200402073942.GA2755501@kroah.com>
References: <eac8a94386a3bf69296f048873ede8230c67f632.camel@tin.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eac8a94386a3bf69296f048873ede8230c67f632.camel@tin.it>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 02, 2020 at 09:19:06AM +0200, massimo wrote:
> I've read the interesting Greg's article about writing USB driver for
> Linux.
> I'm interested in a simpler question. Is it possible
> to write a driver in Ubuntu (19.10) to switch power on or off to a USB
> port, that' s to say to give or take off the 5 volts power supply  to a
> USB port (in order for example to switch on or off a simple usb lamp)?
> Thanks for your attention and courtesy, Massimo.
> 

Try the userspace program 'usbreset' that is part of the usbutils
package, and can be found also here:
	https://github.com/gregkh/usbutils/blob/master/usbreset.c

if your hub supports it, this will work.  Note, not all USB hubs support
this type of behavior, as it is not required by the USB specification.

hope this helps,

greg k-h
