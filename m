Return-Path: <linux-usb+bounces-20319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3199A2C122
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 12:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2E0B188D024
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2025 11:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812321A76AE;
	Fri,  7 Feb 2025 11:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fTB31bCB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF718FDD5
	for <linux-usb@vger.kernel.org>; Fri,  7 Feb 2025 11:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738926050; cv=none; b=duOAR1bqvDn2SlOrtsZZiJtzZyAR2DaW6jRKD4e5LZyTfAjwrGDEfTVDYSQnsomUn6j7deqM640X4vssFdMGd7lFkcSE2EYBHVswRqxqwa740ao3hj+Mv4n3Tn3WxjIyiRx/+rEYTRRO13Gsve05pAkPPuEdJGPut4GhIWNh3H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738926050; c=relaxed/simple;
	bh=ElkCd0VSmZ1y7aJo1xSkdXaYuOZ//Q71DJVBY+TzsMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyrckIyoHZyn8ihElC/Fod0gSKBPxHPOTsY1EWp/lPjxvwAGaCsU7tFr+Zsbb5m0ppaUPDp6t97ibwj4/RSFjD35iInNlJjdSrCefqRF1EfErH8sTP0BSEtRYvXprR2jWzPwqCiuiT34V1SDu1fIxBiU9qBnuAls06NBSSRDkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fTB31bCB; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dcd33d9d9dso8359a12.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Feb 2025 03:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738926047; x=1739530847; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPNEh3d8SXd4UyVBzDYe+DWkKrqBsXALhs4HDck1znw=;
        b=fTB31bCB6ffITFXBEVurhxs52loAUV9Zj237mXjdgHx7EOZQ1o3TFS1l5pIhwwymZC
         HeHhLp72V1M48e+MJkL4qrZKoC3F/FK9pwW8y9/q6yp7MJgwEoKo2ejQjyH7T+6vfTsG
         ltqCsT4vofRnwPEmxehKex/2/hMibuJfSWXD8IVpg5YtBrvzInQPZT+qX+K5pU4Yqe6c
         +z1dAzClMLSzans7A/9AW3QWH93g2BdFju10bRXXJA2JujIi1L3REkZYrEYJYOoCwGX1
         /Z7HJS0Ll+3cV8O6SyKPJ0lm8t6Hry2ksD5dJV0fqiMriy9LrKRVPRY/h+o0o8atFKYh
         P3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738926047; x=1739530847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPNEh3d8SXd4UyVBzDYe+DWkKrqBsXALhs4HDck1znw=;
        b=o/mKjsPK5n5SPFSkBB/f6iWdPoY9f5PNE9/N7VZ4wn4k5O/+MAaT1xKYyqIKoAp6Mj
         KgVoD20oqGaSu5xJOqNqjbfbM4Dqc0LT6qQpoVWfaw9loaJmmsC+NWbPYyByWZ3KeyI1
         GW1N/uDZfPw0cCKHQY/Kv6ZcnDlL7Yd+W0lUqHTJ333xHDRsCh4qj1LIVOv9Nob9QwqU
         QmceyxGH//CPLPQxf09CzRDRqz7bdtM5RxhZVOJwgpK0VGq8f7IfpQNV/rHvns29q9Fi
         H0v5AzsR6g5JCU1rbVWELXu/GoxaGCyda8hqmXW+4KdBwELXfp9bQlT87GXwHtWjoE56
         Hr3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUipxowMXweeDjauoagkRFjX/oipVmQKjndDhOIRp/7TT58f970V1tb8uncgRJsivYrsUoVHWzt5eI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLX3OdUHC1ONQau1souBqzbe69rCdzrHabbHNoLHkQ7g+VV10x
	nGK75QeX+JUS8b+4JPWr1FilVoc9G7HqqCv2sH68uZk4tEysjc3xmxvH1q8gaYQgB7xGTZrcKq4
	tVVs9Re3/qoe+OjIDFeVZTa780CP2a/5Cm4FA
X-Gm-Gg: ASbGncuS7dIT7iusjtCCDIc2C7lFKmg+KPOc9AaVT4ARGvagQQ/jsegsMm4woDlbBpK
	D/o3IgHpGAHYWSu9ksTdgVlfjQqDo/ebJn21uucCLCkMZvT0QL7VYC86TgSG7XMSF8myRocirq9
	BIfYLpvJST9cCHtJSkLePO9SO6
X-Google-Smtp-Source: AGHT+IGKGJth5652Acd+gw45CCa0RFZ/zp8RtL4d3FGKWPR2wRFDG4a+498kMReRGmDCy02tEid8QT1Lvxxfgod8Vaw=
X-Received: by 2002:a05:6402:299:b0:5dc:59ca:8f3b with SMTP id
 4fb4d7f45d1cf-5de47d9504fmr74611a12.3.1738926046475; Fri, 07 Feb 2025
 03:00:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117145145.3093352-6-guanyulin@google.com> <20250206011324.4729b548@foxbook>
In-Reply-To: <20250206011324.4729b548@foxbook>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Fri, 7 Feb 2025 19:00:00 +0800
X-Gm-Features: AWEUYZnVEvD7t_Dz9KkFhfaKqY6-yN5VtxdJYuumvbaB5-jEOXHVpXFPVyLQTDM
Message-ID: <CAOuDEK2c-F8dEyR894c5=OVYTJiLX6y1e1vd1RKoxusNa5PFig@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] usb: host: enable USB offload during system sleep
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, kekrby@gmail.com, 
	lijiayi@kylinos.cn, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com, oneukum@suse.com, 
	perex@perex.cz, quic_jjohnson@quicinc.com, ricardo@marliere.net, 
	stern@rowland.harvard.edu, sumit.garg@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:13=E2=80=AFAM Micha=C5=82 Pecio <michal.pecio@gmai=
l.com> wrote:
>
> Hi,
>
> > - not flushing the endpoints of actively offloaded USB devices. Given
> >   that the USB devices is used by another entity, unilaterally flush
> >   the endpoint might lead to unexpected behavior on another entity.
>
> This doesn't seem right, because flushing applies to URBs managed by
> the kernel, so it should have no effect on offloaded endpoints.
>
> As far as I understand from your earlier discussion with Alan Stern,
> the real reason is that it disrupted operation of class drivers, in
> particular causing kernel-managed interrupt endpoints not to be polled
> during suspend and some events were being lost.
>
> Or maybe the real problem was that if the INT IN endpoint isn't being
> polled, device events don't trigger xHCI IRQs that wake up the CPU?
>

The main reason is as you described above. Without polling the INT IN
endpoint, some functions (e.g. hid, hub) failed during system suspend.

>
> And by the way, usb_hcd_flush_endpoint() doc states that no new URBs
> may be submitted during this call. I wonder if this can be guaranteed
> if the interface has not been suspended first? Perhaps this alone is
> good reason not to flush.
>
> Regards,
> Michal

To my understanding if the interface creates another URB, then the
interface might be able to submit it. Is there a reason to not
flushing all endpoints on a USB device when we have offloaded transfer
happening during system suspend? If there is, we'll identify what kinds
of endpoints are influenced and not flush them independently.
Otherwise, not flushing all of them might maintain a simpler code
logic.

Regards,
Guan-Yu

