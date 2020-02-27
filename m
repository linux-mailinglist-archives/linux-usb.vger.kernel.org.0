Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9361712B3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 09:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbgB0Ilf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 03:41:35 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:41409 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbgB0Ilf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 03:41:35 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j7Ejd-0007VT-MB; Thu, 27 Feb 2020 09:41:33 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j7Ejd-0006Cr-6O; Thu, 27 Feb 2020 09:41:33 +0100
Date:   Thu, 27 Feb 2020 09:41:33 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Richard Leitner <richard.leitner@skidata.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: usb251xb: check if hub is already attached
Message-ID: <20200227084133.spydp5fudfqc6eim@pengutronix.de>
References: <20200227072545.16856-1-m.felsch@pengutronix.de>
 <20200227081448.f7ul3idseybln3sc@pengutronix.de>
 <20200227083007.GB13758@pcleri>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200227083007.GB13758@pcleri>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Thu, Feb 27, 2020 at 09:30:07AM +0100, Richard Leitner wrote:
> On Thu, Feb 27, 2020 at 09:14:48AM +0100, Uwe Kleine-König wrote:
> > If you write this as:
> > 
> > 	if (!hub->gpio_reset && usb251xb_hub_attached(hub))
> > 		return 0;
> > 
> > you save some i2c transfers in the presence of a reset gpio.
> 
> I'd also go with this solution, so you only have i2c transfers when a
> reset gpio is configured/present.

Nitpick: you only have additional i2c transfers if *no* reset gpio is
configured/present.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
