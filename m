Return-Path: <linux-usb+bounces-36055-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOHfEfNa1Wmu4wcAu9opvQ
	(envelope-from <linux-usb+bounces-36055-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:28:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A43B3945
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 21:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 876BB3098296
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 19:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD83332ED0;
	Tue,  7 Apr 2026 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QTF3D0AD"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC74313E30
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775589851; cv=none; b=XCcucaf+bikSyVxYqbg1aJkZnerpsTe+3YWHiuoELKY84IU0fEXGcwFdGAVKMDo0CrVowFhsqpBNhxz+Vmpi1nFwrcmur7ICQwLskz8ELnSIq+S3WxREgJ4DHIDqvmuUZ3BtGugEJrW2xPQW9o29mauBN1zaRjD77MTzV81TFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775589851; c=relaxed/simple;
	bh=tnQf46nDl6xs4sNGkiFqZJOaEZpZC075bvtBMYtjiL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WSB4NGe2q1pi1TtxDfjQOzof/5sRw2MIsnvWhxKJGMkaon7IRX6bPtTBy5gDXbgCexGFjSxJtDKFWYxwCpGAdIVaynFMw9YgOnnL3G2JoSSsiScqm/qcPAtmn5LAYThhM7Tgfg6iMpGA1UB+JIeQCh/ftGbczT/NOqfHGbx+wVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QTF3D0AD; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775589847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FPWEtCkcRgtmY/6CYYtjq17vA4iIM0Zadq4A48aQ/zU=;
	b=QTF3D0ADym1ba6kpURzbdFPaAqI41DIzsTbTkLErMjTEnUUMptIIH7GkuT4tlM/ueqvX+A
	9UBE89XhydFsMWtz0JrKtPfbcVJav1lhJ8iyl1iaFzRhwj8vg0o3mFE9ZuLkdTzRW5lj8R
	3Sm8WoZcSCKDwL0fwFEnhvEPtMesEsU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] USB: serial: iuu_phoenix: fix iuutool author name
Date: Tue,  7 Apr 2026 21:23:43 +0200
Message-ID: <20260407192342.1054359-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=790; i=thorsten.blum@linux.dev; h=from:subject; bh=tnQf46nDl6xs4sNGkiFqZJOaEZpZC075bvtBMYtjiL0=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJlXI/fF/HOJ+KWw5PK5ew4MuYuLFln63eCIWSjG2yR36 9DP3voLHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRihCG3yxpyZ9ljd9NCXqU nP6o72lgwpHw3W7a/N/Y1RwY0ufIL2RkuCHHXxb9SvLeoV1Pd/Nr5JmFlM/7+i3MclfKpLd3xfv OsgIA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36055-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ecze.com:email,linux.dev:dkim,linux.dev:email,linux.dev:mid]
X-Rspamd-Queue-Id: 926A43B3945
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The original iuutool author is Juan Carlos Borrás - fix the spelling.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
https://github.com/jcborras/iuutool/blob/master/AUTHORS
---
 drivers/usb/serial/iuu_phoenix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
index 1b2418dc7a77..e9c712df755f 100644
--- a/drivers/usb/serial/iuu_phoenix.c
+++ b/drivers/usb/serial/iuu_phoenix.c
@@ -6,7 +6,7 @@
 
  * Copyright (C) 2007 Alain Degreffe (eczema@ecze.com)
  *
- * Original code taken from iuutool (Copyright (C) 2006 Juan Carlos BorrÃ¡s)
+ * Original code taken from iuutool (Copyright (C) 2006 Juan Carlos Borrás)
  *
  *  And tested with help of WB Electronics
  */

