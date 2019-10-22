Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00A89E0C3C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Oct 2019 21:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731703AbfJVTJn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Oct 2019 15:09:43 -0400
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:36034 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730186AbfJVTJn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Oct 2019 15:09:43 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EFACCC08C6;
        Tue, 22 Oct 2019 19:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1571771383; bh=c+U1BDlURO2YiroOyy4PKFPpHNCQBlZt0PaEadiXCrU=;
        h=Date:From:Subject:To:Cc:From;
        b=LyK2Hv7Ga9xedHbaBX4Axuyk54JrttZ2jj/XfMxu78wfp9ld1AJeyZObmpOGUlsAj
         +ucKXgNtLOgejrCGqk5vGNKfBdoOZsa7gu78qBUkrInCjTBqzepFkxQNFml+v3ZUQr
         VfNT6++KlHKBB6J5F5TBU0oFYzg5bCqQ6+EOaTjybo5HU9Cu2U+ZbShkGcNEQbHo8E
         TgoEaPssK0ntntJjVikG39he365UJfCZSeW0Dndj+C3647uGShzsaucSZtLaKIbMHZ
         5gpdhpl+nBorY4agJVBxkD81b0KBV4eoqbw89jf2xqsftY0r46UK1M1F5y7O1xhJgy
         wdy8mu7Bjurpw==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 768C1A005A;
        Tue, 22 Oct 2019 19:09:41 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Tue, 22 Oct 2019 12:09:41 -0700
Date:   Tue, 22 Oct 2019 12:09:41 -0700
Message-Id: <cover.1571770732.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 0/4] usb: gadget: Link state changes
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch series adds some fixes to how dwc3 handles cases related to
link state changes.


Thinh Nguyen (4):
  usb: dwc3: gadget: Don't send unintended link state change
  usb: dwc3: gadget: Set link state to RX_Detect on disconnect
  usb: dwc3: gadget: Clear DCTL.ULSTCHNGREQ before set
  usb: dwc3: debug: Remove newline printout

 drivers/usb/dwc3/debug.h  |  4 ++--
 drivers/usb/dwc3/gadget.c | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

-- 
2.11.0

