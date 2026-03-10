Return-Path: <linux-usb+bounces-34395-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNuEOFLor2nkdAIAu9opvQ
	(envelope-from <linux-usb+bounces-34395-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 10:45:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77095248C3B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 10:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D57973033D67
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 09:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EE844BC8B;
	Tue, 10 Mar 2026 09:45:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F543E9D2;
	Tue, 10 Mar 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773135905; cv=none; b=Yig3XXnQUw4fzdGLIXJTQ5bhTfKBHvb2zWBzIunL5ef87AP5FkM60yXwHdWnevw7txOjjfRzspbBRCOa+1kfYdnHzSEgp13mgBzFaYtcDZTCSgUr8/8KmN5fRpJZg/OUz5hA6c02c0wtMde3AgParVP66DD1r8AaMkTAZldd36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773135905; c=relaxed/simple;
	bh=xT7R1RkMzy2dbaWuv1p1nR7Ed0dJVasNukQm7PUcsGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIzSgmaS7ZlBSQs8VJ5bVIZryfcF1QUM3iJzETw/NJT6JccCH/YG9bX8ZfeuJLRVHR6drCEOrBCXn+E4QkuisR4qAeoCgN8HBZB/SIs4e2lBVjxMtY82vq57YtlJGKXHQZPyuo26o3sEpCfKb/lGFzftpyrQeNzVnYewkdGo2P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cbd23c241c6511f1a21c59e7364eecb8-20260310
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED
	SN_EXISTED, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, OB_FP
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:445ebae4-8618-450f-848d-5862dfd5e78c,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-20
X-CID-INFO: VERSION:1.3.11,REQID:445ebae4-8618-450f-848d-5862dfd5e78c,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-30,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-20
X-CID-META: VersionHash:89c9d04,CLOUDID:9d63667047db247e25c16c44531266ac,BulkI
	D:2603101744588VWPXA3P,BulkQuantity:0,Recheck:0,SF:10|38|66|78|81|82|102|1
	27|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,
	QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
	,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cbd23c241c6511f1a21c59e7364eecb8-20260310
X-User: aichao@kylinos.cn
Received: from huangwei.. [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 624939554; Tue, 10 Mar 2026 17:44:56 +0800
From: Ai Chao <aichao@kylinos.cn>
To: gregkh@linuxfoundation.org,
	b-liu@ti.com,
	johan@kernel.org,
	badhri@google.com,
	heikki.krogerus@linux.intel.com,
	valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	tiwai@suse.de,
	kees@kernel.org,
	christophe.jaillet@wanadoo.fr,
	prashanth.k@oss.qualcomm.com,
	khtsai@google.com,
	dan.carpenter@linaro.org,
	tglx@kernel.org,
	mingo@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 6/6] usbip: vhci_sysfs: Use safer strscpy() instead of strcpy()
Date: Tue, 10 Mar 2026 17:44:34 +0800
Message-Id: <20260310094434.3639602-7-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310094434.3639602-1-aichao@kylinos.cn>
References: <20260310094434.3639602-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 77095248C3B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-34395-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linuxfoundation.org,ti.com,kernel.org,google.com,linux.intel.com,gmail.com,zenithal.me,suse.de,wanadoo.fr,oss.qualcomm.com,linaro.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aichao@kylinos.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,kylinos.cn:mid,kylinos.cn:email]
X-Rspamd-Action: no action

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/usb/usbip/vhci_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
index bfc10f665e52..5bc8c47788d4 100644
--- a/drivers/usb/usbip/vhci_sysfs.c
+++ b/drivers/usb/usbip/vhci_sysfs.c
@@ -463,7 +463,7 @@ static void set_status_attr(int id)
 
 	status = status_attrs + id;
 	if (id == 0)
-		strcpy(status->name, "status");
+		strscpy(status->name, "status");
 	else
 		snprintf(status->name, MAX_STATUS_NAME+1, "status.%d", id);
 	status->attr.attr.name = status->name;
-- 
2.34.1


