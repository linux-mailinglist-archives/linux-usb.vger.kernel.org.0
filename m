Return-Path: <linux-usb+bounces-37963-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHyMCrdlEWr7lQYAu9opvQ
	(envelope-from <linux-usb+bounces-37963-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:30:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE35BDE1D
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 10:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B80C300B1B8
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 08:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52117356745;
	Sat, 23 May 2026 08:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7c9W00v"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878D34404F
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 08:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525037; cv=none; b=MLHKYTf1fsQ0V5IOOpj5x8wes5uJLGOnxw1mFgl5502I9DQviraXZaCzGzqqycXlaZzXK/KFMMxjVXjBUPQ0wS3Erpj5A+ZugbBeLFi8agU6XyDQ/k1qmqYSN1Lf6PPnbHmTJCpdLMKGa05zDoCNZchyKD8BEqHEXHv7ACnlglA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525037; c=relaxed/simple;
	bh=fEm494wmzT4RCYgvTiN2RENvJG88iZmHcUw+ah91irA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dEqdGbj43KXno8b9iHL6mrx0Ze5bZ5whZvyftkY64IyHrxc+yutET2mAsxcr1nC3Aqy9Lqgl/Q+KnBJQQwS4h9Wvg2GK6D8kTPnCqKZU8fz+jlnEeZRXWbzYMrq3u1R/9TIVGNJRjbK//2mWg+QqEBqOP5jayd9eV9NeB3wCe3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7c9W00v; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so5352934a12.2
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525035; x=1780129835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=By6RxEVxkPMqf6JEO4j7N7w8dmHsRgJCqXPPkFDGEcI=;
        b=M7c9W00vYOZfjhS80p9r+xQ6/II83qBp3ghEm4PXDN1BIw9kr/jAL/3BtzV4iXN2yl
         cLrg8Tkzggkc6lgpnA0WoAlGu+tawJXBmLeqlTTACw4mD3X4CU7d/x9hQZ1DeNE2rYSq
         J/0VQ+v3LpsDyvXG9ZJA32dPNeeOgyjuIDh61fL3SnHWFVYNM2z73NRI1+biW92B2PjF
         /CT+IJgqD6OANK2n/QtxXVY1NppOzuBA4xapXZU2o2rEh742Wx69GFhPdra645i+jNuI
         i8z3y6V0qJbLHcjqPmHGW5j+7mcR2fGqNmlEmpqw4pPMVK/cf6XR75dDAXtphEXR6k8A
         YiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525035; x=1780129835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By6RxEVxkPMqf6JEO4j7N7w8dmHsRgJCqXPPkFDGEcI=;
        b=Fai2pB3JYSEGSMpaBxURqvDIblEyDuOUXb4Q/JpZ6jcmQnIb0pHv7BfZtqw2rxipU7
         vOaXEvfiLKvfCcD/g2FHeE5yZjvGTo1cMB7jpKWdv/1StbmvHHpUe2asXLBnUpg3d3og
         GFYNB04W9wwv3igTfMAQcnNfTtOTZ04wSTLZ4KJA7Apk7pYbAsunnC8ZItfQnxd+IKfb
         ee/6dxOrz0R/l7GCzfL4pxuRFotAidhEclKyQl/uALsUJUzpof3/6bDeHtbw/xPjfuCe
         ZOyXvJzBn3NWBClK5MZBiIuN/lmt1CSObpiPrwgxaFGiIUoRqifNQQCunYQMtOIvcvmf
         2AxQ==
X-Gm-Message-State: AOJu0YwDAnKaK7jhIBFU4uIoursfV2JwVVtBPvMk3ZVUkwAoJFnZqKcR
	b2XOst/l+FVqxlv78MEaXdCYuG3VUZ7rX4v5WM50V+VMnb3sLdnZo4vU
X-Gm-Gg: Acq92OHctFgIXWXA151aFLAsjPsENtRY8Ofzyc2wlYhIWETLxuzjMp0YVyroHoZsl8w
	D41YmW/T7lI4yrj6nKTqQ478G2SMfNJJ2f1xtRsliULTQySXfGuuWTuk0hqAG/dykz2Anb4+Aeo
	l5w0VtsGuS2xqMioLgl3koSBkovS2ZkeUCNvQNbgfNOmQGIjG8jj1nVDFY5amC7qnIdgwdRVUO9
	6IbRbv37SrIznmxGik0TLjzSMzPCEh6jt7G4S1cysKWjTdYJFsp3K/bmhYI9SO8V6adiPQDi6Oq
	9C+miPvgvF1H7lv7BRr8fX/z2fNutEzpRzrRILmD4aGHlRoczSc/vtdEBD6f4xKnABj3YouYIYF
	AIvZEOAob96FhzVYfXpTVDOJvwJcl4f6SKolVozViDT1ZJaDR1pPmlLY4wZ4dF6DX2Vk6UL82Ya
	lFvdsTn1EUTvww
X-Received: by 2002:a05:6402:4015:b0:672:64b:c97b with SMTP id 4fb4d7f45d1cf-6889c94e8d8mr3738190a12.26.1779525034751;
        Sat, 23 May 2026 01:30:34 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm1651856a12.30.2026.05.23.01.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:30:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] usb: chipidea: tegra: Add external control option
Date: Sat, 23 May 2026 11:30:08 +0300
Message-ID: <20260523083013.46372-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37963-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,nvidia.com,gmail.com,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0ADE35BDE1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Patchset adjusts the Tegra-specific portion of the Chipidea USB controller
to allow for the disabling of automatic PHY and USB controller
registration. This is achieved by adding the nvidia,external-control
property/flag. It does not affect any existing configurations, but it
allows the USB line to be registered or deregistered by an external
device — in this case, the modem.

Since Tegra USB PHY holds clock gating for controller PHY cannot be
handled by code Chipidea mechanism.

This patchset is a part of larger series aiming to bring XMM6260 modem
support for Tegra devices:
https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/

---
Changes in v2:
- separated Tegra USB into its own schema
- tegra_usb structure moved into tegra_usb_phy.h
---

Svyatoslav Ryhel (4):
  dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
    dedicated schema
  dt-bindings: usb: chipidea,usb2-tegra: Document
    nvidia,external-control property
  usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
    controlled
  usb: chipidea: tegra: Expose tegra_usb structure

 .../bindings/usb/chipidea,usb2-tegra.yaml     | 95 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 drivers/usb/chipidea/ci_hdrc_tegra.c          | 43 ++++-----
 include/linux/usb/tegra_usb_phy.h             | 15 +++
 4 files changed, 131 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

-- 
2.51.0


