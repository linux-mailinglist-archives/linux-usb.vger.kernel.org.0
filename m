Return-Path: <linux-usb+bounces-3904-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D9A80A36A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 13:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59CA328193B
	for <lists+linux-usb@lfdr.de>; Fri,  8 Dec 2023 12:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2DC11C294;
	Fri,  8 Dec 2023 12:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGRLCeNz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBFC1C694
	for <linux-usb@vger.kernel.org>; Fri,  8 Dec 2023 12:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FE1C433C7;
	Fri,  8 Dec 2023 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702039042;
	bh=gqQmFdVmCQcNd8eKCMxCHIDAeVXnQ1wKVZgIjb/cu7E=;
	h=From:To:Cc:Subject:Date:From;
	b=rGRLCeNzGWF3GpJdrEeFpcxOAAO3hSBToCupmGi0kWqtNUDaK5uGOOum3/+R1nCIG
	 M21XLvFvzPQV0ZKl7Jptqcb67rDybpXqqQSgESiZjyKnhkEskWo8suGEWt6v3p6E5x
	 n/X7wP1pd+75peLzsXgV0mPX/Qo1uyIl2c0yZYA30n4Rt57/0Qptu4Xf7jYFDLpp30
	 jT4cKNTdm5DP7S8ZneFs98UKXRVhnDCaowJZax3Uueqg57fL1MqwkWQoGp7rm4HKBs
	 tKeWMP1ybW4TtBCJq7fcEG9t7g7zl/MfIXByv4Wva7GlYSk38LyyI0EbtdErq3rBml
	 EIClylnvCZCjw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rBa7P-0007o9-1V;
	Fri, 08 Dec 2023 13:38:12 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] usb: typec: ucsi: fix gpio-based orientation detection
Date: Fri,  8 Dec 2023 13:36:02 +0100
Message-ID: <20231208123603.29957-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the recently added connector sanity check which was off by one and
prevented orientation notifications from being handled correctly for the
second port when using GPIOs to determine orientation.

Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPIO to provide switch events")
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---

I found this one through inspection when skimming the driver.

Johan


 drivers/usb/typec/ucsi/ucsi_glink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index db6e248f8208..4853141cd10c 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -228,7 +228,7 @@ static void pmic_glink_ucsi_notify(struct work_struct *work)
 
 	con_num = UCSI_CCI_CONNECTOR(cci);
 	if (con_num) {
-		if (con_num < PMIC_GLINK_MAX_PORTS &&
+		if (con_num <= PMIC_GLINK_MAX_PORTS &&
 		    ucsi->port_orientation[con_num - 1]) {
 			int orientation = gpiod_get_value(ucsi->port_orientation[con_num - 1]);
 
-- 
2.41.0


