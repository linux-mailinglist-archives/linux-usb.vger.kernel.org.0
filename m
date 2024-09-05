Return-Path: <linux-usb+bounces-14740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA47796E459
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 22:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 231AB1C23BFD
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 20:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB47199E84;
	Thu,  5 Sep 2024 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="RKA6Z8zm"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA983D6D
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 20:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569256; cv=none; b=HKJvEvnfrSC8Tneljx1q9CymVJ7frZ/bjbIiWFyRloUg0yb+G81c56mZQn73eKSc26PjM6c0j5MN7G/drkCqVZ/FdqJTx++kHtgEtlIdlfNGLW+7+Jz4VGcfH002kfCo8SuwPA/emZ30GTrpv0qFaG6qOn4LViPcJIBT1eahkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569256; c=relaxed/simple;
	bh=64Dd+pHlYrEHE25rq8aHzUcu32cl3Q3MBcNEkl/RTVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JjTJKPe4EIIF0EaJz0lhax1JDzz/zgBPNndzzsJMi7PUqD/9XU6fkH5f3QCPN4h3ivwVBG8V5KQ8Rkptg8+a931JBQ3bhJP1Yf9ApC6JRQWgDGPMk9t0AxOAZ4xq3mpX0avcjlyx05sqtVcUMiAsy8TsYQX9SenURGm8FwsOunM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=RKA6Z8zm; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X0BJ56mxvzlgMVQ;
	Thu,  5 Sep 2024 20:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1725569251; x=1728161252; bh=sMcIOebllOR9DnZKv9LGAO8bsBY4SOYdYCu
	ZK5MT86o=; b=RKA6Z8zm+J4ZCz1dm+PwDLug56BMGO0RxDoto/LCpZGukQfTpxr
	vV5GA+sNssqZWSr45J+XjKlu/XFvkJx6TDQZGkNUuRqpvifsTD1Ee7daqpq43wiD
	9sGr+g1bpf0G3XPUV3uYAvTVHLUdX+ukOM0VLio2PNMKN6umfuGDgnSDerhxCg7M
	bVVk9p6HbuuUcn5JQWDHKLW15LZERP2KKE5siWCiDD/8sycPf9krocNURvaIaS/a
	i3gigwRl0OiQ936xKsYEeDAh6fyiZdjNWlFjK0yMDJye0eSLw9f1lONwlF1Uf2Fa
	D5JiO9V2vVzbEQkM1z6qMOHNtpKgGWQTMlQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id U9v4IKAsysPY; Thu,  5 Sep 2024 20:47:31 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X0BJ24tXBzlgVnF;
	Thu,  5 Sep 2024 20:47:30 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v2 0/3] Fix a lockdep complaint related to USB role switching
Date: Thu,  5 Sep 2024 13:47:06 -0700
Message-ID: <20240905204709.556577-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Greg,

This patch series suppresses a lockdep complaint about recursive locking
that is triggered by switching USB roles. Please consider this patch seri=
es
for the next merge window.

Thanks,

Bart.

Changes compared to v1:
 - Added two patches. One that combines the two mutex_init() definitions =
and
   another patch that introduces mutex_init_with_key().
 - Changed patch 3/3 such that it uses mutex_init_with_key(). Added Amit'=
s
   Signed-off-by.

Bart Van Assche (3):
  locking/mutex: Define mutex_init() once
  locking/mutex: Introduce mutex_init_with_key()
  usb: roles: Fix a false positive recursive locking complaint

 drivers/usb/roles/class.c |  6 +++++-
 include/linux/mutex.h     | 19 ++++++++++++-------
 2 files changed, 17 insertions(+), 8 deletions(-)


