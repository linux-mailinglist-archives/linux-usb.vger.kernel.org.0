Return-Path: <linux-usb+bounces-33814-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAohDC5Mo2nW/AQAu9opvQ
	(envelope-from <linux-usb+bounces-33814-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 21:12:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A101C8047
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 21:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94080312CB9C
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 20:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B40821E098;
	Sat, 28 Feb 2026 19:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="j0XjIeHX"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495133E373;
	Sat, 28 Feb 2026 19:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772306425; cv=none; b=SMXxNZgJHCLomizdJ54Ujqb1ySEwOD8NFPPhTG48XY5YrMnxv4NIPcktrSst0T3TX2vQyWw7wR5kL+b1SyhG1djCAzd+pnB+j3RACm8SRI1sZAVQ/Q8gg/x2UQC88RdSrDHjyMjCVCcB3Sx9N89P0ON0j3bDUWxdUIXGnaYW9UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772306425; c=relaxed/simple;
	bh=dDGpUrl87b5xf1YKZJMvdxuyOtP++1rWVHdTKXe8ihU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HyCJpNM1OKYfrLQICH3izdbKoL8ruwh+6kjRkzL5mInnKkSEOy9ItRB4LoQDfYhm0Kv4QzRtK/K0uXMENTEt+CAIJDCkHO6x6yL1eKvlxnn1+Vvu84yDLGBT5dGxk/3aiOQqWPPKZwEWyxrrh7KZ6rmJaT05pZRl8dexn4FMMVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=j0XjIeHX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ihqv59RRqsjyZv7Blon5v2CBQ+pMH00uNt5Hkmkjy/U=; b=j0XjIeHXvO4SGHZkUJgug0eV0I
	HqkVdFhxa2R5D+qVEKuEJgRvZ+u7wv+wAZF22bbhuIdzbun7QlCBuenukF3/9hkwKE4RmD9NUh1MQ
	d1QmihF5+hzg+zOT6INjolegQcMPnVdb5A2XvhrB6qYKZ7akiJDoSSdRVu/WP89V0QlY8Ta7B+8U1
	uwGZLlC26WbHjV5CFArZ65pGgnikVV9AwaX6sPFvIXra25BVjip7Le7AwSgVl/NqgTmXEasG/7kqY
	Gp73atXAtsKZTciDxDe7zewbNaeLH2HJEiepHfWCKLC0JLH77HO9OXlmeP6eJ06Q1UPZ63XGY7uZg
	r4vw8qNw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwPrJ-0000000ACGe-35o8;
	Sat, 28 Feb 2026 19:20:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: ohci: ohci_pdriver.h: fix missing kernel-doc comments
Date: Sat, 28 Feb 2026 11:20:12 -0800
Message-ID: <20260228192012.2787573-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33814-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,harvard.edu:email,infradead.org:mid,infradead.org:dkim,infradead.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E7A101C8047
X-Rspamd-Action: no action

Convert comments to kernel-doc format to avoid kernel-doc warnings:

Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
 not described in 'usb_ohci_pdata'
Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
 not described in 'usb_ohci_pdata'
Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
 not described in 'usb_ohci_pdata'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

 include/linux/usb/ohci_pdriver.h |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

--- linux-next-20260205.orig/include/linux/usb/ohci_pdriver.h
+++ linux-next-20260205/include/linux/usb/ohci_pdriver.h
@@ -23,12 +23,14 @@ struct usb_ohci_pdata {
 	unsigned	no_big_frame_no:1;
 	unsigned int	num_ports;
 
-	/* Turn on all power and clocks */
+	/** @power_on: Turn on all power and clocks */
 	int (*power_on)(struct platform_device *pdev);
-	/* Turn off all power and clocks */
+	/** @power_off: Turn off all power and clocks */
 	void (*power_off)(struct platform_device *pdev);
-	/* Turn on only VBUS suspend power and hotplug detection,
-	 * turn off everything else */
+	/**
+	 * @power_suspend: Turn on only VBUS suspend power and hotplug
+	 * detection, turn off everything else
+	 */
 	void (*power_suspend)(struct platform_device *pdev);
 };
 

