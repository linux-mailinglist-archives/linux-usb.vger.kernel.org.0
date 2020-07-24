Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6029D22C8D6
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 17:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXPQH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 11:16:07 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:32821 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgGXPQG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 11:16:06 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 26965200008;
        Fri, 24 Jul 2020 15:16:03 +0000 (UTC)
Message-ID: <48723549a08c07b96df1495b1bbc5e62df5da4f5.camel@hadess.net>
Subject: Re: [PATCH v4] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Fri, 24 Jul 2020 17:16:03 +0200
In-Reply-To: <cb19dbf0-8f4f-d60c-a93f-bd3b0ae67d09@gmail.com>
References: <ee32a093d43fe6631617c203ea7c86cb700ceac5.camel@hadess.net>
         <cb19dbf0-8f4f-d60c-a93f-bd3b0ae67d09@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2020-07-24 at 13:18 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 24.07.2020 11:59, Bastien Nocera wrote:
> 
> > When a new device with a specialised device driver is plugged in,
> > the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> > 
> > After that, nothing will trigger a reprobe when the modprobe()'d
> > device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> > 
> > Trigger a reprobe ourselves when new specialised drivers get
> > registered.
> > 
> > Fixes: 88b7381a939d
> 
>     It's strange that nobody has noticed... you need to cite the
> commit 
> summary here as well, enclosed into ("").

Changed locally, thanks!

> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> [...]
> > diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> > index f81606c6a35b..6731a8e104bc 100644
> > --- a/drivers/usb/core/driver.c
> > +++ b/drivers/usb/core/driver.c
> [...]
> 
> MBR, Sergei

