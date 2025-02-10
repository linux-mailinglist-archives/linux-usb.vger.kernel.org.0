Return-Path: <linux-usb+bounces-20433-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4FA2FEA1
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 00:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0976C1887258
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 23:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80B6261377;
	Mon, 10 Feb 2025 23:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="391O7On5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F7F1C3C10
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739231488; cv=none; b=fIIKcZSPzhrCwrLOx3Cfacy/MDHdIHfh/oWeGOkP4k64dV6hVGMdV9bUbmhub6MRlaRwJdSnnuNZyEzqHdzaLcGUBdEku+dkmqwBoBYN2b1RY1ur5P9fHGXVHr9Kr2//GFn4mFzPKThILNhD59rKHfhAwRUNEJlYSKFff4JBwrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739231488; c=relaxed/simple;
	bh=8y93GLx5oEKFbWriKxxtGuKxC4nVxTakpj0q+7BExtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T8tbIhFJqFD58h47uf7Hvvuj9K+TAMZoJpCQwKAai4zVrOlWBfl72nNz1Akc3GK/L3FVAOkZ5MWZGrMut21pfUHybqVnWiJmL3qrdF7ysIhF7RIt0BlJi/yc5DlVslMx06SH853pXOr0zSRssWi87ZHoHGzX1CBMx/zzbd7s2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=391O7On5; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3f3b8f6ff68so728215b6e.3
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 15:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739231486; x=1739836286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZe22CX8bjEljQqE/X18PzQlBgx3VPOHv4ii+2JauZk=;
        b=391O7On5S5fpUro0UKr9Vvl4bpoU+TW7WkyIJgY5D/vj/3137QDWjcaTlR6KI56XlM
         exFdmJnls1Zvp04aZ1OcOtK9mh9E4t4o2jUBj9UIQjX9W0yKfoI/erAIx3IzPrH2nFNK
         0QNBwGu+UIwrYImZG+EqW4+TvDVobG0Ge27Pf4e00Ouiw8XL3Z3x4aLaETcj3mMbg1KO
         r1fXxMMxrY6VUqiyh6cweb2iqMNcEIlWKY76n71VCU845ScmYp/HmaaPnxx1Y0+dbk61
         KVaIDJi8bqopT6F9hmjKwhfH7YgU74tr8+/1cWyR22lhfz4sxq76fH5OgyjBmn3Yl2ds
         4BwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739231486; x=1739836286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZe22CX8bjEljQqE/X18PzQlBgx3VPOHv4ii+2JauZk=;
        b=jf97ghRxbUeXSvpPbcGfUg5BQuAwQUzczzr5SURso80rW1S6X33Zh2/XRkgSQHQh2n
         P6t6OHClM0/WpRaLHOkNyheXWiyBl7mZKZJ3B2k4gzr5j/gXkyj7bPfWRKQd+1SD/2z4
         vRZEgkEzOHszwEc3xUJkbq1b8Z6LykcZQbHCSt8gYBXZEayXXm9FnheXwKbyJjdGKc3I
         OGZis0fEq73TXcnRCdyfBBSTZfNaW0tlGrxyKAGhKOQHIBYwAhf254YndMU82EPi5IhB
         vd44ghaOSPgcLp4m9dWVv3InYDXwwVYXF/0euZDoMuoSQMbBQYxbICrfTcKtjS/DTooV
         12pA==
X-Forwarded-Encrypted: i=1; AJvYcCWK0l+Wa3SFHmL6i1jTZWrpOnc52eq0lJFID1o1+5qwnzMu+d9x9t2HMFizdtipdYGf708HmbTpH4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAgtnYTnl52UVYj44p4Xme/xWEzdU5lQvGehXWfYCkLNid45gA
	05o8ltnifh0lvsaoOtiyJe2SsCKytrtSMLVyS6UlscLqeZk20yMa97jfkiNEIKorV2IPuBXNP8p
	/HdzC/xxlCG74dVOeKOX1ctqw74Je8qEtvKV6
X-Gm-Gg: ASbGnctLtlff4SLXK53LdSDFmQj/6A4iqIeWH41Q7VsSK6hcPuararoMsKb7WrjKqUc
	CJozyxw5cHoFHMvTbu1GokV3Oc/PD73Vob6ck6wQwyUz29APTQFnxJtN8Yhz/ZQ9TzIQmQt+fhf
	LbUv7C7BjhaWuJiOfWQprdTYUyN8o6tg==
X-Google-Smtp-Source: AGHT+IHuLnSHtPuNOUUDo6eSZSjQuYoUXhNNwpTBsmKLj0FndJlhcTPSRnjIBXPGqVasrsFQ14d0yUnIUP9l3ZkERZc=
X-Received: by 2002:a05:6808:1886:b0:3f0:5c90:f511 with SMTP id
 5614622812f47-3f3921e7ed2mr9342232b6e.1.1739231485512; Mon, 10 Feb 2025
 15:51:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209071752.69530-1-joswang1221@gmail.com> <5d504702-270f-4227-afd6-a41814c905e3@google.com>
In-Reply-To: <5d504702-270f-4227-afd6-a41814c905e3@google.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Mon, 10 Feb 2025 15:50:47 -0800
X-Gm-Features: AWEUYZmTqkrNQX7oj5ITMhk6PrY78GVnEbkrYb-DvR7qcJ1kKFIz7qBgYPD1m_0
Message-ID: <CAPTae5+Z3UcDcdFcn=Ref5aQSUEEyz-yVbRqoPJ1LogP4MzJdg@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: typec: tcpm: PSSourceOffTimer timeout in PR_Swap
 enters ERROR_RECOVERY
To: Amit Sunil Dhamne <amitsd@google.com>
Cc: joswang <joswang1221@gmail.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jos Wang <joswang@lenovo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:02=E2=80=AFPM Amit Sunil Dhamne <amitsd@google.co=
m> wrote:
>
>
> On 2/8/25 11:17 PM, joswang wrote:
> > From: Jos Wang <joswang@lenovo.com>
nit: From https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/pro=
cess/submitting-patches.rst#L619

  - A ``from`` line specifying the patch author, followed by an empty
    line (only needed if the person sending the patch is not the author).

Given that you are the author, wondering why do you have an explicit "From:=
" ?

> >
> > As PD2.0 spec ("6.5.6.2 PSSourceOffTimer")=EF=BC=8Cthe PSSourceOffTimer=
 is

nit: https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/process/=
submitting-patches.rst#L619

 - The body of the explanation, line wrapped at 75 columns, which will
    be copied to the permanent changelog to describe this patch.


> > used by the Policy Engine in Dual-Role Power device that is currently
> > acting as a Sink to timeout on a PS_RDY Message during a Power Role
> > Swap sequence. This condition leads to a Hard Reset for USB Type-A and
> > Type-B Plugs and Error Recovery for Type-C plugs and return to USB
> > Default Operation.
> >
> > Therefore, after PSSourceOffTimer timeout, the tcpm state machine shoul=
d
> > switch from PR_SWAP_SNK_SRC_SINK_OFF to ERROR_RECOVERY. This can also s=
olve
> > the test items in the USB power delivery compliance test:
> > TEST.PD.PROT.SNK.12 PR_Swap =E2=80=93 PSSourceOffTimer Timeout

Thanks for fixing this !

> >
> > [1] https://usb.org/document-library/usb-power-delivery-compliance-test=
-specification-0/USB_PD3_CTS_Q4_2025_OR.zip
> >
> > Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
> > Cc: stable@vger.kernel.org
> >
nit: Empty line not needed here.

> > Signed-off-by: Jos Wang <joswang@lenovo.com>
>
> Tested-by: Amit Sunil Dhamne <amitsd@google.com>


>
>
> Regards,
>
> Amit
>
> > ---
> >   drivers/usb/typec/tcpm/tcpm.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcp=
m.c
> > index 47be450d2be3..6bf1a22c785a 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -5591,8 +5591,7 @@ static void run_state_machine(struct tcpm_port *p=
ort)
> >               tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MO=
DE_USB,
> >                                                      port->pps_data.act=
ive, 0);
> >               tcpm_set_charge(port, false);
> > -             tcpm_set_state(port, hard_reset_state(port),
> > -                            port->timings.ps_src_off_time);
> > +             tcpm_set_state(port, ERROR_RECOVERY, port->timings.ps_src=
_off_time);
> >               break;
> >       case PR_SWAP_SNK_SRC_SOURCE_ON:
> >               tcpm_enable_auto_vbus_discharge(port, true);

