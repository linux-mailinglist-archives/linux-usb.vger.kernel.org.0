Return-Path: <linux-usb+bounces-11197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC12905383
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 15:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 921561F239B8
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jun 2024 13:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A614E178398;
	Wed, 12 Jun 2024 13:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b="mLg0Lp+1"
X-Original-To: linux-usb@vger.kernel.org
Received: from shark1.inbox.lv (shark1.inbox.lv [194.152.32.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E81316EC0F
	for <linux-usb@vger.kernel.org>; Wed, 12 Jun 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.152.32.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718198383; cv=none; b=ow90ahxu5YslG0bnLvVLmMkOZbDA376nQGStmqUi/Tgkb0OeWseq8C49bWbzsSe5OZ/qbKf+fUFP240giJ0EmyXqJZ4cjeAevuGRl448NcN7Rhk+8My1tHIELUmnnMlnVewZ+NbOuU2MILuVySso7BkPGV4Rzltsar1VNnL9Ou0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718198383; c=relaxed/simple;
	bh=Yg07jVbqIa4EKi0yGM23fGn+NxynCOQbYK513GrXGU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pi2PkH+6EHe368MmOm6122/LSd8hnCcHmXwiFe0s0dmmMhdaCggHE0ZeD3SF6RniOeKn4M+NHh/RX1/5OXVDFNnIHR1KRnsTyQCTcH9waRY8V1oHsY/Z/m71cR+ar3Rz4XxkZdt9ppylWZbOJkHFQmq56GLo5kKK2mfkJfsqAls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv; spf=pass smtp.mailfrom=inbox.lv; dkim=pass (1024-bit key) header.d=inbox.lv header.i=@inbox.lv header.b=mLg0Lp+1; arc=none smtp.client-ip=194.152.32.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=inbox.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inbox.lv
Received: from shark1.inbox.lv (localhost [127.0.0.1])
	by shark1-out.inbox.lv (Postfix) with ESMTP id 4VzmNP1Tctz2d6MH;
	Wed, 12 Jun 2024 16:19:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=inbox.lv;
	s=p20220324; t=1718198373; x=1718200173;
	bh=Yg07jVbqIa4EKi0yGM23fGn+NxynCOQbYK513GrXGU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:X-ESPOL:
	 From:Date:To:Cc:Message-ID:Subject:Reply-To;
	b=mLg0Lp+12xW3KfOZ8Pg6lsiaaNznnYQzzhatU/Wnr/hy/lJZ0XzvGuSISeJptFmLU
	 iodXva1rBTj+dJ6Qsfrbgts0tvRIQiKg4y74+e/JGqdPvgbLX6mIxnxy6AtX324ipp
	 32xUPI/sU8PtYDNQa7bkbMxXjwbiojbNKF4as5Mo=
Received: from mail.inbox.lv (pop1 [127.0.0.1])
	by shark1-in.inbox.lv (Postfix) with ESMTP id 4VzmNP10GXz2d6Kd;
	Wed, 12 Jun 2024 16:19:33 +0300 (EEST)
From: Dmitry Smirnov <d.smirnov@inbox.lv>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Dmitry Smirnov <d.smirnov@inbox.lv>
Subject: Re: Re: [PATCH V3] usb: mos7840: Fix hangup after suspend
Date: Wed, 12 Jun 2024 16:19:03 +0300
Message-ID: <20240612131913.13856-1-d.smirnov@inbox.lv>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <2024061241-washstand-baggage-5789@gregkh>
References: <2024061241-washstand-baggage-5789@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: OK
X-ESPOL: G4mESnoDkHBYucK2NYVo+5Cay5bsFls/zlT3stssiwFUta+jx9N0cWyUGILnHwa7bg==

> You always need to send a new version, otherwise how can we apply it?
Than I'll prepare the fix and send it as [PATCH V4] in new thread.

---
Dmitry

