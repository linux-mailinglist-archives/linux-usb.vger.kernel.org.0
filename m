Return-Path: <linux-usb+bounces-35245-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF1TLEkbvWnG6QIAu9opvQ
	(envelope-from <linux-usb+bounces-35245-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 11:02:49 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FC42D86AA
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 11:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2106303B4C9
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 10:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39703356A37;
	Fri, 20 Mar 2026 10:01:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346AC28F935;
	Fri, 20 Mar 2026 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000903; cv=none; b=KMUHhkFzjoWW8mdVkd1JZn6yhfyl2I5IH34tAhBfVaBQjylVOP8cenMpE2HdNQSI9/hgjzSOlyrlUJ6jkNf8WixhdZwuyrZOxgFyreuVdIlGlyWVNsGmMsIBlXmzrAYIX7EpC5rT9Jl8KJpQQAubzTMzc0TX9f2TknN1SQRGCkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000903; c=relaxed/simple;
	bh=Zwr5iCTnDZBHXBTd2nM7A8Xs0Isd63oW3zv2F2TyMO0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y3AwzpC6F+WEo/FavqFt9YdEqIxDTVOfCoj3k36KN7qtiVN0q7DES4fWpEEuCs3OxYl0jPCDPgBjbu1OaiBftSuTbqkE0X7MbFosxiT9QTRRulLLmq5KlFBxnHsFr8ULEQRZzmIgpnF9AgJENqoqDee4O5yGdRV7LyFcECfmrpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 37b2f4e33;
	Fri, 20 Mar 2026 18:01:35 +0800 (GMT+08:00)
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
Subject: [PATCH v2 0/1] usb: dwc3: Add optional VBUS regulator support to SpacemiT K1
Date: Fri, 20 Mar 2026 18:01:19 +0800
Message-Id: <20260320100120.1343629-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d0ab1744c03a2kunm090bbcfb1f2c00
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDT09DVhhOQh5ISx8dHxhPHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09LVUpLS1VLWQ
	Y+
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[jmu.edu.cn : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35245-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[amadeus@jmu.edu.cn,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.351];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jmu.edu.cn:mid]
X-Rspamd-Queue-Id: 27FC42D86AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The vbus-supply property has been declared in spacemit,k1-dwc3.yaml
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/usb/spacemit%2Ck1-dwc3.yaml#L71

Changes in v2:
- Improve commit title and messages
- Enable regulator only in host mode
- Enable regulator when matching compatible "spacemit,k1-dwc3"
- Link to v1: https://lore.kernel.org/lkml/20260316080000.3130372-1-amadeus@jmu.edu.cn/

Chukun Pan (1):
  usb: dwc3: Add optional VBUS regulator support to SpacemiT K1

 drivers/usb/dwc3/dwc3-generic-plat.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.34.1


