Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0A63B11E7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 17:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733001AbfILPOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 11:14:40 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38391 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732698AbfILPOk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Sep 2019 11:14:40 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1i8Qnv-00077Q-55; Thu, 12 Sep 2019 17:14:39 +0200
Message-ID: <1568301278.3069.7.camel@pengutronix.de>
Subject: Re: [PATCH] xhci: Check all endpoints for LPM timeout
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jan Schmidt <jan@centricular.com>, linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>
Date:   Thu, 12 Sep 2019 17:14:38 +0200
In-Reply-To: <20190912144921.368-1-jan@centricular.com>
References: <20190912144921.368-1-jan@centricular.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2019-09-13 at 00:49 +1000, Jan Schmidt wrote:
> If an endpoint is encountered that returns USB3_LPM_DEVICE_INITIATED, keep
> checking further endpoints, as there might be periodic endpoints later
> that return USB3_LPM_DISABLED due to shorter service intervals.
> 
> Without this, the code can set too high a maximum-exit-latency and
> prevent the use of multiple USB3 cameras that should be able to work.
> 
> Signed-off-by: Jan Schmidt <jan@centricular.com>
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

This fixes the capture from multiple Oculus Sensors, as described in the
"Not enough bandwidth with Magewell XI100DUSB-HDMI" thread:

https://lore.kernel.org/linux-usb/CA+gwMce-h9LPCv1hhfEcRz_2w9mEQLOjy42dcjvPxTeawSU5kQ@mail.gmail.com/

regards
Philipp
