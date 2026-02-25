Return-Path: <linux-usb+bounces-33698-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFY/GDrznmnoXwQAu9opvQ
	(envelope-from <linux-usb+bounces-33698-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 14:03:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B689197C13
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 14:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 129B8306363B
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CB83B8BC1;
	Wed, 25 Feb 2026 13:03:37 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D579395262
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 13:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024617; cv=none; b=LOqsTLEKx3cSsg89/emLCjiQ2i9daM84gySx9+w0UUxRRAmEsjnrF1F8LB0WZOz7V7rvLxeTUi9tAQGnDzo/0d4tom+0WzSY9RriBu6v0M2Q7CwLUZ+UbjOne1ZXGKcB7fYTKnOIwU1bXqi4B96XW7OGnWy0J8fez/JkZ+t4BzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024617; c=relaxed/simple;
	bh=TsqdJHNjUFtNpcwqO4dIvYePvwLju9L0uOdLFWVwwXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1fC4ItNbKIHJRrdhx1ey4lDtpG6V7QsoxzQ0rJMVOrF413rp1abyzNjWb8o6vbEzjzQGcPtnTKoBLcFhygKi0B6NE+atK5ONl57OebAhYlNIntSAh1t+tqi1Gtb86Zt9hnlGLdR2LeaUQPGkR+o2NPuszICC65yk9Xwkvhp7Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 396D91E2A9C6D;
	Wed, 25 Feb 2026 14:03:34 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 0/2] Re: [PATCH] usb: dwc3: Support for USB3340x ULPI PHY
Date: Wed, 25 Feb 2026 14:03:21 +0100
Message-ID: <20260225130323.24606-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
References: <20260225000512.tle2eu4gkd4ut6bf@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772024614239
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33698-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[lauterbach.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lauterbach.com:mid,lauterbach.com:email]
X-Rspamd-Queue-Id: 0B689197C13
X-Rspamd-Action: no action

Support for USB3340 ULPI PHY high-speed negotiation, by adding a
device tree property, which tells the controller to insert a delay
before the assertion of the TxValid signal during a HS Chirp.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>

---
Changes in v2:
- Mention sources of information in commit message instead of code.
- Renamed property to "snps,enable-usb2-transceiver-delay".
- Renamed struct member to "enable_usb2_transceiver_delay".
- Describe dt-bindings in a second commit.
- Link to v1: https://lore.kernel.org/linux-usb/20260224141438.39524-1-ingo.rohloff@lauterbach.com/

---
Ingo Rohloff (2):
  usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.
  dt-bindings: usb: dwc3: Add property to insert delay before TxValid.

 .../devicetree/bindings/usb/snps,dwc3-common.yaml    |  7 +++++++
 drivers/usb/dwc3/core.c                              | 12 ++++++++++++
 drivers/usb/dwc3/core.h                              |  4 ++++
 3 files changed, 23 insertions(+)

--
2.52.0


