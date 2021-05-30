Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599E7395268
	for <lists+linux-usb@lfdr.de>; Sun, 30 May 2021 20:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhE3SD7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 14:03:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:45658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhE3SD6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 30 May 2021 14:03:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6250361206;
        Sun, 30 May 2021 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622397739;
        bh=jGTNxYLXXEqEAGJ4wjDxY9s/OYIwcXM4r8qH8suN0TA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D0z2SACdor96Lxylnnptk4qpSzg0BHPcLmJIkfRyGVTONALiZTEntl15Bk+MAJOR/
         dX9bkP0CsYz89cricdd1jy+7tPj0cyYaZNXIcUFK/pPgxF8OiXQWgbrIDyEgYTyjM9
         TugCkhCy4eWlIwTz6pv0aiuvq9KL/ESnBanP65LUK/ir3Ljpvgrl2rtI8jcKTv8rlv
         iNKMLsww+TKXCYQdlBuKhog7gAy3HPqs34B08kW9zVCZA6BW2TtuYTaqOyBjPDRxrL
         TBD8VGN/p+IUVUue1loDw0K/D+sd4bAgaQhqxZolAT/rt+LweBQgn1FQPkDtCdRBEg
         bpO6JTpQAq63Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lnPlP-0000Au-Py; Sun, 30 May 2021 20:02:15 +0200
Date:   Sun, 30 May 2021 20:02:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Eero Lehtinen <debiangamer2@gmail.com>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH] media: rtl28xxu: add type-detection instrumentation
Message-ID: <YLPTJ3HIos630Btb@hovoldconsulting.com>
References: <CAHS3B0EzL7zeKGjm=kvEq7VgDc-7hZNgOm-z5zPgFwVg0uQe-Q@mail.gmail.com>
 <YLOZLvWESErIePs3@hovoldconsulting.com>
 <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHS3B0E7tqHvF2-jsJZfPWYc6f9HLDDsvepDbqy1rboXOHFegQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Please avoid top-posting; instead reply in-line as I do below. ]

On Sun, May 30, 2021 at 06:57:12PM +0300, Eero Lehtinen wrote:
> cat /sys/kernel/debug/dynamic_debug/control | grep rtl28xxu.c

> drivers/media/usb/dvb-usb-v2/rtl28xxu.c:640
> [dvb_usb_rtl28xxu]rtl28xxu_identify_state =_ "chip_id=%u\012"

The dev_info() added by the instrumentation patch (included again below)
should show up in dmesg if you applied it and rebuilt and installed the
driver correctly.

You can enable dynamic debugging as well to determine if the chip type
is detected differently (with and without the zero-length control
transfer patch), for example:

	echo module dvb_usb_rtl28xxu +p > /sys/kernel/debug/dynamic_debug/control

but it won't log the return value from the i2c read in question.

> On Sun, May 30, 2021 at 4:54 PM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Sun, May 30, 2021 at 03:23:36PM +0300, Eero Lehtinen wrote:
> > > Hi,
> > >
> > > I tested Johans latest patch and my dvb-t stick can find the channel
> > > list but not to tune to them. It uses the mxl5005s driver again with
> > > repeating mxl5005s I2C write failed messages:
> > >
> > > [   23.276076] mxl5005s I2C reset failed

> > It was just an instrumentation patch to gather more information. Can you
> > post the logs from when probing/using the device with that patch in
> > place?
> >
> > Specifically, look for the "rtl28xxu_identify_state" entries, but please
> > include the full log in case there are more hints in there.
> >
> > Also, please keep me and Alan on CC (along with the list) so that we get
> > your replies directly. The list can be a bit slow at forwarding at
> > times.

Johan


From eda5deca4cbdebe21718bb13f76b8eed0673f9be Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Mon, 24 May 2021 10:55:19 +0200
Subject: [PATCH] media: rtl28xxu: add type-detection instrumentation

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 97ed17a141bb..21e565603108 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -612,8 +612,10 @@ static int rtl28xxu_read_config(struct dvb_usb_device *d)
 static int rtl28xxu_identify_state(struct dvb_usb_device *d, const char **name)
 {
 	struct rtl28xxu_dev *dev = d_to_priv(d);
+	u8 buf[1];
 	int ret;
 	struct rtl28xxu_req req_demod_i2c = {0x0020, CMD_I2C_DA_RD, 0, NULL};
+	struct rtl28xxu_req req_demod_i2c2 = {0x0020, CMD_I2C_DA_RD, 1, buf};
 
 	dev_dbg(&d->intf->dev, "\n");
 
@@ -622,6 +624,11 @@ static int rtl28xxu_identify_state(struct dvb_usb_device *d, const char **name)
 	 * by old RTL2831U.
 	 */
 	ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c);
+	dev_info(&d->intf->dev, "%s - ret1 = %d\n", __func__, ret);
+
+	ret = rtl28xxu_ctrl_msg(d, &req_demod_i2c2);
+	dev_info(&d->intf->dev, "%s - ret2 = %d\n", __func__, ret);
+
 	if (ret == -EPIPE) {
 		dev->chip_id = CHIP_ID_RTL2831U;
 	} else if (ret == 0) {
-- 
2.31.1

