Return-Path: <linux-usb+bounces-11404-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B39E490DDE3
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 23:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 639D4285F81
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 21:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FC116CD3A;
	Tue, 18 Jun 2024 21:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o6o96hoQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F3F13AA46
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718744493; cv=none; b=oav33cx1AK69+Y5DEhFGa35/EQkLedi6JMA2Qlu100YsH1ToVBiINnpvIJF7hzneH2DeIeumSqd2r19ZcqQYrt/VrLrb+OF4JzFjTuABGPSy3X3mHk+4jHp/x8BixLo1D6HG5meoRTsCwkVBZw0NepKJkdqr1lE1a6267yf0z1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718744493; c=relaxed/simple;
	bh=M7ojC6+AaFPXUzBfWBFLELK1Bru1aQbIwny2NtdCEBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WIfTxgphpv3rQOeYN9RixOYuyHxDo6m2zw36c+4T1oWDjnhySRzFRDy9utUFK6d2sI784RaMG12BTBJi9+StBSIH/+cQ11JvOmW7tlShvatQkIa88YnXvWABxYVE7zxQ2WgOTDylj8n4wJsCHrniWJoo6eNLfMmDr+WhOR1mr/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o6o96hoQ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6c4926bf9bbso3828987a12.2
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 14:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718744490; x=1719349290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSR2YUiEcVy69ZgXqO9rScAnVdBmxstHFyngSWDJilU=;
        b=o6o96hoQBkblbeegQwLFU7mGH8LYSNxZn/4OBlhWbI3TZCLQWXoMiO2ENJDRpGWl2i
         gSYcPIkP1YSt2hHSExZoohNnAIFuMi59LJoQjC7fZIQFmFtXizG6INsNF/1RMcWSTZ5L
         f7JUj+WoAl1vHtTOL+8pg3PhxhF9nvZzSHYDyHiNh0YjRb4E8HF1a27ZE+wrAu0UhjHO
         3eHhVi1rKUBF3brQZtWUTjvvr/OJzvkEJtcPrUfrsWsLFNxla7uxBVWu6QANWIvzsHDo
         z8leDSzRboW9wm9vplHQwruFcbIYV1C9/OPrqnl/QbdlG8HMyGnMisHEoG86o7x2cgtB
         TPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718744490; x=1719349290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSR2YUiEcVy69ZgXqO9rScAnVdBmxstHFyngSWDJilU=;
        b=iUhG4GQ25aY75BCXl05R7v7ga+idnlt8olkXQ4to7Vu2gX+NUExEQsLJOExJfGVYMI
         fudYjsVjRSFKY6waLqNfjK72g/ivUaeYQm1Gn01x3+CbYVvFsm/hpfdJ6k7dmyrc84y4
         81P5GF0k+TsANEP8BBqOPPqg1t/TeYMb6wRnPj8hqyJZoVjYYeCeP+5rECPMNGQojkBb
         EBKP6DUnLBcwJD05me9sZIS14FDFgL5yFvMQcRhc+RMK2HE6YDNhNOGFlVRCdLA8tOcy
         bp7nzrKIdC6fT4552HgC/rJ9TiPnui7W2PvquLgw8l0HkocxnW64iZatS7U5a+rWGrOl
         dW4g==
X-Gm-Message-State: AOJu0YxE1Fl7DqkJwPi6zvpACbs5Ndreu1LeQ3UF7hIgejxaLbmjZnQ3
	T2Yib1h3McHDuJFMWNh3v3ttTux4wxIpDs06T/+fVv2UUb3cg3RTEFU2HnkqWRSVj7uUlANhn/+
	XrMIoWSQN4/Wkof5GjaMOteAxQA3DT1G72o2b
X-Google-Smtp-Source: AGHT+IEOWcIISAmYNuDiOcjic/rhGJy9R5IWOKhy66koAG9hNpFJEzAGykSUAPEfxsgXqMM884xjXv7VWFkNCsmkl4s=
X-Received: by 2002:a17:90b:4004:b0:2c2:9591:342c with SMTP id
 98e67ed59e1d1-2c7b57ff13dmr854717a91.3.1718744490059; Tue, 18 Jun 2024
 14:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1d6a5eea-2f87-48ce-8176-b50153b27c09@moroto.mountain>
In-Reply-To: <1d6a5eea-2f87-48ce-8176-b50153b27c09@moroto.mountain>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Tue, 18 Jun 2024 14:00:52 -0700
Message-ID: <CAPTae5+EoFCMK8k+mEsoUArCamx4JSw23J1u5Vg4ei5w+dyPhA@mail.gmail.com>
Subject: Re: [bug report] usb: typec: tcpm: Add callbacks to mitigate wakeups
 due to contaminant
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 6:30=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hello Badhri Jagan Sridharan,
>
> Commit 599f008c257d ("usb: typec: tcpm: Add callbacks to mitigate
> wakeups due to contaminant") from Jan 14, 2023 (linux-next), leads to
> the following Smatch static checker warning:
>
>         drivers/usb/typec/tcpm/tcpm.c:4620 run_state_machine()
>         error: we previously assumed 'port->tcpc->check_contaminant' coul=
d be null (see line 4607)
>
> drivers/usb/typec/tcpm/tcpm.c
>     4600 static void run_state_machine(struct tcpm_port *port)
>     4601 {
>     4602         int ret;
>     4603         enum typec_pwr_opmode opmode;
>     4604         unsigned int msecs;
>     4605         enum tcpm_state upcoming_state;
>     4606
>     4607         if (port->tcpc->check_contaminant && port->state !=3D CH=
ECK_CONTAMINANT)
>
> Assume that ->check_contaminant is NULL and port->state =3D=3D CHECK_CONT=
AMINANT
>
>     4608                 port->potential_contaminant =3D ((port->enter_st=
ate =3D=3D SRC_ATTACH_WAIT &&
>     4609                                                 port->state =3D=
=3D SRC_UNATTACHED) ||
>     4610                                                (port->enter_stat=
e =3D=3D SNK_ATTACH_WAIT &&
>     4611                                                 port->state =3D=
=3D SNK_UNATTACHED) ||
>     4612                                                (port->enter_stat=
e =3D=3D SNK_DEBOUNCED &&
>     4613                                                 port->state =3D=
=3D SNK_UNATTACHED));
>     4614
>     4615         port->enter_state =3D port->state;
>     4616         switch (port->state) {
>     4617         case TOGGLING:
>     4618                 break;
>     4619         case CHECK_CONTAMINANT:
> --> 4620                 port->tcpc->check_contaminant(port->tcpc);


Hi Dan,

We could add a null pointer check before invoking
port->tcpc->check_contaminant(), however, it would be redundant.
Unless port->potential_contaminant is set, TCPM would never call
tcpm_set_state(port, CHECK_CONTAMINANT..) and
port->potential_contaminant would not  be set unless
port->tcpc->check_contaminant () is NOT NULL.

So the assumption of "->check_contaminant is NULL and port->state =3D=3D
CHECK_CONTAMINANT" is not possible in the code as it stands. But we
can add an explicit check for port->tcpc->check_contaminant() in
CHECK_CONTAMINANT to make it more obvious if needed.

Thanks,
Badhri.


>
>
> then we're in case CHECK_CONTAMINANT and the function pointer is NULL.
>
>     4621                 break;
>     4622         /* SRC states */
>     4623         case SRC_UNATTACHED:
>     4624                 if (!port->non_pd_role_swap)
>     4625                         tcpm_swap_complete(port, -ENOTCONN);
>     4626                 tcpm_src_detach(port);
>     4627                 if (port->potential_contaminant) {
>     4628                         tcpm_set_state(port, CHECK_CONTAMINANT, =
0);
>     4629                         break;
>     4630                 }
>     4631                 if (tcpm_start_toggling(port, tcpm_rp_cc(port)))=
 {
>     4632                         tcpm_set_state(port, TOGGLING, 0);
>     4633                         break;
>
> regards,
> dan carpenter

