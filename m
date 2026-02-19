Return-Path: <linux-usb+bounces-33471-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF6jGYJ9lmkggQIAu9opvQ
	(envelope-from <linux-usb+bounces-33471-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 04:03:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B9515BCF7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 04:03:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F390302F9BA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 03:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1812765E2;
	Thu, 19 Feb 2026 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhaRwg70"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7D1F872D
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 03:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771470197; cv=none; b=Rk7n8TepYKR9M2UB5z5M1gZgHbL3AL+6TKs3BPNPnVfUNPBlWxPKLYvUW79453q+zZT5uXndlNWf7sOiuF0E8Wb3NpNf50fu0leS7Xq90oyIYoqhyKEQFv4lUkTSt50TKtXI+GqrNqVY+B8+nMp+BhS1eOjVdcvlH0DG+BoNJ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771470197; c=relaxed/simple;
	bh=od6+EgFNc57+4YlHJcjEKl2xhRALHiNV1wfrRF/JheA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s5nhJB8kkx/frAMzk8NhNojPMlw6ENF75qNEphjHr+6nLme19UAFfLide5qElXQ2Vp1LMtD9koMkgppBIEKNZIn7VTyO+kctOWl+3rraNdDJRyZ84rlh6FZ/zGZNQWvf+C/TiJjPnehvJklWT6hwIUkk2lC3vIFvaQ3kyP2ls8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhaRwg70; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8cb4acdacb2so57478385a.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 19:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771470195; x=1772074995; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lUk45RVOcz/5VqwzEe41q8FmdQi2pIya8uE65vlMFtA=;
        b=PhaRwg70q/NsFQ3ZptrgE46JeuoptTt3FwDC8aiYFIwwefyodkxQRt8pV96hGnKlq8
         r1EFZguEV2K9KyEfJ5RE8c5u09faNnyZC+h4SGT/rmC9yxe7P8pV9NiWaVG3jq/7dFkX
         djTheZU35813aw0BLnFKNiSenOhV18Cn5tcDbsrdacqjqDyDcDhJkn2lXSzIJ15gy+p1
         TjOuSPeINBOxqXEnDLYD/wpgHS2fMwxA19I5HSmetGX61LHmwsdG8WZ+/CTJnJs+Vhew
         2Ylt9GuxXqrKwLhxINE+REd7fR/QeNfEPZn2Voci679IF9TdVEpB48Vecz/cykbKMkcr
         84AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771470195; x=1772074995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUk45RVOcz/5VqwzEe41q8FmdQi2pIya8uE65vlMFtA=;
        b=jUDp99NzEGabR/+6LyZs4/PdueF7unnwjgUVDjLrOZKtdHA1RIKjPOr0PPFcDxOC8Z
         ahVQSmFlm24ipQ+dLPyQM1o9XKigxQlXzJCSl2zBCgWFZUJiDV8xzd1Rwmn0gCHpT5JN
         nl08QexsbmtxPPF93sXZq9czVQRpiUOzgsVo9jhRZGRwTLb41bMxali2Of/XKaPRKlzT
         exSGmIfti4C0c2E7AVVl04oOkJF6+40kbz8bFKQHdUaKOvBm59b2+Hzj8U485jncZ44l
         aYHfpjX9mFcJrrWjynOboTPmSUeoPW6orB9uEgmPU4Yt1FzQnIISEWJeGYeEMhFYZ2fz
         4SxA==
X-Gm-Message-State: AOJu0YyKe7DM/vCP/Tzo3hoW8J37tySOwzZME6vy7KN/L3Pbluiez6tD
	xPP+MxnrZ4RpRXhYAaIdL9eXstch0suNsiBSkTgF6Ldn/prEDeUCoAW6DpU785La
X-Gm-Gg: AZuq6aLZz5t2sWGg/4rI51cqcbEOkewOzfdVIALNEs1ZnJYhQ8otGUx2zQpgwzhgH+0
	azLu1Fwaza/bqT7mdc+j3RdOOoirHh8ONeamCDtpH7sfuzO+HaqTOC3j7ChKfLG0A88Jn6CjdvI
	GnCKAVuauM5UoMepHRYRwlQRH2mVA56mBcjUimCZNitU9JICZsi6jF2MACnK3dpdicOMLgAwOHX
	zFM/Y9rDhDRzhPmCtCT8f8THSu/117LLgS3B+reRvRm85VVIaGkMH+gZ7RZ1dptoETWUnODfnRH
	bktwNNp4s9QrtdlUYPR1wKo4+adUmQ77spwWlU+x83FmcKmwrj7u2tYRt1XphmZrezMM8DBo381
	N42CImST5sYqrIgMISZ4RsV8LxUMgn8ahPmtDL/4EKcN6m4N/9CslzaazGNH+GmudIlJGqpxjNc
	VteIEHFpq3rVYo70S7nNtJqUj2YHM=
X-Received: by 2002:a05:620a:2953:b0:8c6:af59:5e28 with SMTP id af79cd13be357-8cb4bf96693mr2038341985a.22.1771470195200;
        Wed, 18 Feb 2026 19:03:15 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cddc526sm205359896d6.53.2026.02.18.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 19:03:14 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Subject: [PATCH v2 0/2] Add support for Etek ET7304 Controller
Date: Thu, 19 Feb 2026 03:02:50 +0000
Message-Id: <20260219-et7304-v2-0-b2e268494ae8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFp9lmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDI0NL3dQSc2MDE900Y/MkM0Oz5DSLNGMloOKCotS0zAqwQdGxtbUAmys
 Rk1gAAAA=
X-Change-ID: 20260219-et7304-f37b616cf8f3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33471-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexcaoys@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_WP_URI(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,etekmicro.com:url]
X-Rspamd-Queue-Id: 13B9515BCF7
X-Rspamd-Action: no action

The Etek ET7304 is a USB Type-C Port Controller with USB-PD used on
the Radxa Cubie A7Z.
According to the ET7304 datasheet [1] and the vendor BSP source code
provided by Radxa [2], this controller is functionally identical as
Richtek RT1715, with the only difference being the VID.

Add support for the ET7304 by registering its chip info in the driver.
Tested on Radxa Cubie A7Z.

[1] https://www.etekmicro.com/wp-content/uploads/datasheets/ET7304_datasheet.pdf
[2] https://github.com/radxa/allwinner-bsp/commit/156b6578cc173855b41ea311a229403ccbadb17c

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
Changes in v2:
- Put dt-bindings Documentation changes in a separate patch
- Add Etek to the vendor prefixes
- Link to v1: https://lore.kernel.org/r/20260217190010.67-1-alex.caoys@gmail.com/

---
Yuanshen Cao (2):
      dt-bindings: usb: document the Etek ET7304 USB
      usb: typec: tcpm: Add vid and chip info for Etek ET7304

 .../devicetree/bindings/usb/richtek,rt1711h.yaml         |  3 ++-
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 drivers/usb/typec/tcpm/tcpci_rt1711h.c                   | 16 +++++++++++++++-
 3 files changed, 19 insertions(+), 2 deletions(-)
---
base-commit: 956b9cbd7f156c8672dac94a00de3c6a0939c692
change-id: 20260219-et7304-f37b616cf8f3

Best regards,
-- 
Yuanshen Cao <alex.caoys@gmail.com>


