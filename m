Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CFD2B4367
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 13:14:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729557AbgKPMNi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 07:13:38 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:7919 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgKPMNh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 07:13:37 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZSdv0KDNz6wNx;
        Mon, 16 Nov 2020 20:13:23 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 20:13:30 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH 1/2] usb: gadget: f_midi: Fix memleak in f_midi_alloc
Date:   Mon, 16 Nov 2020 20:17:09 +0800
Message-ID: <20201116121710.1546690-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201116121710.1546690-1-zhangqilong3@huawei.com>
References: <20201116121710.1546690-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In the error path, if midi is not null, we should to
free the midi->id if necessary to prevent memleak.

Fixes: b85e9de9e818d ("usb: gadget: f_midi: convert to new function interface with backward compatibility")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/usb/gadget/function/f_midi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 85cb15734aa8..596fd7ce56fb 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -1345,7 +1345,10 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 
 setup_fail:
 	mutex_unlock(&opts->lock);
+	if (midi)
+		kfree(midi->id);
 	kfree(midi);
+
 	return ERR_PTR(status);
 }
 
-- 
2.25.4

