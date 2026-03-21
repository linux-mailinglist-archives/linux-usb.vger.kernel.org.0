Return-Path: <linux-usb+bounces-35272-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG7+Gmt6vmnpQgMAu9opvQ
	(envelope-from <linux-usb+bounces-35272-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 12:00:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8FB2E4E24
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 12:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A78613011C9C
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 11:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA333358399;
	Sat, 21 Mar 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b="lZRUQDhc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3F18FDBD;
	Sat, 21 Mar 2026 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774090851; cv=none; b=AHYl1AVMToOWh3+rFQzgX9l/AfxU9RWN/SX1ztdI9/o62dXwXnUaDvY8WgvhCaEKnfHBDsd2JXPsDj7XDdhMWBqKbHp/Aj8lvTSFHB46vy5UvTrUQWzg1pezXY0TTjZkioMJ7mswf94gn4aWsblULr5nTYPN/MnZ0FPDN3XFEcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774090851; c=relaxed/simple;
	bh=TPHIlywY2Ow5X9fsPttUUy6FeNJPJ3Z3r59qTQNMCt4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y8kT7g52MWhb5um3Ny782x6CruxlAIR+ZIp+Vq99wUfOwgGLak2r+QJHfjimIkg+XzDBkRjAA/Pwur52px6E/H2qGiWAvfjjkfwpmXXFJbK0k0X99X6Dn0Nd+/KAU9Pz2nHXIzYL7T7GO4c1IB5nSWuBMGUaYcII7GwTtwmB5cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn; spf=pass smtp.mailfrom=smail.nju.edu.cn; dkim=pass (1024-bit key) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.b=lZRUQDhc; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1774090816;
	bh=cJhKLU8RP0u51byRX8iY3drZRrJzU3Jfe6518Um3d/g=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=lZRUQDhcv+ZiyzIKGNPvNzzxjIUURyvMjnT0eU/VY0EJHRX30GsCNYI51l9DR7+C3
	 VtDQ4Ep1i+PodJlacxLBcrKlc231OPgWXr+DAfiZ7Wi+uCVErpCVD3kAf5Gdz5sHjp
	 pAXXcceAeQsS8/OV8OBMcaPHUfrGAwm8brVvX9wE=
X-QQ-mid: esmtpsz20t1774090809t6b758b0d
X-QQ-Originating-IP: z5F7iMFZ4TbOTYGPKJGKFQZFgDuEF5Oj5wGexrX7CK8=
Received: from localhost.localdomain ( [116.172.93.199])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 21 Mar 2026 19:00:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8142251105176662752
EX-QQ-RecipientCnt: 11
From: Kexin Sun <kexinsun@smail.nju.edu.cn>
To: gregkh@linuxfoundation.org,
	khtsai@google.com,
	hhhuuu@google.com,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: julia.lawall@inria.fr,
	xutong.ma@inria.fr,
	kexinsun@smail.nju.edu.cn,
	yunbolyu@smu.edu.sg,
	ratnadiraw@smu.edu.sg
Subject: [PATCH] usb: gadget: udc: update outdated comment for renamed usb_gadget_udc_start()
Date: Sat, 21 Mar 2026 19:00:06 +0800
Message-Id: <20260321110006.8484-1-kexinsun@smail.nju.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-0
X-QQ-XMAILINFO: NyuCELaSACDhAlffzxnKWSl/f1Nvkgz7FzeuImWdE1JdIze/QLjbqiTj
	yhK+1otJnE/lxNxBGxtNj/YF0zlXL88FGVzR1i2WZ0gUm5gFiYhNvlsOstLS49NIo5RuR/V
	zuA0bxMJ8JqK370dTHMDMtO4/gxNnpbbfmSbaTHgcYknyOPkf5O4nmEc3L/wrLHGZEcipAP
	rTVA6+5JX88wk30fpceuMzwwt6ci/Q6O+K27jANIb4apucO+3zBz/MqBZQc4x9+7gy31qt0
	bTQ5Au22wTnhU41Tc5Hrsl5g6NYaw1Nl3xqmLwlWtSPc/AO46jFOVHhJUZ3IReLYO+Pozua
	56jvu0sfFqm0mg7LtKvz4D3sCHaGOPzaV1tDTETi/xTK+eVKSjk5AOmAbfCntFeJ2/K8dra
	qc77U9XwXwFWG++zPxoPii655jyaj6Yd/8W0nAG1d8dXtcINfewZWvC7A00TfJo5E01+f/H
	gYDB93w1DvjHgPGRvHrA12orpXMP77HxK8I9a3HDQcmMv+UN6tMwoaWs9kvWClDUX7V2O7d
	D8cZAdJjcMukvcqAHRYdnI66mYkVMxH51leR2t1mhY7v91Nxu+27ecPo8RzZm7w/ZAew4gY
	gMoCKMmrCh1es43NnaLdi6Ei5f5OQDfqQymPbNhjGFOKn4nehiXPXKlrkNEqAVp6Zi353z2
	Tvi66A1LXKK+U2nmzpgjVnaZ+i4xQE5HwgzNEsuBJXw8HX00Wdj7QNm+koTNe1tI/H86MIg
	6Kq13VSqXTpaVXXdTpcj449aKE+9wU+UDi2UTv90IKEyRbH+Od9YmR5uEbQfJbnkcuyg46D
	Wf7EOwANCX+UWwxj+0IBg0bxX2OXc7WC3MydtILnNdYyqCV6ZFDup2qsBFh7ZYW6I8xrjlz
	ITGCJxS/RL2JZ+eyaWj+XFsa8jEAMKIxfjbsJcmx37KW2bNF7VfGN3lYqtQDRfpWYw17RQw
	xShDl5hQp2Q5UMT14b2fMkF0gphe18S032+e8s0dqHpRcsB7vD6dLK+/K+xjBc+CJvwy0m6
	ybK2Ldgv+VD6DOGAIxYujTIL7Kv2vGEbdbLZSuexITWK8qUkc/Kr0q9w1CTnRKnzSZZb4kL
	wBQbBnQp7RO0hCSp2k7NXE=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[smail.nju.edu.cn,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[smail.nju.edu.cn:s=iohv2404];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35272-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kexinsun@smail.nju.edu.cn,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[smail.nju.edu.cn:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nju.edu.cn:email,smail.nju.edu.cn:dkim,smail.nju.edu.cn:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0E8FB2E4E24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function usb_gadget_udc_start() was renamed to
usb_gadget_udc_start_locked() by commit 286d9975a838 ("usb: gadget:
udc: core: Prevent soft_connect_store() race").  Update the comment
in usb_gadget_udc_set_speed() accordingly.

Assisted-by: unnamed:deepseek-v3.2 coccinelle
Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
---
 drivers/usb/gadget/udc/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index 08d2a93b3bba..e8861eaad907 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1266,8 +1266,9 @@ static inline void usb_gadget_udc_stop_locked(struct usb_udc *udc)
  * @speed: The maximum speed to allowed to run
  *
  * This call is issued by the UDC Class driver before calling
- * usb_gadget_udc_start() in order to make sure that we don't try to
- * connect on speeds the gadget driver doesn't support.
+ * usb_gadget_udc_start_locked() in order to make sure that
+ * we don't try to connect on speeds the gadget driver
+ * doesn't support.
  */
 static inline void usb_gadget_udc_set_speed(struct usb_udc *udc,
 					    enum usb_device_speed speed)
-- 
2.25.1


