Return-Path: <linux-usb+bounces-35913-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMlmGwDPzmlXqQYAu9opvQ
	(envelope-from <linux-usb+bounces-35913-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 22:18:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C150A38DE60
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 22:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D8FB3021E70
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 20:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF46388E64;
	Thu,  2 Apr 2026 20:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdiTHaC0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB421A0BE0
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 20:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775161083; cv=none; b=jy4qdBnAJMzq4zcJ0hxJfh6oznmlqh8ceOBWQvr+3dLUFkgxZj7zjkE3Of2SS+T1nmtBOWONcmQVxX5Tu8PBIb8steF1o4oGI+G3UaCZwdTk092DPKuyoE9tSbascM5XZ3Yj2FgQCxS0A6oiOLPVC/E+R0GY7heOzk7ujo98dWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775161083; c=relaxed/simple;
	bh=5UsOEcn50cdBc2IpTEpFynqVOam78E9Xv9FXNMb1C8A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRzBVI0LZLNKh3frgkX8LymTlsEbVhJRf0CSPP/P+QyfOySKFnxfl1z/O9ZjOSgZ4+YAtTyolOlbZZOBEshpZSXdZ7zxiTqTJNHGJ5GkhmKQ8szJewk/DXjww1QHWW/PKt55kJhSPrbjgMnJbf44/LMhThPO5/j4y/NPiHOzueY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdiTHaC0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso17758795e9.1
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 13:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775161080; x=1775765880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UsOEcn50cdBc2IpTEpFynqVOam78E9Xv9FXNMb1C8A=;
        b=OdiTHaC0gBz7Ws9ArJJe8KabPgKKlNWZiVyVZBWQXms7QwCQfnqSiHfXqkQoGuom8b
         s0hx3QJ342x72jOmM5l8jzA0bM6UmJgNxcYuh7eApmmCVekf0cRjmm1HIdekuM+wtI3A
         IIZzni1aXMdsMaQxYny2w8IruUNNEKRnsbHSUaQTZ7YKPgG0tPRMKpRW/xA+Bh37Jxc2
         Vt/4/cfi0Hg2dnO1MmkNNv5PCivLZNfn3OQeIqLCMtj4+D9owZ4U4DBwGzCJgpjv1UoN
         krqqpaAECJYY85fU7agFocobbdC32DV6vaQ0/5dNA3qF7pvYRFlQ60OOXua5ZnXorWs2
         KGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775161080; x=1775765880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UsOEcn50cdBc2IpTEpFynqVOam78E9Xv9FXNMb1C8A=;
        b=hVkASNBtf1gXUkfnwUn0J40eIQYAi/ZBnOygCQu9daxpVod2QIupJULznScAz6ahvy
         ExOL/uQxcjit3Tqs5/7K7SHa7I8UnAYxJvIx8mFGeHE+6tkd2UjINsW6uBEyVHCI4K4F
         ITZHM55Ms4AA8DZktT9bhmxg1BG4ajYzWpqhihXRDi9t/JGnghJ7cJu8JkUxhS4xIHfr
         M3oXuPlMPPro0G7j4bHAPRFc0/Y5sDgxFjMtgp4tcApb55HuPqRsesIwcKmmzXtDOtr2
         6Yg/L9eIdMNPyH8555UHS4OBQEzrpnT4YGViChwxNozzGozt35rdT5/QR43Fhtp4qAgt
         yt0w==
X-Forwarded-Encrypted: i=1; AJvYcCXMN///LdqD6nq5Yu5nlqebVDHW83Ads0qq1i5+FDjeDqyeHbulmyDOU6hk8H5SkI00yXzo50XmFZs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3XWG65gqxH1b8bMImRJDwF+VmAANGy1Jvsh1ieZUoSINDbjY
	a9nO9Sk1mLdAZi6POkjVVBOJBBVsBUQeIdEYAOeNQ/cBo+1J2RToRdZC
X-Gm-Gg: ATEYQzxhT2YI/sumLCWuG2PrPNfUyybiE83ZYDgA5+e0z5t7AlHS1d/EPuO1p2YxYG8
	ZdQDFRnKMmG+R0qfGi6pV78v8bwkqg7pPWnKGcr5b1kz6aQm6247qC3DrVTHknDdc59aHeawxip
	o47A/xlfZleEkjKkN2V5hYjwEUaVOZN+meuW9JBW0sE+dZwPrjsOBDOEe87pQViY7Bk+VVNVz/a
	NYW8XHnQTVL6qWWorEHERj5P5FwJ9Z7jc4TN1D2aWqk2WiBNacFsXWZA10GN/qSC4kPofr7XEvU
	AE7yRZvA5AIuaLvf1P1H74yx4eIxLCA5+N59cjgrO+I3bl+mEWqgwXe45PbwZUcdlnV8+3NyIyn
	sk5/moFNrJ514oW5D//xohhD44TOn8gFWA0kg3tIaZKWICLzRkxVAms9elRjUs0Pu00dggyMnfs
	BQBCNwavQrvMY00MD4EPvoBePi1KrngnghFGCarKTP65w=
X-Received: by 2002:a05:600c:3f0a:b0:487:2439:b7be with SMTP id 5b1f17b1804b1-488996a34c9mr7304365e9.6.1775161079942;
        Thu, 02 Apr 2026 13:17:59 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm10185098f8f.22.2026.04.02.13.17.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 02 Apr 2026 13:17:59 -0700 (PDT)
Date: Thu, 2 Apr 2026 22:17:55 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: "Xuetao (kirin)" <xuetao09@huawei.com>, Greg KH
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, caiyadong@huawei.com, stable@kernel.org
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <20260402221755.3afd7df4.michal.pecio@gmail.com>
In-Reply-To: <74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<2026040241-purveyor-bakery-a9f1@gregkh>
	<c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
	<74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35913-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C150A38DE60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 09:56:51 -0400, Alan Stern wrote:
> On Thu, Apr 02, 2026 at 02:59:35PM +0800, Xuetao (kirin) wrote:
> > 2=E3=80=81Following Alan's suggestion in another email, should I check
> > whether wBytesPerInterval is a valid value and handle it in the
> > usb_parse_ss_endpoint_companion() ? =20
>=20
> Yes, IMO.

Not sure, this could backfire if it turns out that these workarounds
will need to become more elaborate and account for wBytesPerInterval.

These descriptors aren't blatantly invalid. USB3 9.6.7 doesn't require
that wBytesPerInterval =3D=3D wMaxPacketSize * bMaxBurst * Mult.

Being greater would be blatantly invalid, but this is already being
sanitized by the descriptor parser.

> > However, when parsing the device descriptor, we do not know whether
> > the actual data length transmitted by the peripheral is greater than
> > wBytesPerInterval. =20

Indeed. Device is allowed (actually: required) not to send more data
than its wBytesPerInterval on IN endpoints.

UVC driver uses this field to pick isochronous altsetting capable of
transmitting a particular payload each interval. If we overestimate,
there is risk that the device will deliver on its promise and truncate
instead of violating USB3 spec. We should rather pick a larger alt.

OTOH, when a device lies and sends more than specified, this happens.
Some HCs ignore the problem (and may overcommit bandwidth if we enable
million such endpoints), others get pedantic and return Babble Error
(my mistake, Bandwidth Overrun is specific to isochronous).


I think this patch is relatively safe for interrupt, because drivers
generally don't look at endpoint descriptors and submit URBs of class
specific size. Case in point, everything works when you override xHCI
allocation. It also works on HCs ignoring it.

Beind the pedant I am, I would restrict this to bMaxBurst=3D=3D0 because
that's the known problem case and IDK off-hand what devices might use
bursting interrupt endpoints and what gotchas await there.

Maybe add a comment that it's a questionable, spec-violating hack.

Regards,
Michal=20

