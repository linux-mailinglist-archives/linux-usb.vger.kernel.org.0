Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C53BC17C5CF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 20:00:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgCFTAx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Mar 2020 14:00:53 -0500
Received: from mail-gateway-shared14.cyon.net ([194.126.200.67]:49926 "EHLO
        mail-gateway-shared14.cyon.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726083AbgCFTAx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Mar 2020 14:00:53 -0500
Received: from s013.cyon.net ([149.126.4.22])
        by mail-gateway-shared14.cyon.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDJ-0003iQ-N4
        for linux-usb@vger.kernel.org; Fri, 06 Mar 2020 20:00:51 +0100
Received: from [10.20.10.231] (port=57634 helo=mail.cyon.ch)
        by s013.cyon.net with esmtpa (Exim 4.92)
        (envelope-from <public+bounce-silo.slz.hanselmann.tv-hansmi@hansmi.ch>)
        id 1jAIDI-00A70o-GI; Fri, 06 Mar 2020 20:00:48 +0100
Received: from hansmi by silo.slz.hanselmann.tv with local (Exim 4.92)
        (envelope-from <hansmi@silo.slz.hanselmann.tv>)
        id 1jAIDH-00061A-Po; Fri, 06 Mar 2020 19:00:47 +0000
From:   Michael Hanselmann <public@hansmi.ch>
To:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
Cc:     Michael Hanselmann <public@hansmi.ch>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: [PATCH 0/4] ch341: Add support for HL340 devices
Date:   Fri,  6 Mar 2020 19:00:41 +0000
Message-Id: <cover.1583520568.git.public@hansmi.ch>
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
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-OutGoing-Spam-Status: No, score=-1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A subset of CH341 devices does not support all features, namely the
prescaler is limited to a reduced precision and there is no support for
sending a RS232 break condition.

These devices can usually be identified by an imprint of "340" on the
turquoise-colored plug. They're also sometimes called "HL340", hence the
terminology in this series and driver.

This series adds detection of these devices, adjusts the
divisor/prescaler setup and implements a simulated break condition.

Michael Hanselmann (4):
  ch341: Name more registers
  ch341: Detect HL340 variant
  ch341: Limit prescaler on HL340 variant
  ch341: Simulate break condition on HL340 variant

 drivers/usb/serial/ch341.c | 196 +++++++++++++++++++++++++++++++++----
 1 file changed, 176 insertions(+), 20 deletions(-)

-- 
2.20.1

