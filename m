Return-Path: <linux-usb+bounces-35331-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAorFAUxwWm7RQQAu9opvQ
	(envelope-from <linux-usb+bounces-35331-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:24:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B32F1E1B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 13:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AA16305CA10
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 12:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEACE39D6E8;
	Mon, 23 Mar 2026 12:17:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12B03988EB;
	Mon, 23 Mar 2026 12:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774268255; cv=none; b=aw7UaaWlQsqVdxQhRZVP4ln0H+s7MPDL0+J6zuOvFjN+9PmTUkuziZr6PqfislsmjIToiEk4YF0fk28VcVVZGLCrzZb6SVA4LhOnCO3qycW6Mpl7G/4aj3OpMhbDfJlO8TVDluvZuO0v5B2UVe2we2Hr29OXaT5A1bzcMbn69fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774268255; c=relaxed/simple;
	bh=7w9S97cs5Ew9zMwYJIzH7eCfDFY0Pfsymo9FiV4fBes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NrdymNJv/itl6vlz9T4FNzMARMs7kNLAcJ+UeaC4xY/DMcTRQrdIHptzSZzfpgqyAQscmqbYAN9RX0ZaRyKsWfXZ2bN9gNqeEjSHAwVMo9BPp6xuZCz4tAI+o6enciapEkGO5TdAbbDJNTLCZYB65GArh62IrYxYm3XlqxYKaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAD3EtpbL8FpX4uMCw--.14474S2;
	Mon, 23 Mar 2026 20:17:31 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: justin.chen@broadcom.com
Cc: alcooperx@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH] usb: gadget: bdc: validate status-report endpoint indices
Date: Mon, 23 Mar 2026 20:17:30 +0800
Message-ID: <20260323121730.75245-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3EtpbL8FpX4uMCw--.14474S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Wr45tw18WFyUJr45Gw1xZrb_yoW8JrWxpF
	s7trWjyrWDA39rtF12qa1UuFWfKanrGryDXay7Kw1UuF15Xr45Cr4rGa4fWFsxKF97Aw42
	vF4vqw1DJF48CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvXd8UUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linuxfoundation.org,vger.kernel.org,iscas.ac.cn];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-35331-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[pengpeng@iscas.ac.cn,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,iscas.ac.cn:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C88B32F1E1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

bdc_sr_xsf() decodes a 5-bit endpoint number from the hardware status
report and uses it to index bdc->bdc_ep_array[] directly. The array is
only allocated to bdc->num_eps for the current controller instance, so a
status report can carry an endpoint number that still fits the 5-bit
field but does not fit the runtime-sized endpoint table.

Reject status reports whose endpoint number is outside bdc->num_eps
before indexing the endpoint array.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/usb/gadget/udc/bdc/bdc_ep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.c b/drivers/usb/gadget/udc/bdc/bdc_ep.c
index c0ab3347059a..a7a22e5ec47b 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_ep.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_ep.c
@@ -1647,6 +1647,10 @@ void bdc_sr_xsf(struct bdc *bdc, struct bdc_sr *sreport)
 	u8 ep_num;
 
 	ep_num = (le32_to_cpu(sreport->offset[3])>>4) & 0x1f;
+	if (ep_num >= bdc->num_eps) {
+		dev_err(bdc->dev, "xsf for invalid ep %u\n", ep_num);
+		return;
+	}
 	ep = bdc->bdc_ep_array[ep_num];
 	if (!ep || !(ep->flags & BDC_EP_ENABLED)) {
 		dev_err(bdc->dev, "xsf for ep not enabled\n");
-- 
2.50.1 (Apple Git-155)


