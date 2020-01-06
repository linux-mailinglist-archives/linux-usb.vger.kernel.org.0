Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821FB131135
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 12:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgAFLLu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 06:11:50 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42194 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgAFLLu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 06:11:50 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1ioQI8-0004Ez-SL; Mon, 06 Jan 2020 11:11:24 +0000
From:   Colin King <colin.king@canonical.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] usb: typec: ucsi: fix spelling mistake "connetor" -> "connector"
Date:   Mon,  6 Jan 2020 11:11:24 +0000
Message-Id: <20200106111124.28100-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 466bd8afceea..1b1e36178317 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -669,7 +669,7 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num)
 	struct ucsi_connector *con = &ucsi->connector[num - 1];
 
 	if (!(ucsi->ntfy & UCSI_ENABLE_NTFY_CONNECTOR_CHANGE)) {
-		dev_dbg(ucsi->dev, "Bogus connetor change event\n");
+		dev_dbg(ucsi->dev, "Bogus connector change event\n");
 		return;
 	}
 
-- 
2.24.0

