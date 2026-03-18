Return-Path: <linux-usb+bounces-35045-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOmBDuCbummHZgIAu9opvQ
	(envelope-from <linux-usb+bounces-35045-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:34:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D25F82BB8A0
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0B733015D84
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 12:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C673D648B;
	Wed, 18 Mar 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="MewTh4N5"
X-Original-To: linux-usb@vger.kernel.org
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23E13D6664;
	Wed, 18 Mar 2026 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837271; cv=none; b=TE6ga4ZEcEg3gtuBTRpTai56rz/wq5MWKnjiqEqn3q1kPonvI8wCavDM7yu9ezOhsoSBkJGhliA/6QHZDpr1Ikx4ys2QgMHpegl9AdS5iLoHt5MlUzeC/ehBa+tjigiTRMm+KZbhRx5Ge0EMOoTOG1jLbb6vN2h1wrDa37upMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837271; c=relaxed/simple;
	bh=9kZ+/uw12vPI1Hj4WaE1zcvG48nXQTqwpIa8WBC92yE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d6q/lJbS30zlp8S5wbH2iP3EFu6CzFzOM88MPhqIgXIZc7lizWZmiz7raKCEC0LiiVyzl2Mn7k8+96VwWdTk+zqWYQ94sXkBLKiYgzXofrU6u+3e1yCROmSt8sEWTlwzyVFIMCVdFRto2Kb4tfF7BAiOUUh/wGmkq1S7NlSlW4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=MewTh4N5; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 62ICXoE021675524, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1773837230; bh=uxzk01tvzwjh6QLVfebclwOWZgnxj6nalX5GcaSdScI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=MewTh4N5sJ9TtTmTVtBpK2mXD/XG0TtBC1Jkjb0Ap8ZrMm8fzkNo1+vBWWlZTa9dd
	 /YNQMD8A+WuBGT9jJfR7zhEssZYbHZ8u7v3lGgZfYYuQd4MIafhEJYNQ3r67mBFzc1
	 xSDr6r2jEw8rPsrJ4tEMTB3NeK9tbpovuR9XBB8MOlN5fJETH9mZ9QVrjGLJKXyWBd
	 tBWABj/1jMyCVIGl2PhO+HYBH9Bkap9WjclZXJ80hjLsudOswIWjywWLBzXAv4JmZ9
	 xUtoLurOgCJu91MwVtGSz7DqrPSMQafb4qqmDWgglmsMawK3eIpQ7MrUSecr05LVs9
	 w9nV5VP2LZfRQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 62ICXoE021675524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Mar 2026 20:33:50 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Mar 2026 20:33:51 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 18 Mar 2026 20:33:50 +0800
Received: from fc40.realtek.com.tw (172.22.241.7) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Wed, 18 Mar 2026 20:33:50 +0800
From: hsuck <hsu.chih.kai@realtek.com>
To: <kuba@kernel.org>, <davem@davemloft.net>
CC: <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <edumazet@google.com>, <bjorn@mork.no>, <pabeni@redhat.com>,
        hsuck
	<hsu.chih.kai@realtek.com>
Subject: [PATCH net-next 0/2] r8152: add helper functions for PLA/USB/PHY OCP registers
Date: Wed, 18 Mar 2026 20:33:11 +0800
Message-ID: <20260318123313.2313-444-nic_swsd@realtek.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[realtek.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[realtek.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hsu.chih.kai@realtek.com,linux-usb@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35045-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[realtek.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:dkim,realtek.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D25F82BB8A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bitwise operaion functions for PLA/USB/PHY OCP registers 
to simplify the code.

hsuck (2):
  r8152: add helper functions for PLA/USB OCP registers
  r8152: add helper functions for PHY OCP registers

 drivers/net/usb/r8152.c | 1797 ++++++++++++++-------------------------
 1 file changed, 634 insertions(+), 1163 deletions(-)

-- 
2.34.1


