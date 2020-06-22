Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2C3202F7F
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jun 2020 07:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgFVFa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jun 2020 01:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:47796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728473AbgFVFa7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Jun 2020 01:30:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2CD2220679;
        Mon, 22 Jun 2020 05:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592803858;
        bh=UQQaMTagT9xJRb69Aulda7o4+Jo3Uv1UTDwaTVbw97A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Rmekd0+jSnya5lllSB/A2q3dihqUM/A4/MoReVKv5fJ5PCEaLffQT+WBIBAl5EPH4
         pc6MAtVxuMS1ufmy5x0wkzz1sFTqj46PYTBt9i8EDUMJEZXPs09SrYx+jP2n+5ixGV
         pb/IiE5E24Jfon5eRi3IJNxI6gWDTr3EPG1nRNvY=
Date:   Mon, 22 Jun 2020 07:30:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200622053054.GA134804@kroah.com>
References: <b4cd2557-9a61-5ccd-32ad-48b0c68bef6b@jrr.cz>
 <20200621085816.GB95977@kroah.com>
 <03712b5a-ecb6-ae42-ff8e-8d5d6f2ed918@jrr.cz>
 <20200621095509.GA120230@kroah.com>
 <470484c8-7afc-c593-5ca9-cdb97dba39e1@jrr.cz>
 <20200621135838.GA125568@kroah.com>
 <c9b58c7f-e40a-0988-6b7d-15beac7219de@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9b58c7f-e40a-0988-6b7d-15beac7219de@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 22, 2020 at 06:38:13AM +0200, Jerry wrote:
> Greg Kroah-Hartman wrote on 6/21/20 3:58 PM:
> > Please use unicode (well utf-8 if possible), I'm all for that, there is
> > no requirement to use ascii only for your name in patches.  I wish more
> > people would do that when needed, as it's only fair to them to be able
> > to properly represent their names and not have to change them somehow.
> I tried it and it seems that www.spinics.net understand UTF-8 but at
> marc.info it doesn't work correctly.
> https://marc.info/?l=linux-usb&m=159279589104617

Why care about marc.info?  We don't control that, nor do we use it.

If lore.kernel.org does not work, please let us know, we can fix that.

> It seems that this page don't send correct encoding to web browser so
> Firefox uses windows-1252 and insted of capital S with caron I can see A
> with ring. Similarily insted of I with acute accent the browser shows A with
> tilda... it looks horible. And even if I force UTF8 encoding for view, it
> corrects mail From but my name at Signed-off-by line stays damaged.
> 
> So UTF-8 seems be a bad idea for kernel mailling list.

It should not be, again, if lore.kernel.org does not work, please let
us know.

thanks,

greg k-h
