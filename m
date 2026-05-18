Return-Path: <linux-usb+bounces-37613-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH53KUEiC2omDwUAu9opvQ
	(envelope-from <linux-usb+bounces-37613-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:29:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B9C56EC91
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:29:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C5B43008C24
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 14:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC023EFFA8;
	Mon, 18 May 2026 14:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfHf8Pv3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9158F3FAE0C
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114544; cv=none; b=tWp4b70E5lIwYFDdJQNt7+1B3xWoAV3FL0/kJDxLg2xeeSN+tBr67M3ounzQkZVYwrArKrXEATrl0435fcYZlEtufqbbz5IRFRdT2Qt3c8ZWjT4WlEQhV/9mqTWQNi4qnPctgEQaOFtMLwNQwqjcF8p0GyJ/qtxF2naLAX7sG+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114544; c=relaxed/simple;
	bh=89PtTp+CZywNRq5iByxV+8ZZVcp4aTPf8WIgy+hSvKw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MTqhMcW5yKMfDoVnvtqgCBX0E40If0+hIwKMacH3UzETzTfaExkKTBZlOcKNIIPc2IiwQtl1pY5rc5IOIyIQ5rLOFyCvClPEqAVu7ityPz/Kd7Z4FwM/MmvJCGuQM+JrnOIG6ebgtA9NYPcccboML0BFTpXfimV2KQit3+T0aiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfHf8Pv3; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7c307937816so15927167b3.0
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 07:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779114542; x=1779719342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XcufF3NFTqjHcW83cLrWRQgO+sW13V4Ery+C5imZXPw=;
        b=EfHf8Pv3S7RjLtF2fTlSGgC2pgh5eAkS3Dm3UqdHnpDunpkJu+iJPYeeN2hywR4mU8
         MSLYSqRD4moBut0YfJkmXBujNTimlN2sPBpZFrPmNKhzIgMMAP/Gg+o4pNcz3QdBETaO
         G5sASpHDJa4YXXuoZGiERrMxU4JTtSoNxO5hIpiGW1SX7KPrEVkXd27XMjL6iaciwBbm
         NIg9kPUfYPf785QMOHZ+gcvz3AjGkkprMskthK8spkK4qQbpIeFTZVOxPWGOOQpG5N6O
         pcdk3F9WisunNuYwvRiuOWBf2X59uM38zGyRtz1XFZU2Tnd/HWtfbFfCcQv0SGoo3M1V
         YYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114542; x=1779719342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcufF3NFTqjHcW83cLrWRQgO+sW13V4Ery+C5imZXPw=;
        b=TJtDRXxFxdfSe9DhLT81456d6KUT0ksbwwqG/3PBZGGnufolV5F7XHEDyzWiN+fxwv
         X5wkgU50h8miznx1XSROgvPSoq986RO/w8N+w4actNwm97m2LvZXPg96YjljNmTjzDx9
         WtV9+BPo8W1xjHNnECNY54eiKIOdNxbIJyueHR1SVYJ6xTNDPCtbijo0tXWXdTme9zBX
         4eACCialh/gXZmKxuuEQLHXWyPJXXfWzol15XdzoDFoq7Mj/OFx127RNLXf/HKLpdau9
         ICoAe7k3k8TWiAop9gOVgiECiWO0FYCGfN5m8DpuKywvvF9THxkpisGKUXh31MWhDBzu
         sieA==
X-Forwarded-Encrypted: i=1; AFNElJ9veH+y9aj2RqhIxyfeqJy7mCSKfMiPI3OmmczqwrDOLwSGc+oxGqurCxgHypdkwp979LGoI9J9zKg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt97JeQgdcFFv6AMdK2Q56TiDlWAl/XSEAqEFX1BSE2tDMuk4Z
	L9noo/RvUbPxNAt9UlNns1V/X/CteZnehI5oFSojf5AA8FuOT0J0JLyV
X-Gm-Gg: Acq92OFKIWl7CBc0iOB2ZO+geCfaM07mvklnVHKUjOBdNEHgIC03N+4nxvbOvdvciIb
	3dRhXU1ZK6NdFJ8kRLvEp3Vyjvc1boBqu4joC7zRTct8Aau3a/WyPbxFaC7f9w6F8F98IFlezxK
	1eyeMZMNohV7mbALNAeIREsdpgxMnTgjxOyGpAvVy5h70SFHr+psQyTu8PXgF1tS5/hATgEURq8
	YNNECncTVRZYx10bQ/ZvZo9zFqbjVZyZ9jp/77jUUrAT3zeK5HpHT6jO3pRsnBd9xLd5mfuSCUx
	PqzPp9eIfq8hy53H5E1kd25Pk0zLa1S7OWrwG86VoMe9ZojrHUNfbYlxkygIoPUjCWoQpF2A/hX
	mPHFNKqhH9V83WWLtA2u5JLXineNZ0+krFYdhXMIb0Qfvhkid60Y9jOKKzhkAMNqPdtJXUCZhN0
	nPKsns5oNjRdAuzoy5TfOqV7ukYPIqKxMjcwjaVa1VIA==
X-Received: by 2002:a05:690c:8d0c:b0:7bd:69b8:f2e5 with SMTP id 00721157ae682-7c95a56f98fmr137336677b3.3.1779114542475;
        Mon, 18 May 2026 07:29:02 -0700 (PDT)
Received: from fsh.attlocal.net ([2600:1702:56e9:4b40:ed8c:6b8b:1fa3:d14b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc997cb156sm22094067b3.18.2026.05.18.07.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:29:02 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	gene_chen@richtek.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] dt-bindings: usb: richtek,rt1711h: remove .txt binding and fix schema
Date: Mon, 18 May 2026 09:28:59 -0500
Message-ID: <20260518142901.1747-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37613-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akashsukhavasi@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email]
X-Rspamd-Queue-Id: 56B9C56EC91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The richtek,rt1711h binding has a legacy plain-text file that was
superseded by the YAML schema. Remove it.

The YAML schema also declares 'additionalProperties: false' but
omits the top-level 'port' property used by hi3660-hikey960.dts
to describe the role-switch graph endpoint, causing dtbs_check
to emit:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h): 'port' does
  not match any of the regexes: '^pinctrl-[0-9]+$'

Add the missing property referencing /schemas/graph.yaml.

A separate dtbs_check warning on the same node is out of scope
for this series:

  hi3660-hikey960.dtb: rt1711h@4e (richtek,rt1711h):
  connector:ports: 'port@0' is a required property

That one is in the connector subnode and is governed by
usb-connector.yaml, not this binding.

Akash Sukhavasi (2):
  dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file
  dt-bindings: usb: richtek,rt1711h: add missing 'port' property

 .../bindings/usb/richtek,rt1711h.txt          | 44 -------------------
 .../bindings/usb/richtek,rt1711h.yaml         | 13 ++++++
 2 files changed, 13 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt

-- 
2.54.0


