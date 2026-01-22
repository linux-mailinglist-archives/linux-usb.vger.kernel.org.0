Return-Path: <linux-usb+bounces-32632-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Cw8IktCcmnpfAAAu9opvQ
	(envelope-from <linux-usb+bounces-32632-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:29:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0679068D10
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 16:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 056923009F70
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jan 2026 15:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFC93A9DAC;
	Thu, 22 Jan 2026 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1OadXaC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFBF396B6F
	for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095079; cv=none; b=uhqgH5LvXXXROTgPmiWcVBtf0Ajus2CTUh+QpfLPbEeKUx5mLw/yljdFnbJQnIpCyh+5D6zVuIJvxSEjYx6W4888XiS+3CZ+7ZZXY1P7RFWGzILxaikU8VQQLEoA0BA+b0z0uoY+HpzZx65hrLooT8tuF1cAPdS3eaAzsXjTPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095079; c=relaxed/simple;
	bh=GJQj2NQZqtRRiQmyVoQ/btU+KatJQHKLFP1Jphjr50c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PosCwrBrgZpMQGTWV2MldfBqM0e5371sEEMJjBgdYCRDSdkNmcRNtatcRXHSMQYkzfm0AN1khsyl05PXW0PwZ7Y60H63M7/ZpdGbk1eJOYDqYFv8ZB8Zj1OmTXPutpnwyvkmIGyJoemtxZfaFq59QKuqvr3/W+8gIRZaFJhWaGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1OadXaC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so9248905e9.1
        for <linux-usb@vger.kernel.org>; Thu, 22 Jan 2026 07:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095076; x=1769699876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1sAXix2/YGIhKcH12LM+KTzHJNEk/POeFR+YuSnMWo=;
        b=T1OadXaCKnZ0+eTeXT8u7cWZ6awQIVLflxqLJAvQAIiWzLAjpcsxssAnH3yZUUE8Gm
         ZjiKgPwM/1M//I34Vgdj1s5IaXbhPxTUc6W3nZvveQ3wTdKMUFx0kZPSFFJZ2bmAALPN
         oIiJ4edK4yxVpZbJUIkvxJB6G9aX/XT+/0YlpXrSeGK5IYuhikirrq0gxHLQ5BZFXerb
         aOiWb38z7VETMiHh9C7nSWpu4q9ad6sKFCaIv9JNrUfAl5Sep7AoNDIWfpoBc0/FOJxS
         IhLgfDmKX77sDGR8G1tr+lPois5WmEPsb3/VjmbVjRFWsYQyOXO5FjYjuHUyoE+8wRsQ
         /gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095076; x=1769699876;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1sAXix2/YGIhKcH12LM+KTzHJNEk/POeFR+YuSnMWo=;
        b=kvQgY1BHccJNGD8LMnBC/5ACGu3dw3NVO2tPsv2qgM0xt59+D7yl2sDvQHv5vkxrZB
         GXXWlNXWH/rDh1HUPbQHi9DVJCa5sr0BOW5RrGKZU728g2INqe6GHYSJfyods2z/wCDi
         I9k4k48Q7LJwcVqOweeQqWrcPcLhLG3Wlbq0VRFq+orw7BUrNmgIhGH4aaa1k7dIqEdW
         oMfmgN9lBxUqVBh5Ir+bxErXQZOGKE51vg9I7sTGavXsG1O50MzDJ2196rlM0mCjnkmr
         g7msH4G5BBRDAax/wyBRkZ+pjekEeUt2/GFDB3B3PuL1ionAnz4TWPu+HGqb+Bcpa71L
         /HYA==
X-Gm-Message-State: AOJu0YwuskBls2hzb/aGe/QOe37sF/99i0FQbrqbv1dhpVcVNS3mPsPP
	sdxzmH8N9BoV91hEH9300c6PsRrCwWF8Vqwsijp46F9BnYDIxfZRKZc3
X-Gm-Gg: AZuq6aJTqj9xzl8GRAy8Tx1kAHOUmBHHJzZLMKCFuG7Y+yfb5ub6mNrawHPF6YdUh9c
	d4idrsTUW12F1zrhmaTK5DlsJrRLsANQG9i2LJB77T5Xdk4hQVmb2iRQtK5pyYpsmdpuXLGrD0H
	CMRI3C78Xh9bx5F6aJZHJAADHKHH/J83VR5kl0xLMRbEG/E4RunypaJ91cytmy2ocCd/4clrHe+
	kJBNB2CZeyE1EgASR+4DjFOrbIuBd1p0G1B4y1Euz2foAnVBWh7Mb4fLh51SDTYK/Cq3nJtUTZ4
	M7fGG3vGm1xTUeyGzJPaiWH5GwGQ0XKQDk8zty/T/tpkqZgxMPCJvdYgCrvAkRGZX5izFGbyTkW
	+306o/XFFu7v62po2gYIeuT14FrsJzBIVgbCEf4C1rZjPmNEeLVlMM0QemUgYvDuqbMySHIS/2J
	Io
X-Received: by 2002:a05:600c:8b02:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-4804c8e758dmr339845e9.0.1769095076053;
        Thu, 22 Jan 2026 07:17:56 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804702fadcsm80395865e9.2.2026.01.22.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:17:55 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] usb: csc-acm: add Infineon/Comneon modem support
Date: Thu, 22 Jan 2026 17:17:45 +0200
Message-ID: <20260122151746.7745-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32632-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[suse.com,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0679068D10
X-Rspamd-Action: no action

Add support for Infineon/Comneon XMM626X modem that used in many Tegra30
devices with GSM capablities like LG Optimus 4X (P880) and Vu (P895).

The Vendor Id is 0x1519
The Product ID is 0x0020

Output of lsusb:
Bus 001 Device 002: ID 1519:0020 Comneon HSIC Device

Svyatoslav Ryhel (1):
  usb: csc-acm: add Infineon/Comneon modem support (1519:0020)

 drivers/usb/class/cdc-acm.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.51.0


