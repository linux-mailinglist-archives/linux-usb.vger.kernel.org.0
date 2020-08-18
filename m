Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1258D248238
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 11:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHRJui (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 05:50:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:46368 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbgHRJui (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 05:50:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B07D7206B5;
        Tue, 18 Aug 2020 09:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597744238;
        bh=qz+/Do4gQWYqGfpTGMzMSVoBUMTZmSklNt39J0l+r/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zKCc6k9HzYw6jZmJXKQkmkSTQxLEjDt3Yd1jy5CyBCWNmFAGxzPFSBdudjlFJ1oGj
         E5xxe39VzvJ5Us83h55lGDmnMtSmIyVc5iKwFF8b4PgGaukSIN2qwOfODXxe0mM11G
         ULF5ZbBHJpePSpLpyEQ5OAzggTrDu71m1UxSuVzM=
Date:   Tue, 18 Aug 2020 11:51:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v7 1/3] USB: Also check for ->match
Message-ID: <20200818095101.GB56916@kroah.com>
References: <20200804113834.6409-1-hadess@hadess.net>
 <20200818090037.GC28036@kroah.com>
 <bd8e57a4c96df5c18a3019b9c20da45458db1ed4.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd8e57a4c96df5c18a3019b9c20da45458db1ed4.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 11:42:23AM +0200, Bastien Nocera wrote:
> On Tue, 2020-08-18 at 11:00 +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 04, 2020 at 01:38:32PM +0200, Bastien Nocera wrote:
> > > We only ever used the ID table matching before, but we should
> > > probably
> > > also support an open-coded match function.
> > > 
> > > Fixes: 88b7381a939de ("USB: Select better matching USB drivers when
> > > available")
> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > 
> > The subject line does not make sense, what is "also"?  Who is doing
> > this?
> > 
> > Coming back to this after a week I have no idea what is going on, so
> > that's a sign that it needs to be reworded :(
> 
> It's actually been 2 weeks. Were there any other changes you wanted
> made in this patchset, or is that going to be it?

I think that's it.
