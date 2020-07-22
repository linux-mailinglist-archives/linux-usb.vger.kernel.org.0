Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 495EA229590
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 11:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbgGVJ65 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 05:58:57 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:42165 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgGVJ65 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 05:58:57 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9798B40012;
        Wed, 22 Jul 2020 09:58:54 +0000 (UTC)
Message-ID: <76c0e527095fd3adbf802e9a27ba93cbd656a03b.camel@hadess.net>
Subject: Re: [PATCH 2/2] USB: Fix source path in header
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Date:   Wed, 22 Jul 2020 11:58:54 +0200
In-Reply-To: <20200722095102.GA2816153@kroah.com>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722094628.4236-2-hadess@hadess.net>
         <20200722095102.GA2816153@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-07-22 at 11:51 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 22, 2020 at 11:46:28AM +0200, Bastien Nocera wrote:
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> I can't take patches without any changelog text at all, sorry.

The subject line isn't clear enough?

> > ---
> >  drivers/usb/core/driver.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index a6187dd2186c..bd346e683af3 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >  /*
> > - * drivers/usb/driver.c - most of the driver model stuff for usb
> > + * drivers/usb/core/driver.c - most of the driver model stuff for
> > usb
> 
> Just drop the whole file name, it's not needed at all.

And the description after or just the filename?

