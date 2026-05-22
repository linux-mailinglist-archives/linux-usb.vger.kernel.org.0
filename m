Return-Path: <linux-usb+bounces-37910-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KACLQPxD2o2RwYAu9opvQ
	(envelope-from <linux-usb+bounces-37910-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 08:00:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 315745AF528
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 08:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D1C03011752
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 05:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5315D3A48F0;
	Fri, 22 May 2026 05:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nkkx2aYf"
X-Original-To: linux-usb@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99C25A359
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 05:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779429556; cv=none; b=TilZsUqA0Z0QH6bGRfS3Z8VtEZi6/pHrzhmkDv23z3Nz5GsprcWOwGCjKfjkFYvwJrqhdMczcChyx1/jQGNGfGF23F6S902bGFmjJ24TY0oibhQ/XalqTijojt30u6VGS5Apbo+4palZt/cGvswxzco7hXVOU3vx3xwDTAbkvZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779429556; c=relaxed/simple;
	bh=zIU3fqcQ3tAzkfYHNjll/5BpqUIHAMtWeYtyCR/qk8M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RC7egu1DF+WU6/Euv26MBomXB+FuiIgXPyp+anqf3w2F6Ps4L/jozuGryX4lteONJLV8OP+cIcAOgCF7jh+FJFDIPu5YFHMhghOh8hl0tLK+ZYgy89rHc3AxgtSldCuGjKxFkmXfKohRxo8JqkR8qsVgg6G2m9suIcHGjequZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nkkx2aYf; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Nu
	ihSMv494Wcxb3COG3mOsUQWf/7cJTwThS8/JzE/Ts=; b=nkkx2aYfVJ0n3Q+lqW
	OVaXTM86U94HM/Y3gvRvywHlKu5iAs5M0xC/ffuKsL10e1xeg8cVCLXXyzcEtZ6G
	Uw35S0flZ7zmWADd4QBD0mxloWs6m7/y+ZQAX8YZbE3Vd4AxihNioXVYOf/EJ936
	aDFFhERbT8Ilkk1bsV63H9vTg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wA3EtSZ8A9qBC_dCg--.55372S2;
	Fri, 22 May 2026 13:58:49 +0800 (CST)
From: Shuping Bu <bushuping007@163.com>
To: Thinh.Nguyen@synopsys.com
Cc: GregKH@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	bushuping007@163.com
Subject: [PATCH v2] usb: dwc3: core: Fix incorrect kernel-doc comment for dwc3_alloc_event_buffers
Date: Fri, 22 May 2026 13:58:46 +0800
Message-Id: <20260522055846.1514488-1-bushuping007@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wA3EtSZ8A9qBC_dCg--.55372S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4DJF1Dtr1kCw1kWr45Jrb_yoWkXFXEk3
	4vgrZ7u398JrW3tryjyayaqry29w4rZw10gF1qqrW5Gayayw4Fv3s2grW8K3yxAFZrJr1q
	vr97Xa109w42gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_a0P3UUUUU==
X-CM-SenderInfo: xexvx3pslqwiiqx6il2tof0z/xtbC9BnAdWoP8JmrhQAA36
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,163.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37910-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[163.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bushuping007@163.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,synopsys.com:email]
X-Rspamd-Queue-Id: 315745AF528
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel-doc comment for dwc3_alloc_event_buffers states that the
function "Allocates @num event buffers", but the function does not have
a @num parameter and only allocates a single event buffer.

Remove the misleading "@num" reference from the brief description to
accurately reflect the function's behavior.

Fixes: 9f622b2a407d ("usb: dwc3: calculate number of event buffers dynamically")
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Signed-off-by: Shuping Bu <bushuping007@163.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 65213896de99..a2587f9f0bb8 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -525,7 +525,7 @@ static void dwc3_free_event_buffers(struct dwc3 *dwc)
 }
 
 /**
- * dwc3_alloc_event_buffers - Allocates @num event buffers of size @length
+ * dwc3_alloc_event_buffers - Allocate one event buffer of size @length
  * @dwc: pointer to our controller context structure
  * @length: size of event buffer
  *
-- 
2.25.1


