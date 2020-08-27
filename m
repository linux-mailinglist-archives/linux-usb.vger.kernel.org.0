Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76D9254887
	for <lists+linux-usb@lfdr.de>; Thu, 27 Aug 2020 17:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgH0PDu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 27 Aug 2020 11:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgH0PDe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Aug 2020 11:03:34 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BC4DC06121B
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2020 08:03:16 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kBJQe-0000so-Kx; Thu, 27 Aug 2020 17:03:04 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kBJQd-0002Rp-My; Thu, 27 Aug 2020 17:03:03 +0200
Message-ID: <b17e8cb934f223a4f6055cdc2065ba75367ccffd.camel@pengutronix.de>
Subject: Re: [PATCH] Revert "usb: dwc3: meson-g12a: fix shared reset control
 use"
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Dan Robertson <dan@dlrobertson.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Thu, 27 Aug 2020 17:03:03 +0200
In-Reply-To: <20200827144810.26657-1-aouledameur@baylibre.com>
References: <20200827144810.26657-1-aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-08-27 at 16:48 +0200, Amjad Ouled-Ameur wrote:
> This reverts commit 7a410953d1fb4dbe91ffcfdee9cbbf889d19b0d7.
> 
> This commit breaks USB on meson-gxl-s905x-libretech-cc. Reverting
> the change solves the issue.
> 
> In fact, according to the reset framework code, consumers must not use
> reset_control_(de)assert() on shared reset lines when reset_control_reset
> has been used, and vice-versa.
> 
> Moreover, with this commit, usb is not guaranted to be reset since the
> reset is likely to be initially deasserted.
> 
> Reverting the commit will bring back the suspend warning mentioned in the
> commit description. Nevertheless, a warning is much less critical than
> breaking dwc3-meson-g12a USB completely. We will address the warning
> issue in another way as a 2nd step.
> 
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
