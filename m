Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D617E395066
	for <lists+linux-usb@lfdr.de>; Sun, 30 May 2021 12:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhE3KUb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 May 2021 06:20:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhE3KUb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 30 May 2021 06:20:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 422D660FDA;
        Sun, 30 May 2021 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622369933;
        bh=aIarsM2xwBn41MLV8NKbGK+QMKL4HkxHO8aTX6fDg2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lHBinzB6WD/pvQwdbEQ7q/ZCJHjptJKNQ3P3JipQR25sMwOxYKeZSjizEClK1QimU
         JzPPjpkOSDSF30CmOF72KtaYwurgN3YPNETjyY0dKwAXTA/RlgnkPQh3cO8KXpSrOW
         sZS06RX8mz4MzHmFrrIj9+viaCwPIR9o3SWRjn/tScR4t6O1fPZgnLi8us6W6K0kCk
         YhQh0RNUkz2BQKgeDcT+UlFmtQfGUFmgdaSyJbxs97UqWhQWqHU1S4J8FyI5WiUcIt
         +2RutTkJ+0RAGW3c3OfyUzzme0V/mb2za3pnpMY0W5G2Qtddvoa54d3TteZOxeZwdE
         EZpt26oMCbJxg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lnIWs-0004uZ-Hk; Sun, 30 May 2021 12:18:47 +0200
Date:   Sun, 30 May 2021 12:18:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Eero <fin4478@hotmail.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: USB: core: WARN if pipe direction != setup packet direction
Message-ID: <YLNmhtSnmEN0+a+x@hovoldconsulting.com>
References: <HE1PR0602MB32762856D2728450104CE1C6A1219@HE1PR0602MB3276.eurprd06.prod.outlook.com>
 <20210529192136.GA1507406@rowland.harvard.edu>
 <HE1PR0602MB3276072A2816DCBD1EB7DEB4A1219@HE1PR0602MB3276.eurprd06.prod.outlook.com>
 <20210529195831.GD1507406@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210529195831.GD1507406@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, May 29, 2021 at 03:58:31PM -0400, Alan Stern wrote:
> Please don't top-post.  And for the third time, please CC your emails 
> to the mailing list.  If you don't, I will stop replying.
> 
> On Sat, May 29, 2021 at 10:41:51PM +0300, Eero wrote:
> > Hi,
> > 
> > The dvb-t stick works when I did that. Thank you.
> > 
> > BR, Eero
> > 
> > On Sat, 29 May 2021 15:21:36 -0400
> > > 
> > > Does the same problem occur if you don't apply Johan's rtl28xxu patch 
> > > and you revert commit 5cc59c418fde from 5.13.rc3-next?
> > > 
> > > Alan Stern
> 
> Johan, it appears that your patch making an empty I2C read actually 
> transfer one byte somehow causes a problem for this dvb-t stick.
> 
> Below is a copy of the original problem report.  Any ideas?

I'd start with verifying that the type is still detected correctly so
that the driver uses the right implementation (i.e. for rtl2831u instead
of rtl2832u or vice versa).

If that isn't the problem, it could be the 1-byte read request itself
that throws the firmware off and causes later accesses to fail even if
that seems a bit far-fetched.

> The patch removed the warning, but the usb dvb-t stick does not work
> because of looping messages in dmesg:
> [  418.485387] mxl5005s I2C write failed
> [  418.658410] mxl5005s I2C write failed
 
Eero, could you try the below patch on top of linux-next (i.e. without
the zero-length request patch) and send us the logs?

Johan


From eda5deca4cbdebe21718bb13f76b8eed0673f9be Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Mon, 24 May 2021 10:55:19 +0200
Subject: [PATCH] media: rtl28xxu: add type-detection instrumentation

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

