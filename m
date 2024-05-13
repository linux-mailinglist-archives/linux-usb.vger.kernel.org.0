Return-Path: <linux-usb+bounces-10249-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB98C3A28
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 04:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E8C12814FA
	for <lists+linux-usb@lfdr.de>; Mon, 13 May 2024 02:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D9E212EBD7;
	Mon, 13 May 2024 02:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ct9Tau9S"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5687483
	for <linux-usb@vger.kernel.org>; Mon, 13 May 2024 02:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715566840; cv=none; b=D+6fX1oL5v5iPrRGkkgz35X93zMV9GcrjzLhZhTRUeCy+Slgmtwww+ubMlG3qHQxsWTukZD5BRxE5vfqeOaYyFnMDZgW/etC4vjM1U35cSHsIZcDccSMIk/ci4B+9W7iOEDMVKM3nKI+wzwb6LsS70uv2ndf44FRXOAhJL8QWwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715566840; c=relaxed/simple;
	bh=gVwQQ0+bJl9j2XNFHKpVo1850TmOXPuoyiaLL1H46I8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tITMOT1OwSWKQTRN/UKGE5zo76WaXvY2rq99zt28g1t784SugFrmNx1/IMUiUSda0Bp0gL2kLPmCH+dpAsV99u9qgvdXzbPCyiDX6eel79leC0SuJva0e6ywA+A7lkcteQ4fOVhN55TV7pGnda01vO7RyseIJLEvf9jMn3nA0Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ct9Tau9S; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TPcf1
	pxzLfKFlBEBd5SLnQVqky/E0pKhUt69oULfpXA=; b=ct9Tau9SXkZOdMtWY8lpK
	doaVPl5uUec3Qa5mdv9S4EEG8VRaZT2WMIvX0G4LJ6AXuYn/JrSmNw2oBeh96l9Q
	wYwoRp7WzDUweAMtMW+rc7LbNwZ9JyICFlMP85s4sZmMMxD73D0AYarRNxMbJ09T
	9pbH7KU2JXfGIGF/OWr42w=
Received: from flipped.. (unknown [159.226.94.118])
	by gzga-smtp-mta-g2-0 (Coremail) with SMTP id _____wD3_3TGeEFmpf0pCA--.47954S2;
	Mon, 13 May 2024 10:19:51 +0800 (CST)
From: Sicong Huang <congei42@163.com>
To: peter.chen@kernel.org,
	pawell@cadence.com,
	rogerq@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Sicong Huang <congei42@163.com>
Subject: [PATCH v1] usb: cdns3: cdns3-gadget: fix use-after-free bug in cdns3_gadget_exit due to race
Date: Mon, 13 May 2024 10:19:48 +0800
Message-Id: <20240513021948.133039-1-congei42@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_3TGeEFmpf0pCA--.47954S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFy8ZFWrXryfWw4rWr4Uurg_yoW8ZFy3pa
	yqqFWUAayxJrZ8tr1DtrsrWFW5Ww4Utr9FyrWvkr4DZF9xJw1rKF13Kr10kF4UCFykZr4U
	KF1vgwsY9F4ak3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UIg4DUUUUU=
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/1tbivgrd8mV4JEyxlgABsI

This bug exists in drivers/usb/cdns3/cdns3-gadget.c. Function
__cdns3_gadget_init will call cdns3_gadget_start to do futher jobs
during the initialization proccess of cdns3 gadget. In cdns3_gadget_start,
&priv_dev->pending_status_wq is bound with cdns3_pending_setup_status_handler.
Then this work will be added to system_freezable_wq in cdns3_gadget_ep0_queue.
Here is the code.
queue_work(system_freezable_wq, &priv_dev->pending_status_wq);

If we call cdns3_gadget_exit to remove the device and make cleanup,
there are some unfinished works. This function will call cdns3_free_all_eps to
free all the endpoints. However, if cdns3_pending_setup_status_handler is
scheduled to run after the free job, it will cause use-after-free error as
cdns3_pending_setup_status_handler will use the endpoint in the following code.
request->complete(&priv_dev->eps[0]->endpoint, request);

The possible execution flow that may lead to this issue is as follows:
CPU0                    CPU1
                      | __cdns3_gadget_init
                      | cdns3_gadget_start
cdns3_gadget_exit     |
cdns3_free_all_eps    |
devm_kfree (free)     |
                      | cdns3_pending_setup_status_handler
                      | &priv_dev->eps[0]->endpoint (use)

Fix it by cleaning the work in cdns3_gadget_exit.

Signed-off-by: Sicong Huang <congei42@163.com>
---
 drivers/usb/cdns3/cdns3-gadget.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index fd1beb10bba7..0f2e143bd17a 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -3252,6 +3252,9 @@ static void cdns3_gadget_exit(struct cdns *cdns)
 	pm_runtime_mark_last_busy(cdns->dev);
 	pm_runtime_put_autosuspend(cdns->dev);
 
+	cancel_work_sync(&priv_dev->pending_status_wq);
+	cancel_work_sync(&priv_dev->aligned_buf_wq);
+
 	usb_del_gadget(&priv_dev->gadget);
 	devm_free_irq(cdns->dev, cdns->dev_irq, priv_dev);
 
-- 
2.34.1


