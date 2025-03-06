Return-Path: <linux-usb+bounces-21476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 814AFA55C0E
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 01:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 810E73A56AA
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 00:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89570748D;
	Fri,  7 Mar 2025 00:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=delugo.co.za header.i=@delugo.co.za header.b="VIk8V5VC"
X-Original-To: linux-usb@vger.kernel.org
Received: from outgoing1.cpt4.host-h.net (outgoing1.cpt4.host-h.net [197.189.247.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC463CF
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 00:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=197.189.247.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741307819; cv=none; b=rLbMkv2TOpXu2MQa+4TNb2UC/1RcF4nn70AWVHpITeg8cAgZLWM6x4nypjcEelQd2l11AadcLvxLAoQJAmY11zQGqkSOjGhUpx/6EDEnJmpncAggvZLL6z19zksKKOVlQswoTcA0bC0/dCrnFWo+cRXQmhx/iCFKj0+M48cVAek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741307819; c=relaxed/simple;
	bh=UOdy1uc1Ja6Ouzx9Gp3orqw2OLpxN4Hd+lHG4CKFzvE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kpnZsxJa2Hjds2Vr3xW2xfchxPfspwAz1tkumCx6UBoTEL7qwoEqAZGDPqA6wrt/eVy/T7zM3I7NWaTlOR0WxQ8aJM9e8JN1Ol2SY9qxua5V5RTfblh9cVHzFaY5Ya8pOnMsRuoiEq4HrfIpHLwFd9zEdcgGYn/66L8sfU7FkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=delugo.co.za; spf=pass smtp.mailfrom=delugo.co.za; dkim=pass (2048-bit key) header.d=delugo.co.za header.i=@delugo.co.za header.b=VIk8V5VC; arc=none smtp.client-ip=197.189.247.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=delugo.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=delugo.co.za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=delugo.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:sender:cc:bcc:
	in-reply-to:references; bh=UOdy1uc1Ja6Ouzx9Gp3orqw2OLpxN4Hd+lHG4CKFzvE=; b=VI
	k8V5VCkGWbwCQLh9b8oY8TfKrSoCaBYBAIQOZUm6t68mHi+xjzoyYyIwweLRzXOjyuPBBsRUX33MY
	yxRisyaiJqXO6nC2vq5rKHpKxmQPHgnMK47AJYO4dyWXdXKa1nf6H8UdXCvlextYeS6cTG7kra2oS
	3KaO7aO0hELliHLa2L9xRO0e+s3Q2p5eEsWjzTwbUVPhhM6LSRiJ0GSwepn3dd/lerq0c4HhloEyV
	0aLOBYZYCAmqIal8sLqgg/B+5KAUslm7VxzrG47ccoMJe/s0qtvenACu7TyrgrL14pdd5PGz993wp
	u/Qor8ct0fuTtiIYvEKyz+zByytz7byg==;
Received: from www46.cpt3.host-h.net ([197.221.14.46])
	by antispam1-cpt4.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <orders@delugo.co.za>)
	id 1tqK5q-001NUW-Ag
	for linux-usb@vger.kernel.org; Fri, 07 Mar 2025 00:53:31 +0200
Received: from [104.192.5.240] (helo=delugo.co.za)
	by www46.cpt3.host-h.net with esmtpsa (TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <orders@delugo.co.za>)
	id 1tqK5p-0000000DoEu-2Yuk
	for linux-usb@vger.kernel.org;
	Fri, 07 Mar 2025 00:53:30 +0200
Reply-To: barry@investorstrustco.net
From: Barry <orders@delugo.co.za>
To: linux-usb@vger.kernel.org
Subject: Re: The Business Loan/financing.1
Date: 06 Mar 2025 22:53:28 +0000
Message-ID: <20250306223012.B1BCD0CCD6141FE1@delugo.co.za>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: orders@delugo.co.za
X-Virus-Scanned: Clear
X-SpamExperts-Domain: delugo.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@delugo.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.75)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+5DhM0jw86KsbkaGfFMuQCPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wAe3P5wnuBLT881sXQnJWLU2Itm39BdCc4FEP6OrUewhPm
 p87GC1OZvsh7yKER8spgIIBy+ry+jilho6aMzblDeb4o0/MLsfRXq2B6Bj1eqDD4K7StLTuqEF9y
 eNim1jV+hJyAsgQN3+fJ25MXybLTUK8SYXIQrp7xzRip84U4OwRo87oeATC+hGtbNyLqD7/YM720
 mpXIX4fbAqVWiUEMYlwzjvDZ/FkpvR7cwSxN+RTHswbbB/ha+ZWrSAi8SkwqWAikMcSxTAWn8RCv
 ieGEzRrIdLp/AwmQcey+hPKVq9dnf3S1NcNv3U2dp/UbPvviEnzvvDcGs5qmm9XDE2pdJqvyYkhT
 hwsslykRZitI8icIFYnZsBkzvNJDT1vaZMrr4xH02iXtFm4w0sCOFbA4fwJOVDCkeSWm5+LqlnjK
 VXjpYNeJ770wY8Cv58UhX5OHiBSoGdSAwB7sMnqRmZNfcesLA3GlTLthqqp+mHWG0CxaRQsif/YU
 G8XfVQduyd16EipRzMVZ5LqwTx7Vvn9SVpfQCjlf31OWLN2NaNeFy2cMkdcBYI8cD/9SXtnMq7wb
 rhba46IXa0qNKt4H52rNeJV6TW2JFJoF0ZF6TK/vP2RxH5J1VPPVdw38+AADOBcXlqtWoZXfDqNX
 VGm4yZ4d/OYnGZUQnca3k4Ez+h60/3A0mGHeGSZcpQEwQX1AA1EVHfNToDFlxTUwUA9PUHUQ2XKT
 4BCSi2w8mgvy3S772KNdiwnzjqOLaqSNtkplMDn6VQfb/c2NIfGrBGJmxhrCYfBTpIHLvTQd5zMm
 bnRvO8FvvUtaUwtwq1GZWRVxIYqyT1Pe05+1xxbrOC6X1v6aZtES8ui4t/zpAOMgqs4l1DfnqevI
 3eLXvW3yX2j47VIimOdNUtuGr9pN8oyUWrjyuTNa7IVsbMNf4F0zLZ5qoYrSJaSrU4KN07JTbdVq
 tu7HAV7fBAXEsn92rcwXFREi
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-Complaints-To: abuse@antispammaster.host-h.net

Hello,

My name is Barry at Investment Consult, we are a consultancy and
brokerage Firm specializing in Growth Financial Loan and joint
partnership venture. We specialize in investments in all Private
and public sectors in a broad range of areas within our Financial
Investment Services.

 We are experts in financial and operational management, due
diligence and capital planning in all markets and industries. Our
Investors wish to invest in any viable Project presented by your
Management after reviews on your Business Project Presentation
Plan.

 We look forward to your Swift response. We also offer commission
to consultants and brokers for any partnership referrals.

 Regards,
Barry
Senior Broker

