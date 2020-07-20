Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACFA227088
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 23:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727834AbgGTVhs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 17:37:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727819AbgGTVhp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 17:37:45 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF49922CF7;
        Mon, 20 Jul 2020 21:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595281065;
        bh=6IiCZJSCazxGZ+S4y95kWx0DvTpmrq6GMeSZMEbfpyM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JSNYyOtQazvpOaNAYgWZ+q+QPJC+0BqwT9eNQiFGhBSaMiYIZp1omU5tOXQ5tNO38
         mWfx+TfK2/MaqgahibaJN6c6vw5VUogJWZjAo2CWFV2XFxsiNIbxGAvPfDy/Xt31B+
         slNi6Tu6RqH5BWYlmDOjAZiEw8hLY025l7dR2pKE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Peter Chen <peter.chen@nxp.com>, kbuild test robot <lkp@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 24/40] usb: cdns3: trace: fix some endian issues
Date:   Mon, 20 Jul 2020 17:36:59 -0400
Message-Id: <20200720213715.406997-24-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200720213715.406997-1-sashal@kernel.org>
References: <20200720213715.406997-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

[ Upstream commit 65b7cf48c211ece5e2560a334eb9608e48775a8f ]

It is found by sparse.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/cdns3/trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/trace.h b/drivers/usb/cdns3/trace.h
index 755c565822575..0a2a3269bfac6 100644
--- a/drivers/usb/cdns3/trace.h
+++ b/drivers/usb/cdns3/trace.h
@@ -404,9 +404,9 @@ DECLARE_EVENT_CLASS(cdns3_log_trb,
 	TP_fast_assign(
 		__assign_str(name, priv_ep->name);
 		__entry->trb = trb;
-		__entry->buffer = trb->buffer;
-		__entry->length = trb->length;
-		__entry->control = trb->control;
+		__entry->buffer = le32_to_cpu(trb->buffer);
+		__entry->length = le32_to_cpu(trb->length);
+		__entry->control = le32_to_cpu(trb->control);
 		__entry->type = usb_endpoint_type(priv_ep->endpoint.desc);
 		__entry->last_stream_id = priv_ep->last_stream_id;
 	),
-- 
2.25.1

