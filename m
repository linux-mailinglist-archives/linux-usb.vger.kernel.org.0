Return-Path: <linux-usb+bounces-38022-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF8RC+tfFGqgMwcAu9opvQ
	(envelope-from <linux-usb+bounces-38022-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:42:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE85C5CBD3C
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 16:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A365302AD1A
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 14:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD3B3F1658;
	Mon, 25 May 2026 14:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sfdu9Cqw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37473ED5BE
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720124; cv=pass; b=IGUVR1XP61WXl29KnXAqNSTePhw1z95Q2nbIFlIwdM1yqlKYmM0wuyq0Y1xOtXQozCWdbf843tVBPog04PR+f4Xze+a/hq6vg/zKFnr36dX2xEQO5LiyBya9jKGVlj8oXyoRnHiIk6Oe5theTcWM/Td3JVYBwCJ3Dcrgc1QMWrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720124; c=relaxed/simple;
	bh=YTuMnBMg3svQrVT3iPgZ+7XfrkHVUtrtijddiVruEqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0nrE0zuOLAuBhzbSshVolvzSOFAUjrxYlCZO6cHo43Ue+UbksFVmHy/Ly5AbQZpT2frhDKuEBdRXDaGfjRLqvfw7YtsAYVKZiggoWVCFM8gYv2UnD2MZs1KoCvnsZ44Cc1OmSOxV+Kmnk0MVcYJczVE5eGIceYI0tKbWo+s7u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sfdu9Cqw; arc=pass smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e568ab0bc5so10498447a34.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 07:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779720122; cv=none;
        d=google.com; s=arc-20240605;
        b=lb7Usb2CJUt34TLcURfcCSJMu2DEdfNC7+a+HjxKhGG9FJJ4stQUXpNqMi14QsUwgq
         zqppoQbkIMoFqubLWc2TNUUB6wHLEYqwSCci13PytY3e4ULHwdmy7toN6D8dzwNN7qsQ
         UtZWh6MjNMlZxYZzOTSSgAM27zrOaFZTsiuiZ9GArqmnVCBSV6n6Q0zGqYA4v/hvRcis
         j3hDQKegv6uMT4IFrvfRLr2546p5o5iYUtN9Qc3k3CZe7cJIqCoaSnetywNOiyeHyjsx
         O9FfrfCrk0wZChQj0YSwBh20KMmKoNwRRd/cSO7frYc7gPOQDDjeNJk7i3o1bxhKdnij
         y7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xMBnzwzJz296KjH5+A4Xajrymf2+B5pQp3Q83aozziE=;
        fh=Dt1zA2E4+nYJM704VO/teAfR3f9uF0mDCKMVWoy0pdc=;
        b=ekZ1lzcN7DRkkr6AkF5Owg8sxwa/ooQazzWAMVprSMaLTG3BHCDJ3d6QKIbjdLfyO2
         zV4rI+bI908YarM/DTKUJPQSpA1Cfw5ifi1Iv373eMghSx7+OOcBBK0T2SWK+e82a60L
         trgcORUvU80xZghrH33xHIj+LABl6nDTFH5n8IaIHA82dul0Up+sqjGS1Z+wWb3tzFFp
         spQjgtoryI2sxOanCWrHcJq2nYMKo2st5UzhArR1QwvcTPAw4KN4B6nsM7gnsvwskEUn
         LNZ9jmEEudGhbOrr4o1t45BaQPxKE1NxZKu/1tjhpyPE3By9N64gfMoQCeAT4BgsmGCi
         6S8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720122; x=1780324922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMBnzwzJz296KjH5+A4Xajrymf2+B5pQp3Q83aozziE=;
        b=Sfdu9CqwG8xA0yypJU9OVGTEITpds9hry5IZgV2XYZLqXUjuptGJ7dADPV/f9afvKX
         4ETAw5AozSm3uhCXm+bFf9Ls+fsjTA3y+1Tir30tLuUviGNedBfgDLrnlXX97njkqDM8
         1rLaO8NbIPVsTG7DBx1sgV7stP41XO8FM0LUY1zk7iubbYrjZANresBZXYhhVob4Bt4T
         6NeTW6myWO2lR6uWmdHSjrQxvW2WBt5CVUm0TWHV1Gza+YlH9NOTvGhmrwvf/puvo7iT
         2cHWsC1/tSziDDL5uvoNqosx5ucX69WZc6D9pu/s2oLqvm9S5fnFdfBzQJZaBZkc+qle
         MV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720122; x=1780324922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xMBnzwzJz296KjH5+A4Xajrymf2+B5pQp3Q83aozziE=;
        b=DMguxi37up1xJaxSM4oAexswsBfEg/RnDMTAXbNBl6POfcaqTMAw3P+QWXW0ucZpox
         Y6yD4ZIjZmzswrM0GTFj5Qtd8FFRG+tdDDcVY83+3nkLVzsMDHVykav13HlzgYTNiqyI
         joZdB276Q7V9/veA6L8GMSN+7iJC7Yy/ygVE5fBefBESs0Prr6jocv+vLNBCJjoXM3x3
         8710s+5SwT7uzsUfrcrTCvEViZzrGq0Mz03J45ZsGXG0pFZ/F/MkVvzd5yzfhRr4dQmr
         hHW0iTXJiEynbIWCXc0VxDQlQ9LAn13+pFtQEtZfbgu5Il7cdjoUDcrG3T0vHgNtwnXd
         XOfg==
X-Gm-Message-State: AOJu0YzEy53lbzvQ2uTMT4MntrmU51iQgZIE8KvMIQ83Ni+iu857Psz4
	sRkxo8tWMyT4dfPkwl99PyEOm50kVasJgvo4oANjjGH887BXxJC7wXNFijbf1aVJcvyDj01ntqR
	DxZ3dxgNMZrh9viK8jqRmRQB99sLnWVk=
X-Gm-Gg: Acq92OH/0spiZrrbp+ZMJmXNXTO2XNULzFk/6AyxuEvK7my8c92eUu7rTRzknrrclgQ
	JWviaYf/9f1fzPxbI9NsKx3olozJpR00aDXLYg7O2iFejyz+fBV7h5RNB5wsIGLm42SziFp3mUw
	x6xzUBrQuLkakEyCuHz7i/c1jm0rNLSgp9jiTCIRp+gpFcmaPrnGaALVMRRtKrnNKoIB/jAMvpT
	ei8/xPlXkCic+VvquzQreYk/xsuotMLIp9/JvTB0iA5XK40dQSk3/dV8m0Qk6RIoafR2mqtvlIb
	3zu+H1upqMhshrXYJbt3vpzBbvrulM4kP3TIuUNDfqgkDdBIUl5acSiH2R+rHyRfmMi/fZQ6xQ=
	=
X-Received: by 2002:a05:6830:668c:b0:7d7:e3d7:e200 with SMTP id
 46e09a7af769-7e5ffe89160mr7589477a34.6.1779720121820; Mon, 25 May 2026
 07:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CADgB2mF95N09=gOvBZ+4ePSQ-0wCynx-rbu=aiyQecT=iDdyRw@mail.gmail.com>
 <2026052525-devotee-reclaim-7673@gregkh>
In-Reply-To: <2026052525-devotee-reclaim-7673@gregkh>
From: Adrian Korwel <adriank20047@gmail.com>
Date: Mon, 25 May 2026 09:41:50 -0500
X-Gm-Features: AVHnY4I58R9esu4tmdCiHqkJeIwjwKnMWVBW3nbv3naG6fYsTOTcmGjmyyyYvZM
Message-ID: <CADgB2mFhLm8AUvARc3OigPDWZ1PUy+=+WJDywugrQDH3-Vhd4A@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: io_ti: fix heap overflows in
 get_manuf_info() and build_i2c_fw_hdr()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, johan@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38022-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linuxfoundation.org:email]
X-Rspamd-Queue-Id: BE85C5CBD3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 26, 2026 at 12:57AM, Greg KH wrote:
> Should be 2 patches, right?
> What tool found and fixed these issues?
> Your patch is corrupted and can not be applied :(

Apologies for the issues. I will send a v2 as two separate patches.

These issues were found by manual code review =E2=80=94 auditing USB serial
drivers for unvalidated device-controlled length fields used in
kmalloc or memcpy without bounds checking against the destination
buffer size.

No automated tool was involved.

On Mon, May 25, 2026 at 12:57=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Sun, May 24, 2026 at 09:20:51PM -0500, Adrian Korwel wrote:
> > Two heap overflows exist in this driver:
> >
> > 1. get_manuf_info() reads le16_to_cpu(rom_desc->Size) bytes from the
> >    device I2C EEPROM into a buffer allocated with kmalloc_obj(), which
> >    is sizeof(struct edge_ti_manuf_descriptor) =3D 10 bytes.
> >
> >    The Size field comes from the device and is only validated to fit
> >    within TI_MAX_I2C_SIZE (16384 bytes), not against the destination
> >    buffer size. A malicious USB device can therefore set Size to any
> >    value up to 16383, causing a heap overflow of up to 16373 bytes
> >    when plugged into a host running this driver.
> >
> >    valid_csum() is called after read_rom() and also iterates
> >    buffer[0..Size-1], compounding the out-of-bounds access.
> >
> >    Fix by rejecting descriptors larger than the destination struct
> >    before calling read_rom().
> >
> > 2. build_i2c_fw_hdr() allocates a fixed-size buffer of
> >    (16*1024 - 512) + sizeof(struct ti_i2c_firmware_rec) bytes, then
> >    copies le16_to_cpu(img_header->Length) bytes into it without
> >    validating that Length fits within the available space after the
> >    firmware record header. img_header->Length is a __le16 from the
> >    firmware file and can be up to 65535. check_fw_sanity() validates
> >    the total firmware size but not img_header->Length specifically.
>
> Should be 2 patches, right?
>
> >
> >    Fix by rejecting images where img_header->Length exceeds the
> >    available destination space.
> >
> > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
>
> What tool found and fixed these issues?
>
> > ---
> >  drivers/usb/serial/io_ti.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/usb/serial/io_ti.c b/drivers/usb/serial/io_ti.c
> > index cb55370e036f..afe29fdf9536 100644
> > --- a/drivers/usb/serial/io_ti.c
> > +++ b/drivers/usb/serial/io_ti.c
> > @@ -773,6 +773,12 @@ static int get_manuf_info(struct edgeport_serial
> > *serial, u8 *buffer)
> >         }
> >
> >         /* Read the descriptor data */
> > +       if (le16_to_cpu(rom_desc->Size) > sizeof(struct
> > edge_ti_manuf_descriptor)) {
>
> Your patch is corrupted and can not be applied :(
>
> thanks,
>
> greg k-h

