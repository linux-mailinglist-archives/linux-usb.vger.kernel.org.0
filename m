Return-Path: <linux-usb+bounces-28970-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E63BC250D
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 20:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A12E34D978
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 18:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E088205E25;
	Tue,  7 Oct 2025 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YDGW7iSt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B277720A5E5
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 18:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759860234; cv=none; b=WtyN9eDZseaiPftC0tRRzhk2wnL1GYK16HA2awFOG4B0zbJinpJ5oWMzb7rylaBx/kvZbgKT9lMAFimRKetwVYWyU6RxKy6GnVBQws/FjmgEteYoK8madakOhfPWwZYVG2pMHVMU1BYc0cAji19PgSfpzQ4pB/7x4A9DV3/2pDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759860234; c=relaxed/simple;
	bh=NHEmrtJIgEleCWQcevq6nqZY7xNB77jO7eLNYiB6sEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=szdwqhWtkoe7KwyoqF8LD6EaCp/h+gJCfbrCj97tUG/gPZBz9hQ1Yf5UVkbd7A5JnxndFI0HMWGWJTCLXx/zwpCarZ33bOLUGfodZ76vitDYOVEGSTcGTEf7UloPJjBpJ2zYxRCFXjhHxqoLDXBaV0oWw09UpsH9HKHR8OT9bvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YDGW7iSt; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b632a6b9effso236113a12.1
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759860232; x=1760465032; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=;
        b=YDGW7iStLghTCfJ7+MCFpdhgAbzOjwWdGzzI4+L/86ppjDjIEg1yv6gMYK7LVKlQyQ
         A62FUxwi7lyqLo86FJjSoCt4Cxl4tlO0fCBif7yXNu8b81yfL6+NpNlMBvDELrOz4KVD
         Mp4yh4bsPfcGIXLH+lA7B/v9L+KcJsb0YxXnrsQuPpXPe7MF7chjW77QqwsBWQENainV
         SJ7yKYtzDCRymEeRt44ed1JSClqUNeFjqaFZkerPO885JnyLV+4lo/2X9BHI3g2q8V4F
         wm5F1GT8MSgfQGG8KePscMiHadq35L2g5kGW3vkcIM9+NuZVdcIgraWFc+UXAqJzXYQe
         4OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860232; x=1760465032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BoeUTdyH6Ho2hK/WV0Pq7ReoILwQzxKPA2QdB9ZFVa0=;
        b=JOEwulLHoMDFrd+aORDxfuRMiPQxWN45YfEuijqkFObhdfDQIsXBXx4WVT2jalTIEZ
         05Vp5tgUqe7T3Osp0AySIvWpmg1VGaZiT/eNM3acjvpNy0yvYOzyVR79hUY4J5eYFZIA
         KtlIFU80udbmx5tlF9ESrftUhRkMCy4eab/sKKwjeNcRQ8NoDnkRtXvy9Q3G/znq/qy5
         +Y/Mg9F7DVp+KJDihHoj5JAhwHLq+rrkaLAQb3RghXq/Wsh5iINbD9IPDnkjXQ9/zY/m
         B4xLc5G4jI1E69P+wd0ARQiYHRbsdcUCI9wPnONZHoK1VHjUffQLrL6+p82+QFIy+SeC
         aenA==
X-Forwarded-Encrypted: i=1; AJvYcCUI9N+ZmkBbF1gEgFjuiMCMzadOL5vr+FQUdRULP2IUlWUPBGZqItMUj6yDdPmKJ84NW2Hu5Y1A3Qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ySlEgbFBT/WIBp+zOwlEMd/dFU7EfcR37s3tBHd+Qq1pEIqD
	bLoY5SCK2X7Ak6cY6oRDLBGmLQSxKsPh9Yg3yyHo1j9dwl3xSY87PluAqXTWJhDkKX8j3XNcaIZ
	ScC95xRMhIDMLeTukgpvLSBdvxIPTShOx5wotRsPv
X-Gm-Gg: ASbGncuHXblDb4bTaNf03J4oTMvF9CCk+kQYCSRK4ur5taXz8PvxQRi4QPkKIjHSX39
	fwYIueLXf2s46MwW+UiG/U5kCQUPtAVpMneOYxp6K7p3u69+cKP4CNcjik3e5m0sXhWpdWuePU4
	s8KIev5MJ1c44fR+w+RInnNh38MgIY4D4FYZ8DBHwpO0u3/QPyYDgSkl4F0WHqUpT40r7xFZIfX
	jOTuEssr+3aDtv5h2atVYnVeFsUDb9dB1Bqc9XDFyQPtRvu1ULxW+YIBYsvkTdePAPV72KXqe2C
	s/L+yvXWNbHwuw==
X-Google-Smtp-Source: AGHT+IErqs+kJVv5rsWGTN2Z0xZ0ickiFqF1IQ4SpRF/lYWHEWgJPEacLea7fTefk87mdvoXJ1AdDn7lRgB9V20xPD0=
X-Received: by 2002:a17:902:d58d:b0:266:cb8c:523 with SMTP id
 d9443c01a7336-290273ffe89mr5647285ad.48.1759860231518; Tue, 07 Oct 2025
 11:03:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006232125.1833979-1-royluo@google.com> <36068ca3-912e-4e71-b688-8689ead8194b@kernel.org>
In-Reply-To: <36068ca3-912e-4e71-b688-8689ead8194b@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Tue, 7 Oct 2025 11:03:15 -0700
X-Gm-Features: AS18NWA8U90B63ffP5jXdkUD5e6eOAqItmxz5SXEaQputDmKkvJD4mEmS6I0ARg
Message-ID: <CA+zupgyLx8q23b-ecrLhYAU27HV_ZFMiH9XR81Q2MKRmMwpcNw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Add Google Tensor SoC USB support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Joy Chakraborty <joychakr@google.com>, 
	Naveen Kumar <mnkumar@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 6, 2025 at 6:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/10/2025 08:21, Roy Luo wrote:
> > This series introduces support for the USB controller and PHY found on
> > Google Tensor SoCs (G5 and newer). This includes:
> >
> > 1.  DWC3 Glue Driver: A new glue layer for the Synopsys DesignWare USB =
3.0
> >     controller (DWC3) as integrated into Google Tensor SoCs, including
> >     hibernation support.
> > 2.  DWC3 DT Bindings: Device Tree binding documentation for the Google
> >     Tensor SoC DWC3 controller.
> > 3.  USB PHY Driver: A new driver for the Google Tensor SoC USB PHY,
> >     initially supporting high-speed operations.
> > 4.  USB PHY DT Bindings: Device Tree binding documentation for the Goog=
le
> >     Tensor SoC USB PHY.
>
> This is useless message in the cover letter. We see what patches do from
> the patches.
>
> What you are supposed to explain here and in the bindings patches, is
> why we want this driver and what is Tensor SoC, considering we already
> have one Tensor SoC... IOW, explain everything which is not obvious -
> and duplicating SoCs with some generic name is for sure not obvious.
>
> Best regards,
> Krzysztof

Thanks for the review. Will remove the redundant info and ensure the next
cover letter provides the necessary context on the Google Tensor G5 SoC
this series intends to support.

Regards,
Roy Luo

