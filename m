Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45AD1125980
	for <lists+linux-usb@lfdr.de>; Thu, 19 Dec 2019 03:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726725AbfLSCOk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 21:14:40 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47280 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726721AbfLSCOk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 18 Dec 2019 21:14:40 -0500
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A576C0094;
        Thu, 19 Dec 2019 02:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576721679; bh=3E1vQHMaiObXAJ9sdSnRc6k4+RUDN/+JeANjpmEUCUk=;
        h=Date:From:Subject:To:Cc:From;
        b=D5lMRydg8exZGdWj3xM/1CGaA0XSTeiRXc6IdWgEj0B+pxQ9M63Z9I0n1f9J1pbhl
         mCN+cYhMvEc3ZD8hJqcvluwTex//AEsxqoSUM0KIxxRwKEstI21Hp3FzM+LQ9bdg4b
         aRPypC84+9p04unzSMict6JdxTr51xaUdFxk6tTSZjxnIaBLjxaDSiWxiORO4CXZVK
         wwAc8fVcVxbk68xoZJOGS9CPoSqj52fy9ul1P/lKTcpFL8AAmI7tR3nBU0OgzrmUyW
         W0cFZTwengjrQoZxG1lD3QNHoIA8zOsvo5RHEvP34luYNgV7pgl4tomvLmywJlytoe
         xerNcBO8DATOQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id D73ADA006D;
        Thu, 19 Dec 2019 02:14:37 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 18 Dec 2019 18:14:37 -0800
Date:   Wed, 18 Dec 2019 18:14:37 -0800
Message-Id: <cover.1576715470.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/3] usb: dwc3: gadget: Improve END_TRANSFER handling
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series improves the handling of the END_TRANSFER command:

1) Don't issue multiple END_TRANSFER commands while the previous hasn't
   completed
2) Don't issue START_TRANSFER command while END_TRANSFER hasn't completed
3) Remove arbitrary 100us delay

Changes in v2:
 - Remove unused variable


Thinh Nguyen (3):
  usb: dwc3: gadget: Check END_TRANSFER completion
  usb: dwc3: gadget: Delay starting transfer
  usb: dwc3: gadget: Remove END_TRANSFER delay

 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/ep0.c    |  4 +++-
 drivers/usb/dwc3/gadget.c | 35 +++++++++++++++++++++--------------
 3 files changed, 26 insertions(+), 15 deletions(-)

-- 
2.11.0

