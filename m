Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F33C79083A
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2019 21:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbfHPTbC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Aug 2019 15:31:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727548AbfHPTbC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 16 Aug 2019 15:31:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D3B22133F;
        Fri, 16 Aug 2019 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565983861;
        bh=Ph0W+/X8/T8ivTGJGIZIzkLhwmWcupug7MucMGuw8xs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MahdPuOLRXf+G1uFwkJggkhUL/sUDvLXXcCvVs3i2ojeTLZGZ2Iw87+BseUlp0Y1t
         t8brM7afpj3YYpZu3rYEymjvy4ZongKsM6ppKER/EsK9GpmZflP3+vyjdR0Xx+8CCx
         f4QN6qgOTVFyvHSfYF3suJi+TZ3TJFy6Mm/5QwoU=
Date:   Fri, 16 Aug 2019 21:30:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Walthour <dwalthour@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel 5.2.7 support for usb Apple Superdrive is broken
Message-ID: <20190816193059.GA502@kroah.com>
References: <764b04f6b4d3ce734a9b00048ea79999b4a099d4.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <764b04f6b4d3ce734a9b00048ea79999b4a099d4.camel@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 16, 2019 at 02:24:18PM -0500, David Walthour wrote:
> I am new to this mailing list, so please go easy on me if I'm breaking
> etiquete.
> 
> Upgraded my Fedora 30 install from linux kernel 5.2.6 to 5.2.7 (and
> 5.2.8) and my apple usb superdrive stopped working. Booting up in 5.2.6
> and it works again as expected, so it appears to be due to changes in
> 5.2.7.  
> 
> I am unsure of where to look to see if this is already reported and
> being fixed. If not, I am willing to help out in fixing it as it seems
> to be a reasonably small set of diffs between 5.2.6 and 5.2.7 that
> could account for it, but I am new to patching linux, so I am unsure of
> where to get started. Any help would be appreciated.

I would start with filing a bug in fedora's bugzilla as the developers
there can help you try to narrow things down better than we can if you
can't build your own kernel images.

And, what do you mean by "not working", are there kernel log messages?

thanks,

greg k-h
