Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3F45395740
	for <lists+linux-usb@lfdr.de>; Mon, 31 May 2021 10:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbhEaIo3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 May 2021 04:44:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229640AbhEaIo1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 31 May 2021 04:44:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9267B60FEE;
        Mon, 31 May 2021 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622450568;
        bh=aBNUhNdRlRR32zbDG0uyjoDBCNgjqOpBBU7J5dLJqVo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M9COz+HraVuW9W/s+vLordV+pOXuy1copEW9sLujatC793MsKvJfyc/RLEWSVl2tu
         fT9wHGyIJTTbTgTmV+J6DNz4MortjwKfTkB5yJbDGxqnPV4v9lAdapv2ofQMJVGbIx
         d4YXtq6s49jgI0watgrXiqOqPrni4tUgmLBA1fsnIGJeM1HxX2sAOuwhDz5ZRDOj+b
         G1iMMSha8WTUFeC6gnNlZ5aBAxiAtt6vGzQMxrr60n1UKe42qM9ygqE2eCWoNqg35K
         0AJXoAyaA5q01e3H05y2Hgn0bz0QLtMORzjJqY2LJ06iW2M1eLSVQWzdb1de7foGye
         Drbu9o5M8E+oQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lndVS-0001xY-Tf; Mon, 31 May 2021 10:42:43 +0200
Date:   Mon, 31 May 2021 10:42:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Eero Lehtinen <debiangamer2@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Antti Palosaari <crope@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLShgrnPV35aXz84@hovoldconsulting.com>
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
 <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
 <YLPTJ3HIos630Btb@hovoldconsulting.com>
 <CAHS3B0EMkXEnaQv61_-6Gh5zd6e4UT_6yOvwhaB_h=6Ta2OdaQ@mail.gmail.com>
 <YLSGTkKNm5+o+PW1@hovoldconsulting.com>
 <CAHS3B0Ez+eKSgrCEnW2ccpBCHc_gJ_Cs3abS_DAYXRAAjNYeTA@mail.gmail.com>
 <YLSVsrhMZ2oOL1vM@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLSVsrhMZ2oOL1vM@hovoldconsulting.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 31, 2021 at 09:52:18AM +0200, Johan Hovold wrote:

> On Mon, May 31, 2021 at 09:58:09AM +0300, Eero Lehtinen wrote:
> > Hi,
> > 
> > I found dev_info messages from /var/log/messages.
> > 
> > May 30 18:41:19 optipc kernel: [    3.143433] dvb_usb_rtl28xxu
> > 1-1:1.0: rtl28xxu_identify_state - ret1 = 0
> > May 30 18:41:19 optipc kernel: [    3.147688] dvb_usb_rtl28xxu
> > 1-1:1.0: rtl28xxu_identify_state - ret2 = -32
> 
> Ok, thanks. So this explains how things go wrong.
> 
> 	ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c);
> 	if (ret == -EPIPE) {
> 		dev->chip_id = CHIP_ID_RTL2831U;
> 	} else if (ret == 0) {
> 		dev->chip_id = CHIP_ID_RTL2832U;
> 
> The chip used to be identified as RTL2832U but after my change it is
> now detected as RTL2831U and the driver uses a separate implementation
> with different hardcoded defaults.
> 
> Commit d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip
> type") added this code and claimed that the i2c register in question
> would only be found on newer RTL2832U models. Yet, actually reading the
> register returns an error in your setup.
> 
> So, something is fishy here. Has anyone verified that the chip-type
> detection works as expected for older RTL2831U?

Ok, the driver just wants to know if the i2c-read vendor request exists,
and actually reading the register will not work since the register may
not even exist (e.g. depending on the demodulator).

So it seems we need to keep this zero-length read request and only
update the pipe argument to suppress the new WARN() in
usb_submit_urb().

Eero, could you try applying the below on top of -next and confirm that
it suppresses the warning without messing up the type detection?

Johan


From 2cec8fa000152bcb997dd7aeeb0917ebf744a7bd Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Mon, 24 May 2021 10:55:19 +0200
Subject: [PATCH v2] media: rtl28xxu: fix zero-length control request

The direction of the pipe argument must match the request-type direction
bit or control requests may fail depending on the host-controller-driver
implementation.

Control transfers without a data stage are treated as OUT requests by
the USB stack and should be using usb_sndctrlpipe(). Failing to do so
will now trigger a warning.

The driver uses a zero-length i2c-read request for type detection so
update the control-request code to use usb_sndctrlpipe() in this case.

Note that actually trying to read the i2c register in question does not
work as the register might not exist (e.g. depending on the demodulator)
as reported by Eero Lehtinen <debiangamer2@gmail.com>.

Reported-by: syzbot+faf11bbadc5a372564da@syzkaller.appspotmail.com
Reported-by: Eero Lehtinen <debiangamer2@gmail.com>
Fixes: d0f232e823af ("[media] rtl28xxu: add heuristic to detect chip type")
Cc: stable@vger.kernel.org      # 4.0
Cc: Antti Palosaari <crope@iki.fi>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 97ed17a141bb..a6124472cb06 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -37,7 +37,16 @@ static int rtl28xxu_ctrl_msg(struct dvb_usb_device *d, struct rtl28xxu_req *req)
 	} else {
 		/* read */
 		requesttype = (USB_TYPE_VENDOR | USB_DIR_IN);
-		pipe = usb_rcvctrlpipe(d->udev, 0);
+
+		/*
+		 * Zero-length transfers must use usb_sndctrlpipe() and
+		 * rtl28xxu_identify_state() uses a zero-length i2c read
+		 * command to determine the chip type.
+		 */
+		if (req->size)
+			pipe = usb_rcvctrlpipe(d->udev, 0);
+		else
+			pipe = usb_sndctrlpipe(d->udev, 0);
 	}
 
 	ret = usb_control_msg(d->udev, pipe, 0, requesttype, req->value,
-- 
2.31.1

