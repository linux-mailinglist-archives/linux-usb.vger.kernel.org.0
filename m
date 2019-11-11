Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA0CF779D
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 16:26:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbfKKP0y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 10:26:54 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58475 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfKKP0y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Nov 2019 10:26:54 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mol@pengutronix.de>)
        id 1iUBac-0000hy-13; Mon, 11 Nov 2019 16:26:50 +0100
Received: from mol by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mol@pengutronix.de>)
        id 1iUBaa-0003bN-Qm; Mon, 11 Nov 2019 16:26:48 +0100
From:   Michael Olbrich <m.olbrich@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: [PATCH 0/2] usb: dwc3: gadget: improve isoc handling
Date:   Mon, 11 Nov 2019 16:26:43 +0100
Message-Id: <20191111152645.13792-1-m.olbrich@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

These two patches improve the isoc handling and make the dwc3 gadget driver
somewhat usable with the UVC gadget for isochronous endpoints.

The first patch makes starting isochronous transfers more reliable. I think
it's more less, what Thinh suggested some time ago[1]. It's still not
perfect because the first request must still be queued within 2 seconds but
it's a lot better than the current situation.

The second patch makes it possible to have gaps in the data stream. The UVC
gadget relies on such behaviour. Without this, using the UVC gadget with a
live stream stops after the first frame, because all later frames are
dropped.
I'm not sure if this is the correct solution, but all other drivers
currently work this way, from what I can tell.

Regards,
Michael

[1] https://marc.info/?l=linux-usb&m=156088170723824&w=4

Michael Olbrich (2):
  usb: dwc3: gadget: make starting isoc transfers more robust
  usb: dwc3: gadget: restart the transfer if a isoc request is queued
    too late

 drivers/usb/dwc3/core.h   |  1 +
 drivers/usb/dwc3/gadget.c | 39 +++++++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 8 deletions(-)

-- 
2.20.1

