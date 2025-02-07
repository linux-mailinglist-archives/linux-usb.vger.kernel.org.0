Return-Path: <linux-usb+bounces-20318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B2DA2C101
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 11:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B230D7A2791
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 10:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713EB1DE89A;
	Fri,  7 Feb 2025 10:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kzvMGjJS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280811DE4CD
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 10:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925660; cv=none; b=pU7naQVfkbYxtiznXbBten3FK5GMr4C3qXzCxmMq3Y6KTsXj1cP6X4/M7RXt0ahyF2wdBx4fNb/R0F+54CSqxF7mGGV4c7aPhnpPwsQfuwVntYunIEQbrOmKCngIyRQpIDFaOcz1LOxTiCAt5U02rvXRk1w5TNglg8WvdYmaxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925660; c=relaxed/simple;
	bh=dSflpRyFbrTCZVi6NediRQrPo4kuZnPLOGm2z/uaHaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDq6DD9wYvko5gdA5M+U9nLfGJkDiCCaR6tkZCl3N7BoI/guERAnf+8QGc1ZYptsJ15tORwldhE6NYGjFzEIWhoffovaZwTjx0hwimiZ1QNbIvfd6dsH+W9RvGbkgyTsPVMFK45Pw6XCmooW0DIlAUC9DRqFAVvYdGvstFU3hU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kzvMGjJS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso8303a12.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2025 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738925656; x=1739530456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSflpRyFbrTCZVi6NediRQrPo4kuZnPLOGm2z/uaHaI=;
        b=kzvMGjJSnUIqR/UCh2PbiPgU97eZO2gcUYO5oJBNJVWF30FVs9FComzsK6KVeGPJyP
         d7Lzl9da709MS1Qe3EDdkrxZY5zkGk/i/MsOnAbeNDt7wJ2cCnmE195pDf+5e15zWsUh
         dw7BwnaSZS9aYqvzPrlgm1KrI3loSAgKFU1u3xheTLIDpp2+upRkzKvEuDF39PVIpi85
         N2NEszzPAzGi1JfQya5TkVB5E/nHDpI78pOEpoYxJ2GCR9flUdLGkF6awAVIjI1Eeib+
         T/P2u4hfxHc6YjDzQasIZ0sllYqzQBF2Aas6l4S5bpZ2Juz+/Gs16amkKfRQZGO1xsbf
         7Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925656; x=1739530456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSflpRyFbrTCZVi6NediRQrPo4kuZnPLOGm2z/uaHaI=;
        b=k8E5iGUX40LKbSCqK3ycEOiAZFmFISzDWwkP2QbYzuI/HZeoQmmxtHCoUGL14wSFCV
         KsXloz26++Hjmi3iattyKvS3hsIo0fLi/SJkua4TzFWY0SLMwSEpAkPrh3jtIfgHf2Mq
         ZFwkqNTDj0m1k/vPFWyiGji+25oCqTeOGA64HPJbVoA0QbCQ8WoP8B2NDE6kFwJPA3LB
         E+9lVX+/R2Wi7QPfw2y8uV7zHz9SLpfS7X43eT0WBxU9DhVzcHjkO8m3MQgaDyvHLEOM
         wAJw7aL46BJM1FszrDIkq3VjIi2j+4lsJBXMbEioG657zdDQTCqiDCEeArew1jPenPuf
         8Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCViSItah+2fEhwEMbIOF27brHhI4PEj+vie3QZDIEQedyAgfT5pvJds42jT1JXa5AJSpS5xGJz/m0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lEiaauqD10XKHc0OvkqTJIkIz0t3yI/mMox/y3IuZ1gYd/p6
	R8OeeOZxX8A8A0ieyIFpYW0jF+C8JKC/YhWkyaP4SOEZrynfVD9Gp6L8E7HaWaCCEdWt7J9f3rR
	yRDiBKQSngnAosOqD+SoYAYO8xivA2F8M/Oug
X-Gm-Gg: ASbGncs6aGRnqOrCLfNB30URc7yllGMp+DiLwWVq7KFX56QnZ9dWnfuzuDEjEaVrw0M
	R1oJ/Bk2nxNmx6jPjF/2Z+O5vUKEdkyxzvWRZNDS41Ol80Kzmp9E7dDDxelq8X7V6d18SEb/dFN
	HjYjRI/F+2ZltO2gk0PzOhoOFe
X-Google-Smtp-Source: AGHT+IHtlyXXzkvXmLUKCILij4rf4Kf6Xt30bOPrPbaEDL98V2QDPJq4D2CF12ijDlbmudrFmDB1UoNvTH8Vc+Diqvo=
X-Received: by 2002:a50:ee16:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5de46901c8dmr88336a12.4.1738925656242; Fri, 07 Feb 2025
 02:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-1-guanyulin@google.com>
 <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev> <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
 <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev> <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
 <c8c699f7-bf9b-4e36-910e-c6f1c7092543@linux.dev>
In-Reply-To: <c8c699f7-bf9b-4e36-910e-c6f1c7092543@linux.dev>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 7 Feb 2025 18:54:00 +0800
X-Gm-Features: AWEUYZl-ygjTK0GFUqDaE7UIIfIr1rSe0TLqJUl1pqqByXhtdHXZ0WZRgydueGo
Message-ID: <CAOuDEK1w9Xbik-VbXwSd1ZYUWx9EQ_TnvEdV3WX2L-8Wtuj5bw@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz, 
	tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 7:57=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.dev> wrote:
>
> On 2/2/25 20:57, Guan-Yu Lin wrote:
> > On Tue, Jan 28, 2025 at 11:22=E2=80=AFPM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.dev> wrote:
> >>
> >> I am not following, sorry.
> >>
> >> Is the desired outcome to
> >>
> >> a) prevent the system from entering S3 if there is an active USB audio=
 offloaded stream?
> >>
> >> or b) allow offloaded transactions even when the system is in S3?
> >>
> >>
> >> which is it?
> >>
> >> a) would be rather interesting, but currently we don't have any such b=
ehavior supported. When the system enters S3 all audio stops. The stream wi=
ll resume when the system goes back to S0. Do we really want the battery to=
 drain in S3?
> >>
> >> b) seems rather complicated, once the on-going DMA transfers complete =
then who's going to refill buffers for the USB offloaded streams? Allowing =
the lowest level to operate even in S3 is only a small part of the puzzle, =
someone's got to provide data at some point. Unless the data is generated a=
lso by a side DSP having access to mass storage or wireless interfaces?
> >
> > Thanks for the question, the intent of our proposal should be (b), to
> > allow offloaded transactions even when the system is in S3.
> > In our design, the DSP wakes the system before the buffers are fully
> > drained. This patchset enables the USB controller for offloaded
> > transfers during system suspend (S3). To be precise, this patchset
> > focuses solely on enabling the USB controller in S3 and does not
> > include other necessary components for continuous offloaded USB
> > transfers. I'll revise the commit message/cover letter to reflect
> > this.Thanks for highlighting the potential ambiguity.
>
> Thanks for the precision.
>
> It was my understanding that anything above S1 could incur a hardware/sof=
tware latency of two seconds or more to go back to S0. That would imply a b=
uffering scheme that's significantly larger than usual offloaded solutions.=
 In "typical" offload implementations it's rare to go beyond 100s of ms, si=
nce at some point you run into user-experience issues when applying volume =
changes or when changing tracks. It's usually a no-go if the user has to wa=
it for a perceivable amount of time while the buffers drain.
>
> Not to mention that quite a few platforms no longer support S3, since 'Mo=
dern Standby' aka "S0 Low Power Idle" or 's2idle' was introduced in the Win=
dows 10 days S3 became largely a legacy feature gradually dropped since no =
one really uses it.

I think for mobile devices, the S3 state is still used since the
hardware/software latency wouldn't be as big as you described, so
mobile devices could still use S3 for power saving. How about using a
"knob" to isolate the feature to specific devices? "Knob" could be
dynamically switched by some functions, or we could statically
determine it as a dts attribute or build config. Will a "knob" address
your concern for this feature? Do you have a preference on the "knob"
design?

Regards,
Guan-Yu

