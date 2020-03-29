Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C54A219710C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 01:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgC2XNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Mar 2020 19:13:18 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:45328 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726382AbgC2XNS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 29 Mar 2020 19:13:18 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9308AC0084;
        Sun, 29 Mar 2020 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585523597; bh=nyZ3QBvaZomgtnCfnxNMPpDAxdv3dl+dAoNSRNRFac0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GD7FziVLCbId0otQ/99CmBgIn4V5zI63Bd9N6kLq0qJj7dCp/zZ8wN2E2kZWl75ff
         qoAUdba7mLodIIJRmREnpmuXciNaWDvsciWM9bC3B0FXF0OScRYW1byqDEXUQf/piV
         TImyGzesI3tosomnsN4NJDUTXxYjlnOTzXnPKYahUQ1SkGaWwANxtAX4kfML4d3NVt
         psNDkNh8hdj1YWQ4jlmde9wssFLFkLGL/vIl/lA9uPs4S48iL6wBoUpRYnbvLa5UhE
         36hOMBQ6jzV8Vv4zM8rvy2RpzGCVnhHMe8a6whMAEVXoJsybbsZhiZ62uM+1Wp37mr
         oeKo8mgw0PoEQ==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 64894A006D;
        Sun, 29 Mar 2020 23:13:16 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Sun, 29 Mar 2020 16:13:16 -0700
Date:   Sun, 29 Mar 2020 16:13:16 -0700
Message-Id: <1538b1dfe07cb3fee30acbc8a21e44678032c088.1585523081.git.thinhn@synopsys.com>
In-Reply-To: <cover.1585523081.git.thinhn@synopsys.com>
References: <cover.1585523081.git.thinhn@synopsys.com>
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 4/4] usb: dwc3: gadget: WARN on no-resource status
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the driver issued START_TRANSFER and received a no-resource status,
then generally there are a few reasons for this:

1) The driver did not allocate resource for the endpoint during
power-on-reset initialization.

2) The transfer resource was reset. At this moment, we don't do this in
the driver, but it occurs when the driver issues START_CONFIG cmd to ep0
with resource index=2.

3) The driver issues the START_TRANSFER command to an already started
endpoint. Usually, this is because the END_TRANSFER command hasn't
completed yet.

Print out a warning to help debug this issue in the driver.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/gadget.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index ee87b7b383f6..1a4fc03742aa 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -356,6 +356,8 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned cmd,
 				ret = 0;
 				break;
 			case DEPEVT_TRANSFER_NO_RESOURCE:
+				dev_WARN(dwc->dev, "No resource for %s\n",
+					 dep->name);
 				ret = -EINVAL;
 				break;
 			case DEPEVT_TRANSFER_BUS_EXPIRY:
-- 
2.11.0

