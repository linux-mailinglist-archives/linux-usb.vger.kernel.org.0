Return-Path: <linux-usb+bounces-29221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07FBD306A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 14:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05E43AAFAD
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 12:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4219826FA56;
	Mon, 13 Oct 2025 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="dtvhK58R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch [185.125.25.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF25262FCB
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760359490; cv=none; b=qATz9Qd741ZsqTEs/MpR8k+dT+NX0lf5IlkgJQgH5tr0N3CK7liCRiK8JLfCV2PE+u+4hjRo1Pm9r003EYE/TgXNzeh4+61IacwgOe62RgxeKup2EOJ8TcZ8JGlSPmg18k8oA04ptBWLTlZhkjhxDUe87t/vlECk5s5mJHHYBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760359490; c=relaxed/simple;
	bh=/5lpHV62O1DD1XW35M0JubSWh13R8zVh0c33QXl+OmU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Message-Id; b=Nwac87PznFNPfshI/ppZJ9RNZE4Z2UqEzbSgcO0OB7j34tXYa023HTOHNszHxJp6skPf791wgqVmSWtEzdx55CXqDKZuWa2JelH9ODI8HYBcnmtkviPNeWfSlnANYBY2HPmGIUkDOHpmFAhkAoxwteYgclyoCfOJd+RiSkK/IpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=dtvhK58R; arc=none smtp.client-ip=185.125.25.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4clc8S1BjKzmfx;
	Mon, 13 Oct 2025 14:28:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1760358520; bh=D4Mgqo3AP7rwsaVyE4diJ/fiJENu4iV8w2ryijxxR7w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dtvhK58RFE5v6j1Dl/hXpVFcC43K+PpVO+k3HjDLVt3NhyS9ieXPzDXUKnHYjsSZY
	 m1/ln9jveW8gWT+PYiALq47T+NxoLD+xEuQBEwKvAzRbGDnnV+VTS2/pDNsNdjArcu
	 7i92luFFx6Z3VIv5AB6ZD0OoLq1OyTiDX9ZI1sj8=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4clc8R4m1kzrtv;
	Mon, 13 Oct 2025 14:28:39 +0200 (CEST)
Date: Mon, 13 Oct 2025 12:28:39 -0000
From: Pierre Tomon <pierretom+12@ik.me>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB disconnection after mounting file system
In-Reply-To: <20251013104621.29418939.michal.pecio@gmail.com>
References: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>
 <2025100905-gestation-founder-3e70@gregkh>
 <20251009160731.58dd47bb.michal.pecio@gmail.com>
 <4cjC4c3F8BzrTr@smtp-3-0000.mail.infomaniak.ch>
 <20251013104621.29418939.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <4clc8R4m1kzrtv@smtp-3-0000.mail.infomaniak.ch>
Feedback-ID: :d3dee46c33acd70:ham:d4c4a9452bf4d5d
X-Infomaniak-Routing: alpha


Le Mon, 13 Oct 2025 10:46:21 +0200,
Michal Pecio <michal.pecio@gmail.com> a écrit :

> Does it work normally while it's blinking before disconnecting?
Yes, I can write and read data on the ext4 fs before disconnecting.
I mounted the fs read-only with `mount -o ro`, it stops blinking,
but still disconnect.
 
> What sort of USB chip is in this HDD dock (lsusb)?
Bus 008 Device 002: ID 154b:8001 PNY USB3.0

> Did you try searching for other reports about problems with this chip?
Yes, I did some research and found no issues, some say it works fine on
Linux with this device. I contacted the manufacturer, no response.
Also tested with 3 different HDD and checked it's not a cable issue.
Blacklisted uas module, same result.

I have the impression that the problem stems from the kernel and my
USB controller on the motherboard (not the dock). It's a USB 3.1 Gen1
Etron EJ188H.

Pierre T.

