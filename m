Return-Path: <linux-usb+bounces-21190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B404A4988A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 12:48:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A2953B4838
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 11:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EADF23C8CE;
	Fri, 28 Feb 2025 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b="BCZZvp71"
X-Original-To: linux-usb@vger.kernel.org
Received: from outgoing50.jnb.host-h.net (outgoing50.jnb.host-h.net [129.232.250.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951B276D1A
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.232.250.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743317; cv=none; b=lOdohu31/kPLD9g+W7zaLgtPgdDB6KPLIRzW+rcqhWQjmcEVY0Kshrbw+zkXvjbHqHr9o3STLQ+rZuv5Pt2x/XBVPXX46uR5cQxVE7dAj+oWO+pnQ7XrjhRLt+p9pvWCup0k2+qjxhw1htGg30hMwj4ATodjzIwz2tkH7Za5xUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743317; c=relaxed/simple;
	bh=LnJAb5OtSiiPPpVmdSEicOxdfy335XXtHun9Lv2d8Bw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l3ZAuX9YCWvJFG8O5zDvFmZUIEjjYwPfzZ431TSImDqkeA0CJcW9z5umeSsGS6UomWK8MsqOH/tab4gcNH9mQn6knvtaGpnmMoBC7YSOVwM7suiVFZkNA22UBADA7tIQYWtW9zQgm6sFnNYcyAWdQd1YrEEQTMTgocgjV0/XAj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za; spf=fail smtp.mailfrom=coldcon.co.za; dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b=BCZZvp71; arc=none smtp.client-ip=129.232.250.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=coldcon.co.za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=coldcon.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:sender:cc:bcc:
	in-reply-to:references; bh=t+qwmUT3iOAm1DfPM+nbVN5TXLHXkSwi3Xte37fm8Y0=; b=BC
	ZZvp71/zOOVYDjSuRK4zNilXC6SOh5z4x4ODKD0PuCFE+i22A7GHriKyG7ntWtqohie/23NfAE5NX
	6PvFao1KOTv7eKmDoDFgQPsT6p4OIP/BaIvcjN5SXcjOcevY6PROzYqorMP2scACL8wiHBHxKYdpd
	8KcHLvdmquPgELdRPV/DgmHsPw0aHVhWYENCzrMBItovjT+1Ji8vPZ7u8D5NWW2I0HWu3uV7XcHRd
	Yv25o4Z+//Z2YJWXpmhZJB3VfqjUNQTx06SA2CjIHQTvBISKfffIP2NZWNwtqW3ZHS5Q3apai8YWq
	9puuJbuDK5IjBs9SxrV7ElRG+prWmbdA==;
Received: from dedi166.jnb2.host-h.net ([41.203.16.166])
	by antispam1-jnb1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnyr0-007yyK-Of
	for linux-usb@vger.kernel.org; Fri, 28 Feb 2025 13:48:32 +0200
Received: from [104.192.5.240] (helo=coldcon.co.za)
	by dedi166.jnb2.host-h.net with esmtpsa (TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnyqz-00000005vZs-2NXl
	for linux-usb@vger.kernel.org;
	Fri, 28 Feb 2025 13:48:30 +0200
Reply-To: funding@investorstrustco.net
From: Iyke Nikolas <avaril@coldcon.co.za>
To: linux-usb@vger.kernel.org
Subject: Re: The Business Loan/financing.
Date: 28 Feb 2025 11:48:28 +0000
Message-ID: <20250228112431.50B7C89D6484C268@coldcon.co.za>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: avaril@coldcon.co.za
X-Virus-Scanned: Clear
X-SpamExperts-Domain: coldcon.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@coldcon.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.88)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+CzanhUpQxxY0jGcn2Rs0cPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wAe3P5wnuBLT881sXQnJWLU2Itm39BdCc4FEP6OrUewhPm
 p87GC1OZvsh7yKER8sq3xHGjwY23W/fr1qIdwR0ceb4o0/MLsfRXq2B6Bj1eqIhJNeUYrwmMRp0o
 fTv2z6OWrRCR/TGJ+LxBEbBCS4VQbvH/y4TBKwDHfQa0wCenXC+SjAMhlxVTUP8RXDYi0U1YIUj4
 F63PyYSZSbT342KwRVEbXfJnI+gG5QvGXTtovK7VZqJmzCeHtqZ+QtMgTB0iLwRMaKsK8lAeAhb+
 aZDwTMQ3Kg3hL2oXz5A5E5R/dS4GkJ5hfB+qWugfDEytZYoACfRtBjLzEjgIZNLWhI/Mb7SOSczA
 6/BlLHspgKwfxkpFBMGtk0DHIsZm7eDIdidx3dBtceKX2dWiEm+7oHm9xBEeGmns8QeFADnQDTrf
 rq/iPB9nbD8ib8/LRKDL9uX6nH0SFAAL0wIn8kjcTporPPrEMEUywY28JQK/4tt3rRkgoL0bckEu
 e7jwJnlVscnY5Qx4fJOk03R5fJtf/Dv/9m9+uP0zyEETyQahh1k9u6fK30DS261NPJJTtvuBG/zT
 0zE4yQisjeYJnjZO5/L7oldr+s92CtmFaD32Yzf9EPMX+84YNLINQzZZlYZbmxAlS9YoHFltGqun
 dRd2vfQDxRcLZivEDcmpAbM9ZRc0AilfB1kGL3fSE2MONRlXMKtuCu4G2nFtWAVIvsCOu5FM/fu3
 x7erbsjFB4F58vtkzX1IXL2HuBms3UQozp/9cGXPgWmfwr5Ca8wcXc1evp7vaeNzMeYMM/qc9He6
 zd8kb2nrAUZxhra3hcJgPbkQnKk3ClTXlSfQV8rvfnHgqk4U1Gt/9ppEoh7u4mXKDwivYDdQSwbI
 5IDQMARnZ2/ixmby7m9xwLahPGY0/PEbdICFRgFnzGg9rgSSO4p0kGP/3qk3UfKQ9OIEeAN+Uhcn
 OZzPia/e3RTzWtZ565WlxfE2
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-Complaints-To: abuse@antispammaster.host-h.net

Hello,

Do you require capital financing or low interest loans to advance=20
your business projects or growth strategy? We can provide with=20
the needed investments for your business. 

Get back to me if interested?

Best regards,


Iyke Nikolas
Managing Partner
Investors Trust

