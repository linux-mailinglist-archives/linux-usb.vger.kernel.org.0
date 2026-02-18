Return-Path: <linux-usb+bounces-33432-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MutKl1qlWkzQwIAu9opvQ
	(envelope-from <linux-usb+bounces-33432-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 08:29:33 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A97153AC3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 08:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3DD1301AD15
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 07:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99EA130F7E2;
	Wed, 18 Feb 2026 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jHYKVhhl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UAVtArrx"
X-Original-To: linux-usb@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C10130E0E9;
	Wed, 18 Feb 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771399766; cv=none; b=USKgeZUbj/CVZnWyLRy17ri0bVblhyn1eaOnG4MFbowCcdJX4xyZ1+S4LoG4HvqWGgS43ZJtf5I/+zvfgaWIQ+jb8esauq+HcPzhxpYPGe1hBqdPPk0V3Zyks9ojjGHakq1dn3/9NjczlUoMS1S2rZzqCUNqLBDoXvwtPPy1irE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771399766; c=relaxed/simple;
	bh=9o1Uf26FGLsF7TAIQpX6259LEBsIRZn0h+oKl4VsFdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay5strPEZ+W/I2Y/BAWZaGxAFigZjfFKbSsZYvNnQhbyqr8PpgGFmwm6Vh9DtPUQOYloWk/DVroOnKp/URhcC+GiVX0KSGMurNHsR9Op6E/U+I+7wW1rm5juyZ9Xmp0j/DxWauUc3zuY0lj3lK0pySp3EDaE7j8XayC79Q/ULGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jHYKVhhl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UAVtArrx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 18 Feb 2026 08:29:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771399763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tc9wYhIQIs24bZdmG0gaDLK22NIlwlVkm9cSNby3yaE=;
	b=jHYKVhhl5Elie3YYwS11aymO+sXeMqu8hjln0rQCtm1oXGjIicye7zZ0pOm8Vb6A59Fj4g
	iVzpds1UwVlXUyBuUojeEkp9P0o0f63CW7KhgelnLSvZY+40XlSfMpj7esr8N18kzf4ncG
	qZ6Vnmjx3hpg1vG1DdZCJle+pHUAJ7xxVc6Uyy0bXVVte6XZsOmavAi31FYbRS0XgMs+rm
	9A59opfaWJ/MLvQBUM5N8AYfaaSomQyicgaxdP6q15xoPUI0DhTrOIHe2cwChcoMoKMomy
	qfU1chibKZSy/ETJl+kpvlh049yqHyegavOYsAhs5tbFmsevy672rfadMVaK8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771399763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tc9wYhIQIs24bZdmG0gaDLK22NIlwlVkm9cSNby3yaE=;
	b=UAVtArrxndOArnaxN0aKpb3+Bq2z/GPmoEAUOLtHqwwZlxgFtroOQK5e1Cx2JzY3U1VH60
	45+2ccN94dAII6Cw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen Yufeng <chenyufeng@iie.ac.cn>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	Andrzej Pietrasiewicz <andrzej.p@samsung.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in
 nexus handling
Message-ID: <20260218072922.C08qI5s1@linutronix.de>
References: <20260216204848.10748-1-jiashengjiangcool@gmail.com>
 <20260218052219.l7gfndrn5e4h3qe4@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260218052219.l7gfndrn5e4h3qe4@synopsys.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33432-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,iie.ac.cn,linux-iscsi.org,samsung.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bigeasy@linutronix.de,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: 11A97153AC3
X-Rspamd-Action: no action

On 2026-02-18 05:22:21 [+0000], Thinh Nguyen wrote:
> > Fixes: 08a1cb0f65fd ("usb: gadget: tcm: factor out f_tcm")
> > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
=E2=80=A6
> While the patch itself is fine, we should prevent this situation from
> occurring in the first place. That is, we should enforce the config
> dependency and prevent the users from removing the nexus if the gadget
> driver is bound. Likewise, we should prevent the gadget driver from
> binding if no nexus is established.

Is this an actual problem or just something that looks like it could
happen? My memory is that the tcm holds a reference on it and the
referenced commit just split/moved  the code. So if it is a problem then
it should have been there longer than that.

> BR,
> Thinh

Sebastian

