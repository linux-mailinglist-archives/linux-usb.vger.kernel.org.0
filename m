Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84AD7830C6
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 13:37:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729898AbfHFLhE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 07:37:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:33718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726783AbfHFLhE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 07:37:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8269F20C01;
        Tue,  6 Aug 2019 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565091424;
        bh=yil6PQ6BUh3GshAxh25B9TvtvnVV9meLxecoFUsQ4LE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hz9d9ZeRBpqGTzOeZyLtfDFJZS8vOZ+5nDn4fsKen1rUkrhzfrW9xn0o9sYkiomdD
         +I4snaqq4GOZjZd/a6E0BqY9Z0dv59s7+/w0TybT7L+sbTOuqZ8iSSd2seKTdVpSoV
         dgjDzF/b5rYahKpgvFHHbgsgzvFwe5FH7yKS+SXk=
Date:   Tue, 6 Aug 2019 13:37:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     =?iso-8859-1?Q?Thi=E9baud?= Weksteen <tweek@google.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: setup authorized_default using usb_bus_notify
Message-ID: <20190806113701.GA18582@kroah.com>
References: <20190806110050.38918-1-tweek@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190806110050.38918-1-tweek@google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 06, 2019 at 01:00:50PM +0200, Thiébaud Weksteen wrote:
> Currently, the authorized_default and interface_authorized_default
> attributes for HCD are set up after the uevent has been sent to userland.
> This creates a race condition where userland may fail to access this
> file when processing the event. Move the appending of these attributes
> earlier relying on the usb_bus_notify dispatcher.
> 
> Signed-off-by: Thiébaud Weksteen <tweek@google.com>
> ---
>  drivers/usb/core/hcd.c   | 123 ---------------------------------------
>  drivers/usb/core/sysfs.c | 121 ++++++++++++++++++++++++++++++++++++++
>  drivers/usb/core/usb.h   |   5 ++
>  3 files changed, 126 insertions(+), 123 deletions(-)

And does this solve the issue you reported yesterday?  If so, I'll be
glad to backport this to the older stable kernels as well.

thanks,

greg k-h
