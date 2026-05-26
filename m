Return-Path: <linux-usb+bounces-38056-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G3lIWxuFWojVAcAu9opvQ
	(envelope-from <linux-usb+bounces-38056-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 11:57:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8C75D3CA3
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 11:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7321C302C04B
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2026 09:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD87C3DA5D3;
	Tue, 26 May 2026 09:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVZlTsys"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F03DB64E
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 09:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788896; cv=none; b=f/Za5aYBWX1Lv4+nQe+iVB+NlJd8F84JnVc5bCyJ7Ko2D2Ex06HXxCtoJoLFYxbmCGwdBI4pOfDWZjt/ymy7I6FMUF6fqvZaXk8hzrDyCFOY+w2L13bF8n45+GezPb0oSbBosdrtvFGRksZ8/Ta5TSHrxGNqOKpgM/R/dVfls0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788896; c=relaxed/simple;
	bh=6xgiU7UHk0fyH8OtVpuJExgRt0VbjZpUEjJ/frbR0FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4kaIuQ8C9TWaZOTvmuOkUsx2rEdncvOGEKDU5o3uJHkprwpUCwEsu6YOBgtThzN3RyFS8oKMJzbKGxOt8DocKsq5Q49k8Hr+bxykJwMwFtlsJauMzUlltia6sR293GkVXTF+O2krOT608r8d0PFHNVHMfxOiYpSpzf+nMdAh8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVZlTsys; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9451F00A3A
	for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779788895;
	bh=6xgiU7UHk0fyH8OtVpuJExgRt0VbjZpUEjJ/frbR0FA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NVZlTsys9BWdtHzTDLDn5rfEhTbtLxyyJGzF9yhWAnDRt41GZGQkchM1KVUs4BE+V
	 1ZfotqeJQVRfUIDBM6RJ2k1gVu2eBPsu9O+FeP6SXfWF/fNjDthrrS7mHTkNCjm0tu
	 z8lXLoRuCz3oM81VIG4KNypW0wZMBD+C0W5bBLTTQrUkpCxFSnVeLs5s6QmfusqyrK
	 2DZ+l73jxUWSahhHCjeNnze7jpJ4/4lfxQqN/demRkAnfOOJj/aQiLbtdK7j/e7uRU
	 bs0KQ9vbAJ0Tk2r4RTaxzHBYygw2z2HFkI95yphzgxLV8SHOsGkb3Hm9fXVZm2Odf1
	 r7Hx6MJKvNEGw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3939d2bd7ecso87321381fa.0
        for <linux-usb@vger.kernel.org>; Tue, 26 May 2026 02:48:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+HS1sTtWeeqyr1Yll1UjWDERoxNq1s0BkhcfxBrdrkBeAs/uTyaDjkNAsNkUFC6pJDwBLo5VLkLQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrIHrqUgWfltvx0HDddR5WsuYbhHLHMkdcbG9iOFZDAJXX8t3a
	caOnUVOtDApSFn+OozoRqD571PIgTSsjzLtfk3eoVEXeTZwNJFd7yrF1I+seovXkc3DW4iwsyqW
	YmufqRnfMjG8d7a7zg+usRhsqavbAILi1xCxvAEkO4Q==
X-Received: by 2002:a05:651c:20cd:20b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-395ca1c8679mr43054031fa.7.1779788893678; Tue, 26 May 2026
 02:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515090149.3169406-1-wenst@chromium.org> <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
In-Reply-To: <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 26 May 2026 11:48:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
X-Gm-Features: AVHnY4JnWCndh1h2w4rgycQThCJN5e2R-74Cpg5S6rpAEGBFVHeaeEFDCnabd1Q
Message-ID: <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on Chromebooks
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38056-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,x:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8C8C75D3CA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 24, 2026 at 10:06=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> > >
> > > I expect some discussion on this patch, because a) it adds some
> > > OF-specific code into an otherwise generic (core) driver, and
> > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up power=
ing
> > > on the port twice, which negates the port reset part.
> > >
> >
> > I understand that you do this because the port device has no OF node
> > assigned. If we wanted to call pwrseq_get() for the port device, is
> > there really no other way to associate it with the correct pwrseq
> > provider?
>
> I suppose we could tie the "port@X" node to the usb port device, but
> AFAIK no other subsystem does this so we would be introducing a new
> pattern.
>
> In the M.2 pwrseq driver, we would have to match by port node instead
> of its parent device node. We may end up with different behavior for
> the USB target vs the other targets.
>

I imagine, we can check the bus type of the parent device to know if
this is USB?

> Also, the "port@X" nodes only exist for the OF graph connections to
> connectors and/or muxes (this series doesn't deal with the latter).
> For directly connected devices, there is a "device@X" child node
> directly under the USB hub node. That node is what gets tied to the
> the USB device.
>

Is this a problem? I don't think I understand what you're saying here.

Bart

