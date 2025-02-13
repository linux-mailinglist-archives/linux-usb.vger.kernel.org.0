Return-Path: <linux-usb+bounces-20577-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E16B3A338A5
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 08:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E63D188C394
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2025 07:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52726208990;
	Thu, 13 Feb 2025 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pKUCldKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451AC1FAC42
	for <linux-usb@vger.kernel.org>; Thu, 13 Feb 2025 07:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431035; cv=none; b=Prs6VAazFUAiL6ywUMRwdL40+Pb2WZHgzZxlMIIUvPnwLKulrZ1bS9DcR1GkcbQAFsL/8pWdqCgZy8tyxvh30mnoOdB9/WFOgzD/M111QipgJTbONintPWIS5V/9j1U3UIbnjhvc+IBXSNp6FjkzLZ0d5oyXxaUWU77fNFxm1ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431035; c=relaxed/simple;
	bh=XwVMXNQ761j3J7Ptn4ee+kWiWQc+4AgbYEzScpJOJFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=forVkyUHjMIqc0W/BkK7LCQuRSg3YX2MzhZOFtGqAsm+RxPS7v33zzpSS3b4w8MymIMosSvKNoC+F4SFT5gYYk0diQo+9JEf2k8toOGyGKTm/89Z2AkLXKNn6+pkEr90z4PAR7btWBWZ0RP0LFFnuFmq6qCQlxrBkTC4vATxweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pKUCldKf; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2b86794e3abso315841fac.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 23:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739431032; x=1740035832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAPzHDLMa8F4I+uGf+X/tuBXjfEKEnfqltbhxTQMiCY=;
        b=pKUCldKfzYzCQNftwC8WE7i8y3OusWFZkjrH86JyEJyFMzMnP7mnx5FHb2VSrqdvo4
         lpYAyDOBZgkH+mSnZYvulxenYcJ5noxEmLAzCW9niPIVB9LJRVixTHWauRYTf2krubus
         3ZNmZwOyUNN/tINzIpd7h2Kk8zZUrOh7I8hUy11ArGs0SEF3ABkyDigMHEXknmwL/O1i
         O9S9Ilwsmu8lC69XPZ0AJJk0svk7kakJdV0At5bc1z1JmvHgs+9NfvVvoZ8JlzJs7Mhe
         h/JaKgFzLIsOzibxA2yvYr59MTdEQ0Q+Ylx/KFJzTdD1AlIR2D/N8EYcYhl1ZMUTPDuN
         mAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739431032; x=1740035832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAPzHDLMa8F4I+uGf+X/tuBXjfEKEnfqltbhxTQMiCY=;
        b=FDUTED1bNwJw1/E7l8z493sT02tbeuzS0DB1K4NrVxJdPxDv9jw5uS5+8HFFpPOREI
         iNo6k4vYVZpCHmHvwI1aDmwZjzf5tXbTJLTcTGHxCy2P3b7Brr/oT6FlNDJsJL4SXjH4
         y6YlQCUhvbN9bCG7PO9eaMKz5dw4yNctPKiPlPjo4Wt/Ok2mehLGaLfzIIO19l4OCthz
         CZwZX/8tTl08rjZzirhjblgxjLCj8RNyTq3PJFFMpcMV4JfGbXPagcHm6ODL80Xhbf5z
         2q+3JGurpbZcfHKEOaZ/hlvSR2u8xyjWmjJA+WHCIKcuK681p4+IA/7mXVXmNIl8n6Sl
         mI8w==
X-Forwarded-Encrypted: i=1; AJvYcCVCDjiBl9Ea9W5PQSS5KuC88oi4A6uPLkVVBAqJOOKnwYt6kzx61f8SA5balt1vsG7Xx7ScPIUGNlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyyaObQq6MOz6rcOdIOaYzMLKaJcCBIxozg8DSAm0ZMEmgiG96
	NfguddF3qeEYHwdaGAMw2JE5JSMLPrLrQBbE09N0ychgSFqs0o1qJnH0l7sBthBh9RMF9s5bDhb
	NbqrWg4OC5Xoi0sGaPGizE882UHLM6IKwZmGM
X-Gm-Gg: ASbGncvFw0hXwkCNoWnsVWvTHjcJ15lYr0BxwXmYA8p0p3Ge+6CgaG1wPsxCD8hfo/V
	XJHpf6Cjfgrq1eGHoAVvqN3L6XRocVTNCZkGfZMflPdd1bctqTJZUJh0gS5e5gQERl0F1nhCwSN
	HvuHhaIcGoJ9/KQvwN5MS1SQalPAIBfw==
X-Google-Smtp-Source: AGHT+IEfsRGc6DLQY4CQesdImaEpBlwTV0xIah205sPo/thcjlRBTIl4u2FV25/hHf9zrYLZB0A6O/UXUSdB+3lpew8=
X-Received: by 2002:a05:6870:7ecb:b0:296:fff8:817 with SMTP id
 586e51a60fabf-2b8d682f1e6mr3912622fac.35.1739431032122; Wed, 12 Feb 2025
 23:17:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209071752.69530-1-joswang1221@gmail.com> <5d504702-270f-4227-afd6-a41814c905e3@google.com>
 <CAPTae5+Z3UcDcdFcn=Ref5aQSUEEyz-yVbRqoPJ1LogP4MzJdg@mail.gmail.com> <CAMtoTm0bchocN6XrQBRdYuye7=4CoFbU-6wMpRAXR4OU77XkwQ@mail.gmail.com>
In-Reply-To: <CAMtoTm0bchocN6XrQBRdYuye7=4CoFbU-6wMpRAXR4OU77XkwQ@mail.gmail.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 12 Feb 2025 23:16:35 -0800
X-Gm-Features: AWEUYZmRfdK_T6BH_zrmkDkJWGSMnlIR49ILGN6X5bdP8CDQPfCyq0ocxuORgqU
Message-ID: <CAPTae5J5WCD6JmEE2tsgfJDzW9FRusiTXreTdY79MBs4AL6ZHg@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: typec: tcpm: PSSourceOffTimer timeout in PR_Swap
 enters ERROR_RECOVERY
To: Jos Wang <joswang1221@gmail.com>
Cc: Amit Sunil Dhamne <amitsd@google.com>, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jos Wang <joswang@lenovo.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 5:50=E2=80=AFAM Jos Wang <joswang1221@gmail.com> wr=
ote:
>
> On Tue, Feb 11, 2025 at 7:51=E2=80=AFAM Badhri Jagan Sridharan
> <badhri@google.com> wrote:
> >
> > On Mon, Feb 10, 2025 at 3:02=E2=80=AFPM Amit Sunil Dhamne <amitsd@googl=
e.com> wrote:
> > >
> > >
> > > On 2/8/25 11:17 PM, joswang wrote:
> > > > From: Jos Wang <joswang@lenovo.com>
> > nit: From https://elixir.bootlin.com/linux/v6.13.1/source/Documentation=
/process/submitting-patches.rst#L619
> >
> >   - A ``from`` line specifying the patch author, followed by an empty
> >     line (only needed if the person sending the patch is not the author=
).
> >
> > Given that you are the author, wondering why do you have an explicit "F=
rom:" ?
> >
> Hello, thank you for your help in reviewing the code.
> My company email address is joswang@lenovo.com, and my personal gmail
> email address is joswang1221@gmail.com, which is used to send patches.
> Do you suggest deleting the "From:" line?
> I am considering deleting the "From:" line, whether the author and
> Signed-off-by in the patch need to be changed to
> "joswang1221@gmail.com".

Yes, changing signed-off to joswang1221@gmail.com will remove the need
for "From:".
Go ahead with it if it makes sense on your side.



> > > >
> > > > As PD2.0 spec ("6.5.6.2 PSSourceOffTimer")=EF=BC=8Cthe PSSourceOffT=
imer is
> >
> > nit: https://elixir.bootlin.com/linux/v6.13.1/source/Documentation/proc=
ess/submitting-patches.rst#L619
> >
> >  - The body of the explanation, line wrapped at 75 columns, which will
> >     be copied to the permanent changelog to describe this patch.
> >
> "As PD2.0 spec ("6.5.6.2 PSSourceOffTimer")=EF=BC=8Cthe PSSourceOffTimer =
is"
> This sentence doesn=E2=80=99t exceed 75 chars, right?

Apparently, It actually needs to be wrapped around 75 columns, not too
early either.

Thanks,
Badhri

> >
> > > > used by the Policy Engine in Dual-Role Power device that is current=
ly
> > > > acting as a Sink to timeout on a PS_RDY Message during a Power Role
> > > > Swap sequence. This condition leads to a Hard Reset for USB Type-A =
and
> > > > Type-B Plugs and Error Recovery for Type-C plugs and return to USB
> > > > Default Operation.
> > > >
> > > > Therefore, after PSSourceOffTimer timeout, the tcpm state machine s=
hould
> > > > switch from PR_SWAP_SNK_SRC_SINK_OFF to ERROR_RECOVERY. This can al=
so solve
> > > > the test items in the USB power delivery compliance test:
> > > > TEST.PD.PROT.SNK.12 PR_Swap =E2=80=93 PSSourceOffTimer Timeout
> >
> > Thanks for fixing this !
> >
> > > >
> > > > [1] https://usb.org/document-library/usb-power-delivery-compliance-=
test-specification-0/USB_PD3_CTS_Q4_2025_OR.zip
> > > >
> > > > Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm=
)")
> > > > Cc: stable@vger.kernel.org
> > > >
> > nit: Empty line not needed here.
> >
> Modifications for the next version
>
> > > > Signed-off-by: Jos Wang <joswang@lenovo.com>
> > >
> > > Tested-by: Amit Sunil Dhamne <amitsd@google.com>
> >
> >
> > >
> > >
> > > Regards,
> > >
> > > Amit
> > >
> > > > ---
> > > >   drivers/usb/typec/tcpm/tcpm.c | 3 +--
> > > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm=
/tcpm.c
> > > > index 47be450d2be3..6bf1a22c785a 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > > @@ -5591,8 +5591,7 @@ static void run_state_machine(struct tcpm_por=
t *port)
> > > >               tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PW=
R_MODE_USB,
> > > >                                                      port->pps_data=
.active, 0);
> > > >               tcpm_set_charge(port, false);
> > > > -             tcpm_set_state(port, hard_reset_state(port),
> > > > -                            port->timings.ps_src_off_time);
> > > > +             tcpm_set_state(port, ERROR_RECOVERY, port->timings.ps=
_src_off_time);
> > > >               break;
> > > >       case PR_SWAP_SNK_SRC_SOURCE_ON:
> > > >               tcpm_enable_auto_vbus_discharge(port, true);

