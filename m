Return-Path: <linux-usb+bounces-37527-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oM2SE1ayB2pBCgMAu9opvQ
	(envelope-from <linux-usb+bounces-37527-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 01:55:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D055975C
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2026 01:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50A7A3023E35
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 23:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590583FDC19;
	Fri, 15 May 2026 23:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="e4LQhlax"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE643FADE4;
	Fri, 15 May 2026 23:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778889265; cv=none; b=N4hv3V472oWyAZVTbXSo6L5bfoM3FK41Y3HjD5bcwbz0CtPucBcdontgHnsOabt365YOFx6j4O8Y9zqLK6ldhkchteJCllPnUucePWmSMxDTq2TNm/sr3JIyWIYvktJ90a1lQazhaatoy4C+0MBIF/rmph1cvZG8kdUsS+qPg4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778889265; c=relaxed/simple;
	bh=8HpdAnsXIN35hIzRU5qjx5bzWsqCznLIFxP3Zm+d/aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIOdaL1bo1Gg85H3/uMNWd+i/R6I+jn9b6w7djnNKSHwkCAW5G+NbWEvrAKBj56atP90VkALWW16ykJ1X1e/cRqINj9sZIK92mdajdzaq+QnUu70vI/KGOIbXM2G7cROx4uxyDZFfJW8IGECaBLYs67Ie3+3HiApaBlkFYQ28xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=e4LQhlax; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N5f3lj6C5HIDH3Fzp/GhTglSGpFIUUcwSyDOCWfejiY=; b=e4LQhlaxTDcnibipaOqc8DzCv3
	CWpNoT2EQQBQe3VkkYnpyDjmG77Rop1e1DSidvihYvF0vj6L2eNlLn6y4oNYPgkJFOgmwt4rfdVGs
	NTXN3D4jHZePKgp5bK84U/9aZAnyu5KEL2Q0iJenbUXl0HMjMy/a6fGiKjyLvPc+gTKVqIeN2rmCc
	O+0Bct+0alm/HrRn5WXCt8F+BZGKw8/YjNvzuUEC7gSwYH+YXka6u8QZfKE2/OeVCuqbd83JB8xUX
	8OvIWDxc9PWc46WQsrOsgnC333KojqINDLDCNDMQCkykyi2s4WLl0qIr9LfduJ1u10ARvpvTQoAzV
	f+OQ5xBQ==;
Received: from 186-249-149-153.shared.desktop.com.br ([186.249.149.153] helo=[192.168.1.68])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wO2MI-000keM-7t; Sat, 16 May 2026 01:54:22 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Fri, 15 May 2026 20:54:12 -0300
Subject: [PATCH 1/2] usb: atm: ueagle-atm: adjust 'device found' message
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-ueagle-atm_cosmetic-v1-1-9a15e5e45bd7@igalia.com>
References: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
In-Reply-To: <20260515-ueagle-atm_cosmetic-v1-0-9a15e5e45bd7@igalia.com>
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-atm-general@lists.sourceforge.net, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Rspamd-Queue-Id: BD8D055975C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37527-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.818];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,igalia.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Correct the verb form and add 'with' for clarity.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/usb/atm/ueagle-atm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index f3ae72feb5bfc313ccfa1ab6a9bb40fcd8f5800a..2730e7d41c89a354e115e38d97e314f888c62137 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2590,7 +2590,7 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	int ret;
 
 	uea_enters(usb);
-	uea_info(usb, "ADSL device founded vid (%#X) pid (%#X) Rev (%#X): %s\n",
+	uea_info(usb, "ADSL device found with vid (%#X) pid (%#X) Rev (%#X): %s\n",
 		le16_to_cpu(usb->descriptor.idVendor),
 		le16_to_cpu(usb->descriptor.idProduct),
 		le16_to_cpu(usb->descriptor.bcdDevice),

-- 
2.51.0


