Return-Path: <linux-usb+bounces-34267-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKkJIGeJrmnKFgIAu9opvQ
	(envelope-from <linux-usb+bounces-34267-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 09:48:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB71235AAE
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 09:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5BA2301980C
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 08:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE7333DEE2;
	Mon,  9 Mar 2026 08:45:45 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A88310636;
	Mon,  9 Mar 2026 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773045945; cv=none; b=Jjt2lgxPLVFgWjLElS45YO4HYiRWTp2sqfijtu2xSJf1tmZ0vVJXQj+FBHwl3VPHTzpuaWnIHibhzNHazMn7AYWX3fGutvRGtv+HMNV4OYWLKvFK/F7uHVwBy5SV+AXubwicZ94LwxA9+AbBowno5i7lqBrTBVZzCOYD9dCgQnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773045945; c=relaxed/simple;
	bh=CZtTpLHyhvrnHzeaIe1WIUoGeBW7ghthVW8GIXGbuwg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q7KnssxVWa7gm3XhC00zkJRk0eQ8o7viMolUbvygogpcCQCxdXjzqsNd07NYhqFAcwv6BJ5GTx0nl+WLqLIOFI8YcZyrJNUsI90SGEySlOCV3E53ESZXS3svDm5PUaVnSK3D3OEjXWym2yoIklml7hf8iba7agmz1VUwJqNbBE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowABn9gmqiK5pUnDxCQ--.43647S2;
	Mon, 09 Mar 2026 16:45:31 +0800 (CST)
From: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	18291782795@163.com,
	Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
Subject: [PATCH] usb: chipidea: scope ci_ulpi_resume() to CONFIG_PM
Date: Mon,  9 Mar 2026 08:45:23 +0000
Message-Id: <20260309084523.718431-1-pengpeng.hou@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABn9gmqiK5pUnDxCQ--.43647S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1UXw4UCryDtry5Ar1fZwb_yoW8GF48pF
	4UAr48CFWkJ3Wagw40y3yrC3W3Jan2yFWxJrWfK398ZFnxGa1UWF1fJ34fJF1DGryjgw13
	tr4fGa4kuF1agFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU1vtCDUUUU
X-CM-SenderInfo: pshqw1hhqjhx1rx6x21ufox2xfdvhtffof0/
X-Rspamd-Queue-Id: CBB71235AAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34267-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,163.com,isrc.iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pengpeng.hou@isrc.iscas.ac.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.684];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,isrc.iscas.ac.cn:mid]
X-Rspamd-Action: no action

In current linux.git (1954c4f01220), ci_ulpi_resume() is defined
and declared unconditionally. However, its only in-tree caller is within
ci_controller_resume() in drivers/usb/chipidea/core.c, which is already
guarded by #ifdef CONFIG_PM.

Match the helper scope to its caller by wrapping the definition in
CONFIG_PM and providing a no-op stub in the header. This fixes the
config-scope mismatch and avoids unnecessary code inclusion when
power management is disabled.

Signed-off-by: Pengpeng Hou <pengpeng.hou@isrc.iscas.ac.cn>
---
diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@
 int ci_ulpi_init(struct ci_hdrc *ci);
 void ci_ulpi_exit(struct ci_hdrc *ci);
+#ifdef CONFIG_PM
 int ci_ulpi_resume(struct ci_hdrc *ci);
+#else
+static inline int ci_ulpi_resume(struct ci_hdrc *ci)
+{
+	return 0;
+}
+#endif
 
 u32 hw_read_intr_enable(struct ci_hdrc *ci);
diff --git a/drivers/usb/chipidea/ulpi.c b/drivers/usb/chipidea/ulpi.c
--- a/drivers/usb/chipidea/ulpi.c
+++ b/drivers/usb/chipidea/ulpi.c
@@
 void ci_ulpi_exit(struct ci_hdrc *ci)
 {
 	if (ci->ulpi) {
 		ulpi_unregister_interface(ci->ulpi);
 		ci->ulpi = NULL;
 	}
 }
 
+#ifdef CONFIG_PM
 int ci_ulpi_resume(struct ci_hdrc *ci)
 {
 	int cnt = 100000;
@@
 
 	return -ETIMEDOUT;
 }
+#endif


