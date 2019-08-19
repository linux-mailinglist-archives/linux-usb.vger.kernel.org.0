Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B271921BF
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 12:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfHSK7R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 06:59:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43909 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfHSK7R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Aug 2019 06:59:17 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1hzfNb-00017A-0A; Mon, 19 Aug 2019 12:59:15 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1hzfNa-0005Gc-AA; Mon, 19 Aug 2019 12:59:14 +0200
Date:   Mon, 19 Aug 2019 12:59:14 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Richard Leitner <richard.leitner@skidata.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] usb: usb251xb: drop some unused defines
Message-ID: <20190819105914.bhertupbr6kwx3j5@pengutronix.de>
References: <20190819100211.26791-1-u.kleine-koenig@pengutronix.de>
 <20190819104104.GA6530@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190819104104.GA6530@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 19, 2019 at 12:41:04PM +0200, Greg KH wrote:
> On Mon, Aug 19, 2019 at 12:02:11PM +0200, Uwe Kleine-König wrote:
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/usb/misc/usb251xb.c | 5 -----
> >  1 file changed, 5 deletions(-)
> 
> I can't take a patch without any changelog text.

So I am supposed to repeat the Subject's content in the body? I
completely agree that an expressive changelog is important for changes
that actually change something. But it seems silly to me to describe
something trivial in more words than necessary. There is zero added
value; only added noise.

> And you forgot to cc: the usb maintainer, so there's no way this was
> going to get merged :)

I would have expected that it is fine to direct to the contacts listed
in the "MICROCHIP USB251XB DRIVER" section of MAINTAINERS and then let
the people there care for forwarding. (And other than that it seems I
catched the attention of the usb maintainer :-)

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
