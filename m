Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4090B22973E
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 13:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgGVLSL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 07:18:11 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:51307 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbgGVLSK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 07:18:10 -0400
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9FC3F240015;
        Wed, 22 Jul 2020 11:18:08 +0000 (UTC)
Message-ID: <4e59faf590b52f8965062c8f66bc6538e9f7e7ad.camel@hadess.net>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Date:   Wed, 22 Jul 2020 13:18:08 +0200
In-Reply-To: <20200722111233.GA2912795@kroah.com>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722111233.GA2912795@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-07-22 at 13:12 +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 22, 2020 at 11:46:27AM +0200, Bastien Nocera wrote:
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
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> 
> What commit id does this fix?  And if it's in an older kernel, should
> it
> be backported to the stable trees?

Fixes: 88b7381a939de0fa1f1b1629c56b03dca7077309

AFAIK, the apple-mfi-fastcharge driver wasn't backported to stable
trees, and it's the only driver that's impacted by this bug, so there
shouldn't be any need to backport it there.

Did you want me to respin it with this info?

Cheers

