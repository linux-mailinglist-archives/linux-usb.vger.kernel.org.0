Return-Path: <linux-usb+bounces-36161-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KeCE8Vd2mlQ0wgAu9opvQ
	(envelope-from <linux-usb+bounces-36161-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 16:42:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FD3E0611
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 16:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEFF6301C150
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 14:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3BD386544;
	Sat, 11 Apr 2026 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="XIsvNkza"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0092DA749
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 14:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775918527; cv=none; b=md1CWc38EDrxy6gNXlYV5zx6qedEwMhfTZNOp/W0DgMu/1IftqPsycrH+68BJ5mTCCmFdcjqbTEkT30//4SOpVDINRxpprrwMFratXXeeIJrBQcrDgXg6AUga/1ZuKp02vIWLZ+md8sQia4keSVZihZ+Pw27IBIECWft5bUihKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775918527; c=relaxed/simple;
	bh=jDNje2qE5wnUiO5W68NMfsRUbTDbBEc+Q4erprxn58I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEPwCJvz+0UhZ6S9BLmGXxMtLhHyn0Jy/B8b7d53S7rXrWKFEe3Rsstx5UCSKglvdtR+mFXmNVx6UnSN5FQppiAU3x49CmqvduXTGFFkf9p8bZnHLIdZ8bDPU+aoKKJSW4gdPKwvX+A/evbTcfjtTyT0ejscHChZoLQ7WSy8iK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=XIsvNkza; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1775918500;
	bh=RGI/m8KjnHFpnLWDkqIY3XoL8mJQCn1B5U6YOZXtvRQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=XIsvNkzaKiSoMf3kZDsclYCsVCZL20BB+TNtUl/72tYFzHXL5Kxyp6PkTI2EwU9mY
	 RcMV5RFLbAhwp19U3psusm7o9FSCUYnxmydI8IGqkK/rVxO6I3iGAs3rqr/9Amx+vJ
	 3AHOOxVQsB/7Zgp75Nc1ZO9+PInVxV9HACcWJZ9k=
X-QQ-mid: zesmtpip2t1775918494te3d24484
X-QQ-Originating-IP: WzSvb7kXZNNMN/wnXlGzfhNQOzNCWMW8/NmTxVxoOCw=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sat, 11 Apr 2026 22:41:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8893480091701257266
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Subject: Question on follow-up work for secondary interrupters
Date: Sat, 11 Apr 2026 22:41:33 +0800
Message-ID: <47A8A9A0842FA2D5+20260411144133.1207478-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
References: <20260402131342.2628648-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: N82HcWlqWvaKSW7l/LmFkhJjH6x/Z5w23zlIB7cHp6gw4Ce7Mcw3zMA3
	BRtG/ABiIC3eJfnJsUcXlC0l+vySV5JmspSK3S3aSB8i9NGnVcsDabUNsLH8E7NTJiKDPBF
	Zg574IYBKGnjkakBR1j7EG6KvvBXhLZEQtWMHXr7oPpppaHqa/Lh1dcxiRRM0S/JxoWLIDz
	Sgcc9nxnfWTlDj9GLv1+EuVmVsHaJ9l1++sP+28KGeK9Yc/xW1Bc0d3T+0xlPRa1gMuF3CT
	LQHLeZi/Rr+9X6rluaExIp/VVaCJifJ/Klit0F8MIItHPSzsLFt64rCOPdjmPxk2w3LVyKb
	KTvPLgGtYyHS9HkgT6BU/Vp90Dx0UfPqiBf4Aj7l2mOROAKz5D5DB3ONLBt6gu48+paOupq
	wE3qMFB1iEOCpoJBKeuQwdGQBtPfh86pNY8vAj62uWFTo1XFbH6aIuix5s7DkB5wDLpj8IC
	wromVHu5k41wKrhjAIpr0FEqEIHB74cD7a6VibXhBOxERGpKAXyTq/gmUMZc5qjMlmnua0n
	LVFC5zvVyzGe6azjneh2UJ+nZ+eFl4yNekM5SgA0vFGXTbskisrnulQAhi2+2Y/xlbSMe9/
	+l8j4a3SBXiyYpU8nrQi8d9WUr4r4MPaP/tv3D3zOHjnEBU7CyBlS9nbtQNy1xMI+9dk8rj
	QQQPxcZJ7x+Y7Z5JsZbOSJbVE7zXOwXulrjkfkrwzJEY3mf/akB11DahK65mqjtGEjInGkl
	lZ8E2cB74Xb7J57YWAt8RF0P+1kU26q7zq+dfknPhsLSWVhbeaCZaLyct2OJO6fU+7L+YWb
	2OZNvC9qSTPCLKwYTTzm6dG342qdWMff5GFUwmyZxiNH2TNheA/KUu+PF61orUNWPAQfsgN
	lS2vVa+wCkcAFB9GhqPtmN3U5auRs1x96mA6nU7sL0gdFtMDMtfeFCbHqqzKhA4Eo1W+iii
	6G2i6TSmEwYiIwhtdWae3fZtrG1DDEx0XyMz4/1fDadt6rYWIHGxCAp/zZNHMd9rs3t+QSJ
	r+d4li+CGT+iS93sncwVAiKc4DSSMgAJVF8N1N4bW9fwe8YKRP9VBJD6gRA51SXvo+ZJ3CB
	Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36161-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 634FD3E0611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> A couple small fixes and a lot of xhci refactoring, decoupling and cleanups
> for usb-next.
> 
> Thanks
> Mathias
> 
> Michal Pecio (3):
>   usb: xhci: Simplify clearing the Event Interrupt bit
>   usb: xhci: Fix debugfs bandwidth reporting
>   usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()

Hi Mathias,

I saw your recent xHCI refactoring series for usb-next.

In your earlier reply to my patch, you mentioned that after this
refactoring it should be possible to use the secondary interrupter
itself as the request_irq() data, instead of adding a separate
array/context.

Would you say the code is now in a good state for me to continue the
secondary interrupter work on top of it?

If that is the case, I would be happy to continue from this new base
and rework my earlier patch in the direction you suggested.

Thanks,
Xu Rao

