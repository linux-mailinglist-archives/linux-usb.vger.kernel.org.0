Return-Path: <linux-usb+bounces-35096-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBnlNnKXu2nwlgIAu9opvQ
	(envelope-from <linux-usb+bounces-35096-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 07:28:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 333072C6C28
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 07:28:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C561430649E1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 06:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F60B3451DC;
	Thu, 19 Mar 2026 06:26:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0440DFAA;
	Thu, 19 Mar 2026 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901580; cv=none; b=CeDCyF6EC1s9Ub3dZB1q08CL1G4gwzE1EQPnVYBl94Rt3iQRRTsXhkF8GvjO4XvZ6Kwlt08NRKNISxJo6QivSHY7xZLziwfIIO5pIrj9wwKjvQqqla481PLcy/PsQzAvsPLurVpxgPgJH4kpwAtoDOE9a5xZeBlZNdHpRchcbVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901580; c=relaxed/simple;
	bh=21xww1wUtJxyoss2A64Nh+1RNmAWHYGyqiWGeKGa+Yg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cFblEajM9XqFZwEtbp9NNL6Bu6KbrTUFHkX5m0JSWrkYpCZYT3dH0La//2RgHOTyCxd2De7PbdJ96QMaBRDDoJp0S0iA/6CrMISNd/M9B3qOGe8HXetRvYvbN1+03MAPNa9f4QIzEmI5wZtCios/1SxDuFqYvcydyGH3TFEvoJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [116.25.95.187])
	by smtp.qiye.163.com (Hmail) with ESMTP id 378652ffb;
	Thu, 19 Mar 2026 14:26:10 +0800 (GMT+08:00)
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
Date: Thu, 19 Mar 2026 14:26:01 +0800
Message-Id: <20260319062601.1042965-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
References: <20260318231542.mmbcrqy36oyw44xc@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d04c5e12303a2kunm33e6bd551ad55b
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTkkeVkxPHkMeSUxPSksdTlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSkNMWVdZFhoPEhUdFFlBWU9LSFVKS0lCTUtKVUpLS1VLWQ
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
	TAGGED_FROM(0.00)[bounces-35096-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[amadeus@jmu.edu.cn,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.472];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jmu.edu.cn:mid]
X-Rspamd-Queue-Id: 333072C6C28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

> I mean this is a generic glue driver and not specific to your spacemit
> k1. Some platforms use regulators to drive the vbus (e.g. dwc3 meson)
> while others for internal controller supplies (e.g. dwc3 exynos). Also,

So shouldn't the generic glue driver manage vbus, but rather the Spacemit
USB PHY driver? I don't have any good ideas about the current name.

> if the platform is operating in device mode, there should be no vbus.

Do I need to check if it's in host mode?

> Also do we want to disable the regulator on system suspend? If so, we
> may need a regulator handle.

I'll add it if you think it's necessary.

I'm not quite sure how to do it well, thank
you for taking the time to review.

Thanks,
Chukun

