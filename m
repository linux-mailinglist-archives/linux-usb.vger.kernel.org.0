Return-Path: <linux-usb+bounces-27264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A4B346B0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 18:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EFB23BC838
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 16:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 894BD2F83A5;
	Mon, 25 Aug 2025 16:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qSnRd4nR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SokfILj5"
X-Original-To: linux-usb@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE662F0C55
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 16:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756137912; cv=none; b=mEfNuaP7StDtJpKtGpcmJbhvmgxrDmGV7qlKvAYqmqwqmunOzKXVp49NL4AgEHPlsP1j28y11pyE8EARYrd++FpoOA+RRetdX6lyrIl+5EVdFMaVhUcxy/EY4JO0/Xw0pCF78aQEoRrkKCNCgLr4KlYxItfQwrCjP+HtTZLzGRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756137912; c=relaxed/simple;
	bh=hxvSdtIgwxJNH7t8METDJICNpbM1CSVYeRrLTneSN1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlMCuWUPHlXJBPbPFxdjlO2MlMamS7w7hzSydyTxl8RJqPRJgLCIgNxJK5MNv3i1eGW5OuZtxnjfiyFC5Wp+yJd+HZmXnYirusHa5mvdb2O16visyrSC7mEGOLuNZhqgAP21EbcvZsZaIEEXEB/Ez0Azt6B/oRzFsq+bh0kuKIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qSnRd4nR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SokfILj5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 25 Aug 2025 18:05:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756137909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxvSdtIgwxJNH7t8METDJICNpbM1CSVYeRrLTneSN1o=;
	b=qSnRd4nRf4xP2mn8coxHM61VAi1ZPkQwdum/2tRTR+grn6e6Tt6ULJbXcFyEMKdMemNcTH
	/kj4jidlA1dY9VwuAtjhf7c8RNZ1rNLTZRfpmhZWg7JYdmFS6JBwJj1tx4NM1C6Mp7Q51f
	VytWtp5FqriZf522bq4dHvHw+yQnbklGfgFRU4GK+R+aZbDMdcVfIR0olyhTnJ2Sds+CqR
	gph0/crbjSUy5V2aXAt8IzfI4VNI5n3sHqfytmG2KmX2bMqXhieN56rRyUkiNf+3EX7dJm
	3Wali22c6w2mE4WY2IYO0+ahreLlFK7TqbV2/xge1eXOIo60PRcwQ/GoKjnDQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756137909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxvSdtIgwxJNH7t8METDJICNpbM1CSVYeRrLTneSN1o=;
	b=SokfILj5uDkuVE6pOdVtA8ZaWGfVI+JpTUnV191HZrsm9gIZIy9LfPF7CTNTey9e95lEFI
	PERWguAwl4qPumCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <greg@kroah.com>,
	syzbot <syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com>,
	Yunseong Kim <ysk@kzalloc.com>,
	USB mailing list <linux-usb@vger.kernel.org>,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] USB: gadget: dummy-hcd: Fix locking bug in RT-enabled
 kernels
Message-ID: <20250825160507.79o-FxpF@linutronix.de>
References: <0d6d8778-a45e-498f-9e31-1d926f582d7e@rowland.harvard.edu>
 <68ac790c.050a0220.37038e.0095.GAE@google.com>
 <bb192ae2-4eee-48ee-981f-3efdbbd0d8f0@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bb192ae2-4eee-48ee-981f-3efdbbd0d8f0@rowland.harvard.edu>

On 2025-08-25 12:00:22 [-0400], Alan Stern wrote:
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: b4dbda1a22d2 ("USB: dummy-hcd: disable interrupts during req->complete")
> Reported-by: Yunseong Kim <ysk@kzalloc.com>
> Closes: <https://lore.kernel.org/linux-usb/5b337389-73b9-4ee4-a83e-7e82bf5af87a@kzalloc.com/>
> Reported-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com
> Closes: <https://lore.kernel.org/linux-usb/68ac2411.050a0220.37038e.0087.GAE@google.com/>
> Tested-by: syzbot+8baacc4139f12fa77909@syzkaller.appspotmail.com
> CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> CC: <stable@vger.kernel.org>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thank you Alan.

Sebastian

