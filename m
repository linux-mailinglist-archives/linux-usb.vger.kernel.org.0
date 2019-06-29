Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECA15A9B7
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 10:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfF2IzV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Jun 2019 04:55:21 -0400
Received: from mail-m974.mail.163.com ([123.126.97.4]:35684 "EHLO
        mail-m974.mail.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbfF2IzV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Jun 2019 04:55:21 -0400
X-Greylist: delayed 901 seconds by postgrey-1.27 at vger.kernel.org; Sat, 29 Jun 2019 04:55:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Wo892
        MP6Fw3mZgqiRNYn/8T56AWJO8/+HS75b1PMiJY=; b=p79M0qShRXsF3Pu1XziJh
        NH3vRT2YoYEIYGW/otkTkZ/jw//kCdZMpqROlsbV1y4ryfFFJZNBfH/1us65NFU8
        y2iVkJllAkD1Mgm7H7sfTkMiWPbjNUMXpcYT1JG8cZUxZbb+6AUKtchJZt4zncKB
        IEVTuVXdOVscSyPUKAEfD0=
Received: from localhost.localdomain (unknown [222.65.47.109])
        by smtp4 (Coremail) with SMTP id HNxpCgB3fsbxIxddMKOjAA--.96S2;
        Sat, 29 Jun 2019 16:40:17 +0800 (CST)
From:   yuan linyu <cugyly@163.com>
To:     linux-usb@vger.kernel.org
Cc:     yuan linyu <cugyly@163.com>
Subject: [PATCH v2] usb: core: message: remove memset in usb_get_descriptor()
Date:   Sat, 29 Jun 2019 16:40:11 +0800
Message-Id: <20190629084011.8101-1-cugyly@163.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: HNxpCgB3fsbxIxddMKOjAA--.96S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1kGr4Duw4fXr1DuF4UJwb_yoWfJrb_Cr
        18ZwnrCF109a47GF92kwsxArWFv3WSvrykWa9avr93AFn09a45ZryIvrZ3Cr15G3WYyF9r
        G3W8Jr18uFs5WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeZ0ePUUUUU==
X-Originating-IP: [222.65.47.109]
X-CM-SenderInfo: pfxj5zr16rljoofrz/1tbiShLi41PAGEsC2AAAsD
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

when below condition occur, the buf will be dirty again.
if (result > 1 && ((u8 *)buf)[1] != type) {
	result = -ENODATA;
	continue;
}
so caller should check return length which indicate buffer valid or not.

Signed-off-by: yuan linyu <cugyly@163.com>
---
 drivers/usb/core/message.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index e844bb7b5676..03425e6b3da9 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -640,8 +640,6 @@ int usb_get_descriptor(struct usb_device *dev, unsigned char type,
 	int i;
 	int result;
 
-	memset(buf, 0, size);	/* Make sure we parse really received data */
-
 	for (i = 0; i < 3; ++i) {
 		/* retry on length 0 or error; some devices are flakey */
 		result = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0),
-- 
2.17.1

