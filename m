Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF8CD370C03
	for <lists+linux-usb@lfdr.de>; Sun,  2 May 2021 16:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbhEBOFF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 May 2021 10:05:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:50100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232592AbhEBOE7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 2 May 2021 10:04:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8303A613B0;
        Sun,  2 May 2021 14:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619964248;
        bh=KqrtwADJFNLccYKBQbyAelZdQv0NXjhVMJ5uSbf8zRg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nfxAZnM9it1Z1prmpKs1vSOhsxVx5moRK74YhqTzFqYYeYGt709geS1LI6E+pV5EA
         kcyeztvrCXfxcoPHe7x63J0BymIaC5YFaHYoByUCvH0Au6cv8LjWk5H8x8XPmDDNmg
         zjWQZhejdELxqobp1HfKl19RkG3dUeu6VBx38YokE12pI1Qs4S11qWGcdH1rP6FDPA
         UVkZrXEHPWNi74sG9rqos9EcmYjP+naMMweRv/Shg/F1AUuLQAIU7ksbARXP5jTYMI
         sJqeD9dej4y1pg2oOZQkBhQIffoSO1gPXmigVnoeUSI4e7DZEZwIHDAK4EALZJiFXl
         L9jgkLdnGUmpA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.11 17/70] usb: dwc3: gadget: Ignore EP queue requests during bus reset
Date:   Sun,  2 May 2021 10:02:51 -0400
Message-Id: <20210502140344.2719040-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140344.2719040-1-sashal@kernel.org>
References: <20210502140344.2719040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wesley Cheng <wcheng@codeaurora.org>

[ Upstream commit 71ca43f30df9c642970f9dc9b2d6f463f4967e7b ]

The current dwc3_gadget_reset_interrupt() will stop any active
transfers, but only addresses blocking of EP queuing for while we are
coming from a disconnected scenario, i.e. after receiving the disconnect
event.  If the host decides to issue a bus reset on the device, the
connected parameter will still be set to true, allowing for EP queuing
to continue while we are disabling the functions.  To avoid this, set the
connected flag to false until the stop active transfers is complete.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Link: https://lore.kernel.org/r/1616146285-19149-3-git-send-email-wcheng@codeaurora.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc3/gadget.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 65ff41e3a18e..5b5520286eff 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3267,6 +3267,15 @@ static void dwc3_gadget_reset_interrupt(struct dwc3 *dwc)
 {
 	u32			reg;
 
+	/*
+	 * Ideally, dwc3_reset_gadget() would trigger the function
+	 * drivers to stop any active transfers through ep disable.
+	 * However, for functions which defer ep disable, such as mass
+	 * storage, we will need to rely on the call to stop active
+	 * transfers here, and avoid allowing of request queuing.
+	 */
+	dwc->connected = false;
+
 	/*
 	 * WORKAROUND: DWC3 revisions <1.88a have an issue which
 	 * would cause a missing Disconnect Event if there's a
-- 
2.30.2

