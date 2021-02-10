Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C66316151
	for <lists+linux-usb@lfdr.de>; Wed, 10 Feb 2021 09:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbhBJIpO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Feb 2021 03:45:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhBJIne (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Feb 2021 03:43:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B285C06174A
        for <linux-usb@vger.kernel.org>; Wed, 10 Feb 2021 00:42:39 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1l9l50-0002ag-DT; Wed, 10 Feb 2021 09:42:34 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1l9l4z-0006JX-HF; Wed, 10 Feb 2021 09:42:33 +0100
Date:   Wed, 10 Feb 2021 09:42:33 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-usb@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 0/2] usb: dwc2: Use clk bulk API for supporting
 multiple clocks
Message-ID: <20210210084233.GO19583@pengutronix.de>
References: <20210125093825.4292-1-s.hauer@pengutronix.de>
 <20210209165424.GB3909217@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210209165424.GB3909217@robh.at.kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:39:30 up 69 days, 21:06, 102 users,  load average: 0.01, 0.04,
 0.07
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 09, 2021 at 10:54:24AM -0600, Rob Herring wrote:
> On Mon, Jan 25, 2021 at 10:38:23AM +0100, Sascha Hauer wrote:
> > Currently the dwc2 driver only supports a single clock. I have a board
> > here which has a dwc2 controller with a somewhat special clock routing
> > to the phy. Both the dwc2 controller and the ULPI phy get their phy
> > clock from a SI5351 clock generator. This clock generator has multiple
> > clock outputs which each is modelled as a separate clk in Linux.
> > Unfortunately the clock to the phy and the clock to the dwc2 core are on
> > two different output pins of the SI5351, so we have two clocks which
> > must be enabled.  The phy is driven by the usb-nop-xceiver driver which
> > supports a single clock. My first approach was to add support for a
> > second clock to that driver, but technically the other clock is
> > connected to the dwc2 core, so instead I added support for a second
> > clock to the dwc2 driver.  This can easily be archieved with the clk
> > bulk API as done in this series.
> 
> Where is the usb-nop-xceiver single clock coming from?

It's coming from the SI5351 clock generator

> 
> Maybe you shouldn't be using usb-nop-xceiver? There is a ULPI binding 
> though that alone doesn't really help you.

The clock that feeds the phy is handled by the usb-nop-xceiver just
fine, it's the clock that is fed to the DWC2 controller that I need
support for. I hope my other mail makes this clearer a bit.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
