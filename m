Return-Path: <linux-usb+bounces-34967-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDArFaiYuWn5KwIAu9opvQ
	(envelope-from <linux-usb+bounces-34967-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:08:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CC2B0A48
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 19:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71A06304CA6A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7060337E2F6;
	Tue, 17 Mar 2026 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="nFr/9wnB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9686D34889A
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 18:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773770892; cv=none; b=q8pQZzcgZTB3t9TtJxaT8yrd3afLgN+sAwzK3HemgpOlV5gp/Ul9LiBPo6l7aaYLrKIJbsxAP/S4qa6zguFScoKFBvIot982Ad31TrM0GbMFpQAyKK03H/XaKtV9ahbILE23D4gEAb83cNuwWmYG/mts+iJUmryA4e2JQBT1VgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773770892; c=relaxed/simple;
	bh=akAl2/DG0rdw7GlbNngJ+xuwwxnaipw/AQYp8maIV00=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mjJ6kp8yl/UhYDUtfpzCaTFCOcrNYvS8ZXE8li/5hQqnhiNwNOj+DtJXOTcflT+wmXoVTgMVClle/EPcHCeGtVQkMbZsPioeC5HpVWEfJQ5dJrQ+SkwjTDJxeSWoIBepPMH339vGDRwfsMTVTRvGpd72fqA7J0TRMHFLxiWGZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=nFr/9wnB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so50634265e9.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773770889; x=1774375689; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HT1vwWl+a38V7qIi5t2z8SaT/U8JFZY0mnIb8ncq2Gk=;
        b=nFr/9wnBAV5+DBAoMvmJ01HtGUUcrRjDoa18LaaKI3SyGLsBU2+pG6AfHsJWMUJ+v3
         0+ZUA/Q+ebu8oIXfwSHkFCPncOCWObgMRYeJAtMGJfFuAzlz2idMK+g6/J0/+KJXn/i1
         JmuRU8cfYKQx/bbMrl3cB0O9eZUcGXkkY8TQbdt4r4bOB4p+w2tuuE2vKxemjwYiW179
         n22XP99NiwGHp9GMhKXY3cBHFi3IOwBUr1vaa4zAccarALATqQs9Bs4MwB2NDWdX8qLs
         q2fBEz3AQ8aIi1ZRd7h8aqCyOYdy0GmzCvTok/9um+PSalgaJVz9IpYppY8Po0oZTAAT
         8a0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770889; x=1774375689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT1vwWl+a38V7qIi5t2z8SaT/U8JFZY0mnIb8ncq2Gk=;
        b=IH5IsJ7u7jHQy9tllsK3/3D55Y4NZAKnqrrcuaWuqaHW5Fc6UkRWM5D1+R5LeSkDCO
         nRBpqt/A1dcKXfOH9VwyBMYsF+PHLzjSI3zmt1tBehYxoz1ugTXeAM5ze7R+kGf78tHh
         FBfEbYAVHfhiPX5912Yt62IYfP8g2QpMha/DZtTSDPFdAnGNgS0X8SHACgdOz6aPMVuV
         96HO9eWTNVogwnZVjfkB8aDc+TuovG4+X90jaSTHtQAsfDx2pcvfh7g5BUMoUkakfG8y
         Ez16RnJE+5KfZ7n4o0x47O6Uh1zdyS1UalMMxCQGy7/xrDnXP0qu/jc1GO2Wcij6B89l
         ZNhw==
X-Forwarded-Encrypted: i=1; AJvYcCVj5xPqGRlxU0wQVChJ8XxIhJ5r2HPV8gIiKx0YVVqJjNxvwQta94F9ErwZA+yedlvsJapx6KjNw1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWcd3fyABYyA52D/dGmFXUwOkIN6I38y/IjTpOvZlSNc5H+n7
	XsxuMToaI/SIJsx9W3ZiIUpXxGzJwQENg+0tVcODop87gg/i6ok8Q38o+cHZyBpaL5o=
X-Gm-Gg: ATEYQzyK6YSDocc9kDtw/anHc9PV2lNjAYrY1evP5m39pdQQOCAnKcYqy1LgjOW3y3+
	rKVhHmR+63B5A7JhRPB+VqWeNt9tTA5JkppgmO9B5JP6bnoRSncRTqogWCMqi4b1UkUgBUezXsH
	OYEM1grbhYYjz18kzh3jo7WsOvOnrxNro9UiCCM2j6NFbyvOwVAAQl6KVSdVbtEvcngm4PXdyOD
	9clA9d2nlic3qE5zfkfsSWAvgxpKB2JUyvjSsrgqM7YB1QvcfxcVeNO4NQmrhPPzVSTnT16Htt9
	Vn8GQrsBY98kQOW13LZhNkOhVzYEdACbEvp9kqPboYj5RkjBJ2J2n8bMUM3ejTVShca25fTwz2/
	ZsqPfhGZqj15YW9S8QBlAgUbtRvlLrcAMQVMjWJBQpKfVjSUt9BgGlJFijm2i+XyF6lU5zABnBM
	Fqd3bMhIWxZBE2SkFwOnz20kh6v7qgQCTFt1ureBBPR+DFC6lD8oYqn8us5iDXjzDmaEQVdtAbd
	XcGkw==
X-Received: by 2002:a05:600c:1d0b:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-486f4577061mr8194215e9.31.1773770888892;
        Tue, 17 Mar 2026 11:08:08 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184b8b9sm1436536f8f.1.2026.03.17.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:08:08 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH v2 0/5] Add HUSB311 Type-C controller
Date: Tue, 17 Mar 2026 22:07:57 +0400
Message-Id: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2YuWkC/zXMwQ6CMAzG8VchPTtDZ2DqifcwHCh20sSMZcNFQ
 /buDozHf9Pvt0LkIBzhWq0QOEmU2ZXQhwrGaXAPVnIvDbrWbY3YqOkV6YSo9AWJCAdjTAvl2we
 28t6lW196krjM4bPDCbfrz9i2fyOhqpXVDY3UnEdrTWef4j2Ho+MF+pzzF7urctmgAAAA
X-Change-ID: 20260115-husb311-291bbb1a7776
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>, 
 Yuanshen Cao <alex.caoys@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698; i=alchark@flipper.net;
 h=from:subject:message-id; bh=akAl2/DG0rdw7GlbNngJ+xuwwxnaipw/AQYp8maIV00=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTunNF6r7Z+eZ2E4oJ2I+HNT2ROywbkLzbi7/zRrbxM4
 o/qsqxLHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEy1LBcjw8nDy1/9mst7L2zPdOOAlW2RyZm3DoeVcTIVL3mslC5yOYvhn37WtUW
 BX4vqPti9vzJPwm3qHTN+i5oTzdy36vprLj4X4QcA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34967-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flipper.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED8CC2B0A48
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

This also enables a bare-bones DT node for HUSB311 on RK3576 EVB1, but
currently misses the connections graph for the USB SS and SBU lines, as
those might require the USBDP PHY ports schema to be updated first for
proper DP AltMode support as indicated by Sebastian.

Signed-off-by: Alexey Charkov <alchark@flipper.net>

---
Changes in v2:
- Changed the binding to use fallback compatibles (thanks Conor for the suggestion)
- Rebased on top of recent next, thus also adjusted the binding for ET7304 to fall
  back to RT1715. There are no in-tree DT users yet
- Removed the VID/PID/DID checks altogether instead of endlessly multiplying the
  list of matches for new clones (thanks Conor for the suggestion)
- Link to v1: https://lore.kernel.org/r/20260311-husb311-v1-0-f25bcb58cff7@flipper.net

---
Alexey Charkov (5):
      dt-bindings: vendor-prefixes: Add Hynetek Semiconductor Co., Ltd.
      dt-bindings: usb: richtek,rt1711h: Switch ETEK ET7304 to use a fallback compatible
      dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
      usb: typec: tcpci_rt1711h: Drop unnecessary VID/PID/DID checks
      arm64: dts: rockchip: Add HUSB311 Type-C controller on RK3576 EVB1

 .../devicetree/bindings/usb/richtek,rt1711h.yaml   | 16 ++++--
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 20 ++++++++
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             | 59 +---------------------
 4 files changed, 36 insertions(+), 61 deletions(-)
---
base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
change-id: 20260115-husb311-291bbb1a7776

Best regards,
-- 
Alexey Charkov <alchark@flipper.net>


