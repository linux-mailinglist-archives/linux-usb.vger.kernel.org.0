Return-Path: <linux-usb+bounces-37810-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCYBEQk8Dmqr9AUAu9opvQ
	(envelope-from <linux-usb+bounces-37810-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:56:09 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9259C69B
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 00:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73F8D3098A7B
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 22:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFECF3A6EFA;
	Wed, 20 May 2026 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bMP+KuVG"
X-Original-To: linux-usb@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47D32B121;
	Wed, 20 May 2026 22:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779316388; cv=none; b=Dat0SlbRzV4caO/bR/8ecwAZhRztN5LaOdQ1ehSpmQApJs3hY3SifASZ1tB+lAkkymiNgDrnzPS+zB8r+j9zDPotY4yRSF4oyuM9pemkqriSL6SzoeeANymecAdWIN5KL/nDUUNl/v2JswMGz8FzL027sx5t0+7+LPUtktkrvQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779316388; c=relaxed/simple;
	bh=RfXaP6M4keIK2c2f+aUEGkwysQSF85AepUYcr3maP38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwDTsL2+X21TQLdaKd5pAvYYR3Rq/4IUiQ/fjefGi3FALN1vXE5pL55LK8fm4FA2CIQmUhiF5ZSl8YzXiz8opthhoiTQFTBcBrncG1hBfknAp5ql4+HBWY1mtEKJcoIiQTh7yiPJBYSvBtBfFiqseNWLPCgAc5gdwzAnF7m17nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bMP+KuVG; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=acQG2Ne0YBrGhFgX5ybV2ljWIOwgSpQAc7km9W2xD08=; b=bMP+KuVGzuIQcS9ojffwWCkO41
	AOY8NFcAOeLBmWNlpL3zX1jJ/n7kxRneYVLjkl3Sfqt95NUe3oso3YDxBsrhZ1JMnEf4wankq/+iF
	HLkL1EtJp/BpGuoS+QW8WsEQd6CgvGKIiA4l8iZzAmJd9qtgLoGKKLN7uBwrdImNi3M4lL64sciUQ
	+zZBD9DluFx03sjuljDCBObtHptG7qAu0Kqu4t1HZ7ehslw8F5dCwFnHA/iwnS65soIyTrxe5rj3D
	UUtYwzV8dr3ZLD52R7RNUK0prlXj+uG7P5Dcb/nLo4X9H/ehWOCinPBpCW89T3VSAduRbWVw5XFs5
	cdmqd6kw==;
Received: from 186-249-145-161.shared.desktop.com.br ([186.249.145.161] helo=[192.168.1.68])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wPpTK-0043AI-7W; Thu, 21 May 2026 00:33:02 +0200
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Wed, 20 May 2026 19:32:50 -0300
Subject: [PATCH 1/2] usb: atm: ueagle-atm: use dev_dbg() for 'device found'
 message
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ueagle-atm-cleanup-v1-1-010c8bc7b214@igalia.com>
References: <20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com>
In-Reply-To: <20260520-ueagle-atm-cleanup-v1-0-010c8bc7b214@igalia.com>
To: Matthieu CASTET <castet.matthieu@free.fr>, 
 Stanislaw Gruszka <stf_xl@wp.pl>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-dev@igalia.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2
X-Spamd-Result: default: False [-0.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37810-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[free.fr,wp.pl,linuxfoundation.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mfo@igalia.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,igalia.com:mid,igalia.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 46B9259C69B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Convert dev_info() to dev_dbg().

Per 'Documentation/process/coding-style.rst':

  13) Printing kernel messages

  ...  When drivers are working properly they are quiet,
  so prefer to use dev_dbg/pr_debug unless something is wrong.

While in there, correct the verb form and add 'with' for clarity.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/all/2026051628-squatter-stature-c0e0@gregkh/
Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
 drivers/usb/atm/ueagle-atm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index f3ae72feb5bfc313ccfa1ab6a9bb40fcd8f5800a..71559a934133a82ddb23d255e0f04d018c13c583 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2590,7 +2590,7 @@ static int uea_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	int ret;
 
 	uea_enters(usb);
-	uea_info(usb, "ADSL device founded vid (%#X) pid (%#X) Rev (%#X): %s\n",
+	uea_dbg(usb, "ADSL device found with vid (%#X) pid (%#X) Rev (%#X): %s\n",
 		le16_to_cpu(usb->descriptor.idVendor),
 		le16_to_cpu(usb->descriptor.idProduct),
 		le16_to_cpu(usb->descriptor.bcdDevice),

-- 
2.51.0


