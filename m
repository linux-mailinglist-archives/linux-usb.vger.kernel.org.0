Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42BB122AECA
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jul 2020 14:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbgGWMOw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jul 2020 08:14:52 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:40601 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727859AbgGWMOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jul 2020 08:14:51 -0400
X-Originating-IP: 82.255.60.242
Received: from classic (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 155C6C0009;
        Thu, 23 Jul 2020 12:14:47 +0000 (UTC)
Message-ID: <081d42070b06e5138daea18551c84b314e04732f.camel@hadess.net>
Subject: Re: [PATCH 1/2] USB: Fix device driver race
From:   Bastien Nocera <hadess@hadess.net>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu, 23 Jul 2020 14:14:47 +0200
In-Reply-To: <20200723121150.GA8206@b29397-desktop>
References: <20200722094628.4236-1-hadess@hadess.net>
         <20200722152640.GC1310843@rowland.harvard.edu>
         <407a8732f7e124e623f8687729d4d4775dd8ab27.camel@hadess.net>
         <20200723021904.GA5798@b29397-desktop>
         <bbc6bd03507d8ec3462f671f06587317f3fcbfca.camel@hadess.net>
         <AM7PR04MB71570D838FDDB467A302423E8B760@AM7PR04MB7157.eurprd04.prod.outlook.com>
         <ee58286dd0f6e62c6ca95f094292893cf921fe21.camel@hadess.net>
         <20200723121150.GA8206@b29397-desktop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-07-23 at 12:12 +0000, Peter Chen wrote:
> 
<snip>
> I may clear now, thanks.
> 
> So, you mean your device has no interface descriptor, so you can't
> create a USB interface driver, and have to create non-generic device
> driver for it. I see there is __check_usb_generic function at
> generic.c
> to check if it could use generic driver or not, you may add some
> condition (eg, no interface descriptor) to avoid using generic driver
> Is it feasible?

I'm not looking for work-arounds, the driver is meant to be for *the
device*, not for interfaces. It does have interfaces, but they're not
the target of the calls made.

There's a race between USB device (not interface) drivers on the first
plug, which I'm trying to fix.

