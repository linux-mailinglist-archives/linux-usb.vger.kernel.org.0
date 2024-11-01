Return-Path: <linux-usb+bounces-16939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB199B8D75
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 10:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65CF1F22ABB
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774A8157E88;
	Fri,  1 Nov 2024 09:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrYVPtJj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05513FF1
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 09:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452253; cv=none; b=O9iGbP8zyaMhaLmohSAvRPncS3l5b/pODNE/T1ztCQ7sxw3+ZycETS96X+J2XRU7Q/Xe26l5hz4wiF3MDqajqaowFje5SiquWcf1xeMl5Zn/Q6dY1dKYNWoiS3YEY1PfvClufpXL5MZ0+nUjmno5/e1zJEr9IEjaGjxwsnqQvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452253; c=relaxed/simple;
	bh=S4Cjw+KzqDdY/dJv82rgsglGSuSGI1uVtD95qVmtWDU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YlY5EvjGbz4Xc9BrUYpodQM9ImBfbhbLL7AdkdZGKU4Ckuo8ygrVcV08zCJ155BwhWsJ3lhe9p9d0zbnGpGMgwyD0CNuxbH+mRVMTAKnzfDcqrWM+GVaI64hEzyKGifiHmU48vXuCN3m58eo41OQr5fSS16j9VwFuSc642ZP6BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrYVPtJj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3110b964so15957321fa.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Nov 2024 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730452249; x=1731057049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F38MVj8NbJ/mj81F7aBVo2iLHcFGUoJG2RSjA72ffn8=;
        b=SrYVPtJjq7M+PJCfe4m9+/Ov39ndlxroO+jmAr/8m9E0Rz/Eoj+Ml1bTRT+b5RgAGm
         JNPpxp6Do+IFoNjZXIRPfpXy0b9TdwbHCYnEH7TinoI8s4TB8DQ4jZwN/AdZ+diNsP4/
         14MwZIqoR3/l9n5K0Eo2RpwKKw9v3HlhUr6wWJ7a0kIHX3ybRVPaMokL3tWIocRZG0sb
         o52CuFpEK9WcpoYalfn62NxgJKVOYCmToEP0XwGgPE3MmQYqBvgJ/QpI17tB5O1rfSm9
         Nwll6MAfvow/bUzGUrYDP++UtYCk7R2l9UNiPNwkautIaPfPCcfgpIyvYuhJp2Gct0Fu
         0QSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730452249; x=1731057049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F38MVj8NbJ/mj81F7aBVo2iLHcFGUoJG2RSjA72ffn8=;
        b=M6QxErCYtEtlq1aiAd4+/v+qmbkwu/GdFFh57KNfcb7Xw2vegX3Ici7l4Z4z8lfoIE
         8fXefZbbTReBn1WJ4lkLEozBCI+s1CfrHfGbtf6SxOJ4q4YgnXEQusr5wpY4/XDWgF8B
         LhVjgvDBRsgEBE3h86CE9OgzOfmenOIBoKVXVIyuBJ9Lj57ZkXvPmRfZvWCfQpLVm9W/
         KE6icOhfSkTH64XCIUJaURhoGa9KXwq8dUWRBRkcvmABYHWbbPewRxxwbbTlM2YjJxDr
         T7kV9jIQDpGm8Ti37CbiUZ3jRhGz50gSwnT9eDVd/FfKmUeOqjySo8vBbA/Z7YHm/CtE
         XG/g==
X-Forwarded-Encrypted: i=1; AJvYcCUkBSLcII26hXF/XNJ+ufk4mv0K/ATCjgcfOLqygu5nNE87Xl1zJU+7BBv9D4QyvsYOY2CZz4+VYKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykhpi5TJ6umZWXIJtAJZjj5OUpC1bsXYVyCTyEdIsW2YCbRAFo
	2bmNKzRuctu8a4mn090q/qp8+SDI3PDTxKoKVyMRHOZerxmBrY02
X-Google-Smtp-Source: AGHT+IErCW3ykdSg+To8RRr/nRy3gIhwCxpoCUyEo2XN2FVGA4aCH9YBfLOQ1ZtHIx2r1HHrtpNigg==
X-Received: by 2002:a2e:bc0e:0:b0:2fb:61c0:103 with SMTP id 38308e7fff4ca-2fedb757a88mr15481811fa.4.1730452248628;
        Fri, 01 Nov 2024 02:10:48 -0700 (PDT)
Received: from foxbook (bhd206.neoplus.adsl.tpnet.pl. [83.28.93.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef8a6309sm5071161fa.93.2024.11.01.02.10.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 01 Nov 2024 02:10:48 -0700 (PDT)
Date: Fri, 1 Nov 2024 10:10:42 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 "Neronin, Niklas" <niklas.neronin@intel.com>
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241101101042.3cea9516@foxbook>
In-Reply-To: <c7199fd8-243c-4fe9-8f7e-323ff4c67765@linux.intel.com>
References: <20241025121806.628e32c0@foxbook>
	<20241028083351.655d54cf@foxbook>
	<f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
	<20241029092800.32eccf3b@foxbook>
	<7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
	<35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
	<20241031091347.29b6ffdd@foxbook>
	<20241031114926.22ac4359@foxbook>
	<20241031121724.5a259d6b@foxbook>
	<c7199fd8-243c-4fe9-8f7e-323ff4c67765@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Oct 2024 16:22:14 +0200, Mathias Nyman wrote:
> Ok, good to know, then using flag is not enough.
>=20
> Using a retry timeout for failed stop endpoint commands also sounds
> good to me.
> It has a slight downside of a possible 100ms aggressive 'Stop
> Endpoint' retry loop in cases where endpoint was stopped earlier for
> some other reason.

Waiting 100ms is rare. It happens in cases when the original bad
workaround would retry infinitely, and this bug still hasn't been
reported by users for half a year. But I triggered it with patched
drivers or by stopping a device with flaky cable, so it can happen.

EP_RESTARTING flag could be used to avoid wasting 100ms in those
cases, but I found that I can predict its value in advance while
queuing the command, without adding noise to unrelated code. That
was the STOP_CMD_REDUNDANT patch, and now I'm trying to just avoid
queuing such redundant commands at all. And timeout if that fails.

I found this "redundant" prediction very accurate and pointless
commands are practically eliminated. Correctness is guaranteed by
ring_ep_doorbell() always starting an endpoint with pending URBs
if a few ep_state flags aren't set, and always being called when
any of those flags are cleared. Only two exceptions are known:

1. The "transferless tx events", which may trigger a hard reset
   without Set Deq. In this case ring_ep_doorbell() isn't called.
2. The bizarre ASM3142 ifconfig up/down issue, which crashes the
   whole bus and really looks like a hardware bug.

Generally, all cases of failing to restart an active endpoint are
very user-visible and problematic on their own right, so a bit of
extra delay wouldn't be the worst problem at this point, I hope.

> =E2=80=A2 When software rings the Doorbell of an endpoint to transition it
> from the Stopped to Running state, it should update its image of EP
> State to Running.

Making this assumption is exactly why we have problems, because the
start/stop race is tricky for hardware and some chips clearly don't
behave in such simple manner as suggested.

Regards,
Michal

