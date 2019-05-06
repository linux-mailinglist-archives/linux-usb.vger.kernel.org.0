Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049AA1498F
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 14:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfEFM31 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 08:29:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:52456 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfEFM30 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 08:29:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B44B6206A3;
        Mon,  6 May 2019 12:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557145766;
        bh=9idMJCSVjJ+vXqJ7u95677+167EEOAisIQTKWjtNr5w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UnfIN01Pi9Phvza4F84+iSJLyEWuGfM692sJSSBbl2WhhX2dfnfit7YX0cx4mjRfP
         96vMYzKXjFKLH3qTjMQzMxcE/qPP0xECK0rUhS1qpZ1QIf7WQ0wnwvwrJZbQ0imhU4
         VzTeUrWk2rFKEyRuSFdlUcwLwQzpNBLkCr17Ezuk=
Date:   Mon, 6 May 2019 14:29:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 08/34] lsusb.py: do not entirely hide usb.ids exceptions
Message-ID: <20190506122922.GA25449@kroah.com>
References: <20190506090241.169665-1-grawity@gmail.com>
 <20190506090241.169665-9-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506090241.169665-9-grawity@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 06, 2019 at 12:02:15PM +0300, Mantas Mikulėnas wrote:
> Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
> ---
>  lsusb.py.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lsusb.py.in b/lsusb.py.in
> index f9e273d..0d7ff95 100644
> --- a/lsusb.py.in
> +++ b/lsusb.py.in
> @@ -610,9 +610,8 @@ def main(argv):
>  	if usbids[0]:
>  		try:
>  			parse_usb_ids()
> -		except:
> -			print(" WARNING: Failure to read usb.ids", file=sys.stderr)
> -			#print(sys.exc_info(), file=sys.stderr)
> +		except IOError as e:
> +			print("Warning: Failure to read usb.ids:", e, file=sys.stderr)

This patch is a bit "annoying" in that now I see the error:
	Warning: Failure to read usb.ids: [Errno 2] No such file or directory: '/usr/share/kcmusb/usb.ids'

When I never would care about /usr/share/kcmusb, the "problem" is that
the usb.ids file is no where in any of the other "default" choices in
the system.

So I suggest either saying "here's all the places I did not find it", or
just stick to the error that we have today, as this feels worse to me.

thanks,

greg k-h
