Return-Path: <linux-usb+bounces-38026-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iA7lFTZkFGoxNAcAu9opvQ
	(envelope-from <linux-usb+bounces-38026-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 17:01:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E6B5CC05B
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 17:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E55893029E55
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B58134C808;
	Mon, 25 May 2026 14:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3KtyEiz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16E13F20E4
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779721137; cv=none; b=WBKBdFV4gWdVcBrRsuAX1kHlWigdglzj4In/brylMDgosDpQZVvTYh8u0kApAZ2SUz15+wr6/YUtoZL6TIQMRkxR6uH9dLMR2BcPMZxYpC7y7VQt9hPjAZNdVLbexeIW43OlYBtG5ogeVMYE6w1rxGSSAM12K0Q5coqAa+K9F9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779721137; c=relaxed/simple;
	bh=mQzf0udB9WF5zu5/FBlJF1x0afDQDwFSq0CE/SAXcyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jORffF8gCL0k1MK/fXHimnEiSnpS3l5hA7Fiy5Ds+oaGxQ69V28rbfAdYOiNgjziy9c5CCo9UVt7Wj0UQjwOlhC0WQ20Z/tQNsFzMLa/DGvNVQJM5zdwQ2n20dnxQmfOTCv7QWU7EeSlqS9D2ksgirGy4smZ09geDTvwQSC7YF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3KtyEiz; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e634c4b74dso1037683a34.1
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779721134; x=1780325934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3w98fzDAZ74VeWHLLU7AbRT+oeZljBSAiHlsaRVO9E=;
        b=g3KtyEizZ/6jhK9oDFuA6uIqn1NwPBU8z/nOKUt9F5x6P5SdNpILrhgTb3EpVTVyge
         LwSgKmueTlBk+a/HTq6uARVzSq4KY7ZZyDZvMmjU3vZHDkqOH4i6kGnrMTj75P8BMEV7
         YLEwoNW5/VQzkI47bLw8t1WItL/wKoGD1yeRqncLWhbWf1pgH4PIUV3rSgb+5iyrqNP/
         WOkT3XuvbkwnEadFdmkDIxdHNH/eNhKZK2vmpD49PkuMwJjOtSvn0vfPMVbRuMP5A6nN
         F4oIqbESl9wBcak9a4jMa+zFzTVIXTdYNcIpcKY2NONxnHuK2VHjzUireLueXb1ZwteV
         3oEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779721134; x=1780325934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3w98fzDAZ74VeWHLLU7AbRT+oeZljBSAiHlsaRVO9E=;
        b=R9VBBGfLGRcyTS+qrv7J98EUi9ruHh/g06owvhWTj1xy2W93VBQMDb7TqDe2GP8vg0
         ltTwZo5L/MWR7LHmOTBcftCVgMb12MpZCsOctnNWyeX/mFbuejDjfRW/e1Wl0vLGvtRn
         NPmREhKM5RCsnDXr2Dm7JZuStuOiWm88/9EgbgSEuV5bfOf0KM0rP8NFO5RjgHgA19Gj
         1xiQpS66RWE19XBHWkF0o2qIaUz5cAE1URVHENLKAKpahKJYM3mP8w+2vdHbk6uEMb7T
         5UcfLTtQpbtb9RGGWJzBolWpA21a48ev+oR5DskRmF7JmPZCoSPiLYJe7Q921lQ2Vy2M
         DeHg==
X-Gm-Message-State: AOJu0YzRdjrNS27Lp3e5DAqRnEkJTR0AU/OcKrOP/xdkTPsCdfBNB7bM
	lqvM/79KIX7ZbbcBXveY8iLNNS+Egp/EiKBS8irCyfLh+fNj14qwpAnRP5F8Ndylsks=
X-Gm-Gg: Acq92OE76KwllPsNs2mxR5Ocs8c5Tp+FTZU4WW3wR6nzfyOhNRNuVbeY9Tge60KMPQ0
	I8R5HoxUnJCvyevi/GrQb9ZcaMzBnvHXXXJMt3/an463pbmVKGOvNxhml5AIQiCiEz+8YC9qXkH
	BBdgobCPEp1pctjoeKQAYdV75KidGZoWJGSB+WpwaZ5Xg2y6rwp3uVnIdqpu+0O42tBz+SX7g19
	emCW0EkwgaCbAXU45K0v2oGhaOvQKu5arsQIkbVjEyWA415i5l5nOQMN1wqPAegD/g4q+SI+AW2
	Oa/pJSMT6OLvlFEbKlXOCzYUiNxzZvoF5DV1UUf/vguUBAD6ecBHy7cY2KhZIBm9VhGGUSim8lH
	mK6iBu3rW+bXcUW0g6sHRkDNlPSLg3VLUq5kkrdYEEPGSrzo2WrZEHUPbMW+3fLMo6uYGGUdJVY
	mZ7g+pOMrvc6YTYrUejjLzR2Vz09OWASjkfT/BEv0g0WQ3BH0W3MY7pqfOLpPl2ajCVgUiqxN+4
	hBjZRSg5GNGMdJwrjmvU2RZh5nuA777GuqO1fNHbm4t9C0=
X-Received: by 2002:a05:6820:818d:b0:69d:8f9b:f2ef with SMTP id 006d021491bc7-69d8f9bf5d1mr5767643eaf.29.1779721134579;
        Mon, 25 May 2026 07:58:54 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d836c6d9bsm5294101eaf.2.2026.05.25.07.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:58:54 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: johan@kernel.org,
	gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 2/2] USB: serial: io_ti: fix heap overflow in build_i2c_fw_hdr()
Date: Mon, 25 May 2026 09:58:32 -0500
Message-ID: <20260525145832.2941-2-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525145832.2941-1-adriank20047@gmail.com>
References: <2026052525-devotee-reclaim-7673@gregkh>
 <20260525145832.2941-1-adriank20047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-38026-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A7E6B5CC05B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

build_i2c_fw_hdr() allocates a fixed-size buffer of
(16*1024 - 512) + sizeof(struct ti_i2c_firmware_rec) bytes, then
copies le16_to_cpu(img_header->Length) bytes into it without
validating that Length fits within the available space after the
firmware record header.

img_header->Length is a __le16 from the firmware file and can be
up to 65535. check_fw_sanity() validates the total firmware size
but not img_header->Length specifically.

Fix by rejecting images where img_header->Length exceeds the
available destination space.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/serial/io_ti.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
index a35409bd766c..afe29fdf9536 100644
--- a/drivers/usb/serial/io_ti.c
+++ b/drivers/usb/serial/io_ti.c
@@ -844,6 +844,11 @@ static int build_i2c_fw_hdr(u8 *header, const struct firmware *fw)
 	/* Pointer to fw_down memory image */
 	img_header = (struct ti_i2c_image_header *)&fw->data[4];
 
+	if (le16_to_cpu(img_header->Length) >
+			buffer_size - sizeof(struct ti_i2c_firmware_rec)) {
+		kfree(buffer);
+		return -EINVAL;
+	}
 	memcpy(buffer + sizeof(struct ti_i2c_firmware_rec),
 		&fw->data[4 + sizeof(struct ti_i2c_image_header)],
 		le16_to_cpu(img_header->Length));
-- 
2.43.0


