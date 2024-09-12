Return-Path: <linux-usb+bounces-15056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6BB97746D
	for <lists+linux-usb@lfdr.de>; Fri, 13 Sep 2024 00:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C03A285B97
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 22:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D46F1C2322;
	Thu, 12 Sep 2024 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="mjpkICAm"
X-Original-To: linux-usb@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6758D1C2DB3
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 22:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726180821; cv=none; b=NpJciXHFnhzNLzyuTn4Ufa4m+1MvAQAA2v0jiPQTNhGgdvRl0qysxa4BzGhPVA/eQERaHLrkMPHf564H67gGpY/vwqa71Tw83UadNQT3fEfD7JDfJtAS2Rkh/HqDPBLxvdBBte3dCQKDVQld0l/L1Ko2pdwuWidjCzZVXe7pqXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726180821; c=relaxed/simple;
	bh=ZsFxiWO3/D5RQ5MjC+1teHPVqWUsvpGnCvRNqD9HDcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NNs87AspklUvd4DhqdDW26rIJmavGcXfiwvH+BLaoyHMO6G0+TuX+jhJe/CeTzVGooTRwQKU/XlzCP2AI88PtH9apEqfD0o7cK67rlqw1kYIQ10xo156jDAaBa97/KGmOtijVBpFhXFyLuy3BCpnvOdhOcY8P6h9NohLt6xgzWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=mjpkICAm; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X4XSz5KkBzlgMVm;
	Thu, 12 Sep 2024 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1726180817; x=1728772818; bh=e4HuWgiUPLqX3HlcrGB60GHrArXX9+fNyYR
	1AxbnbjY=; b=mjpkICAmB28mBWvYYS5tKShCJRCJ1SPHc8zxREoH39oUTIdsIu9
	z0QfaiU1LXV5uTLwS/hYBgJEm3Ew5gl3JN58EtmHr94c3CXREBG0sxxU315eSnFo
	lgjJr7bL6UMlC28pPH3GeFpwufQ8peOGtdQ/jPv4RzmWpioQzcFT/p4y38unIADn
	KGgp7Jy2NMvdup1XGYVWn7Byn5+mmOV34lHVwm+Qu97BjVu+6ErON6w5Ip55ETbq
	Jz57O254nwgJ/kf9SgeVwOwkG6XcHEm4dKdOhuNwkJMaNGNJ4uEowYCJ1x4w+r2K
	rQoip1kXF9hDTnCiJqiJru2MAECsAr13XYQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id KfbEmWJz9aKD; Thu, 12 Sep 2024 22:40:17 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X4XSw5Gs6zlgMVW;
	Thu, 12 Sep 2024 22:40:16 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH v3 0/3] Improve a lockdep complaint suppression approach
Date: Thu, 12 Sep 2024 15:39:53 -0700
Message-ID: <20240912223956.3554086-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Greg,

This patch series is intended as an improvement for commit fc88bb116179 (=
"usb:
roles: add lockdep class key to struct usb_role_switch"). Please consider=
 this
patch series for the next merge window.

Thanks,

Bart.

Changes compared to v2:
 - Rebased this patch series on top of Greg KH's for-next branch.
 - Left out the "Fixes:" and "Cc: stable" tags.

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
  usb: roles: Improve the fix for a false positive recursive locking
    complaint

 drivers/usb/roles/class.c | 14 +++++---------
 include/linux/mutex.h     | 19 ++++++++++++-------
 2 files changed, 17 insertions(+), 16 deletions(-)


