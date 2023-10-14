Return-Path: <linux-usb+bounces-1617-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18D7C93BB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 11:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 506FAB20ABC
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 09:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453216FDF;
	Sat, 14 Oct 2023 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Hq4FcTGb"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB746AB2
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 09:25:01 +0000 (UTC)
Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44AC4AD;
	Sat, 14 Oct 2023 02:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1697275497;
	bh=Vw3LE+Tmc3qVjQ4FoHkWDrAwkVApf+QWFWyArfPalQk=;
	h=From:To:Cc:Subject:Date;
	b=Hq4FcTGbJbxOkeDlltPPfPiGYRFJ6/dx6NuuICuzJMq9BEyizxDV7pzk/NvyEE97G
	 pD7aosqp0jKSCUicq85l7cMh7AoVfUNKSsIhHLV6NOaJmHlyFYqxzR3kWu2SqhMaVL
	 wcC8g1NPekn52kfcbrpyf5tNfFL4yfozkXY70oy4=
Received: from KernelDevBox.byted.org ([180.184.51.70])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 6372385B; Sat, 14 Oct 2023 17:24:55 +0800
X-QQ-mid: xmsmtpt1697275495tjv34p9ek
Message-ID: <tencent_A06A37B6A0C0643DEC1524501525866FAC09@qq.com>
X-QQ-XMAILINFO: MWBbVm9/0ltkXrz4vFd5e88m18OA1A/UuI1XeYAgyJeKVrHh720EvpMYv9l1CY
	 880gv3o8poCYOZw1t5e8+FOSapKh836Gdm1emw8548VmY/GIWVEPw4NyCmKy+XZXJSedK5bVbu12
	 GexQ/C8waLZ0qJsfazLT7bGvz3nnKDa4zogvTLsKv/8GBNjKqM95RQEr6bciGZZ2kxni9uk3CaTK
	 wfIJaafvPlURJc4NVxUw9j9Wp6h2NIqqLVXlFujB2OVYmkFEKJFPU05BxfA6BtRN2uss+x9yrFLb
	 I6DtmaAtcaIHqSF4wKtDqSxfhnqQdSzbEEICZu6UvajaC7qKSze8jNWJRmc9u2q+Gc7CFmBPkKZy
	 t5EUV70gMIg0ZHrJt4ZhWXfyCYLlrWp8TDsCA1WSf7XjpDfK9/uRzCAEldfrVzpfwrIjN1yI+moI
	 zz+qJ2zF4c4+E36Dt2UYyLG38Q/vy0oKOFVPUg6+0xvhSdD7aXfyfaKJ/ejt6Vu3bRP2XoSifZ8A
	 kl11ME5GHzov5iPv7sgUVrXFuqqS8fUJ07X1yPWQKIUpzFGGj9jRTPchKz8NothAsHGhSGbXGV/4
	 fQ5zIB/T0LIzc3DyZScv+fTMb0MvQLuV6lV9FMgNTH4k2gD9/CcD7onOYPzihs/ZQ8tEpm4Kwt7b
	 r3iIvpeQfr14IOc93HjGshTxz9MEOaURkbTtmoDDUk/vmeG8qIHhgVMdUIX83fPQPC8EDfPwSN0Z
	 eIYcSXrMCEdj8q9zRs8Vl2Tj4wuK7erSs5GjfnXmTpjq/dz4Dhhu2ufYbslRQ3sVPcB6+DZmvz4d
	 FEY2YQR2mC/u4UP5YKHBaU0kzutx1bJXKea1s1K0SN4ZcRBNiiVTCaRrqJFPX/jDXjUG7cr2gQoy
	 W6S/bbRubZQetm/gZ7704DcbFxh/Jzmg5PVJWnp7oniSKXtnH1MIvGtFEX5TvWq3lE5zKngH/fHV
	 V7fxi6imWoOamicW17TTcRRdCYcBdltXf3mZ5NsU3aasR4WwFcMQ==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: heikki.krogerus@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] usb: typec: retimer: Check dev_set_name() return value
Date: Sat, 14 Oct 2023 17:24:53 +0800
X-OQ-MSGID: <20231014092453.2785962-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	HELO_DYNAMIC_IPADDR,RCVD_IN_DNSWL_BLOCKED,RDNS_DYNAMIC,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

It's possible that dev_set_name() returns -ENOMEM.
We fix this by catching the error and handling it.

Fixes: ddaf8d96f93b ("usb: typec: Add support for retimers")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/usb/typec/retimer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/retimer.c b/drivers/usb/typec/retimer.c
index 4a7d1b5c4d86..f163856a78cd 100644
--- a/drivers/usb/typec/retimer.c
+++ b/drivers/usb/typec/retimer.c
@@ -122,8 +122,13 @@ typec_retimer_register(struct device *parent, const struct typec_retimer_desc *d
 	retimer->dev.class = &retimer_class;
 	retimer->dev.type = &typec_retimer_dev_type;
 	retimer->dev.driver_data = desc->drvdata;
-	dev_set_name(&retimer->dev, "%s-retimer",
+	ret = dev_set_name(&retimer->dev, "%s-retimer",
 		     desc->name ? desc->name : dev_name(parent));
+	if (ret) {
+		dev_err(parent, "failed to register retimer (%d)\n", ret);
+		put_device(&retimer->dev);
+		return ERR_PTR(ret);
+	}
 
 	ret = device_add(&retimer->dev);
 	if (ret) {
-- 
2.30.2


