Return-Path: <linux-usb+bounces-4356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E2818C26
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 17:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9046EB250A2
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 16:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B0A1D54C;
	Tue, 19 Dec 2023 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="khOLHw4C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F771D54F
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 16:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so17473a12.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 08:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703003117; x=1703607917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YD6kGmy+HRdzXv571WEAQv2is7FOqhP1n3PSSdlrkeA=;
        b=khOLHw4CXMXXaSzPc3futDZOL7ZCBWPQe6zi7q8c98p34OBcL7x+HVn46DtHGV6NRS
         FIm4phndWVSzOb1F/exeKxIItYdtSwC2xww3vX1phpMHfz+waPd0lWR5XoIKuoVKfWvy
         iFWFjxF/irQyO2DU66Z09bC7u9IfpLlWSVFB/yhc1xTh6JKJwFniHsvnfcVdWBFGYS5k
         9U7Eg60LuBiig2dTKiAovuGIvqMgZNJJAXUWVXtzvpIrRgHWwGYjO7WdRy0ANLEAtbhk
         UQTz/JxuXOATwx3Ljx/3Dw+MLl1IIel0T85up09DuFp6AQs3Ux7gYs7XcQQ6aDMRQGQt
         x+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003117; x=1703607917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YD6kGmy+HRdzXv571WEAQv2is7FOqhP1n3PSSdlrkeA=;
        b=KuihaoeHBQWO9BKoBNRyY6RcPliZZz1yk+hqDKncfqybffW0C4wpyKsACBmISYON5m
         /k3iReAivPHyPlrWyMg86erd9b2ds7n5KJt7qz1yMn2bn16fiykqQJ0WAD626Pqm+EFu
         GViEQ5j/f9sHHUz6hQbB0o0DqgfnH/Ao88vBbT/E9q5z0MtaDI4ozNkKeF5dqGWrY/kp
         DfOT8vHqJwA8cZgFJRMOvUelGhehoOLKK5ul9gBB7TV55SGWCJt2tRpVMmCypRQuFTzW
         axjC7z0hWvdOVxs/MkqTqlt09kOoAPdLmGao3aTep/DWld+okvB0d3UAb+mm9LEGh82Z
         L05Q==
X-Gm-Message-State: AOJu0YwKoMtN9zZYxjK/Alj/wEZ/zdC+JrwpZ64VOH0U9mH3ul5B4axS
	lc2L6UMVUHYlKMrT9zCSHZ1NbK44QTXHhsjEcsxJbeW4reOf
X-Google-Smtp-Source: AGHT+IEAm+96JKlSG3to3wXv8eocuNM21ZuJHK2JvsMf7UbKAMepfHr55XUs+qnJeUmzaKQIpHHO9UCKwqRS4sUkXWE=
X-Received: by 2002:a50:d616:0:b0:553:5578:2fc9 with SMTP id
 x22-20020a50d616000000b0055355782fc9mr179330edi.5.1703003116624; Tue, 19 Dec
 2023 08:25:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
 <70822a4d-a9d9-4be4-9d1f-89e50a8a7378@suse.com> <20231218205953.g77zdjsojrgjak6a@hdebian>
 <CANP3RGf6OEA1kksEPSKd1A4U3P-GEp1ySnhi_X1qB_9KeQfMYw@mail.gmail.com>
 <0603f052-df86-4803-b7f3-4a263d7ebcf2@suse.com> <CANP3RGeg1NKGcoOyst-UWLbf=j9f2Qj27YbvTBPGMZADaqxeJQ@mail.gmail.com>
 <fb92d7d9-7794-47be-a9b3-6605c52ad594@suse.com>
In-Reply-To: <fb92d7d9-7794-47be-a9b3-6605c52ad594@suse.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Tue, 19 Dec 2023 08:25:04 -0800
Message-ID: <CANP3RGdKPzw5UyQE+FP34yF88VHPBiU3rPbg+g1zxH+vjsUNCg@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Oliver Neukum <oneukum@suse.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>, Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2023 at 5:24=E2=80=AFAM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 19.12.23 13:19, Maciej =C5=BBenczykowski wrote:
> > On Tue, Dec 19, 2023 at 12:45=E2=80=AFAM Oliver Neukum <oneukum@suse.co=
m> wrote:
> >>
> >>
> >>
> >> On 19.12.23 00:00, Maciej =C5=BBenczykowski wrote:
>
> > Perhaps.  I've been looking at the gadget tx code, and assuming hrtimer=
s work,
> > I don't see how it could possibly screw up...  the hrtimer arm/cancel
> > are clearly
> > at the same spot in the code where we allocate/unqueue the ncm->skb_tx_=
data
> >
> > (I have found a potential use-after-free-on-error bug and a stupidity
> > that I'll send fixes for,
> > but that doesn't appear related to this thread)
>
> Yes. Could there be a logic bug in the algorithm?

Perhaps?  But, as I said... I'm not seeing it (on the gadget side).

> Maybe it is necessary to also consider the time the first packet
> was queued and to transmit if that is too long in the past?

The gadget side does not (any more) adjust the timer (on later packets)...
Which is part of what makes it so simple logic wise...

This sort of bug would likely be easier to make on the host side
cdc_ncm driver...
I'm still not following it's logic...

>
> > But the host side driver seems more complex/confusing.
> > However, I've not really ever looked at it previously though, so it
> > might just be that...
>
> How can Hiago determine that? If you do a ping from the gadget
> to the host, tcpdump should show the timing of the echo requests,
> shouldn't it? If they arrive simultaneously we at least know which
> side the issue is on.

I guess you could ping on one side, and run tcpdump on the *other*.
Then look at the timestamps on the tcpdump vs ping cli reported...

If tcpdump shows ping requests coming in at equal intervals...
then the ping sender side + receiver is OK, and the problem must be
the return path.

>
>         Regards
>                 Oliver
>

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

