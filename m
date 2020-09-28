Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7807D27B3A6
	for <lists+linux-usb@lfdr.de>; Mon, 28 Sep 2020 19:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgI1Ruq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 13:50:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:53926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbgI1Ruq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 28 Sep 2020 13:50:46 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E4B320739;
        Mon, 28 Sep 2020 17:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601315445;
        bh=DtmjWP3bxklOw2yPoWKGOJ2ab6CvFBGzDnh+KmCO9Iw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hE9IUU1nUneaD2uBTQbkAqT2xaXQbz7UyaD4ueFsEGYLPJjtS88dDvJncg33l/Ra8
         CD9JO4aUC5DdbYz+Z6nVPfgP1kDzM0qZuRuzbG3O5rTAimbIewjbI0MCxSEr7b+5zS
         uUJEp3N3OzAsTzYiEkAzixKX2RwbDyhrFnFhvwIM=
Date:   Mon, 28 Sep 2020 19:50:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kiran <kiranmkota@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: /net/usb/ipheth.c incompatibility with Apple iOS 14
Message-ID: <20200928175053.GA2202486@kroah.com>
References: <CAAn0qaXmysJ9vx3ZEMkViv_B19ju-_ExN8Yn_uSefxpjS6g4Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAn0qaXmysJ9vx3ZEMkViv_B19ju-_ExN8Yn_uSefxpjS6g4Lw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Sep 27, 2020 at 07:14:39AM -0700, Kiran wrote:
> Effect on end user: when a linux machine is connected via USB to an
> iPhone that has been updated to iOS 14 and has personal hotspot mode
> turned on, the user cannot connect to the internet.
> 
> Troubleshooting: DNS works, the linux machine can ping the iPhone
> gateway, pinging google.com hangs. It appears that there is a change
> to the USB packets that iOS expects.
> 
> Here is a link to what I think is the most relevant part of a Github
> issue discussion with more specific details:
> 
> https://github.com/libimobiledevice/libimobiledevice/issues/1038#issuecomment-699630379
> 
> This is my first linux bug report and I'm not familiar with kernel
> development. The other people in the Github post will be better to
> talk to regarding a fix. But if I can provide more info, just let me
> know.

Not much we can do about this, but if you come up with a patch that
works, please let us know and we will be glad to review it.

good luck!

greg k-h
