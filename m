Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B29CB408641
	for <lists+linux-usb@lfdr.de>; Mon, 13 Sep 2021 10:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237877AbhIMIQ4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Sep 2021 04:16:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237806AbhIMIQz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Sep 2021 04:16:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5937660D42;
        Mon, 13 Sep 2021 08:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631520940;
        bh=aJ70588ne2a8fQo2jBDPUZStMIvT3fn9TBv/fDChGqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LyL6fplcrdfk4JZTyrhIpSSua1JyJeQCYMAmIGrEqcJKQeUKjP9zl2idfjiz2SBN1
         JQbdzL5FDcjTnVsjfQP8/1wvMC/1WlCAFUMut2TbhmRotrKXjrLqsX5HxmhrXO9Azl
         cKjV25W0JhZpEqKpCTwzzr3fdqZhU7YzJkgtQavgCDCcBIyPkF139D5VINvGxhC+sb
         7CG7HxBmFZ48Dfq68U/RuyJ0a0rAUiKoT8oYOwXIjI0HO6yPDRcHj8Ca82ydlEWYYG
         i21ec/wj+JGIPYRkyIS34kWxb88zs2jpPWUcnUg/m2KB0U96ph2GDneFAThXjOE37I
         Dweq79bFQiT0g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mPh7e-0001hh-SZ; Mon, 13 Sep 2021 10:15:27 +0200
Date:   Mon, 13 Sep 2021 10:15:26 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     carlo <c.lobrano@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: serial: option: add Telit LN920 compositions
Message-ID: <YT8Inq3QTrRSqliU@hovoldconsulting.com>
References: <20210903123913.1086513-1-c.lobrano@gmail.com>
 <CAGRyCJH_Fe09RpMcbV3bMbxqzN+rwaKz1hDRWg5TWvp3wHjDww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJH_Fe09RpMcbV3bMbxqzN+rwaKz1hDRWg5TWvp3wHjDww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 03, 2021 at 03:20:09PM +0200, Daniele Palmas wrote:
> Il giorno ven 3 set 2021 alle ore 15:10 carlo <c.lobrano@gmail.com> ha scritto:
> >
> > From: Carlo Lobrano <c.lobrano@gmail.com>
> >
> > This patch adds the following Telit LN920 compositions:
> >
> > 0x1060: tty, adb, rmnet, tty, tty, tty, tty
> > 0x1061: tty, adb, mbim, tty, tty, tty, tty
> > 0x1062: rndis, tty, adb, tty, tty, tty, tty
> > 0x1063: tty, adb, ecm, tty, tty, tty, tty
> >
> > Signed-off-by: Carlo Lobrano <c.lobrano@gmail.com>

Thanks for providing all the details needed to review this.

> Reviewed-by: Daniele Palmas <dnlplm@gmail.com>

And thanks for reviewing.

Now applied.

Johan
