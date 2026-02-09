Return-Path: <linux-usb+bounces-33201-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WD5VHlb3iWl7FAAAu9opvQ
	(envelope-from <linux-usb+bounces-33201-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:03:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D191E111736
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 16:03:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC91A317BE5A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 14:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C229437BE9A;
	Mon,  9 Feb 2026 14:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HcWQTxr4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2469437BE77
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648453; cv=none; b=PZAYgfbaJS9D9KANHGMrgk45esUDDeBa2r83HdIMBOK1yAfxtZiZipx0njRxNuznwHoAsDBoAn45x1h2aYV1+EcMWQ2gasSyjXGrAVRjmk1lUkjDVg8X98wAYThc8W/mhWTmh5JDJVPTnHQUgWiGOSof6+FcdAHM4vZHYEvP1Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648453; c=relaxed/simple;
	bh=p38Pt61WWnI/446NW3EDs/FqTgapnD4fxQmalZjM5hc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhT5SCaJ8mEPNE+7gkY23vALVTlQKw1BPnsfVlYtr2q4aXqq+rJ3F5jRKQd9/CJke0RJhL4FSp2FyECZs4jrB8e9SW7NMKYk8H55H7XHtlf4k/LjmSEc8vDMn4sMM4wjPcmFeapDU0+T1i1TBnIK7WtPCTyDfSgvc5nsyYnF+wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HcWQTxr4; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-896f6d4b6c1so19119076d6.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 06:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1770648452; x=1771253252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho//V7xLOKZYyWUOboKGJN9nZXZMUfKAgO5c4WVrjL8=;
        b=HcWQTxr4Fkat5ASfsOohELjnjBlqeasHLEgH0Syc7/l4VZFpO7aRpHL9sw8JxunpsF
         MCwguM4LAnRlZ+VzX3HRcpjVc5o1+8YJ5Us67T6vRvq0cNlANtr3SKD/k3kn8dNSOric
         hEFWyeY9DK1auSt3V0hPCY77kY4shHED9Io+No53mVxHE48t+SoRi/HhBnChao2Tw/GG
         diPUWbftbqdQtkqztQJTo29Mtw1Hv3Vi5i/6+P7611ngI7U1mWMOP0TrITrlBaANzZtN
         lf/ZvHel65UL670TDF2+vuNyKiERcIwHKdoNmmt4Sz9FIUedWT6lAEPdu5lpAMtBS4E1
         ULCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648452; x=1771253252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho//V7xLOKZYyWUOboKGJN9nZXZMUfKAgO5c4WVrjL8=;
        b=nSNNglTWkk5KPn5WV8qrXm6jJ78nKwFqAtgzPEo0B7KfCdL4UDo+YrEzy1qDSwevQa
         hijibmD2jh9NFqp24AewtPUeZ5baqtxm9bPmPbOQRxcSpO0Arh8xv9Am8bhw6Hyp4fPj
         SK6jygw8R0q1lYYH+OSPemFdM7TCETUYHts8uY4nmzSbTNEWFG+H2DhCCaGhTleh2wv+
         ML/7dAI8XeRGTr/WCR2iMZxRNBUqqW87647haJJv0CwT1uNZXHWBPOiikOLpjP3xzy+X
         fb74hbPfpvzbV9afEzDsbDDS90fVSoCYSxr5Mhs0WbBV/72t/CJMF+r96gWJy96hqM7W
         HtdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrZpvv07+IM9qvokXb5SPZAklUxaJz+1WDhJqgvq1d6fWc1oOQPyWhOCYlOK7l5W/wefujFI2J8tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR89jc3MpJb2oqSslRIkE2bLWeThaKhZxGbQmQvuJ2XuVNx1eW
	mXxWseUh+jKp8rxOhf6FMGFSL8TyYcTLqtU6MVa+1yG7ewGWncDVl/NAPiFJ8+dz0w==
X-Gm-Gg: AZuq6aKUmYZDVD0dhZAplsKc6GzPTw2MPrh8/TE+NqsH1f/zOtEK/7+SDUEEy56wBrG
	mrJLicxFc7U9hbm2fMa6i5RtwFGaPP0oVsZXrZrKcAQXALu3wzKipR9vNPh8i8p1eu+p3KzQxow
	AJEf3xEc6HUDE5elwU9Yng4h9SS6FDCF0FKMu9BykjJa1HMXEXB2H1n7mHgAp5wYPkrgRhXwXN1
	gKiAzqrsy9Fbj0Au4bfiKn/cFAu0dlFKV/RUSXlc9wzQOxTEwXsnnAb7mFmwPiZaT6pjH6fUW4/
	LKtJd+Xsl/2n3L3LiqrjAd1saMEaq969PiGo7lgRkFueJswHmYZbz8ovEK+U1tvWfL6k8PKLeKY
	vHyRClQia4f7YcbgOadAHxyvcjziGCsD45kIN8iY3vBBxz9m1x4vKdPS8yiQEDbNqlmWZIJgZrL
	wQH1kIrA5fCeYubNTebAM3sdD8avzJ1g==
X-Received: by 2002:a05:6214:1bce:b0:894:835d:b112 with SMTP id 6a1803df08f44-8953c86c112mr172690676d6.40.1770648452057;
        Mon, 09 Feb 2026 06:47:32 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf7be4366sm821652985a.16.2026.02.09.06.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:47:31 -0800 (PST)
Date: Mon, 9 Feb 2026 09:47:29 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Liam Mitchell <mitchell.liam@gmail.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbhid: tolerate intermittent errors
Message-ID: <d1cbfe87-5097-4630-b848-4575ebcf3b09@rowland.harvard.edu>
References: <20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com>
 <a31763aa-77af-4e13-8708-b007ed53277c@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a31763aa-77af-4e13-8708-b007ed53277c@suse.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33201-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: D191E111736
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 11:06:03AM +0100, Oliver Neukum wrote:
> On 08.02.26 18:10, Liam Mitchell wrote:
> > Modifies the usbhid error handling logic to better handle intermittent
> > errors like EPROTO, which should only need resubmission of URBs and not
> > full device reset.
> > 
> > Reduces initial retry delay from 13ms to 1ms. The faster the URB is
> > resubmitted, the lower the chance that user events will be missed.
> 
> Hi,
> 
> in this case I have to ask the obvious question: Why wait at all?

Because of the possibility that the error was caused by transient 
interference that might not go away immediately.

> It would seem to me that if you have spurious or intermittent errors
> the right time to retry is immediately.

It depends on the cause of the errors.  In any case, a short delay, such 
as 1 ms, should not make much difference.

Alan Stern

