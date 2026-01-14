Return-Path: <linux-usb+bounces-32340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7014D208F2
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 18:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A48B3005F3F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 17:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976391E25F9;
	Wed, 14 Jan 2026 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="AaxY7tfn"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20716307494
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 17:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768411892; cv=none; b=BP1kQWiZ5cH5TVshBkGGjMykF95k6wIIZQAxqzH7L5pEz4bQBpymwcKek+snKCV6E+AxhGWgoStaz2m8RVBDw24pTa3E5JBjRLOKvHwSXGpzVr7GS3Ngf10AHRfl15oLqRVqeSuZ6oBexRXgDeMCGFQR+BuvW2rsk2bA/pfWIK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768411892; c=relaxed/simple;
	bh=ejwhFcDiVubKmUTMYvEWonwx6kfulx8UA93XLL0QL9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=U8vmvrEvcme0d/iXOuXicShB+mg7TxOJ3FilasUUQzAL0wBHaXMNz7YGtJH4NPGJjoPSzBtL+ty/k44WZ5bC1xPVJiz7zNzMJq39IU1Itz8+tqmVLG01ZQixuacgT7u0sUsFHkj9Vpz19QxuugMTgOEet8+8b43MoZnLgeGiLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=AaxY7tfn; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768411885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YPRVG2Kt3RIzXwQiUJV9LIgvxAOvSvPHT6ORBbUlgE=;
	b=AaxY7tfnwX2HhjTNbqdTaSETNtcnp69xmApYFC0xRLe1aYNrAkN36g4+U1K71jPkz/mZnT
	5XCGPSsZpGk6qK6lXUbZ/EPRL6GjsNdx10ERPBvdviA9nu2FPKWc4yyLCs/VVBvSbOB56f
	Rz9U6ZUh6HVlBVg5wN+5TYiwgJFe2Ou4ccK0yZARQ3E+DVrty8bjgmyaMOVeXWJW+WcGxK
	bTBr8PpUar2hX6gmqZGa+LKM0mNksI9B2A7OkD8s5IriaCnwQMQK7zhQpmPBGL08fEeDwY
	GjxemZpCwft0F+ZbxxFUht8HDLB/eXdiyfalUTyNlOZtIFUtWGxO7SYKfhkbug==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 18:31:23 +0100
Message-Id: <DFOHOZTANT92.38TTTMCKWID54@cknow-tech.com>
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: "USB mailing list" <linux-usb@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
 <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
 <DFNLGSUWJA5Z.3OJHVYWST2YFH@cknow-tech.com>
 <b9041d32-1eab-4428-ab2b-769daefdbdcd@rowland.harvard.edu>
 <DFNRUF2LUPH4.1493G2SYERZ7Q@cknow-tech.com>
 <b108b747-cc7c-4537-b9bc-b0862bac71ff@rowland.harvard.edu>
 <DFOEGOTI1AQ9.175GP7V1VK1XU@cknow-tech.com>
 <91fb697a-7bfa-4e26-85cd-40810a8d2be5@rowland.harvard.edu>
 <DFOFCN7H0Z10.1FAC3SN3TX79O@cknow-tech.com>
 <febe88e2-9abd-481e-af9d-3f0825ef204b@rowland.harvard.edu>
In-Reply-To: <febe88e2-9abd-481e-af9d-3f0825ef204b@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On Wed Jan 14, 2026 at 5:07 PM CET, Alan Stern wrote:
> However, I agree: 30 seconds is _much_ longer than it should take to=20
> detect a newly plugged-in device.  It should take less than one second. =
=20
> One possibility is that something involved in waking up the EHCI host=20
> controller from its runtime suspend may have caused the delay -- that's=
=20
> why I asked you to try turning off the controller's runtime suspend.=20

It may be completely natural, but I was surprised runtime suspend was
involved at all. So I'll definitely do a test by turning it off.

> Also, I'm not at all familiar with the particular hardware used by your=
=20
> platform for receiving wakeup signals.  It's possible that a GPIO=20
> responsible for this wasn't working right and that's why you were=20
> getting all those warning messages.  Another reason for wanting to know=
=20
> what will happen if you take suspends and wakeups out of the picture.

I think GPIO is involved with wakeup signals ... sometimes at least.
I added the linux-rockchip ML precisely because I (strongly) suspect
there is Rockchip specific part to all this.

Cheers,
  Diederik

PS: I very much appreciate you taking the time for this 'debugging'
session :-)

