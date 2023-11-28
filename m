Return-Path: <linux-usb+bounces-3454-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 046AD7FC940
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 23:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 858AEB21403
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501B8481D1;
	Tue, 28 Nov 2023 22:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NohylIsr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F10D1AE
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 14:15:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32fd7fc9f19so3842210f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 14:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701209726; x=1701814526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSuNbvFD94OG0oYk7b+7GOQt8DSjs2N76h+2PCSx+Vk=;
        b=NohylIsrBJkwAjoEL2hqa4tDzp2xvkI9It6wIjFbwVwg0DoPcXayX2z0VRG9vDm/gR
         xEj7xWtQdzd6uJzvXXNjpTCHYPqRx3Innl+SJuKivuMSvFmIutumMPVXJ8xnCzhQX/A0
         IibtGGbLji2aey2ooMPQoHLoWCrdB5Qv+C+bn4RrFHHmdrit7xeau3UHohVL6QNoAmo6
         orbJaGjACM9apdfvrrE7mPrQo9Qj1h+bt36n3pBsguRiFqH7jjv8DJqWD3tg3ru6ObBx
         L3Mp6PVI9/5eX23r3ko6yqycVVyAV0QWe9H2yvpLe7OSHtxF0HfHgoaLAUf7S2MBONDz
         5VcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209726; x=1701814526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SSuNbvFD94OG0oYk7b+7GOQt8DSjs2N76h+2PCSx+Vk=;
        b=pbbJfPCPPKT8RVwSlRD1PKLaeqwse1g/aKbnUtg+ixnJgkceB4c+kQ6RXIyxyeqKko
         6Nx1Hy/ClOM2GJpAjqX/CwEqdtQ3RYCvtOgMPAwUbDMmoENMTIeFNSgBqZ+hSq8if+ub
         nBa8OW585heRtFXnLFtabuqPuW4iYgO5qoml0xuw/SNPViyUf9G+1OEjKPSbDX4KDF6g
         XnDnUkyDi9IRyEEY0A6+xfXy5V/TG0b0K70o9OgVy8bbVT+6xD48MTuWri2PX58wbOWY
         +fDmac7g042IPYdxXAVTjxTKb34+TiUEAy+zbEP+tBL3jedmpu+amfMX3wC3D+ookXPc
         h5bQ==
X-Gm-Message-State: AOJu0YwMiXN+RBjQxZ6kkf3HPNqf4FpW6yJyLryce+1F64yi29SWfX5s
	OmkNpToR+MR3BVBRPzKAsv3s9jikETFdbKPBRkJKOw==
X-Google-Smtp-Source: AGHT+IFo5eMmUryvfDv0/Q2qmj29tK13SPoJ88ZCN7SRG/AW2iXQbMaREJXoDrOMgFKBOpSfgKWAiAma00T6FBnfSbI=
X-Received: by 2002:a05:6000:1962:b0:333:13d:16d6 with SMTP id
 da2-20020a056000196200b00333013d16d6mr4891352wrb.34.1701209726456; Tue, 28
 Nov 2023 14:15:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127220047.2199234-1-royluo@google.com> <2023112827-repent-broadband-e557@gregkh>
 <CA+zupgxfxaB_bO51ZXW+5T3-FMF94=Tm+mqZ92LCYBZtwiQd3A@mail.gmail.com> <2023112835-sediment-subsidy-7e99@gregkh>
In-Reply-To: <2023112835-sediment-subsidy-7e99@gregkh>
From: Roy Luo <royluo@google.com>
Date: Tue, 28 Nov 2023 14:14:50 -0800
Message-ID: <CA+zupgzbt17nRxLPpaQVpv7LJyVJjGFEHKMQN28amUD0Cr3zhw@mail.gmail.com>
Subject: Re: [PATCH v2] USB: gadget: core: adjust uevent timing on gadget unbind
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, badhri@google.com, quic_kriskura@quicinc.com, 
	francesco.dolcini@toradex.com, quic_eserrao@quicinc.com, 
	ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 11:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> If you think this fixes a bug in the existing code, why wouldn't it be
> needed?
>
> Also, this implies that you will not be wanting it backported to any
> chromeos or android kernels?

Maybe I didn't get the criterias in
Documentation/process/stable-kernel-rules.rst right, and yes, I do
want to backport it to android kernels.
Anyway, I'm sending a new patch with Cc: stable@vger.kernel.org

Thanks,
Roy

