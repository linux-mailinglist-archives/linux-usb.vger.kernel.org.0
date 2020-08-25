Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 751F925141F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Aug 2020 10:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728942AbgHYIXu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Aug 2020 04:23:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbgHYIXu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 Aug 2020 04:23:50 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0ADE920639;
        Tue, 25 Aug 2020 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598343829;
        bh=7VMz50D7ZZ0WPmUQJONRcdBdlICzRU9qCkM2phdMJdQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PSSTiJO2m8BnQId0wTCEmWanF6KF5g8CXBUKfMDAyFPgW8Gn0fGvbJydaPaOxmT2U
         R4lnDuXr76vs8Jgpw3T1G91qDVSlto0v9UyW4jMjVnpBxnC3tprU0tMtveud3c9r9g
         mIzR0ED9ZZzDlfGaQR6zM139eUEBazVDckWoqkVE=
Date:   Tue, 25 Aug 2020 10:24:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     David Laight <David.Laight@aculab.com>
Cc:     'Alex Dewar' <alex.dewar90@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "accessrunner-general@lists.sourceforge.net" 
        <accessrunner-general@lists.sourceforge.net>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: atm: don't use snprintf() for sysfs attrs
Message-ID: <20200825082406.GB1335351@kroah.com>
References: <20200824222322.22962-1-alex.dewar90@gmail.com>
 <3e882693bb344424af37d4d35f3db605@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e882693bb344424af37d4d35f3db605@AcuMS.aculab.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020 at 08:12:05AM +0000, David Laight wrote:
> From: Alex Dewar
> > Sent: 24 August 2020 23:23
> > kernel/cpu.c: don't use snprintf() for sysfs attrs
> > 
> > As per the documentation (Documentation/filesystems/sysfs.rst),
> > snprintf() should not be used for formatting values returned by sysfs.
> > 
> > In all of these cases, sprintf() suffices as we know that the formatted
> > strings will be less than PAGE_SIZE in length.
> 
> Hmmmm....
> I much prefer to see bounded string ops.
> sysfs really ought to be passing through the buffer length.

No.

> The buffer size should probably be SYSFS_BUF_LEN not PAGE_SIZE
> (even it happens to typically be the same).

Nope.

> If PAGE_SIZE is big (or small) passing a 4k buffer may be
> more appropriate than a PAGE_SIZE one.

Nope, sysfs is supposed to be "one value per file", and the buffer size
was specifically not passed in because you should _NEVER_ need to care
about it because all you are doing is printing out a single value.

If you really want to print more than just a single value, you should
not use sysfs.

So this is designed this way on purpose, you shouldn't have to worry
about any of this, and that way, you don't have to "program
defensively", it all just works in a simple manner.

thanks,

greg k-h
