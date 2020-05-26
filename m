Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6D11C5546
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2020 14:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728569AbgEEMRR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 May 2020 08:17:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:43210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728180AbgEEMRQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 5 May 2020 08:17:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 07130206B8;
        Tue,  5 May 2020 12:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588681036;
        bh=wV8NO8yKKq39WfuQJaqftLyvkr4QFKD5fm91qP3qKzg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PyZ5Oh4je7m/B3dCXVvoC0F3P1olh76bO4gzgRciwyvY8hwYmzYeiSwT0qjNPSqF1
         R5uZ/amNcLh21u/78qquJ/BejPYyI4XRr5bzdpkPv7Y7BUAoEYzu/pcv90JNadLLL2
         4gFf0LKBWj/JicWNsWPTW6ADfQhp9jkNBLtHSEis=
Date:   Tue, 5 May 2020 14:17:14 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrey Konovalov <andreyknvl@google.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH USB 2/2] usb: raw-gadget: fix typo in uapi headers
Message-ID: <20200505121714.GA118143@kroah.com>
References: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
 <059e7e0ff26cc7d6e85275f764e31d85db867c4b.1587690539.git.andreyknvl@google.com>
 <87y2q6akhh.fsf@kernel.org>
 <CAAeHK+y=d_Hu1mwGifYuw6GRSBR=zncGCVOeN6GobP3L1zui=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeHK+y=d_Hu1mwGifYuw6GRSBR=zncGCVOeN6GobP3L1zui=Q@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 05, 2020 at 02:11:44PM +0200, Andrey Konovalov wrote:
> On Tue, May 5, 2020 at 9:50 AM Felipe Balbi <balbi@kernel.org> wrote:
> >
> > Andrey Konovalov <andreyknvl@google.com> writes:
> >
> > > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
> >
> > return -ENOCHANGELOG
> 
> I've sent v2 with changelog shortly after Greg's response. Would you
> like me to resend all raw-gadget fixes formed as a series?
> 
> BTW, to whom should I send them, to you or to Greg? I've noticed that
> some of my gadget patches from before got into the mainline twice.

They really should all go through Felipe, I was just trying to help out
a bit in the past.  I'll let him deal with all of these :)

thanks,

greg k-h
