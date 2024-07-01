Return-Path: <linux-usb+bounces-11821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6891DF6B
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2024 14:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 831931F2484A
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jul 2024 12:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A4A14B97D;
	Mon,  1 Jul 2024 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="V3hYOWf2"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark3.inbox.lv (shark3.inbox.lv [194.152.32.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34826BB33
	for <linux-usb@vger.kernel.org>; Mon,  1 Jul 2024 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719837325; cv=none; b=nhSxq035U+gZC6VnTBg4DTNDoThgiFnpNzL0Hi0ugtrxNZZB31tQ2O/BVBi9hVVBiKf/JJJIV/mPPneO9pW0acLcvWvuYj6l2NqsXA35a8IKU0fPJ3R+iESdmhT/71IuobcPY86sJG/U/CaMHHVEB/vedfPoY+Z/Q5qnaqz4tzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719837325; c=relaxed/simple;
	bh=d6iQRsbW4HOdZ+2IUpqrmV4MQAwypxkgPd+rbrtg+1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5AWuJ4j71BeUBkGJdNwSp6cygOeN9dD3rjhNVkkKV/Vf5lXSo2jea+pvXi5Y//UMSI4MGYiJTQ3crhHDhvXsGn7b+EBI56gK3bgarQWr74PST7NzjK2KtWEyyg1NX1OzSqTwlStnbrSjKz8t+ZorswIeG3l3nK7bujwCgUz2uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=V3hYOWf2; arc=none smtp.client-ip=194.152.32.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark3.inbox.lv (localhost [127.0.0.1])
	by shark3-out.inbox.lv (Postfix) with ESMTP id 4WCQMs0nvszMl0k;
	Mon,  1 Jul 2024 15:29:29 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1719836969; x=1719838769;
	bh=d6iQRsbW4HOdZ+2IUpqrmV4MQAwypxkgPd+rbrtg+1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=V3hYOWf2JUnq6VJ3X5uJ8tsZnkSJU2kAcUuKCbSqrPQtduybVmHLolNOIlZAltt47
	 gw2oxYMnW+1OSGMRf2RpbBts2A/rUEioBSAtdPVa+l98MfXquZMuCgixs54UNWJPyS
	 udb0iMlxHwfxJZzMyp+URnR6EDn74oWvpLCbqwrc=
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark3-in.inbox.lv (Postfix) with ESMTP id 4WCQMs0HJMzMkw0;
	Mon,  1 Jul 2024 15:29:29 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Dmitry Smirnov <d.smirnov@inbox.lv>
Subject: Re: [PATCH V4] usb: serial: Fix mos7840 hangup on resume
Date: Mon,  1 Jul 2024 15:28:56 +0300
Message-ID: <20240701122909.54840-1-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240614224556.23215-1-d.smirnov@inbox.lv>
References: <20240614224556.23215-1-d.smirnov@inbox.lv>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: EZeEAiZdmGU/2M22KJpl7v3lxN6tV14/zlT3stssiwZUt7LCst1zeGmRGZiNag+6bg==

Are any further steps required on my part?

---
Dmitry

