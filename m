Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C092C3BB3
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 18:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390396AbfJAQpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 12:45:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:58308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390388AbfJAQpp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 12:45:45 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FD3D2190F;
        Tue,  1 Oct 2019 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569948344;
        bh=4/1WMFpvEtJisXoIx8yqSm8+ou6YBcEv5rXgYGQ49L8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZkODZ435u1WkE8AfEgflBNyntlWUyXeEtXpvehnCxywGtJPIAPLWPTFdX+FxHU0Pk
         prc0eZydirH78mY68AOFtBsN+Hav6RPPzglgzycMuV9FZxyQwWirw1t1vyiVBFt+/4
         Mu/ZeCkt4IWOGlBVAjragUg/R1fz6g+wMPsEWXbA=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
        Jakub Kicinski <jakub.kicinski@netronome.com>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 08/15] usbnet: ignore endpoints with invalid wMaxPacketSize
Date:   Tue,  1 Oct 2019 12:45:26 -0400
Message-Id: <20191001164533.16915-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191001164533.16915-1-sashal@kernel.org>
References: <20191001164533.16915-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bjørn Mork <bjorn@mork.no>

[ Upstream commit 8d3d7c2029c1b360f1a6b0a2fca470b57eb575c0 ]

Endpoints with zero wMaxPacketSize are not usable for transferring
data. Ignore such endpoints when looking for valid in, out and
status pipes, to make the drivers more robust against invalid and
meaningless descriptors.

The wMaxPacketSize of these endpoints are used for memory allocations
and as divisors in many usbnet minidrivers. Avoiding zero is therefore
critical.

Signed-off-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/usbnet.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 2502681369cd1..6c531abe198bb 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -115,6 +115,11 @@ int usbnet_get_endpoints(struct usbnet *dev, struct usb_interface *intf)
 			int				intr = 0;
 
 			e = alt->endpoint + ep;
+
+			/* ignore endpoints which cannot transfer data */
+			if (!usb_endpoint_maxp(&e->desc))
+				continue;
+
 			switch (e->desc.bmAttributes) {
 			case USB_ENDPOINT_XFER_INT:
 				if (!usb_endpoint_dir_in(&e->desc))
-- 
2.20.1

