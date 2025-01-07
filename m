Return-Path: <linux-usb+bounces-19053-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F535A034A6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 02:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6BE4188576D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 01:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18422744D;
	Tue,  7 Jan 2025 01:47:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D27A5661;
	Tue,  7 Jan 2025 01:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736214479; cv=none; b=a4nZ11yaKfn80i3FFqfdEYgRNNarC0tldmda3fQdjLWrmYE4ru3TzL7Mq0NTi/VgD8MsZd8QbotOlZzthHE1pRNfezhluVysNMd6YKQpEeZZyOVj1XhTcfr/zeMgLm55oYDgQUPYTQmNa10CW+shvbT6t76H6v6ZTkjo/cYN3wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736214479; c=relaxed/simple;
	bh=TLKZAmpHwoAPhrJ7/+ND3S0bcXPxKzMyX6ugBOthQPw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QlUGTiuK0Ec84qdeyXWImZtKaeFXBd92WwQiTataRsoZfEmCb+K5L/MI3RDhjn0zx9ISp3QKBznASFb4gG4GNFdXd7LKUHT+NVEkf3K8y3WPerrokhsXvlT9Zj3TvPeeObQ6527vDZ4MxQU21uDJG3bqPWe/t1WYXguf5WGRLEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YRv4851m1zgZRV;
	Tue,  7 Jan 2025 09:44:40 +0800 (CST)
Received: from kwepemg100016.china.huawei.com (unknown [7.202.181.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 699EF1802D1;
	Tue,  7 Jan 2025 09:47:45 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemg100016.china.huawei.com
 (7.202.181.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 7 Jan
 2025 09:47:44 +0800
From: GONG Ruiqi <gongruiqi1@huawei.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<gongruiqi1@huawei.com>
Subject: [PATCH v2] usb: typec: fix pm usage counter imbalance in ucsi_ccg_sync_control()
Date: Tue, 7 Jan 2025 09:57:50 +0800
Message-ID: <20250107015750.2778646-1-gongruiqi1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemg100016.china.huawei.com (7.202.181.57)

The error handling for the case `con_index == 0` should involve dropping
the pm usage counter, as ucsi_ccg_sync_control() gets it at the
beginning. Fix it.

Cc: stable@vger.kernel.org
Fixes: e56aac6e5a25 ("usb: typec: fix potential array underflow in ucsi_ccg_sync_control()")
Signed-off-by: GONG Ruiqi <gongruiqi1@huawei.com>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
---

v2: complement `Cc: stable` as requested
v1: https://lore.kernel.org/all/20241230093523.1237231-1-gongruiqi1@huawei.com/

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


