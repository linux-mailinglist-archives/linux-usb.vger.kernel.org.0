Return-Path: <linux-usb+bounces-25356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D44AEF6AC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 13:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E03DF3BB7B0
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 11:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10EA27056D;
	Tue,  1 Jul 2025 11:36:20 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201625A651
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 11:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751369780; cv=none; b=a0EZbrYkMbvKEFeo0wBKRK/rzXcwRtYkzZ/wiCtaV0daOyPSeqY1rC/6byBTDcQD1Zk95J0G++qCFPhk3BQ8LeP7nGh5L1qOvrcWp4mwEw2hq0+AOE8cCB2lUbbtHyRyPjuhdeySMrFTpxSuh+hEGiIJCh4DLQdKkC5ejRfECkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751369780; c=relaxed/simple;
	bh=vQADPTc5XoXuzi/Me+uZve5kiRdCDrl2giogeKEUDtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bY+lpJEEmryjy74usTcDKR36+/b4UptyEmbZqNJBlB5hx9kjX40vbce1RRWdLozRODie7SENoW/upnBJtZ2xCbW/faoCaxIlmQmH35/ELze3Fg2Fjtq1l30t4S65jpKL8IUYSLR+2bCPH8xbvkLq/+mUMb+n7u1MMsvtU2R0FVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 067394013A3F;
	Tue,  1 Jul 2025 13:36:15 +0200 (CEST)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v2 0/1] usb: gadget: f_fs: Remove unnecessary spinlocks.
Date: Tue,  1 Jul 2025 13:36:01 +0200
Message-ID: <20250701113602.33402-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1751369775075

Changes for v2:
Get rid of now unused variables.
I am sorry: I should have caught that in the first version.

Ingo Rohloff (1):
  usb: gadget: f_fs: Remove unnecessary spinlocks.

 drivers/usb/gadget/function/f_fs.c | 10 ----------
 1 file changed, 10 deletions(-)

-- 
2.50.0


