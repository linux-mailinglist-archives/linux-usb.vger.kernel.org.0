Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B4427CF7
	for <lists+linux-usb@lfdr.de>; Thu, 23 May 2019 14:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730492AbfEWMgH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 May 2019 08:36:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbfEWMgH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 May 2019 08:36:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C7742177E;
        Thu, 23 May 2019 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558614966;
        bh=pMsi9QRJXG7Cev7wi6+DUEu9DzmkegcMm1X6u13BXGw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aLY7zVjedoPuTyEvLA0aQKgkbKAty46WImIHvfRByZTvF7sWqnXSZ7YjpSpRkPown
         b1CAN6e2qZhSgWfQ0N+4u4dBoDAlQRjoAesE74VDx1c3coUNGWx19FUHxKIZeprPdn
         KyFBjgyCBS5QdsH6mcZb0P4vbhHb3nj8aftjojG8=
Date:   Thu, 23 May 2019 14:35:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Crash/hung task in usb-storage thread
Message-ID: <20190523123552.GA31462@kroah.com>
References: <dca3ea08836e475894bdebc7eb28acff@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190523120410.GA16571@kroah.com>
 <3bb81d0da7de4745852aef52802f3b9b@SVR-IES-MBX-03.mgc.mentorg.com>
 <20190523122626.GA26641@kroah.com>
 <4412d0ddd08e41009d46c018d50ce5c3@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4412d0ddd08e41009d46c018d50ce5c3@SVR-IES-MBX-03.mgc.mentorg.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 23, 2019 at 12:30:06PM +0000, Schmid, Carsten wrote:
> > > > Wow that's an old kernel.
> > > Indeed. Long running project.
> > > 
> > > > Can you reproduce this on a "clean" 5.1 kernel release?
> > > As this is an automotive embedded target, we currently have 4.14.102 as the newest custom kernel.
> >
> > 4.14.102 is still old.
> I agree
> 
> > > Porting a 5.1 will take a lot of effort.
> >
> > Then that implies you have an SoC with a few million lines of code added
> > to the kernel, right?  Nothing we can do here about that mess, you need
> > to go ask for support from the vendor that is forcing you to use that
> > kernel, sorry :(
> >
> 
> Well its at least an x86-64 based SoC.

An x86 SoC should work on 5.1, what is missing there to keep it from
functioning?  Why hasn't it already been updated to 4.19.y?

thanks,

greg k-h
