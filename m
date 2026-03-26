Return-Path: <linux-usb+bounces-35497-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Og2Ah8JxWnn5gQAu9opvQ
	(envelope-from <linux-usb+bounces-35497-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:23:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B07263333DE
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 11:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD72930EF86B
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8AB33C2788;
	Thu, 26 Mar 2026 10:00:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34033C0612;
	Thu, 26 Mar 2026 10:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519232; cv=none; b=fafjHp0ULYqdTb3gq9e9hapJsjc13PYbqJH583otTgJfUQkBN43SN0MECB6/8SA5+nHM5faEbiMThTwkVN9q2wUES5AvdyNiX6Of3iSU7f6UErIqEC1CTEr5DuWouLgvPvqCzWimrxF6H7czN1bDJdbRg9ctAxkNxDCPYFQKjPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519232; c=relaxed/simple;
	bh=gfJfakw6BzUUL/qpyMm2q31ARNS8RHJP4aVoKrXBqzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ctm50SNg+4BvESLneVFjNXRb2PnF45gMKkXYUTvhodQY8cIzjB494+YQzii5YAyuM/qT0gIAY5QE4ykB8rrwFvXJ7KHC7LohUxF4QqVQdxk6KEBooppxSJmGUGlJm6nbku4B3g1SwwUORXOayCKIEdzzf2EbAXy8xWt7/fGDHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [116.25.95.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 38672f74f;
	Thu, 26 Mar 2026 18:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v3 0/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Thu, 26 Mar 2026 18:00:09 +0800
Message-Id: <20260326100010.3588454-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d29966bbf03a2kunm60643231383e9c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHUgZVkJLTUMfQ0NNGUMfTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSktKWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[jmu.edu.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35497-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[amadeus@jmu.edu.cn,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jmu.edu.cn:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B07263333DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit%2Ck1-dwc3.yaml#L71

Changes in v2:
- Improve commit title and messages
- Enable regulator only in host mode
- Enable regulator when matching compatible "spacemit,k1-dwc3"
- Link to v1: https://lore.kernel.org/lkml/20260316080000.3130372-1-amadeus@jmu.edu.cn/

Changes in v3:
- Add missing properties and adjust position
- Link to v2: https://lore.kernel.org/lkml/20260320100120.1343629-1-amadeus@jmu.edu.cn/

Chukun Pan (1):
  usb: dwc3: Add optional VBUS regulator support to SpacemiT K1

 drivers/usb/dwc3/dwc3-generic-plat.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

-- 
2.34.1


