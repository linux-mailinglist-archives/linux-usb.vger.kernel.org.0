Return-Path: <linux-usb+bounces-7897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D687A09C
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 02:18:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949CC1C23539
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 01:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B77F98F6E;
	Wed, 13 Mar 2024 01:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+lmtt5o"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D898B2F30
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 01:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710292721; cv=none; b=USuy6qlVctwNnrHJGKCuDXTIdmOU7Vohz6uDgYz15KkwRSonuz+jlg02G3iGU8GbR1UILc7YNeKIBUDSEGkrTV65lIRF9aNYAVw7yM4R1WDFBZxsyi0V6svqwCnkLjyaSilorAhZgYheVTDc4t8fhph4050Ib2CAjLxEmw+z9v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710292721; c=relaxed/simple;
	bh=EFUU+oX8StgwuFecKW/wNRie0VAq/OIFF8EgiADtxO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnJ5OtmGs+KViSb8wVNDDOgQy99E2RK8c6nGPFhZ0Zzdf5Qq79H63qOnrqGd66YJJopAMh8fmHli9Iweut92uMpBkcLBzcTUwDzadq5Qz+WQiAMR9buQO8+XOYdJQO59/TSlqHnPqai5jWXMubNYmk868C5sWlUqvSqsXLkaKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+lmtt5o; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-60a068e26d8so52428107b3.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 18:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710292719; x=1710897519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFUU+oX8StgwuFecKW/wNRie0VAq/OIFF8EgiADtxO4=;
        b=M+lmtt5ookGTSEJu8ZpkC5bvSW7/0Wof8m0eQzKgfQakiAIf/mU2MOf+bbEoz6KL/Q
         29dZw3M5YKck0meRUckoq5VDP/HE20CKRBCH2mX1P8RmHU4qAY5uESr0wuLryeDMdODP
         BzEwtwSOlIRco/2tlnvfIGIwi0CabuKQzg22JbNSYEo0F6XArXBK+BJj5Ra7jLqisTpK
         RSg2lKjEMBrf/Scfb/7CIAH9q+fGVsT3nGQLK2c5SFnJ3SAKOcxVXyrvBBVK4HfH4Pma
         XvPvkRTrOL875KDIQoQVW+UdQlDmysitgfKFwt0u3L9S786986/t466wWWY1d0EHejkE
         e0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710292719; x=1710897519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFUU+oX8StgwuFecKW/wNRie0VAq/OIFF8EgiADtxO4=;
        b=Qk+hfm/ERnvcn90iffCxIVaW4vPPRxftTUQW3yYETcPGhu1cSRJpUmw6g3sCiHxv4e
         zsH5Yl4UxboguNFGVqfPJ5dSbdJvQwUvGfb3oJfOMCsKujzMWLfGrsu2oWz+sizn9Swq
         4l58e53Zf+P78WnhHUJPoD3gKYI2mu6OjCIQtRIz3By57+DuHnUK4kODTrPKiTnK08lQ
         5+BumWoeVBdqUQlY6EwFQHCYx+WwXKh9a1p50ntLmIMw96xLsfCLGWespQ3nMmzo0wPt
         PLAk6H+C5riqZHVOP4njRvEybA60j+Vcn9RNi5BmXTq+gMX6WG0R3kNrN+swjc/04YHe
         H9wg==
X-Forwarded-Encrypted: i=1; AJvYcCVBk/O6wKi4Y6xeh6Wn/q9BI+cYkSKnQ3t9cJ12CTxFeWHje3rkuCUhYrz/TPM6NQPaxHlkC6lqGcZd0Hu0cOax3QUX1KVSLgpY
X-Gm-Message-State: AOJu0YzU37xJ1qMlZ0bReNlfwIc1L69MNAqFA+q3yG7prus1z299lIQo
	eMpCgHq8DuftNd2EKnMYrYkEAKMvQyu739SVKLt0jvL8iC8wzh0xhBnJqau3HyVUzfPRs75iyK/
	orYCUDEuGjvZ2JhTgDe/Wd1dzO3k=
X-Google-Smtp-Source: AGHT+IHTMqjVaVUG0IqwUGqRN+gjnbAa6bZTabT8IYtp6xcugB/oV/0tPdB+LZ8wLTekcffiVrILRpkXWtQN4t3dkN0=
X-Received: by 2002:a0d:d6c9:0:b0:609:513c:a8f7 with SMTP id
 y192-20020a0dd6c9000000b00609513ca8f7mr1299975ywd.0.1710292718639; Tue, 12
 Mar 2024 18:18:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
 <ZfAGdjPgNh2GrVXt@hovoldconsulting.com> <1710257049.14565.6.camel@chimera>
In-Reply-To: <1710257049.14565.6.camel@chimera>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Tue, 12 Mar 2024 19:18:05 -0600
Message-ID: <CAMMLpeSRZvw_uAYEMoQo6be8p_2WLxz8FKXg350S9iNPYy1kpw@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: driver-api: parport-lowlevel: clarify purpose
 of PARPORT_MODE_PCSPP
To: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
Cc: Johan Hovold <johan@kernel.org>, linux-parport@lists.infradead.org, 
	linux-usb@vger.kernel.org, sudipm.mukherjee@gmail.com, hkzlabnet@gmail.com, 
	reboots@g-cipher.net, mike@trausch.us
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2024 at 9:24=E2=80=AFAM Daniel Gimpelevich
<daniel@gimpelevich.san-francisco.ca.us> wrote:
>
> That link is to a question that the submitter asked, and nobody
> responded to it. It seems that this patch stems from an incomplete
> reading of the kernel documentation. Those docs say:
>
> > SPP (Standard Parallel Port) functions modify so-called SPP registers:
> > data, status, and control. The hardware may not actually have
> > registers exactly like that, but the PC does and this interface is
> > modelled after common PC implementations. Other low-level drivers may
> > be able to emulate most of the functionality.
>
> So, the PARPORT_MODE_PCSPP flag denotes the availability of the SPP port
> functions, not any fields in a struct.

Hello Daniel, thanks for your reply. I still don't quite understand
what it would mean for a driver to lack PARPORT_MODE_PCSPP. Is the
idea that a parallel port could support EPP or ECP without supporting
SPP? If that's the case then in my opinion the documentation should
still be rewritten, but in a way to clarify that the SPP functions [1]
are not available without the flag, and the flag does not imply low
latency.

-Alex

[1] Namely: read_data, write_data, read_status, read_control,
write_control, frob_control, enable_irq, disable_irq, data_forward,
and data_reverse. See
https://docs.kernel.org/driver-api/parport-lowlevel.html

