Return-Path: <linux-usb+bounces-2449-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D777DEDC2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 08:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8683EB211A6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 07:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196756FA5;
	Thu,  2 Nov 2023 07:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAB16ABD
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 07:59:35 +0000 (UTC)
X-Greylist: delayed 396 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 02 Nov 2023 00:59:32 PDT
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D366116;
	Thu,  2 Nov 2023 00:59:31 -0700 (PDT)
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAnR6hFVUNlvixZAA--.19531S2;
	Thu, 02 Nov 2023 15:52:37 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	quic_schowdhu@quicinc.com,
	gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: misc: eud: Add IRQ check for platform_get_irq()
Date: Thu,  2 Nov 2023 07:51:13 +0000
Message-Id: <20231102075113.1043358-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAnR6hFVUNlvixZAA--.19531S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1rJr1fCFW5CFWUWrWktFb_yoW3KFb_Kr
	yDuFs7GrWF9rWYyr1agay3ZrW2kF1DWr18ZFnFqa43tFyDC34vqrWavF95AFW7urZ8GFyD
	W3s8WrW29FsavjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2AFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUT6wZUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The function eud_probe() should check the return value of
platform_get_irq() for errors so as to not pass a negative value to
the devm_request_threaded_irq().

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/misc/qcom_eud.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 7f371ea1248c..26e9b8749d8a 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -205,6 +205,9 @@ static int eud_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->mode_mgr);
 
 	chip->irq = platform_get_irq(pdev, 0);
+	if (chip->irq < 0)
+		return chip->irq;
+
 	ret = devm_request_threaded_irq(&pdev->dev, chip->irq, handle_eud_irq,
 			handle_eud_irq_thread, IRQF_ONESHOT, NULL, chip);
 	if (ret)
-- 
2.25.1


