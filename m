Return-Path: <linux-usb+bounces-4604-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFCB81F7E9
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 12:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDE13B23670
	for <lists+linux-usb@lfdr.de>; Thu, 28 Dec 2023 11:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C2D7461;
	Thu, 28 Dec 2023 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=freenet.de header.i=@freenet.de header.b="OeelMpbE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout3.freenet.de (mout3.freenet.de [195.4.92.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343206FBE
	for <linux-usb@vger.kernel.org>; Thu, 28 Dec 2023 11:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freenet.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freenet.de
Received: from [195.4.92.127] (helo=sub8.freenet.de)
	by mout3.freenet.de with esmtpa (ID dfk1976@freenet.de) (port 25) (Exim 4.94.2 #2)
	id 1rIojB-0079hI-P1
	for linux-usb@vger.kernel.org; Thu, 28 Dec 2023 12:39:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
	s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:In-Reply-To:References:To:From:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=j3d/xTC1kJYa9W9HfCfzkxX2ovhG+AtgLd3j6YZICcs=; b=OeelMpbEOIi+LWXXZ1hZ3+5mPj
	NqA5qApai4JwJgO9rCFSzLoOrfXvhqPC5WQuJRR9A7ZCk7Ozm7Q+ciGKrMiUKfYPYwf8J+DEFUvMq
	spSj4chlj9G8G0Au8XGzzM/8kCHgvma8D8hy/Ue3cFfvOBCG7wSrbaoffiPt/p42PZqbf3gvLTdZg
	NZbdiSM5cfdC5GGz/0FSkSOyx5S5uYbalmPR7q6C8/NY3cSOw9Nm6XUK/02PbbGsMhhZveirqRFkU
	JhXFOmUK5tFylDbdjQ+Xj3yjP5MDmeUyvHDxU8GzzuL744Mzqx7h2rpXSr7uPMB+/PC56S7ZiLJMP
	kzOxapMQ==;
Received: from i6dfa2517.versanet.de ([109.250.37.23]:49296 helo=w04)
	by sub8.freenet.de with esmtpsa (ID dfk1976@freenet.de) (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_CBC__SHA384:256) (port 587) (Exim 4.94.2 #2)
	id 1rIojB-004Y5R-G8
	for linux-usb@vger.kernel.org; Thu, 28 Dec 2023 12:39:05 +0100
From: =?iso-8859-1?Q?Daniel_Kr=FCger?= <dfk1976@freenet.de>
To: <linux-usb@vger.kernel.org>
References: 
In-Reply-To: 
Subject: question to usbip linux kernel
Date: Thu, 28 Dec 2023 12:39:14 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAC8Whre1Kd1NmUKQc/8GBzMigQAAEAAAAPBa3siTwcdKkSFhjU2/+TwBAAAAAA==@freenet.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ado5fno0j+wRlZn3QsyX3J7y7KT49gAA/AJw
Content-Language: de
X-FN-MUUID: 1703763545F1429DC793ACO
X-Originated-At: 109.250.37.23!49296
X-Scan-TS: Thu, 28 Dec 2023 12:39:05 +0100
disposition-notification-to: prvs=07268e1723=Daniel Krüger <dfk1976@freenet.de>

Dear Mr. Kroah-Hartman,

on github I saw that you are developping the usbip project. I have a
problematic issue here when connecting a hid device (connecting from =
linux
to linux). This issue does not exist on the windows server version of =
usbip
(usbipd-win github project) where I also contacted the developer for =
more
invastigating, because this developer has a big knowledge and also had
solved such cases. You can find the open issue here trying to detect =
what
causes this issue:
https://github.com/dorssel/usbipd-win/issues/816

As you can see there, I already have attached usbmon captures too:
https://github.com/dorssel/usbipd-win/issues/816#issuecomment-1870343829

Perhaps the developer of usbpid-win project has given an idea or answer =
to
solve this issue:
https://github.com/dorssel/usbipd-win/issues/816#issuecomment-1870301129

Eventually this has to be fixed in
https://github.com/torvalds/linux/tree/master/tools/usb/usbip
or here?
https://github.com/torvalds/linux/tree/master/drivers/usb/usbip

Could you look at this issue please and tell if there is a chance to fix =
it?
Or is it possible to build/compile an own version of usbip server with =
some
code fixing and if yes what file should be affected with a fix in which =
line
of code (perhaps it is only a timeout issue and needs somewhere a sleep =
of
some milliseconds after the attaching process)?

If this issue has something to do with a timeout to set after he =
attaching
was done, one can think of a new parameter in usbip command which tells =
to
wait some milliseconds to wait.

Regrads
Daniel Kr=FCger





