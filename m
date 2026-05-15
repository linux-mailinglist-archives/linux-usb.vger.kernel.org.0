Return-Path: <linux-usb+bounces-37483-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHKVBAvmBmoHowIAu9opvQ
	(envelope-from <linux-usb+bounces-37483-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:23:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF0654C578
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:23:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C62473051D08
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 09:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A09A42B72A;
	Fri, 15 May 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCj3R3Wf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368CF42EECB
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 09:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835743; cv=none; b=YQLnE03MRxWjlFNclLJqa8lswO20nk8ZARiic0AqEEoI/GXWS+bVbXrn+ppwWTekonYYP4HVkDOLT3YXJPpEyOeoOiENuNFcG8VDGCNBcpftmQ+MxjJ9QHMyrepuCyxUSpVkREyQpFQp60sCFRF+FG1dmMLfVP4SzEZT1yFvS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835743; c=relaxed/simple;
	bh=bOSDifb0+bqORKH2w/7EPITVe40diI8h5lS71n8Mt58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8gVUPvY8+YxBitN5ePYbzPuu59Ma4gbQSwXVEDCd04cmlV/mLpY5weJ34v/ls8RpEq2+Zxlcw9Up9O2P72PRbhs6fKoJagmDQw2HaMz8+EWWM2VR+RL0U9C6GfSgpxsTDF03vXREln/u273iSlNkIWaWBRsh0ZX8oXH38b33uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCj3R3Wf; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so3859551a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 02:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835741; x=1779440541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=JCj3R3WftoStic+DwMeCi+7mnyb0HhFcBZBXMAAfPT8pcXH2l8L+N8MkzUL3dAtdOD
         dxnkd8kwHxLw5PJkQjPiN34ytGyYS5XK8H08Y+ZZMPJadfGPi/d6HgCu6y1pTgWFcJR3
         jaNMIkNq26XYAcikYNj0CqhML+KgXMF6VweKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835741; x=1779440541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWN7gkxjFiGZ3cV0OWHAWJ+8N9Pyp+YRIV9vOKGoCOQ=;
        b=L7TslTb9LeQsvwVs+yXkZSlI2vV7JwSELhJkgg1hMcWt+uZnOcu+8/UCsSNPTZjW8g
         7BUMJHsm2d5ZkooZdd1clZEO0vUVj5QG+UjenMCY5zQz/oPqB3K2LknwsXfqU8JJRsCw
         ekXU/S+k27olIXW3AbYlD/Cy8UeL9WRHrRBUS3VASmZiUl8dm3i2Kt+VDPTMBWs/Vcit
         8y2Gju7dVRsui0asqydYn1VICql0IJoXTzS+IpDyI2IcsLYh72cfDWO9x6sJFL0O40Yd
         85zs75bbIbSURs5/kmjPBdJh5CvhPrpqMe4zG0L4qNOQ2KLwszhfgVXTL7PSMudfF9Ft
         57Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/gVMdKdCzWu/6n2/YtmAyjXoBdDK2NewAUv5vqlhltmjdwvn4/Bop0QopsUJ98GWXfZOnIam6GzmA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2F2R3Nm3vS8tzUonZe2um9si90leUTtWfZ6SgBkEtJyG+AMX9
	BIfLIWpDMrXM8W52fGgUztZRquRqNZxnwaNcfB83stQfRnazQ4o5Jpc9MeJp28RmMw==
X-Gm-Gg: Acq92OGUhsxIe2F8UHkthUlWf0txBM50uJ2ZfzdDJTHLd3OoS7ULNHEVDM4VG/sycB5
	Dmx3QH4C99gZnHvuZbKjn4sBC4Nd9evwnfl7Vr77clC49ucqqYEHZRb0cFqD+CKl0WF8u6jSNuQ
	92HuCMrYSrNJtxAwg//wGhmYDGrE5/E8nVNpteAE212SoJmpDpmkyLLoYN58CQc5QKYomBbzx4S
	/SM1007Ti7NL1rnNxDlhignNvIjcxho4vrf/HcCBTyjuKJSGH0KMAS2QGUv+RFF0E1OqH2NWXyu
	1MKIKeex2ej+a72r9sZX7C/uqIC9ybAN0pqcb/DwwY1ZpO8mw7QA2xtrl5Jol0LMcZUddZdxhyN
	E1MEX7LTPubeElWO31tibDTnZomb+kmjQ8AOrUN8MusehecdDVhJ+1gLftfJmwF2B2xq7EFJvBh
	4iRlHDIcXnR45dVY6kvJvE1NYrXEluLAeX6o914oc3CHcUQpSdM4569vPz6UYMJzA4abSh+X394
	/7ZGL96ENR8IBHgoB0=
X-Received: by 2002:a17:90b:5203:b0:35f:b288:8e4c with SMTP id 98e67ed59e1d1-36951a6722fmr2708708a91.15.1778835741437;
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:21 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 04/12] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 15 May 2026 17:01:40 +0800
Message-ID: <20260515090149.3169406-5-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5EF0654C578
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-37483-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com,collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 24960ba9caa9..90ea597d42ae 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1998,14 +1998,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.563.g4f69b47b94-goog


