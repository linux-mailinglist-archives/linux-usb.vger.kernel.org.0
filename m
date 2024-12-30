Return-Path: <linux-usb+bounces-18895-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5782C9FE4C9
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 10:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 145C016231F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2024 09:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73BC01A2541;
	Mon, 30 Dec 2024 09:25:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906B213A88A;
	Mon, 30 Dec 2024 09:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735550744; cv=none; b=IFABLMIbKCpc8vbDT0ZNWgncIUheUQ2+MhyOy7NC/8qZLArr1T//RRlmFF7w1eMtgPoSXYcQ1CsVVCzIBEcvemse3kBvDsDIE0ZgSMkmBClaCF83iaKmMXJg6GFGbDfRazeOoU/L7Rg/WGWWwms/rlx1DJJIK8GfSXD3Hqo0Obs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735550744; c=relaxed/simple;
	bh=yDagBD6eVFacKmXpRjzhO7c6g8gFjBvHSmeU5D2YD2U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o+DZdeJ+fZ7LAdxanq1cHlnheGhGMVkQ9GaQLld/MSR1frx9VeNxWYOcUlTAb1I0KdngwBdE3WJLB8QWSCfftn6fxUwB5CJ/NIEEL8bHLHUlQXcXzqd0bbU6pKYK2sewZyR2oSr2Umf8a5jaagD25ymCA2E3vjxhxpZ4kjJC5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YM9cL40qMz2DjdW;
	Mon, 30 Dec 2024 17:22:42 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F3F51A016C;
	Mon, 30 Dec 2024 17:25:32 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Dec
 2024 17:25:31 +0800
From: GONG Ruiqi <gongruiqi1@huawei.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>
Subject: [PATCH] usb: typec: fix pm usage counter imbalance in ucsi_ccg_sync_control()
Date: Mon, 30 Dec 2024 17:35:23 +0800
Message-ID: <20241230093523.1237231-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg100016.china.huawei.com (7.202.181.57)

The error handling for the case `con_index == 0` should involve dropping
the pm usage counter, as ucsi_ccg_sync_control() gets it at the
beginning. Fix it.

Fixes: e56aac6e5a25 ("usb: typec: fix potential array underflow in ucsi_ccg_sync_control()")
Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index fcb8e61136cf..740171f24ef9 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -646,7 +646,7 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 			UCSI_CMD_CONNECTOR_MASK;
 		if (con_index == 0) {
 			ret = -EINVAL;
-			goto unlock;
+			goto err_put;
 		}
 		con = &uc->ucsi->connector[con_index - 1];
 		ucsi_ccg_update_set_new_cam_cmd(uc, con, &command);
@@ -654,8 +654,8 @@ static int ucsi_ccg_sync_control(struct ucsi *ucsi, u64 command)
 
 	ret = ucsi_sync_control_common(ucsi, command);
 
+err_put:
 	pm_runtime_put_sync(uc->dev);
-unlock:
 	mutex_unlock(&uc->lock);
 
 	return ret;
-- 
2.25.1


