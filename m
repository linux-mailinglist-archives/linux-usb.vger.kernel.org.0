Return-Path: <linux-usb+bounces-25741-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B078B034A2
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 04:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D354A7A280D
	for <lists+linux-usb@lfdr.de>; Mon, 14 Jul 2025 02:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243811DF26B;
	Mon, 14 Jul 2025 02:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="VELBJmQh"
X-Original-To: linux-usb@vger.kernel.org
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8298678F54
	for <linux-usb@vger.kernel.org>; Mon, 14 Jul 2025 02:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752461368; cv=none; b=M9TmzfW9uQn7s3IyIpbPouk34b6idu68TlhosIyf6reDkkFWW3/HvaedB5OzoAwIVoGOh7LRqa+ckPTXwAVF27E22f8j/xiL7Q1ReQ9qMMUMJ8Vin5VdrkH0WQF2VPrZFU2bC1O3RGMKNpu3Uoyro7kDk5370l2wIdZmCllanac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752461368; c=relaxed/simple;
	bh=VSVbUMc6mDbmJjYAY/5z0TMIdVhDUf4VoxFheGf6NwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnoDPMJnZOJ65poQjTnEgW9l9j6YTAIBTVirZyq6UPuCjGBsLk3UQuv1YqI734SH/gaX8VfGB8ajLjYGV0F1d4OMwOyh3qaKMsdmTLZwRO0YwgLxWUUUJDdcbJwMS35YsKNwLSAG6KMZeaP5l48rRiNkvK+59e6DWIVvqKv83ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=VELBJmQh; arc=none smtp.client-ip=202.108.3.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1752461363;
	bh=GMaWGcV4ODZf5yVjbrXFE/lU/1m+YQcTbnacYAlAafo=;
	h=From:Subject:Date:Message-ID;
	b=VELBJmQhqWYLk1AhlkuNmH2M601N7J+Fi7ayO4pvB3kB5aFM7Xx7DLqkvEOx779M9
	 dHWLoLoMj2QgwBXao/kqkSsF9dgFrlfZcJx1yOcGWQRG4qvnP5365z2X332aVq16WZ
	 4d5nfifA8L53wH48gEjTe4Dgezd/6NQUQ8iOZ4fY=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 687470280000305A; Mon, 14 Jul 2025 10:49:13 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9860704457077
X-SMAIL-UIID: E295B15E201B46BDB669C3E5CB240984-20250714-104913-1
From: Hillf Danton <hdanton@sina.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	syzbot <syzbot+fbe9fff1374eefadffb9@syzkaller.appspotmail.com>
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KMSAN: kernel-usb-infoleak in usbhid_raw_request
Date: Mon, 14 Jul 2025 10:49:00 +0800
Message-ID: <20250714024903.3965-1-hdanton@sina.com>
In-Reply-To: <e8fe21fa-9a2f-4def-b659-063d55a40f3d@rowland.harvard.edu>
References: 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Jul 2025 15:19:34 -0400 Alan Stern wrote:
> 
> Try again, but with Benjamin Tissoires's recent patches.
> 
> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid c2ca42f190b6
>
#syz test:   git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git  c2ca42f190b6

