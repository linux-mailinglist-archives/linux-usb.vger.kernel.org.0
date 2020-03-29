Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FFBE197108
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgC2XMx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:12:53 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:53102 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727028AbgC2XMx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:12:53 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0540443B0F;
        Sun, 29 Mar 2020 23:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585523573; bh=hfLnprPMYIxYDM0VhDbh+dLgmXnDbW4vVSNkHQImr24=;
        h=Date:From:Subject:To:Cc:From;
        b=PWZ3X8S/1BBeJv8+mG5MtAuhV2qXjS2dqIF3R+E+vDBRFPEKjf97W8zZfryeZj/rq
         a+F0OKuDRCO4mm6UC3MwZeXqt5PF2iTAtSQaRUf1Wqe56lWD8JBr1oPWoYpQ2dxTf8
         gvulLqqDXtB3iJZIakJ7EU9XGQneAhQX1YycFtfGVD6o2smF9FeiILmqauyz3j8aoZ
         zWSkaJMnohnMD4UzYNKrjBMW/nwXWPEAFCIfL41fhI08tu559I5x1mBH4rGzcGhBGV
         0ZEm6/dj+WmEMVktJlPzLdZdz00nkEPJOtLAE/DLDnqrfckG1bHL20SlnPoK3E+C41
         dxCJkzqaAGzeQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5F899A00B1;
        Sun, 29 Mar 2020 23:12:51 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 16:12:51 -0700
Date:   Sun, 29 Mar 2020 16:12:51 -0700
Message-Id: <cover.1585523081.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 0/4] usb: dwc3: gadget: Improve isoc starting mechanism
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently we use the "retry" method to issue START_TRANSFER command multiple
times, each with a next interval. There's been report that 5 number of retries
may not be enough. See https://lkml.org/lkml/2019/11/11/535

We could increase the number of retries. However, that also may not be enough
depending on different system latency. It is not often that the latency is
higher than 5 isoc intervals. If it goes beyond 5 intervals, let's restart the
whole process again.


Changes in v2:
 - Include patch "usb: dwc3: gadget: WARN on no-resource status" to this series

Thinh Nguyen (4):
  usb: dwc3: gadget: Properly handle failed kick_transfer
  usb: dwc3: gadget: Store resource index of start cmd
  usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer
  usb: dwc3: gadget: WARN on no-resource status

 drivers/usb/dwc3/gadget.c | 71 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 12 deletions(-)

-- 
2.11.0

