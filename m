Return-Path: <linux-usb+bounces-11051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D13901894
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 00:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556ED1C20BA5
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 22:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5EF4C627;
	Sun,  9 Jun 2024 22:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="iWqz16sp"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark3.inbox.lv (shark3.inbox.lv [194.152.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F124B208CB
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 22:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717973958; cv=none; b=jw7tcXgTbNmMdzwXQtrLz+Qi8YcY9CoViAf//1LkV4BvbYdVnDnwhUr0a4dlJ4SdDl0oiVSfX7K1rpQ9qZjCdPAx/tZpqxMQGlEGGecgnSO9uugTLFP+ww0YqvI+gqe5kbZwFfPSbbBhl3r0as7m/ozM1LUyo5CNkHogGu3Req4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717973958; c=relaxed/simple;
	bh=1ZNYob3TV8v/wdIdU6axJvcvSj8URlQb8ejg8tETTJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tiXuuFOvE0SQwIuCX7W9C0OraZCH4OKASo2omFT9MlULi1N1Il5AAEHeRFxz1VFoetew7ao7ljU7/2tm/Qc5FuAZnfDgaoshDENJnn3kJAT07hgioBP7aJ4JSA2xOsFDbrNxJ+ZV6/JxUjgMt5khpSfasVzpzGtPFstLC5J3i0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=iWqz16sp; arc=none smtp.client-ip=194.152.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id 4Vy9NX3zKxzMkv8;
	Mon, 10 Jun 2024 01:59:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1717973948; x=1717975748;
	bh=1ZNYob3TV8v/wdIdU6axJvcvSj8URlQb8ejg8tETTJI=;
	h=From:To:Cc:Subject:Date:Message-ID:X-ESPOL:From:Date:To:Cc:
	 Message-ID:Subject:Reply-To;
	b=iWqz16spMUG50Y5/xvt0EaVxTE5R4X+YB7mmIJ6k6ifDxq2x28fFkikI+98Kf1bEW
	 sa1+Dbn0JOYjseo8slLTUzsAFtMbOcJCpFVtg6kM57qkllGjjndLyAHJT6uwG4AMuY
	 XPMQ3YCN1hnIZ1a1q+agsw8wtMLxVg1G0Sth5vcc=
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4Vy9NX3vhfzMkvB;
	Mon, 10 Jun 2024 01:59:08 +0300 (EEST)
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4Vy9NX1WhvzMkv8;
	Mon, 10 Jun 2024 01:59:08 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: linux-usb@vger.kernel.org
Cc: Dmitry Smirnov <d.smirnov@inbox.lv>
Subject: [PATCH V2 0/1] usb: mos7840: Fix hangup after resume
Date: Mon, 10 Jun 2024 01:58:49 +0300
Message-ID: <20240609225850.3900-1-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: G4mESnoDkHBYucK2NYVo+4GXy9SvNC4uvCb5z7424XRdtK+yzdM1Ly+UB/ecFH7fbg==

This patch addresses a kernel hang issue with the mos7840 driver when
resuming from a suspend with a device connected to the serial port.

This patch introduces two new functions: mos7840_suspend() and mos7840_resume()

Tested with Delock 87414 USB 2.0 to 4x serial adapter.

Signed-off-by: Dmitry Smirnov <d.smirnov@inbox.lv>
---
V1 -> V2: Addressed review comments

Dmitry Smirnov (1):
  usb: mos7840: Fix hangup after resume

 drivers/usb/serial/mos7840.c | 50 ++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)


base-commit: c3f38fa61af77b49866b006939479069cd451173
-- 
2.45.1


