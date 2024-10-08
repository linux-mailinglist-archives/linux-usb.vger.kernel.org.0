Return-Path: <linux-usb+bounces-15843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B29947D9
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 14:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6AE3E1F25F1B
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 12:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674831DE3C1;
	Tue,  8 Oct 2024 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q9mxOjv/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628A185B58
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 11:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388783; cv=none; b=XjJCLaVuSksR5YVu5XYFi/7qdvu6z1oN/RXefj+aYAa8mVL3TD9EwAoXJdEocw0Y1jXIYDTZf4mDUdF+7PtFlv/mZNjKRtMYGFplm7pd/a0qmbENtLuZHXgxmsUOHKIuctPXAitng8zDkttKDBUdk4e2TDbwn9P5SooaM9410eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388783; c=relaxed/simple;
	bh=Pz0SOGoJf/49jFAJMh+Bk3CmUi5Zcem4IPFeloGvAno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyrbP8j8UYyh8KNqs9U+Bsu0Rs/PrJUeHtyWP+knCC6zpAYvGpa8LvyECTA4L/KwIf26PkMqvexwnRwYYzaqW4yjwhYnQrnV3GwBb0le9PbvdkLy/aPJ3z/TtoIIgWkiYcJGmEe2WCnevi+gWvVQYx6VBrNuGvGlDhUfrKwKaGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q9mxOjv/; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb1dd2886so236025e9.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2024 04:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728388779; x=1728993579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOcmgkPNRf0kvEERDZQRUet6h/8Mc0E/vBAaBKPRt98=;
        b=q9mxOjv/ckqWMuYa7NT0EzMZ33Yw1LirjuKjrLTZnvUcKv3eQWcP0lB3JRpe1hlY47
         KR6rsOn0DQP+sHpBO9yWlnhXL5hRKDMG8LQgk2/BJg2/ovw6XZ5c7j7Uw8ezwK9r0Q7V
         xGJeLnKMLcm+KOu+MRvcLYbdieQtAneKcKhy5HhzTtAaf4qrVQe43vTSTr8zre1N6SZC
         6wtxwo47/xIJuLj1D+SPvY4NTVsMobr+xkZWHB1f1icoPAHMfxu83bmWuJyDC8b2S0Pc
         5z3j+0zeGssIkaDQYv4eFt5QEEWr58lYSYpWuUVHs2DXqDwM6GsdSJBQr0VbwthFlXPa
         vgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728388779; x=1728993579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rOcmgkPNRf0kvEERDZQRUet6h/8Mc0E/vBAaBKPRt98=;
        b=HALrpQ763IBuas36yuDYPa8HAyvmYrwD0P+2JsZMPHie39oGO1u1FlfditrInmwdRu
         sQleB/E2JrX0FxKlpHIiLWvBt/8BK1E6cE7QJsYdU2hQTWLSy0HLbAosAKQnKL2ssEgN
         XzMS+eeJKr071CkXCVkZxpsJRy+/8rd/5Ooq7UojQTYafALN53rQ/2/x0vujbYPbfeQw
         KGrAL/PNsEcE3mZTPXGWuwidlrQ+r/Am9+jJNv79KRfwX/hwMM50xJLjjgz69jTRL+7E
         y+/uek70oqkEQIwvo/LO1zm+KwMevrN/7O43YJKOrFPkZcncpH3ohZSxjRFpH561Ljav
         xolg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqihGW83SRRIJPxfMs3C8DNuyfIN3NQJGu1A0owTCQJo7Ssrmasb2uUb7+Bbwoydu4QmYkaKjrEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyATqzVeG3a2q0xqiEWU1OklxhbsDsWNKSNhHTEUrL3FuYOyGyg
	ySyHzIk/CD6PfEAGb9Zm6hnq1+VxlMOitnSwQZt1a183693tt2ODbTbRvh0+6xz2nWmQV33lgkl
	T261CQ5D+zqgqI7ctR4DFk/UgnUKDlR4cB3gg
X-Google-Smtp-Source: AGHT+IF/exW7Z8cqHE69JpNvFhXfSFn/gK+3++BaPSqwc/mLNvI2MIZL+YrUa/fxP6y1gQB3mQOVrQuly8TPYna1emM=
X-Received: by 2002:a05:600c:3d93:b0:42c:b0b0:513a with SMTP id
 5b1f17b1804b1-42fc83dee2emr4432795e9.2.1728388778507; Tue, 08 Oct 2024
 04:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007135508.3143756-1-joychakr@google.com> <20241007135508.3143756-2-joychakr@google.com>
 <c98ece5f-c105-41ca-af1a-bddc61893071@kernel.org> <CAOSNQF148N5meoFZkbGKoMXMZ62kf=JOV+1r0GCsep3DPP_Lrw@mail.gmail.com>
 <1bc2c476-9d7b-4c87-924b-ecaed0f721de@kernel.org>
In-Reply-To: <1bc2c476-9d7b-4c87-924b-ecaed0f721de@kernel.org>
From: Joy Chakraborty <joychakr@google.com>
Date: Tue, 8 Oct 2024 17:29:23 +0530
Message-ID: <CAOSNQF0b--3o5bseU05Eu3a2zDiTTYfbnQNONFo3imw3HnaONA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: dwc3: Add binding for USB Gen2 de-emphasis
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 4:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 08/10/2024 12:23, Joy Chakraborty wrote:
> > On Mon, Oct 7, 2024 at 8:26=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On 07/10/2024 15:55, Joy Chakraborty wrote:
> >>> PIPE4 spec defines an 18bit de-emphasis setting to be passed from
> >>> controller to the PHY.
> >>> TxDeemph[17:0] is split as [5:0] C-1, [11:6] C0, [17:12] C+1 for 3 ta=
p
> >>> filter used for USB Gen2(10GT/s).
> >>>
> >>> Signed-off-by: Joy Chakraborty <joychakr@google.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 12 ++++++++++=
++
> >>>  1 file changed, 12 insertions(+)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/D=
ocumentation/devicetree/bindings/usb/snps,dwc3.yaml
> >>> index 1cd0ca90127d..a1f1bbcf1467 100644
> >>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> >>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> >>> @@ -190,6 +190,18 @@ properties:
> >>>        - 1 # -3.5dB de-emphasis
> >>>        - 2 # No de-emphasis
> >>>
> >>> +  snps,tx_gen2_de_emphasis_quirk:
> >>
> >> No underscores.
> >
> > Ack, will fix it with a follow up patch.
> >
> >>
> >>> +    description: When set core will set Tx de-emphasis for USB Gen2
> >>
> >> And why it cannot be implied by compatible?
> >
> > As per my understanding these are tuning coefficients for de-emphasis
> > particular to a platform and not the dwc3 controller, hence should not
> > be a controller compatible.
>
> Platforms must have specific compatible, so this should be implied by
> compatible.

Maybe I am using the word "platform" incorrectly here, what I
understand is that the same controller(in a chip) when used on 2
different physical form factors might need different deemphasis
coefficient values to be passed to its Phy. Someone could correct me
from the USB link stand point if I am mistaken here.

Thanks
Joy

>
> > Similar to the property defined right above this definition which is
> > from PIPE3 spec for USB Gen1.
>
>
> Best regards,
> Krzysztof
>

