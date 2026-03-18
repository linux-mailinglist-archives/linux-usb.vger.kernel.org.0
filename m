Return-Path: <linux-usb+bounces-35016-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEe7I6dHumkFTwIAu9opvQ
	(envelope-from <linux-usb+bounces-35016-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 07:35:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F22B675B
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 07:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39F9F30A4571
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 06:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD31F366064;
	Wed, 18 Mar 2026 06:30:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADAF29D287;
	Wed, 18 Mar 2026 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773815424; cv=none; b=RntmsVrhfQd2X4W4iPa894jkHbbqCGllx4FowVdncd2TNgASaiEthXcW9g2KXvzrdxIUCq0cnsiMi9nUAgshEzn0txHJIDBhv3fqCPlKP3R4yjSw0s5YNJL1LpZLYQg843a5W/9y2KIDYEQ/s5js6SKNjYgYknuQj0vzmFi3l4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773815424; c=relaxed/simple;
	bh=S/DDSdZmUw0tA5ExSi6kU8ksd+/FNhkv/SyMLipYwsA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eRiIr3TYR97JmhYGj8PBEFPV8BVVPxTCln9exkxSEh9CPzD77d+KBd05OoNHU9/h79pKfvFF9TREljBiMqpRJ2ubvUDWk8XMK9Nzr9AvTvjv7j2FWPyhKzDYlKJXE3aQf1y0jkFMuL86aBnYXtOBBsA+2EzCJxTEpzPJBxKTPF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.94.199])
	by smtp.qiye.163.com (Hmail) with ESMTP id 375de3318;
	Wed, 18 Mar 2026 14:30:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: thinh.nguyen@synopsys.com
Cc: amadeus@jmu.edu.cn,
	dlan@kernel.org,
	gregkh@linuxfoundation.org,
	huang.ze@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-usb@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS regulator support
Date: Wed, 18 Mar 2026 14:30:02 +0800
Message-Id: <20260318063002.3743362-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318002953.6gknb2jfveqyisop@synopsys.com>
References: <20260318002953.6gknb2jfveqyisop@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9cffa3308303a2kunme7efa47016e9df
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ09LVk9PHx0YSkJOHk8aTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJCWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
	Y+
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[jmu.edu.cn : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35016-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[amadeus@jmu.edu.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.935];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jmu.edu.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 380F22B675B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> If we have a specific user, please include it in the change log. In this
> case, it looks like spacemit k1 as noted under the "---" line?

I will change it to "Some SpacemiT K1 board".

> The name "vbus" here maybe confusing. This regulator powers the
> controller chip and not neccessarily turning on VBUS of the USB bus
> power line. Is there a common/different name for regulator id?
> At least fix the error message.

Sorry, but I don't quite understand what you mean.
Taking the OrangePi RV2 [1] board as an example:

VCC_5V0 (IN) -> VCC5V0_USB3 (OUT) -> Vbus30

The VCC5V0_USB3 regulator is connected to the USB vbus pin.
I think it's okay to call it "vbus" here?

[1] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONSR

Thanks,
Chukun

