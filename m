Return-Path: <linux-usb+bounces-34586-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEPoNVKIsWmjCwAAu9opvQ
	(envelope-from <linux-usb+bounces-34586-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:20:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 691592665B1
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B3F303A90E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98616248F64;
	Wed, 11 Mar 2026 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="fvxsmHWw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334328000F
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242435; cv=none; b=oaCdnts/6em8mRrNWoBFtK0+4QooE1lkuKt851DokgBO51gXLrT75gii24k7h9wNdw9aM0rKzMPLbZFlhHGrbvUV56vIglLQgK23l1A/YyPboYykBZDl/QHanntYfCcC8Tul5uZVHWmQo/Lh/xzzNiREgMdrqLZtwTDJYviNppI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242435; c=relaxed/simple;
	bh=qIns13uQVIFngxNxMdLQKv/A1SD5iBfuaA1F7jTUhu4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QJd3+9VEoNvbk51THWsmMazXZ2SxXW9JAmAplbu/A9VBlKGML46tFUc54iFCgdVoqV/2KT6OU54D6HrSmCHhTEO0I0YMoWEoJ34CymEsruiQAm8bRV8BdxT2E0JzJo5Yfyl16ZE2BchwCe6G1StlSPOo1quT1d9fJU19xrQU2ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=fvxsmHWw; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so10872342f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773242432; x=1773847232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L35iSGHl3sKnZzkhaQZmLKpUBP1SB2CXAb5fzFNXY4A=;
        b=fvxsmHWwOXg9ZogGYH5m2b9N4yPqAAiVhzdRjbjpaTh1vPj9ei7P+oiZlINe8224HP
         wo7cq7xUpqqRvgqhuhJEp3pHLGD+oc6Q7Yh1HAdFqtWqQOD3pjd0d1Kw4JT9qojf+v5b
         HPW48y+RtaUe+YtZFmb9G2/aGchor9CWF547svbhkNYiS+yK0yCXgowQoWdibpy6Hmx+
         uK6CdEGmKJJ6QLS1WpERbPqX8vYqPn/S05EulqgIrr5YrLugm5/Kxni5RiZB+7y6swwn
         WuJEyNaRtF4563k+nCJZ/fuRlPqNw9/OxE0utf/cTH74ojaqMZRzfSvqqnIlzcXW08a8
         ps2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242432; x=1773847232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L35iSGHl3sKnZzkhaQZmLKpUBP1SB2CXAb5fzFNXY4A=;
        b=R2qozav0USkOhtBT7E79Z0wc9sMRyh7PMPqV08Bv6hioNlsFwn8Luvj6rVnu9v2tsh
         oICy2j18rCtcF75i2DiPqUc1s6KHyY1lAlBC7RRJ3xLA94eKnLzrHFoIgqPnZkbEb1Di
         E7CZNmhhqloUe7F3Va+7Jw1CdWt/TY0rC2CaRpbcNyU5wz+o1TQyX8mS30xk7sttThGd
         7jHSPSgDz0R46sXRi2MUASrZ8G+3i7w8PspCJ4s7WiFL/lrwNlN1bJCmcoOqGYbDDl3n
         r7wbbM8qMVB4Iu2Y00Y17HZInptHeZpS8t16pxFCTxmGZOSJE2uX/M5eGFXrbsVagU16
         LcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCURh0Tnmgouk5casrNUXwAYafVifycJzej5p1NepXGHtoz9vA61xD1oHh6CZN3qtTuadeHcTyWvdYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6rJ8DknF1zwtkqguPuOGpvBPs+CWdW/kSjyRYfq9nhhnQjARS
	xgrGQFuh3uycfUbVqZ4IRi8r+3daMz/qp2PthtzCikv641+bsOFP2S6DZY+li7gkVTQ=
X-Gm-Gg: ATEYQzw2Uzad3W7G/Al6Ne8XyRsOcKvZyrl5bZAl/K5F2sSivbyLiBYEJ2KhWEIo04q
	IWpd83fY14fYiUlZCrvDJdq5rFaobrIGb8zrdXASt2gz1z3GYaHzXFtHDilQjb5sj+mrAMRMEhW
	yYxy9JUtjiB21E5beDUqBRDi4ErZwUJypDNYLX0mmh7An+eScaQfAboqvpKrB/WDEU1UYwA+ZKG
	iD1sFKOBKh3/sbVPm6S+5obQOtkzDZGLZIYs2nr9JcwM11lsXiVeL5lzBvtpVlj73Kmxl+Wq5DZ
	qQPvZFYS9bXdkNTKyz6/pw3mzaeOlj97b6kPiS/o0Xn6aXAWe7K944a9PCOWRdBu/ydYIdO8PXc
	sTU1a+xwWmiHPLT1wPV1N4uhDhZQdCgi9N5tQHtUm+HftJZUKUp+7znXXrN79etXPK6NrKDSTaa
	GnEmV31Q6afvxOrmIbNJ+im/wkZnPzQUaWeiIuuyh0W1MEMdiK/rw1WeYjF7REs0Z+dplWnMH0E
	FxWig==
X-Received: by 2002:a05:600c:1d0e:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-4854b10c86cmr51440335e9.23.1773242432249;
        Wed, 11 Mar 2026 08:20:32 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm435519285e9.2.2026.03.11.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:20:31 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/3] Add binding and driver for Corechips SL6341 USB
 2.0/3.0 Hub Controller
Date: Wed, 11 Mar 2026 19:20:20 +0400
Message-Id: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSIsWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ND3eIcM2MTQ13DVNNkS2PLZGMLkzQloOKCotS0zAqwQdGxtbUAphp
 sSlgAAAA=
X-Change-ID: 20260311-sl6341-1e5c939c384f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qIns13uQVIFngxNxMdLQKv/A1SD5iBfuaA1F7jTUhu4=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRu7LCb0sfYHyceY+5+vYr7jyf/leKzWb/L9VIOfd7nJ
 h5WWvKqYyILgxgXg6WYIsvcb0tspxrxzdrl4fEVZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKmeZ8PIcOfFw+PH3xZkG4hrGux6dvfigTPytyc5ak7faFA4pY1d2JDhn627W52
 t00rluvQu8171OYGL9crXCnHoVykaOS5a4rmQEwA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34586-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: 691592665B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Corechips SL6341 is a USB 2.0/3.0 hub controller with integrated power
management and support for up to 4 downstream ports.

This adds the vendor prefix for Corechips, a binding document for the hub,
as well as requisite entries in the onboard_usb_dev driver to let it
request the supply regulator(s) and the optional reset GPIO.

At least 1v1 supply is required for the device to operate, and external
3v3 may be used depending on the board design.

The reset GPIO may be provided in either the USB 2.0 or in the USB 3.0
node but not both (the chip has only a single physical reset pin).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (3):
      dt-bindings: vendor-prefixes: Add Shenzhen Corechips Microelectronics
      dt-bindings: usb: Add Corechips SL6341 USB2.0/3.0 hub controller
      usb: misc: onboard_usb_dev: Add Corechips SL6341 USB 2.0/3.0 hub

 .../devicetree/bindings/usb/corechips,sl6341.yaml  | 79 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 drivers/usb/misc/onboard_usb_dev.c                 |  3 +
 drivers/usb/misc/onboard_usb_dev.h                 |  9 +++
 4 files changed, 93 insertions(+)
---
base-commit: 7109a2155340cc7b21f27e832ece6df03592f2e8
change-id: 20260311-sl6341-1e5c939c384f

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


