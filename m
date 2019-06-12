Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1CC1425E5
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2019 14:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439010AbfFLMcp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jun 2019 08:32:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:34848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436805AbfFLMco (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 12 Jun 2019 08:32:44 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D41DF20874;
        Wed, 12 Jun 2019 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560342764;
        bh=FyGu3LtDEM2nU2WwzxefP6ytO17dEeo8OKl2ahiEfvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PDcBNawP/6jVD9nBE/4ujtD5waqnx2IRZ6B2D8eCeny3Rc/cq1VAClGHDxI1Fg5gP
         PkjWorF0xoaQshKADyLDyQ5jKAhOpVMtEttqheK/5QVV2N1faJvIos+cyQPRAero38
         FTE78FcZ56n29sLFUqEo7dos7UnODRWp0dE0nvLU=
Date:   Wed, 12 Jun 2019 14:32:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vladimir Yerilov <openmindead@gmail.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: kernel NULL pointer dereference, ucsi bug
Message-ID: <20190612123242.GA25718@kroah.com>
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190611075431.GB7918@kuha.fi.intel.com>
 <CAB31r6V+PYppYJz29u_hfpiL6xqhhe+-2xZTRpqOmpLrtCdh8Q@mail.gmail.com>
 <20190612095532.GB19831@kuha.fi.intel.com>
 <CAB31r6WFwkJwnkqCy3Lw4f2ybZ63EoJFxAcLyDFvm_gHkLRrOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB31r6WFwkJwnkqCy3Lw4f2ybZ63EoJFxAcLyDFvm_gHkLRrOQ@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 12, 2019 at 10:23:56PM +1000, Vladimir Yerilov wrote:
> Yes, it works.
> I've built 5.2-rc4 with this patch and it works fine now, the problem is gone.
> It is great that I didn't have to downgrade BIOS as a last resort in
> my attempts to workaround this issue.
> 
> Thank you!
> 
> Cc to Greg in order to let him know that it is resolved now.

It is not "resolved" until the fix is merged into Linus's tree :)

thanks,

greg k-h
