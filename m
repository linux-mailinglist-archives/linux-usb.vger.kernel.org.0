Return-Path: <linux-usb+bounces-10843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A107B8FBF7E
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 01:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CAB02883A4
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2024 23:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62AF114D710;
	Tue,  4 Jun 2024 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="vMHZPR4s"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark3.inbox.lv (shark3.inbox.lv [194.152.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B2414D2A4
	for <linux-usb@vger.kernel.org>; Tue,  4 Jun 2024 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717542050; cv=none; b=PpOeTwTrKjALBPQZdPN/8ReXMBdrmwnjo/ChfdmSMVRLWfRfkOzepn4y1K1ffBRI5z41CWPev6Gk2bfH7XayHwEdytHHz592f5cjBeYx/sRVCbS52Aiyc9rYSiJ8bBT37xUMIFdP/5XUDw6Crfm3mXuyunXDi9HGCMK71wvV7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717542050; c=relaxed/simple;
	bh=S9BYh2fqGinPY2WA5gulL6y4xgXnsU11LbOcdXBvbaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPIt/BZGrerhUP6/+0vYST1AzQcuiW6zvv+sTCb1mpjPZXKNCB1GPV+xF9KDPNYLq9FuvebnpZkW0fmmLEi8HxlCw94QVpjC8zxjgrGfcT70yUIVjUVYhw8aClkBYKO0ugCzSX07FJt5eXbBZqCp8AK37K45MviLpGJrJ8iy9A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=vMHZPR4s; arc=none smtp.client-ip=194.152.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id 4Vv5XH3ZfWzMkvc;
	Wed,  5 Jun 2024 01:55:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1717541711; x=1717543511;
	bh=S9BYh2fqGinPY2WA5gulL6y4xgXnsU11LbOcdXBvbaw=;
	h=From:To:Cc:Subject:Date:Message-ID:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=vMHZPR4sbtBAp5bkSZ9Gcth11t4L4XJ6N5deMuCaC/fWNIy5er4r8DQtXii9cIgsZ
	 kryqJFV6UEd5eslWIDpt07+56SJMK415qJ1laALEFA9mIKuuAmCLMEdGTHrytLOqlx
	 aFzDd+wa68b3Ysf92QFVCYIiruh44S18zvVzF8t8=
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4Vv5XH3WJfzMkyk;
	Wed,  5 Jun 2024 01:55:11 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4Vv5XH136qzMkvc;
	Wed,  5 Jun 2024 01:55:11 +0300 (EEST)
From: Dmitry <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry <dimonija@gmail.com>
Subject: [PATCH 0/1] Kernel hang issue with mos7840 on resume from standby
Date: Wed,  5 Jun 2024 01:55:06 +0300
Message-ID: <20240604225507.6801-1-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: EZeEAiZdmGUkzM2/Kodt5OXswNKxSjhQsCXmvc49lRRFz9PMu91reWaLGobnBwO9bg==

From: Dmitry <dimonija@gmail.com>

The mos7840 module causes the kernel to hang immediately after resuming from standby. This issue occurs only when a device is connected to the port during suspend.

Dmitry (1):
  usb: serial: Fix mos7840 resume from standby

 drivers/usb/serial/mos7840.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

-- 
2.45.1


