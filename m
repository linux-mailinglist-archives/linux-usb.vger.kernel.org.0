Return-Path: <linux-usb+bounces-5735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2ED845C6A
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 17:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7E0298D83
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 16:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB69626BE;
	Thu,  1 Feb 2024 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d7TOtrL7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7708862174
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 16:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706803249; cv=none; b=GFE89WOh4+9dcnMnc5RfRMvSdeswDsbUZVFtY1Bcuik8OX0Hmposzpjtw9xbwUYPE9lY2iY9lOvU81tS5t51lj1alrb4uuJW2jOT2oxF3o/RW4iJ1eO7T++z7SaOgHLCLof0IsM3/jt088eycloTM8vtuOBeRPbgvTRtajLMxb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706803249; c=relaxed/simple;
	bh=LfH8VcU2Lhb55/DWAFRHRgTWaYRH6XpZml+946QsT8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjaM3qB+06s7MTyd2G0BSW4vpXzeIwPo+mE5NXtc9IjjAZABBo7AAR3bj6PlqAb7/tDmY/CZFW9ODljsJWXjnHfaAWt9vrNOrBRprf+EJx7G5BcKTVjAEJt6p9m4awp56XWqBOSo5TB9DbvMqG0bOeI3XrXP79V3x6kSSkGwabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d7TOtrL7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55f63fd3dd8so14290a12.0
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 08:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706803245; x=1707408045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1DMfysap4JrKaVpmot/Ile+whuj0cOJvZWdDpBWCyU=;
        b=d7TOtrL78rNkvnkc7FWdKyZ+Hc5xhLoH5jtiU9FFaTygKqsoHor/4LSsVk99fxKkmr
         tmBEWwIc4sRBiPlVfvUPK5dsPE2Mpl16mYc97RGRqEM0W8PMJ7Iw8kGmG3TVVMbQeZCs
         Bh5UqbeNy98rYGiy8nlyLUVHri3LOVljCRD2w4H1R+cxHL2Kr01/R3oNiuFRQ5lQVHzE
         J6Wa43X4M5XhveYIOG2AptagT/9k9mpeBRZQmHvsDV2Q7QDqb3peil0ho79SiSERuDD3
         e5cKqSr6Qr0ySCvfcdd/yncEkFJUIL6uWgAeEETM4KSGJOh9TtKHwNiLIsv30f5oejLE
         TzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706803245; x=1707408045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1DMfysap4JrKaVpmot/Ile+whuj0cOJvZWdDpBWCyU=;
        b=UaZ5VfkW5Z5UMKxibA0EHHlkpgEkuKTC5FarMwUeg/v4yWVCfSF80CY62u6rnK2sUD
         vBpXqXFX41MMlpojUoXcDZqxETma9mXvGnHt2CnhEdYbvNWPM0ZveeiPRWPdGLdlY4Pr
         njYpPKS0R9YA0lelhvUzwo+IhiNa6kli0LoHzSjh/crBg4YJmaRabF4KxrHsd+i3aObh
         KGaZ7yLR4KYBB7PVfNwJi5GBbH8/dJ/OpNS1cFlxsX18MfYHRFcQXLqf+tUmdEH70HlH
         0vTjT7j0DbhxcO6ChpgA2+8Zjlp8PAkWtxc5QaL7JbQg5VjuVY33V9V7+PxQlK6EoFtV
         ighg==
X-Gm-Message-State: AOJu0YxG2NsKYroTCJasxq8dB++lLtxdfAj19RICKAd5nUBLMkAc8lZN
	9o2IP+ZttVe2RDSv3JxBGdAgIV5pbKaQxPpY6p0LkaQrx03Zh+Wf+C2llOhlODetcH0V8VR+3zI
	V3tdVUJwdLwvUu0yoB9N96Nzo/B/qdSVBhMT1
X-Google-Smtp-Source: AGHT+IGPA4t3VShyiapoEsQ+eMSFj6xYW1M1WSp7kdkTKJlhK10lCpopzwUNGlhUan+VUHAy+5jp5I/OpgBbqT5Yoas=
X-Received: by 2002:a50:9fcb:0:b0:55f:98d7:877c with SMTP id
 c69-20020a509fcb000000b0055f98d7877cmr192536edf.5.1706803245323; Thu, 01 Feb
 2024 08:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130064819.1362642-1-guanyulin@google.com>
 <0e4221b5-bafe-4bea-b533-0ed8add81ef1@rowland.harvard.edu>
 <CAOuDEK2VSBcQdLKt27VrLUxH2S22275ffbe5mdVM=vBZDhceQA@mail.gmail.com> <09fce208-72b1-49e8-988e-ea149fbaf0b5@suse.com>
In-Reply-To: <09fce208-72b1-49e8-988e-ea149fbaf0b5@suse.com>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 2 Feb 2024 00:00:00 +0800
Message-ID: <CAOuDEK3YcHxm4H2+n1r5KZoFK9PG9+XeJD49FCKaeX+KFhkrzQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC] usb: host: Allow userspace to control usb suspend flows
To: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org, 
	mathias.nyman@intel.com, royluo@google.com, hadess@hadess.net, 
	benjamin.tissoires@redhat.com, heikki.krogerus@linux.intel.com, 
	grundler@chromium.org, yajun.deng@linux.dev, dianders@chromium.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, badhri@google.com, 
	albertccwang@google.com, pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 1, 2024 at 5:38=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wro=
te:
>
>
>
> On 01.02.24 10:02, Guan-Yu Lin wrote:
> > On Wed, Jan 31, 2024 at 1:12=E2=80=AFAM Alan Stern <stern@rowland.harva=
rd.edu> wrote:
> >>
> >> On Tue, Jan 30, 2024 at 06:47:13AM +0000, Guan-Yu Lin wrote:
>
> >> Why does this affect only the USB subsystem?  Can't the co-processor
> >> use other, non-USB, devices on the system?
> >>
> > In our use case, the co-processor only supports USB subsystem. There mi=
ght be
> > other co-processors support more subsystems, but we're not sure about h=
ow they
> > will interact with the system.
>
> Hi,
>
> it would be very good if you decided this now, before we add attributes.
>
> The reason is that if this feature is needed for multiple subsystems,
> the attribute should be added to the generic device structure, so that
> the naming and semantics are consistent.
> You really don't want to repeat this discussion for every subsystem.
>
>         Regards
>                 Oliver
>

Hi,

Given that in our use case the co-processor only supports USB subsystem, I'=
d
like to proceed with adding the attribute exclusively within the USB subsys=
tem.
Please let me know if there is any further consideration, thanks.

