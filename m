Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 120E819A28D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731470AbgCaXhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:37:36 -0400
Received: from mail-gateway-shared02.cyon.net ([194.126.200.224]:49836 "EHLO
        mail-gateway-shared02.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728840AbgCaXhg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:37:36 -0400
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared02.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRo-0000zq-8t
        for linux-usb@vger.kernel.org; Wed, 01 Apr 2020 01:37:33 +0200
Received: from [10.20.10.232] (port=35846 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.93)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jJQRn-000qIj-2x; Wed, 01 Apr 2020 01:37:31 +0200
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jJQRm-00085z-H3; Tue, 31 Mar 2020 23:37:30 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH v2 0/6] USB: serial: ch341: Add support for limited chips (was: Add support for HL340 devices)
Date:   Tue, 31 Mar 2020 23:37:16 +0000
Message-Id: <cover.1585697281.git.public@hansmi.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - s013.cyon.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - hansmi.ch
X-Get-Message-Sender-Via: s013.cyon.net: authenticated_id: mailrelay-cervus@hansmi.ch
X-Authenticated-Sender: s013.cyon.net: mailrelay-cervus@hansmi.ch
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A subset of CH341 devices does not support all features, namely the
prescaler is limited to a reduced precision and there is no support for
sending a RS232 break condition.

These devices can usually be identified by an imprint of "340" on the
turquoise-colored plug. They're also sometimes called "HL340", but not
all such devices are affected.

This series takes multiple steps to support the limited chips:

* Remove special cases from clock prescaler computation
* Detect limited devices by trying to read a register related to sending
  a break condition
* Amend clock prescaler computation to only use working values on
  limited chips
* Simulate an RS232 break condition by temporarily lowering the baud
  rate and sending a NUL byte

Michael Hanselmann (6):
  USB: serial: ch341: Reduce special cases in clock calculation
  USB: serial: ch341: Add basis for quirk detection
  USB: serial: ch341: Limit prescaler on quirky chips
  USB: serial: ch341: Name prescaler, divisor registers
  USB: serial: ch341: Compute minimum baud rate
  USB: serial: ch341: Simulate break condition if not supported

 drivers/usb/serial/ch341.c | 294 ++++++++++++++++++++++++++++++-------
 1 file changed, 244 insertions(+), 50 deletions(-)

-- 
2.20.1

