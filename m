Return-Path: <linux-usb+bounces-8734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E1E89517C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 13:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82CAB1F23CB6
	for <lists+linux-usb@lfdr.de>; Tue,  2 Apr 2024 11:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1417065BD1;
	Tue,  2 Apr 2024 11:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="xHcrk9dh"
X-Original-To: linux-usb@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8EF60DEA;
	Tue,  2 Apr 2024 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712056207; cv=none; b=EPCOE8RQ4ovu9dXIPJiDM9f8kqa0UbYuKsXZ4kfMcVEg+jslle9CeCzQqou9rkuozWTBLabrcqJDYITvcpUq196AbJn7W0yR+NYVLnAi3EbcITbikQDS6wTHi23LvRREAdFxwlEanOlC2MtjsfJi1lCP9NRcAaxGY95tzOy8JKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712056207; c=relaxed/simple;
	bh=jgpgoq/QTgIKErhMo7+aVkeA14DdQgDE837Qa3gLBKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzF5mr2if/igi/sRXdMWcIy+ZkOsEC+TqNptkq7xhIdiIUvS+rzrtssiK/pG6KtfSeGk5UE9XjxSCobLy3av7T1cPntlyTn6JSpaTPiQrOHx+IGspoUFEg9dgMqklQiF6FUqKq8RU06DEfiAEfBjczKJW6KnghXpqtijEUMwtas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=xHcrk9dh; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1712056197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9qjDrVhPABDqcButy64rrklBE4MPlj4eblWi/uVSPtc=;
	b=xHcrk9dhMFWjShvEyQC94PfUCBu0ubhIl3Rs6L2ICTtjLNaVd0ronZkDkZM/BWAWFOv8g8
	Yyu19L/qDFf8gJxbzCB6+zQ7ewCvhWX+lBr1tEzV5u8vzjMCLJjGVZ3EsDuaT4C24vhuo5
	aJLkXWDFCIXUSipX2n1Ipoo0qfrxFj8=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 0/2][5.9-rc] USB FunctionFS DMABUF interface fixes
Date: Tue,  2 Apr 2024 13:09:49 +0200
Message-ID: <20240402110951.16376-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here are two patches that address issues that were noticed by Christian
when reviewing the very similar IIO DMABUF interface (but the FunctionFS
patchset was already merged at that point).

Based on 5.9-rc2.

Cheers,
-Paul

Paul Cercueil (2):
  usb: gadget: functionfs: Fix inverted DMA fence direction
  usb: gadget: functionfs: Wait for fences before enqueueing DMABUF

 drivers/usb/gadget/function/f_fs.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

-- 
2.43.0


