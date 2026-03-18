Return-Path: <linux-usb+bounces-35055-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAmcJVO5umlWawIAu9opvQ
	(envelope-from <linux-usb+bounces-35055-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:40:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 424202BD544
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 15:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03B9030D08C8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 14:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B733DBD7F;
	Wed, 18 Mar 2026 14:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="ODjR7wxq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437683BED20
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844397; cv=none; b=bGnUFpXKDHr7RQlvoIt8McC2/yJLeihVtWcr57gDvywumm/HnmKlsCWrs3WxJmNGlgEzfl4KC+aZkExLnbg6BK/d3Xu4Z+8fM4ZAA1XLRZs32Gnv2bYKj4QI9ff0Ycy9hEc2SpFkcJl5tzqkPJIsIjvjwfzgOSDI4DL7Va2A/Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844397; c=relaxed/simple;
	bh=hPnozSgqnYTOtRcflEokCMCaBCLnXXWPrNJFmfU/cPY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K02WlUfPzTpSMKp2NZVLTxeXm9RXf5xoF/S9HcyG4fZXm+dNAeLunaM2jJAVzAcCng4yhk2/fzJBaI3pHar2SrTUac7WfUwnCFtwVwJLsG+unYhbG83LtrzDgxH1/zx9wZ/+josKI5EnJaYQOIoR220mXsuvYgs1OVORFh2BlAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=ODjR7wxq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439c56e822eso7226704f8f.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773844391; x=1774449191; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kMQM3TQmX/3PoqKaquuCSb30y26xWFnUEXhCi5bjZZs=;
        b=ODjR7wxqioj2e9+lp6UeFCgD/l5mOcT9+uBnEnWHwQX9kVuKNJsoPa+ODRQNs9Ad7R
         5KZgZ7sY1dU3AKmTJCQa5Azb4aCbr//+6P0lpsqyn3agrvcEydSC6qGuobPJqGjcO/Vk
         yioJiJ7nL+oE/kOZEyMqm55zOiZ+7vVFyjC5KLd6HxI7WqaKR1AdYq2VnrtaZCDFtEBg
         TKXbh+4bkcS8XGmkGBzMTkxZGgc43Vf39HznDlejqixyOmLtPJmHq1gPwZPWeCvnz/Yd
         OjX5VpqgHJCxDBaoyMkM960jrZ7TuXMyXL3GbOPmn13TzlqJ7YfH7ZDCavpLxY/lUx3U
         gf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844391; x=1774449191;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMQM3TQmX/3PoqKaquuCSb30y26xWFnUEXhCi5bjZZs=;
        b=CgxD8YzQc5ymqmkWiE20F4wfICsQqSP1yU/7tf/I+dVpPh4nB9SZWn5rur4GXHNdgx
         cCUbu55CAlDARxluxT6oWvWYX7Iei+fvA+b9Q4St5+bhY+xGUcMHjqsDXgneIeI1f11p
         yWr8BA1jJKJ6f8mSYnS+OemZm4R2Osa5vfji8GxNYlOo5r+l8e3aeghOEVbKbv9NtfUA
         KZcxSdb1wLvUgMt9ugd6elQPPFNmqKXeYuiz129uU0JgM4VOlUmA1IBGZbEhPGNY+Vk9
         KzpO7FfnPAbWYAmCHSYQVzYlqi+0w31JVKcK58XFmgu0JebRfwlQ3zu+kR+ehNHO75G+
         Dfpw==
X-Forwarded-Encrypted: i=1; AJvYcCVHSkebQnlKCEfCydjrsHhBpLxrgWFvzimQyzR7xPdH3HQVldgarMaDb4G0RofS4AWmyhf6BOtnZ4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDaL+SKPzeM3o2NHSuk16rEfefSgi0z07hJdFHdXae1RhDeQJm
	zadyoQp/C+CpV1bT4qsZ6KlF/QQIW9/2LYFDY2S/68De73AxdN/9Eoz5EdlW8aYkevE=
X-Gm-Gg: ATEYQzwuNt4av9xZ6qL4wfD+LRutOt+E1O8NrZgFBozAQjUT53O7mzrxKTZLTz3rxhB
	e8UMNz9uqteZ2T4DnO4NrLUr42/tZ+XyvedEHjA84B9tnVwf1+AHK9wHtrLvKyydX/g7lPaeneJ
	6yGBYVwJcTUymxObA6CyhYkSq3G24MalqLmFFgOlHTdevTKPU8t4aqijifNthaaZJ/WKXZDRHyY
	Bok2HFr3sxjax5tDWZSJiCubpbUKixJglm7TgvLOv2wF8PzrApsmkteUIMEA0klcbXKRpe5/oEg
	KUaGkL/ca2HsnCG+/F3aqywhX5SGBHZUeKabqKfmc+DNfI119q07mzhkjCVLzR0c28ipCUNIYd0
	554U8o78zSI8K/m+xldpJh2XD0sNoFLEUk5KdyzX3a7iJsVMscuY1RgDnyx9W4y2hAR/4MWx+qR
	C12Laohr8aMPiVRZAsYo2QeKT8Q1wkmI4RF6nkbe/dyEHkQHKyAVW8BfjOQoHHvtLs2hiM3IG6o
	Fg6RA==
X-Received: by 2002:a05:600c:3e0e:b0:485:4eaf:eb14 with SMTP id 5b1f17b1804b1-486f4475054mr60737565e9.21.1773844391115;
        Wed, 18 Mar 2026 07:33:11 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm270642085e9.3.2026.03.18.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 07:33:10 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v4 0/4] Add HUSB311 Type-C controller
Date: Wed, 18 Mar 2026 18:32:52 +0400
Message-Id: <20260318-husb311-v4-0-69e029255430@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJS3umkC/2XMQQ6CMBCF4auQrq1hpkLBlfcwLpg6lSYGSItEQ
 7i7BWPAuHyT+f5RBPaOgzgmo/A8uODaJo7DLhGmrpobS3eNW2CKeQqQyfoRSAFILIGIoNJa5yJ
 +d56tey6l8yXu2oW+9a8lPMB8/TRm+20MIFNpMSNDWWGs1Sd7d13Hft9wL+bKgFupV4lRpsqAN
 mWRV8T/Um1lsUoVJZJCzqFEKs2vnKbpDZNYZrQUAQAA
X-Change-ID: 20260115-husb311-291bbb1a7776
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3101; i=alchark@flipper.net;
 h=from:subject:message-id; bh=hPnozSgqnYTOtRcflEokCMCaBCLnXXWPrNJFmfU/cPY=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTu2r5k+vf/32MDdRte2UWfEmi1m/76dpBpyiZH44pf1
 +94fZGu65jIwiDGxWAppsgy99sS26lGfLN2eXh8hZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DA11jHWMGLg4BWCqzXUZ/mlXr/DtURS7uiDMrffsP2nvvnUuV2ST32TtF/W/8zyC14WRYVKdsXb
 zjytsyS8XZJ49dVnp52GDWZdq/+m3LFb7o+X9hB8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35055-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: 424202BD544
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

HUSB311 is a drop-in replacement for RT1711H, used in Rockchip RK3576 EVB1
board and some other boards closely following the reference schematic.

The existing RT1711H driver seems to work fine with HUSB311, and publicly
available documentation does not provide enough information for HUSB311 
to identify any meaningful differences, so this series wires up the
existing driver to treat HUSB311 in the same way it treats RT1711H, by the
way of introducing fallback compatibles in the binding and removing
unnecessary VID/PID/DID checks from the driver.

Note that patches 2 and 4 are on top of commits by Yanshen Cao which are
currently in next but not in master. Maybe they can be squashed in full
or in part to reduce churn, if we agree on using fallback compatibles.
From what I can tell, ET7304 can also be used with a fallback compatible
alone and without driver changes once VID/PID/DID checks are removed (I
don't see it used in any DTS in either mainline or next yet, though)

Signed-off-by: Alexey Charkov <alchark@flipper.net>

---
Changes in v4:
- Picked up the review tag from Heikki Krogerus (thanks!)
- Kept the format of "enum" for the single-value compatibles instead of converting
  them to "const" entries directly under "oneOf" (thanks Krzysztof)
- Clarify the commit message stating that ET7304 is identical to RT1715 except for
  its VID value (thanks Krzysztof)
- Adjusted the style of the "Link:" tag with [1] in it (thanks Krzysztof)
- Link to v3: https://lore.kernel.org/r/20260318-husb311-v3-0-2b32e6192b9c@flipper.net

Changes in v3:
- Dropped the DTS change from this USB-centric patch series (thanks Krzysztof)
- Dropped commit references for patches not yet in mainline to avoid confusion, as
  they will change upon merging
- Link to v2: https://lore.kernel.org/r/20260317-husb311-v2-0-03c17c986abe@flipper.net

Changes in v2:
- Changed the binding to use fallback compatibles (thanks Conor for the suggestion)
- Rebased on top of recent next, thus also adjusted the binding for ET7304 to fall
  back to RT1715. There are no in-tree DT users yet
- Removed the VID/PID/DID checks altogether instead of endlessly multiplying the
  list of matches for new clones (thanks Conor for the suggestion)
- Link to v1: https://lore.kernel.org/r/20260311-husb311-v1-0-f25bcb58cff7@flipper.net

---
Alexey Charkov (4):
      dt-bindings: vendor-prefixes: Add Hynetek Semiconductor Co., Ltd.
      dt-bindings: usb: richtek,rt1711h: Switch ETEK ET7304 to use a fallback compatible
      dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
      usb: typec: tcpci_rt1711h: Drop unnecessary VID/PID/DID checks

 .../devicetree/bindings/usb/richtek,rt1711h.yaml   | 17 +++++--
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             | 59 +---------------------
 3 files changed, 17 insertions(+), 61 deletions(-)
---
base-commit: 8e5a478b6d6a5bb0a3d52147862b15e4d826af19
change-id: 20260115-husb311-291bbb1a7776

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


