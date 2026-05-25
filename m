Return-Path: <linux-usb+bounces-38046-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMdNKHCwFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38046-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:26:24 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A35CE585
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03F8D3009CFB
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B95395AFD;
	Mon, 25 May 2026 20:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axmROOAl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F60395AFA
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740780; cv=none; b=ZjrwIyWA3RePpAXeAtM+pxXR/RE4ujRkDluTsDt/hODhZpQeUu01wvDYXtTBkZPHroeZJw3O8h6QiJcc9GlS3pziB+/gwJ0ViArkoBKoq1W2FBA3LUbXkF+uLA+v50rH8/koWvnBjoFnEf0l5xGDTdE1AlCchMXYSJR8YK2T2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740780; c=relaxed/simple;
	bh=BDjNlnf6kqOTmpfdKzt077i1YFIj/VXRK26I2fNu3o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHDig3qfbCvkCy52aetTBMp4qvWZy1h20mLjDIHWwzmPE+GzRNmXJ9QG93WfmJjLoQlPj5MmbVi8zfIPsqBklqka9+8jkPESLLW4Y9U/cXxMZCTIpHjsAajTRcG5vBxmL1chVZoZ07VbBNMvXaHSeaYn2xwbnZgqXZ9haLLlHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axmROOAl; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69d78547957so2104874eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740778; x=1780345578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4eLS8y1SewZPIf8sa07E1Jfs/Pz7SGQnlUffTbCSc8=;
        b=axmROOAlOL/DaxOZUC8iK5woqnHP1IWO9HuDE/bWK6lKBPlcZt4WmU8/4DRD2hmOVs
         LhSHovXnafJu2WfSMGFfjmQUVssN838ieby7iBn77Mz0XIR6GTGQsRC4pJqbPW6UC0UD
         uUa/6uTkFQnQQIzmIFy+oZzaCKQ8CWztmOY0Neygf7hU/ARRbmt7e2dKj8xGYUA2hzHT
         Sgvj0nCz8Ur4pLZnKg95IchWfVL6azmVVYaWKZA+nS84QXzAs/cq+jDFi7lgmVexnsfo
         7kBDaxgSPDIzTyH+2BdYvNFDeQK+jD1biHfFcxWaPLNGSloh/2E/J0iVe2J8z45BVngi
         ppxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740778; x=1780345578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4eLS8y1SewZPIf8sa07E1Jfs/Pz7SGQnlUffTbCSc8=;
        b=C4kWD568R3oMEs39mRjMwp74C0265Q8V+swPaK4KesTUBhWaK/3PYINVSxa3ffZBLl
         x2z/sdFGUYqnxDdyyyZnoupdT//HWbgOvhvxfjZLbJnAxS21P/at0U1/bK0lTxZ5/zBT
         2T8tZfblGFs6Sl5yiEg8S4JBJFu5AbtGrue1ZDl3XuBy1VA/nqcew9Yhi3cIP3DsCzi9
         vYh4sXBwnWIQgYb69fE4i7jx91Detg9s83236YoTZB/spy4QVTBbgCTaiV4EkMUzo33d
         lQhSby5UoV1pNsQlpz3IsjWT/QmxVxxR7joGszyugn9EwpR0BomFbtD2e4/VPGFy/tsd
         EPRA==
X-Gm-Message-State: AOJu0Yxf7nZN8quSCSSqW/Pmui+rQjahv1k8Qc6d7Vq2HfbtBZF7aasY
	B79LPi3h/Q2nL0GujkNecV6OLh6jIoEUffjGd/OTTd2BC/3h6pHk/LAyL3NENDN9Dx0=
X-Gm-Gg: Acq92OHgWR6/Sf0/itMBXm2nRu6khyewvxi/GKbqplpsiFXpsUTyRZtf8GJ1lmoG97n
	YYbEI6LIn4kiiw9dq9Ed0iyYoCRSAy9UO9eAQ1A/EpzaII63HEpB18zIWnT+H2Nt4/H4rXemRYI
	/EpfOna7/VIhfm77/QaAFWxkJ/ZFC8SW8mqhcDkhosyr4qotwnluj5Nuh2/T4zTKkcJkwgoouQN
	FEJQc1P1CAzFZjU7dvHsvyNopBpFhhWX4zoMrE3GObAh2ztxBFn8NYUBIql7HmKgSt8bNX6hUvz
	Out2Znr2wr8kDJImCJyyBu4SlEDQbvWbdZg+zd210P1aYhEFoIyrqh5lbucnrqYso8eCQeFjREk
	gJbyjBpfT55unGgpmS+QboEvXBWXSgOyD/sCPdSRgfcfsS5pUrs0fpIwPPnH3SDG0iZbNro1b3S
	lsEi/jfXRc00aCPnjbPbB/2X18bE3aSwg5bC1hCsarqbdWi/r2kH9+voHkkRcbQpVjhaxXdW14I
	n/d9DQzjQhhT5O9CP250zJjSt57pDCXWxWKLQ3CTrclZ3Q=
X-Received: by 2002:a05:6820:290f:b0:69d:9198:227f with SMTP id 006d021491bc7-69d91982730mr5285853eaf.25.1779740778004;
        Mon, 25 May 2026 13:26:18 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43b63512d63sm10898192fac.2.2026.05.25.13.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:26:17 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 4/4] usb: typec: thunderbolt: cancel work before altmode is removed
Date: Mon, 25 May 2026 15:26:12 -0500
Message-ID: <20260525202612.680-4-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525202612.680-1-adriank20047@gmail.com>
References: <2026052517-undergrad-reformat-44bc@gregkh>
 <20260525202612.680-1-adriank20047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38046-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 842A35CE585
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tbt_altmode_remove() frees resources associated with the Thunderbolt
altmode but does not cancel the pending work item before returning.
Since tbt is allocated with devm_kzalloc(), it is freed automatically
when the device is released after remove() returns.

The work item tbt_altmode_work() can be scheduled via schedule_work()
from tbt_altmode_vdm(), tbt_altmode_activate(), and the probe path,
and may still be pending or running when tbt_altmode_remove() returns.
The work function accesses tbt->lock, tbt->state, tbt->alt, and
tbt->plug[] — all of which reside in the freed struct, resulting in
a use-after-free.

Fix by calling cancel_work_sync() in tbt_altmode_remove() before
releasing any resources, ensuring no work item referencing tbt can
run after teardown begins.

Fixes: 100e25738659 ("usb: typec: Add driver for Thunderbolt 3 Alternate Mode")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/typec/altmodes/thunderbolt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 32250b94262a..57c8dff0c51f 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -303,6 +303,8 @@ static void tbt_altmode_remove(struct typec_altmode *alt)
 {
 	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
 
+	cancel_work_sync(&tbt->work);
+
 	for (int i = TYPEC_PLUG_SOP_PP; i >= 0; --i) {
 		if (tbt->plug[i])
 			typec_altmode_put_plug(tbt->plug[i]);
-- 
2.43.0


