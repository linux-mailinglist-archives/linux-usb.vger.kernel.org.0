Return-Path: <linux-usb+bounces-35578-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCXqHLjQxmkCPAUAu9opvQ
	(envelope-from <linux-usb+bounces-35578-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 19:47:20 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F23491FA
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 19:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55CE0305B965
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2026 18:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783DA2D781F;
	Fri, 27 Mar 2026 18:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nz+foUhr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62AD1ADC97
	for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774637189; cv=pass; b=dnesLHaZ6VVrZYeGVl5Cv6WdW+L6SW0bkYuPbSnsk4mSjc8yiByDwZoYTvoNxJ7R4PKbhstcMrE3rCgER0glenlUINWdrntkWZzDF41nQ2Mlsp8fSFrxAajngJNvYMocffcc9t670uutzjgsuxyAuMwv+VuZMxT0EVDUuO/xarg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774637189; c=relaxed/simple;
	bh=ig/C+jgMKPpowpKxPcfOcwOQHv/H0BhwJpXkTWUhuaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NQ3vyt60Vu6eZSSl8Lu4+p4uJvVFak/Q6MAN46BqiuBgbwTQTSaA69Y1u2NTU+o0Lu/Aouib9r4sL4jYMx2mRUMeCx5iEjOtHqqyDN7VU4ThwaBrab+GfYEyY5ypn1NNuJnd0Mujx8lP/9t7Xjnuw5hee8t9KbNpKwJAYNgQdt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nz+foUhr; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-506bcb23a78so20798701cf.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Mar 2026 11:46:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774637187; cv=none;
        d=google.com; s=arc-20240605;
        b=lL51NzLRZbiMSgZ+sae8epDv1D7Q6c95Rb2kzX/tA4giJZoECLsfJ6VS4jf/XY1Phl
         WqMK1ZAHejvyiPwGPaT09SaG5rWnRqGtwKkEgpZ3qm8I0MdVGuHiLq4RZuyNRNGXPtcD
         ZvBFUwNiHEkkaAR9R1KiZMkPUhim9107BHKUq/IfNpow+Fk38/aBUgEc/E3czhy+CMPS
         GEV1/PnMrsmSnE7k88+nd2vWpXpGH1e6Rsw11SmoMet1hXVc4h2TyaIT1sDKLkwWcoqS
         CbxeDCUOhMJDUj6omX1hmunttjB1dBI5vW2ZSzqhiVuZpvnQTzvaqp8epc+EMJqjmSrE
         sb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ig/C+jgMKPpowpKxPcfOcwOQHv/H0BhwJpXkTWUhuaQ=;
        fh=RJk+pZqpqHiQVCVuJD0Zn0GPfBYL6VTxd4FySlr35Q8=;
        b=MZeOxxVqShQVk9FJBChsqgtw+EOWTTPqvpi4MAUcpeR2dLIib62tnwUU/q6H/3xyHt
         n+SWCQNu2J8U91Bu8qg6IMD9CkdJ4QOfcR75JXnRKMVr1vHFmYSiVxo1hrB9tUSK0GyM
         VJeRXIKXz8lNyieyElRszHIUuU2QV8M0zE42SSLGUAxHGwG4IZaroM3lc3y3sl1lYOZ1
         Uv2pfJOITNfoZ4YLQwPm046h3+6YoYFJuSL1vtL4QeqZhi4ww1x6WWaLMR5sYjPjupUh
         O6ocq5rgB4jNrMqXuyqZ/GeU9pg6xbIQvm9FqWZ0WX0+5WQL8mLUBtLNsJIRNfqoUa+T
         pHZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774637187; x=1775241987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ig/C+jgMKPpowpKxPcfOcwOQHv/H0BhwJpXkTWUhuaQ=;
        b=nz+foUhrPFz+lxK55Pj3dXpIU1qLS1KKPqiOTWdObWBzNcmDmHashA8Bp1mP90Xv53
         P9HEHf0klOPc10+fUGwCRKqpZYS5MfrehRcWjpQJlCdbyXA1KkH150w9Mw3Pqp+e29MN
         zhKxDe9knAuuku+8EE1NyucKnsQWdThmWAjGu2n4ioX5C2V+xl8TMYOJ9NCptHJeqieI
         Ppz7my4n6hgOzOZHrwUpNULxYdm0woRMupg9jb3UkZy9FhF06ZQXI+SSDsLzWNdnVX8L
         dhqwmLNarkWG2X8uyfmvtfCQ3YXyG5Ey1YunEgUlOOOlVYSbQKW9ddxkmHVXvp2pO37V
         BChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774637187; x=1775241987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ig/C+jgMKPpowpKxPcfOcwOQHv/H0BhwJpXkTWUhuaQ=;
        b=Dl+W/ph8hJQrUn3BoqEo2msSJg1z0S0o9fJSXrSO3gLgQU3Pi0QaN2u8D7sXkLSexY
         5RxyPoEB1hTRT0SGYtFxzCzT+r/j5TxG/y9W1hHko+uT4CgX+iXLbSqP666rPkyKhpSX
         3P32jD0N1aDvFan4pWTaSuA8ufbFr0aePNjbIj9k9nUUwK5GwhSu9TWj0Tq69fPeYwMF
         jpuS9pjzQbUhBseCcD3jSGAXiA+uSr/uUXLZj1FxK4rkCLybWORzjEOwBqMXNkPeXdCd
         IAH5m2zgQEYGgCfeKNGVMKf8bTCizK4cpnZvLXRlb6P0FIM66bzfHVV7GSFqRG8JQH76
         AvAA==
X-Gm-Message-State: AOJu0YyhKwHntB4zOWs+tXoDCdXKbFGxq9cKby7ju2hesX5UpL8b2aEM
	aWZQUo09SOCnssRNlpkjdCPlqdo5R1C4cwBOU4GhAzkSnuJ2Za/Rk6U2nkbreigyUzEpvtem+wL
	nSZcHgjEeIuPRDaNBEkUVq9DXiTmAjhmfZoyv
X-Gm-Gg: ATEYQzxIBVDsGh373lMLV9ouTR5m++BSzgQlh/f+K5HenV10CPRXuPsBvwLr0OVecUe
	+8LMUEwtiFRDEH5ihHMiiRQ91RsqEkAVnFH1JP0iYqIFkxrhMFi7WSWMC0eGuuEI5V42xycrksJ
	KO+Y/4LT/oTaxFuY05JXS30LJ9WnUMdxn1tReLMBRVR6I+k+5bmpa4oaT79Z0Sz0YbUhjqNrZf6
	vcb2hjz64myQPzasm9MI0LM1OUfLwV+QVxi4cPegrnaJ2onSk3n4kHJZ0iG0qcUnKL9qJPNZ5e6
	5msOFv24o2bar9GdsjbVITMsuNc2QMdsGwJDDHm01yeDveHUEZ8nGnWBHkWiakiZqkAFqXXm+Ti
	uSXT/h+qIXAEO826E/ACVV+Mi
X-Received: by 2002:a05:622a:112:b0:509:3c8c:2405 with SMTP id
 d75a77b69052e-50ba380bfdbmr50966151cf.28.1774637186747; Fri, 27 Mar 2026
 11:46:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN9vWD+13DHCyjq+7hYgTSDx87TLtKXV9-8GMnZPuZnYvjyANA@mail.gmail.com>
 <2026032337-resend-recolor-efc5@gregkh> <CAN9vWD+N6K4VExNgnhp=amfBDJTFN9Sz156qsy550dP-d1S9Qw@mail.gmail.com>
 <2026032431-chance-dodge-6b6e@gregkh> <CAN9vWDKZn0Ts5JyV2_xcAmbnBEi0znMLg_USMFrShRryXrgWGQ@mail.gmail.com>
In-Reply-To: <CAN9vWDKZn0Ts5JyV2_xcAmbnBEi0znMLg_USMFrShRryXrgWGQ@mail.gmail.com>
From: Michael Zimmermann <sigmaepsilon92@gmail.com>
Date: Fri, 27 Mar 2026 19:46:16 +0100
X-Gm-Features: AQROBzC8jTMoInqphaSg9I1fOzn0L1yauWTQYhpu-R0mAdHIkz9RrEnbG00Hbuw
Message-ID: <CAN9vWDJOrHk0oNyiB97JaYqxMDGtP6hNh+LrPBC-van+HU7YGw@mail.gmail.com>
Subject: Re: Oops when rebinding f_hid while /dev/hidg* is still opened
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35578-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sigmaepsilon92@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D54F23491FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> - Move cdev_init to hidg_alloc and cdev_device_del to hidg_release.
> I've tested this and it removes the issue, but it changes the
> behavior. With that, the /dev/hidg* will be created as soon as you
> allocate the function and bind/unbind of a udc device has no effect on
> its existence. Only deleting a function will remove it.

That didn't work out, because it leaks the kobj due to recursive references.

> - Use cdev_alloc in hidg_alloc. This would allow replacing the cdev
> without invalidating the old one. This would probably require
> introducing a global variable with a list of hidg functions though to
> provide an alternative to "container_of(inode->i_cdev, struct f_hidg,
> cdev);"

I found a way to implement this without a global list and will send a patch.

