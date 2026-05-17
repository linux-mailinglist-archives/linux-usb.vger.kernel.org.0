Return-Path: <linux-usb+bounces-37557-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAi/LJEHCmqNwAQAu9opvQ
	(envelope-from <linux-usb+bounces-37557-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 20:23:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 188055630F8
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 20:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DC6B301DCD6
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 18:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59103CD8CA;
	Sun, 17 May 2026 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V7oBhwIl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3872566D3
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 18:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779041989; cv=pass; b=J65BlMbth+U0aWasBARosnGaAMKSDNFUTrojANCLm2C0Bkahj2ep/FQdXXporjeSd1cEZoXUV0fx62WfSr6XZLuOpZBAlYsZl8sZRbs4x/rpCxq0nUmLoXZTL+EQ+ifO4rlWyE0JzAIHu9O/6aOkymrL9Vuk60wUHRwI3gU96ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779041989; c=relaxed/simple;
	bh=Nd43E/zmZ6c/afHegFvDIk2Fq1CDykKACE8Mmj+xopg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxGoaCOYin/fZ1zJP+zA9iw4PVhgiIF+/ElSHRGpxm44G937YNufcFeq4UMdsopZKRrEwmJaQhKZ+4NgXRwGOZvc99bBbGbtvwZLDdIEQKPV03iuRoslHQta/xiysgNsQVvus+nBn/GzOsdWuTOPdpzBzBIuTgq9dC71Feq/3co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7oBhwIl; arc=pass smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48ff4f8ef0dso16814235e9.3
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 11:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779041984; cv=none;
        d=google.com; s=arc-20240605;
        b=evzDcAzriUaVmdM10uc+yGTaXA97NF/mhjbrw7/IfFSJDxoLio670jC4Ff+x9KKXb6
         TEdaNdHn7IgQy+sTFhmMLnYHjomdYuln2UwcX/Say40qniS9X/NOdvQzR4dJKPsY0Ayo
         dXB0g/faSx7zQnxTex3MJzYks0aR6KprRBqWeBGbSSsCEplcXL4CqDCVBcABCSTFzT/m
         MkZbWB6S4TYiAd08mg2m/Nfc3ZggN/08koqI34I1yVduXxLaX16c35xNjauH0vxBth0c
         tsrJwYWPddCMAT8zJ6Bx0wbamy6DicO4s8owhm4bsjG/TKO8TMAcXPRvOyEiv+qvLqI4
         CHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+MJxxZUB4Dccd8/YKQFwAFVwBdt+/1w9eYCETuhgmlk=;
        fh=GJpw3/eeawSL3qQgc0xGyT69Al/fK4TjILdTb7bMZPc=;
        b=CfCaFheqZJAlZ1OTepA4H1Qd/F1a7DntsjxQkQ8fv9MK9RITuadBsqPykUTqTSadu6
         +Q90oxQdlcxCV5825RmL20sfgDbfvLsw9xlDpW4t38iArsj7oorN6FPYwcNoa/CEH5Tm
         A3tdSfNV2dkMGOmk63WdxLly0Vr94JdoDDTX3Ei/0r3swLMMckoRZCbEAQoLguunjPDZ
         UpPoHcnrRch2cqlclb2RFIbczXAqbk/SIZb+DfmvnKryJfd9aJjTCk7dlPxDBlrallaf
         sC9AWui8qVA/gF4bNg1TBGnfnhCMw9DXxA66xGnrhohFOHZzTNlogRNI0htBJ/RvZEDB
         4GGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779041984; x=1779646784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MJxxZUB4Dccd8/YKQFwAFVwBdt+/1w9eYCETuhgmlk=;
        b=V7oBhwIlehLIW3jisjkFIJKqd3T5rLwkkGn6u9DFBOpJ43E0vWhLe8vyEFR4gQhii6
         vt+KQo56tKwbMz8V6fnyAhtkbxsFmbV2QkZVoZNkR51Jvp9VrUvILcvME+jPi8gqiPZX
         o4lc/5Baquwrtj70BaIQX7dIcU35tulU0qVOnE7SQiDmA9UwKR9QoLC8qGJ5AbTQEYwn
         VeIJ1WyCp3wmIk20I6JjEduXNMwlScCZsIuBv7QAn6vdFnUeTQa0S9mR/6Gt+GZ8oFUz
         xEVYhs75lGIyAkHXqfz+uyeSZ/Zvb9N2r/HzaX1eLakbmgMfBL/C1tiXeEnwa08kuc2R
         oMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779041984; x=1779646784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MJxxZUB4Dccd8/YKQFwAFVwBdt+/1w9eYCETuhgmlk=;
        b=IJ9RPj+bGaRjQe9xk/BaIGVnCWEvZXszuOZhvWyGvIcgIuGifIuaAYYVCOrfaYOCiY
         WvXlh4rf6Mv0NwK8LZrLylUUZ3fSTipQB1oY3sALIwaz1CR9Tr3+Kiq7UoFp2XlzNQUF
         xwGP2zRIBz5OJanz/Iij8sffepTQSlOgEpGXNpwH2TG7Ca+LXEpnydEBLffEHRlCxU+s
         yDYjKH/HAU/gBxElj4IIEhjudHQy5CVRHQcCdPb/aR50neKW1lNwPGrOMUl6JdQU9gep
         aHuVK4BKQuAvAl86AGwfJ7TsiMHpMVvfo7yrA69NF4iIPyxnhiMoO2TFOpxCCvmfyNOK
         aI2A==
X-Forwarded-Encrypted: i=1; AFNElJ92rEFTQfaq+DfsMhru0F+E6e4BLilOgpjWYV+dijRuyX/5yK9A5wpdbcoHjiMjuWqS2wVSEtU2mBU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+J1CmpZuvY+wjpTzL+00bh6AForO0Pz60OojhkoUdlcHxqMLV
	AL+zF18nevKpY2EwhUbx550lYBun6juyEI0yHZ6BwiYFKienLPZmzE/1KEM1S5Qf8xIevD2R2Ll
	Xn+alL1Z8PO6sQJRoYJS27vNWfrVJzdLASW3/CPk=
X-Gm-Gg: Acq92OEKLRnlQxdQYw4pj9SrYJqvxsD4v6TzE7qDi59Pc0PVJE6j3IdYnA8IcQRAiI1
	2ayRvuJFcx333A/ll5o5uvebSyZZTxdid7Km3E+1IYVXWqsiYxXr8/P/J79+dcmqtGrljZioQRk
	ihUAPixSecNZ4UkoMT1p04nGF/QBst8PXTUohaaewOvwgEYWmPBFBmZ1LUufiYjn5weNbiKNuat
	1FosnnSQN5GGygLDR2aTWSqrY2q/BvVWvrhkRWqi4frMm8jRIFLNY7JIhevWCIDs6MBhc5B2F85
	LAhfRCgPUURkP+9O4ZJCnL9JZlEJ8S9/EXpxNFPEQ8q8PfizcTOT
X-Received: by 2002:a05:600c:c087:b0:48a:7b55:12a6 with SMTP id
 5b1f17b1804b1-48fe5cb36aamr144412275e9.0.1779041983818; Sun, 17 May 2026
 11:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517000145.1868817-2-eeodqql09@gmail.com> <2026051731-ripeness-wipe-ebf6@gregkh>
In-Reply-To: <2026051731-ripeness-wipe-ebf6@gregkh>
From: Seungjin Bae <eeodqql09@gmail.com>
Date: Sun, 17 May 2026 14:19:07 -0400
X-Gm-Features: AVHnY4ItOxehoiyNr6n5or_YbkH_aH8Pi0AD2Y0ODwg-EzbjIzwA2rrpMZt81hQ
Message-ID: <CAAsoPpXhyaWp98Mge3zXz8a9XGJoL=MG-+iL3E=B7GBf_EVRmA@mail.gmail.com>
Subject: Re: [PATCH] usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, Kees Cook <kees@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, David Mosberger <davidm@egauge.net>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 188055630F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37557-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

2026=EB=85=84 5=EC=9B=94 17=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 1:49, G=
reg Kroah-Hartman <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> On Sat, May 16, 2026 at 08:01:46PM -0400, pip-izony wrote:
> > From: Seungjin Bae <eeodqql09@gmail.com>
> >
> > So if a malicious userspace task with access to the root hub via
> > /dev/bus/usb/.../001 issues a USBDEVFS_CONTROL ioctl with `wValue`
> > greater than or equal to 32, the left shift operation invokes
> > shift-out-of-bounds undefined behavior. This results in arbitrary
> > bit corruption of `port_status`, including the normally-immutable
> > change bits, which can bypass internal state checks and confuse the
> > hub status.
> >
> > Fix this by rejecting requests whose `value` exceeds the shift width
> > before performing the shift.
> >
> > Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host d=
river.")
> > Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> > ---
> >  drivers/usb/host/max3421-hcd.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-=
hcd.c
> > index 0e17c988d36a..3d6b351dcb1a 100644
> > --- a/drivers/usb/host/max3421-hcd.c
> > +++ b/drivers/usb/host/max3421-hcd.c
> > @@ -1694,6 +1694,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type=
_req, u16 value, u16 index,
> >                                               !pdata->vbus_active_level=
);
> >                       fallthrough;
> >               default:
> > +                     if (value >=3D 32)
> > +                             goto error;
>
> Cool, what tool found this?  I've been running some static checkers and
> I don't think it turned this one up yet.
>
> thanks,
>
> greg k-h

Thanks for your interest!

It's a KLEE-based symbolic execution tool I've been developing for
kernel drivers. It's still a work in progress, but I'd be happy to
share more details and the tool itself once it's in better shape.

Seungjin Bae

