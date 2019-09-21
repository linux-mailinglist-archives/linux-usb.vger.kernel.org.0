Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D97D4B9C57
	for <lists+linux-usb@lfdr.de>; Sat, 21 Sep 2019 06:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbfIUEpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Sep 2019 00:45:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:48156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbfIUEpN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Sep 2019 00:45:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6141D20C01;
        Sat, 21 Sep 2019 04:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569041112;
        bh=77X77KHeBAcUIWUblgox8NKnr//eHksiPvmH6Q/PpuA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LfxyUsY5qwFjXQujUGU2rLISA+wocs9KxABFTQnySjD7pf36tDcJBdHHNdXy/g6ZN
         ZNZebe0WcnFBQh5MHZQtc2U0YBEfgATh5tFdgZzrSbiJfkf956paGcl56j2hfDQ9D/
         XyjEx2tVxsMVass9C3pQY26gc4wj0HVHj3cPBROs=
Date:   Sat, 21 Sep 2019 06:45:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JH <jupiter.hce@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Failed to connect to 4G modem
Message-ID: <20190921044510.GA990793@kroah.com>
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com>
 <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
 <20190918054744.GA1830105@kroah.com>
 <CAA=hcWR__j20ZQY9H8zzTryEatSfe+yXLYQXSaXMvgy3pwdJKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWR__j20ZQY9H8zzTryEatSfe+yXLYQXSaXMvgy3pwdJKg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 21, 2019 at 08:10:30AM +1000, JH wrote:
> Hi Greg,
> 
> On 9/18/19, Greg KH <gregkh@linuxfoundation.org> wrote:
> > Otherwise, just use 5.3 now and then 5.4 when it comes out in a few
> > months.
> 
> My apology for an off topic question. I discussed with my colleague to
> use 5.3, if we cannot wait for 5.4 LTS release, we will do a remote
> 5.4 upgrade from 5.3 on air for the product. One of my colleague
> warning me that kernel 5.3 and 5.4 LTS will not be a minor upgrade, it
> will be major upgrade which will have massive libraries changes. I
> don't agree with it, but I could not find kernel document to state
> either 5.3 and 5.4 LTS is a major or minor change. What is your
> insight view? Appreciate if you could point me a reference to prove my
> colleague is wrong.

You should never have to update any userspace code or library if the
kernel is updated as we guarantee backwards compatibility.  If we did
break something, please let us know and we will work very hard to fix
it.

This is a guarantee we made back in 2007 or so, and have been sticking
to it since.

There is no "major" upgrade issue here, the kernel does a new release
every 3 months and changes the number, showing it is "newer" than the
previous one.

Hope this helps,

greg k-h
