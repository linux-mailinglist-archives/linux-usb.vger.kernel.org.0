Return-Path: <linux-usb+bounces-33497-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBTBKyANmGlF/gIAu9opvQ
	(envelope-from <linux-usb+bounces-33497-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 08:28:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1003D165445
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 08:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8D563023368
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 07:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A70F331A56;
	Fri, 20 Feb 2026 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIvezovl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA53B315793
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 07:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771572503; cv=pass; b=K2Pfoohaft3lLcxeOsZYTs/hknZ8xldgmNilN9o1U3NUw6wChiGMqCz9bGsBOhU4JlfsAblRu8IXNvjW+vJKF7ktJb9a12+ciQ2+ipOtA5sJYmQrvWpWz/c6p5wdouY8kWKEHNL5yM1UydYUE2yBtKcznRG+IgZCeU0U9MQNagU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771572503; c=relaxed/simple;
	bh=pb4UwxSVDOogMVKWIV/+F+Q7Ebn2c3eDuKVVkXBdcnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7fXFqZJSvkSZHpxVz74FEHkbere0stoPfpV9ApJ4h32uWEvwKEviZihirW7YZ8HKrfcYHOzqVj4MLx3TesiJ8kYTZYo0Wa6ZV2riCWd9TBtlTFSTiWHZBijJnOphkfEp7JIEr0Xla4wUREJ4777HTD/uT4K9v347gzoY8+fKjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CIvezovl; arc=pass smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56706fd623fso1191012e0c.3
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 23:28:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771572501; cv=none;
        d=google.com; s=arc-20240605;
        b=Ck39X4knD6tLkct9C3OuBRbYZp2sCGqGZb9arBLfuLPxadNvlw+JKalspdH3pmNBLJ
         u0dNLh+VDSzB0gSDk+fxQD5iBuiugqEjv3UdgFZ+cvduyD08lfhGTy2SNQPp6X4OUZgA
         T/Xs2bAPdEpmA7VNQkq8PWIS5xR+hVSPgGLU9h7lG4iLTwnDPGqX3WuIq5UjgbAWLgOj
         /mpokvzT/5jY0c+m8AVsoT7Ad4F0viMUjuFj91WM7Hx35eb2BSLO+tVg/sQOWQVdwABS
         2pYNVyGwukeVVZC3HyJY4Yq6jqW+FI0RW96TniqxPKLK/63TapFdrKuRA6k9GSFZZmUn
         G4jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pb4UwxSVDOogMVKWIV/+F+Q7Ebn2c3eDuKVVkXBdcnQ=;
        fh=+B+MlfsB72tmYq6MZSgRE66vRgTuVRy8myv5tu2nkFQ=;
        b=HevzE+G9DbaXbxTNtivRzPlhwdXac9hRQSd5N+K0E6bZRFR3aF+c3oD9gyH61eDKXx
         0I3JgM+uu+LYTwlD2gSbTHo5i3bnscx53bUE179K5arsTFndfO2xUUamFsVWNJida+Fv
         ueTGZ7vjixMjSdUFA2ZpLn9M1fFUC4df9VgL4oxjvKBw++vngD3J05NPdYTIFBPwutMJ
         qcbb2bnMeKaExy0bDZPnugTUubmk/RW+Jmo7nWwZdsa33S4ApUaWtGpwDn36Vy1XRxT2
         J5Lcq5sfhOijbbOGiPRol8JtwRJz1RLABerPWbH1dVd0Dy9H8iGgo+bGrSbZ/EzYaTID
         B/iA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771572501; x=1772177301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pb4UwxSVDOogMVKWIV/+F+Q7Ebn2c3eDuKVVkXBdcnQ=;
        b=CIvezovlWbPStnBBPoAik88LHPzIHcOHf8LDXVacpOc/O5ipz9tzWz9XF8xyl7gGNx
         CROZj1X7G02UnnHytdOuXOAzEbptT7JUE9u028lYKmGXTrWq97/E5gqQWR+u0UisawqI
         RwJ9BvZvCFwvK31wIIPGAuV1bW5ZYhaaYHA551mkw4X0YADPkObuCB6m5p8NL17aFeoX
         GjgSeL6Zhynoen8wXwyT/U60536fEva+eZI0wTwAgGl0Okwy3TTs2Vi5GoopVQMl93eE
         yYynI9nqAjal3bAslEbbddi1rBvajeHxdnQ0Hn0QLN11T0AxcP0RJtpdn7ADoKwiW24D
         F/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771572501; x=1772177301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pb4UwxSVDOogMVKWIV/+F+Q7Ebn2c3eDuKVVkXBdcnQ=;
        b=pK1v1FGFRESA4MJTZdaGwIwdt7KVFSNQD4oU1Xq3IZsR8UWnD0trkIcOVF8bksxWeJ
         czWq3VyAlHr7NPZE3NIyGjPhUUar1jvZEL1ks2jrrAvwmdsHFvMZlltGzFjs+brlganZ
         HXUyON/LphooUKKNeFrAEgEmAOdtGfxlKboYqZmisP/KsC8orJIgvDoe3xSQQPRqgbJq
         vl1MIy3eYYrx9y+7+Dl/CaAjuHQmvPskJRM+mRXBJ9+wNPrLMoEo0Im61HIqRin5AD0z
         vnYWihBhhBB9RmS1vNMvJ7G62pbrEtcCvL9tBpPtre0x4KqoylukfSUpdgO5Nx+QtUZ9
         5Q6w==
X-Gm-Message-State: AOJu0Yx1kVDP6u3l/ff0+QgRzXljIJTih3hJM/I9S1lmdId9RfRgJPyE
	Jw3Hew1JRX/Nh6bZ4FhjOD8HVA9eZdWhDKL+i8hi0JDX+tbSXe+ipPfAtvhAjamcRAxE6E1dxYs
	gwc82BBfJQBRkjN+F+j48UFM5GuBuQUA=
X-Gm-Gg: AZuq6aI3Tt0qx9vFN0YJ8YSioX9dAcuSrJEFta8rLYcLp5PolmFnvWx1lI5B4gEsb1N
	A2QN5Q6uqCIjgPQABcMUMCS8J3BCGybm6n7fjbJQiNbAtW7HjxgUEBzbuif0BFbMdMquaQHR/bU
	CmWh9TwcF9uWNVJVsyFGUyNksDLHk8I7OgiGDq68+MLEEIsvBjo1kzKC/iKk3K/GdpGdfNaYKL8
	T3PBIZAF7KONtl+VKIBiJZCUvyCiOIiawGGfmpj+gpoYu1oiHUDbKCOR1Qf/sZbg8L8lu2K6Nj3
	XjD4998=
X-Received: by 2002:a05:6122:a01:b0:563:73ff:19be with SMTP id
 71dfb90a1353d-56889b6bd02mr6225334e0c.8.1771572501280; Thu, 19 Feb 2026
 23:28:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219190251.3422-1-nathan.c.rebello@gmail.com> <20260220063457.3672-1-nathan.c.rebello@gmail.com>
In-Reply-To: <20260220063457.3672-1-nathan.c.rebello@gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Feb 2026 15:28:08 +0800
X-Gm-Features: AaiRm51mOpDWIr8Ge-3mqPek2d9nKMGtkHPE2-_OYFIVyt7ax_gofe7-dX7JX58
Message-ID: <CAH2e8h6=0E41Ti48sMbhpvSLL-9znaj+aUpqtU5vobeoapdH8g@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: add bounds check in gaokun_ucsi_handle_no_usb_event()
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33497-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1003D165445
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 2:35=E2=80=AFPM Nathan Rebello
<nathan.c.rebello@gmail.com> wrote:
>
> Agreed that UCSI_CCI_CONNECTOR(cci) will be > 0 when a connector change
> occurs, so idx >=3D 0. However, the check also guards against
> idx >=3D num_ports. UCSI_CCI_CONNECTOR() returns a 7-bit value (up to 127=
)
> while num_ports is typically 2-4. Other functions in the same driver
> already validate this -- gaokun_ucsi_connector_status() checks
> con->num > uec->num_ports at line 188, and gaokun_ucsi_handle_altmode()
> checks idx >=3D num_connectors at line 295. This function was the only on=
e
> missing the upper bound check.
>

Upper boundary checking LGTM, thanks.

Note: I followed the check like other qualcomm platforms do. It may be
unnecessary, I think, if we trust the PPM would send the correct
information. ucsi_connector_change() never check it.

Anyways, you are welcome to add the upper boundary check.

Best wishes,
Pengyu

