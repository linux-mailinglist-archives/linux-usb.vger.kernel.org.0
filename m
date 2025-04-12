Return-Path: <linux-usb+bounces-22997-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2538A86AF6
	for <lists+linux-usb@lfdr.de>; Sat, 12 Apr 2025 06:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 762F77B0851
	for <lists+linux-usb@lfdr.de>; Sat, 12 Apr 2025 04:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8B918A6AD;
	Sat, 12 Apr 2025 04:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SEpzgaz+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7B92581
	for <linux-usb@vger.kernel.org>; Sat, 12 Apr 2025 04:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744433031; cv=none; b=X3opdOxitsoiQZmGWm0W4cP33Q1G/e9wvU8OKaSiK5Hk3g4cPUXdMCrY2WZr+/bX7Pdv0wOaI7th3Zvx5gIxRVKXHNkk9SMNm/V4jSVe1R7BfnY5Tyzt3t41vHfAoyZio++TdRaJmml8tQMBxkwqh0Q04BQu+F0OzE3zeuGrPlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744433031; c=relaxed/simple;
	bh=EylllJImv3qhzLeg7Hz3ocN2fi83rwMC9jhdkJm3RDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSRvE/liHXK/inWAUt9rqff39dcuI4gHj7xsOcrzxSwylXmHd582qoSLCHWQ6v3qLRGvrDz3BkVKJ/ehA63Vyg6dF0sbm49FRZ1vP6XZfqUW9SUHh6L6SC0vv6fz3DbRDXR0Ov12TYUvIvgR2rV0NWRQlQ8MB4BCmaPmSGqv3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SEpzgaz+; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549924bc82aso2090e87.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 21:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744433026; x=1745037826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnTCsDVWU5J4Xw4ABLK6h0NzKq/dBZzCAzPAZFSnhMY=;
        b=SEpzgaz+3DEDWH3RUZ0cxdmerJuDZzGejGEcdGDo1PWNdM48Hy15Tn6Wy2dA0AGzdI
         Ht/NzzfAvawgMF71ST+ak/PozYgQ8PaZ6SP8pOUJcLdcDwbvzKamGpjs5LyKiPssPiVz
         ZWIWj8uIOQEY1GUVmLKqxlv1he+/SJi4RjpLoHaT2YT/AmrJInH3NpbnP5vUZfOs/DaC
         ht80H1KWevkt3mu45tQ0RjKv5abpFpJeWWK/OA4tSPYKJ0x9nL8SHjTIXS8CC3QfGydZ
         j3AMg/RyLknEeuofucC3kV54uLzNYacqPAW5PwM4RF4PNaoWHHGTYUfDm44ZVQ820cYQ
         hjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744433026; x=1745037826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnTCsDVWU5J4Xw4ABLK6h0NzKq/dBZzCAzPAZFSnhMY=;
        b=qEUvVduVT3Y4vVagaxVX6FKnJBvvB8uyBGeQo5hdfanwxj2Ex1jGhMXuhkXaCCd2rq
         tYISNZpioCMfTGfs9PfsdLb8voc35TIucSbpsmgFg59Meiz54cDc+kr0VSZt/GVJaGgu
         4/nxIbuNRwZAG6W4OjYO3DOC3YWtnjpOnTtEQeUOrrXQKZKdbPhATjzoMFehrEBmzguM
         ETPUUK/2y6uiOYoSRAoKlnUcy0+KbrYSgKYIQA9EczWoo0G45vIoCoW7Bw3f8JTVvf/P
         X/LlzD9yKHLBSGxNAuOdnAtWGj/iHEhuW5K199KuxODotdTNGULvVTzGp2xn7I7N11St
         HBzg==
X-Forwarded-Encrypted: i=1; AJvYcCUyfhmCPAqirHZq0X9SxNFN2Ex4FsWP1KTbcvFjfdWG3+QEbnsuqv7QFHSqhbD7VU/Hekr2saJAwKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh5WTHeTWeWBs8yZdNj+iJNp2pGGc7eMQLNgW8fjLoKREQ6hH5
	B/U0sz9ZESclhpFhwmXq4UQ7QRKRImVgXf9wBK8VZtaRjMVuzNs5lLuyrbWx8b+nZo9sVG/YzNs
	BaIaTcbph33RCFzNz8Vcc3QIyIhKWTG/NpjrC
X-Gm-Gg: ASbGncstVeHoq1d0EZHdcXYeHXXmsMdGbJ4aBChcYiJCE03yEZ9mR08E9AzPKvE1SUT
	WXewrG4hpO86ssgu2prrUMDT1Dezj2bIK+EE362KtYcMb7Ux/ZIz781eN99z0UiLYLA1zyA/zW8
	WX4tBHaPPhe7Yz4Dog5LOgSFpK
X-Google-Smtp-Source: AGHT+IHnstA8OniMve4EXZITU1zVCY4y154h9HimNAz/Uo0RrhTicjqylKIFQodk/tjVtUv8odT9lNWzhaGFZHXckDA=
X-Received: by 2002:a19:4307:0:b0:543:e3c3:5a5e with SMTP id
 2adb3069b0e04-54d4b942080mr108384e87.4.1744433025987; Fri, 11 Apr 2025
 21:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327133233.2566528-1-khtsai@google.com> <2025041149-krypton-rejoice-bced@gregkh>
In-Reply-To: <2025041149-krypton-rejoice-bced@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Sat, 12 Apr 2025 12:43:19 +0800
X-Gm-Features: ATxdqUGbABxzaqNR9ApS36LdZlULbILlznZJz9K8NT1T8kLwQpJDLD7xl2RobSU
Message-ID: <CAKzKK0rDnEzeV0CuQdki3Gzh7yCvx_roHo4axfTYpN0V1Sv7-Q@mail.gmail.com>
Subject: Re: [PATCH v3] usb: dwc3: Abort suspend on soft disconnect failure
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, Mar 27, 2025 at 09:32:16PM +0800, Kuen-Han Tsai wrote:
> > When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() keeps
> > going with the suspend, resulting in a period where the power domain is
> > off, but the gadget driver remains connected.  Within this time frame,
> > invoking vbus_event_work() will cause an error as it attempts to access
> > DWC3 registers for endpoint disabling after the power domain has been
> > completely shut down.
> >
> > Abort the suspend sequence when dwc3_gadget_suspend() cannot halt the
> > controller and proceeds with a soft connect.
> >
> > Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>
> Always test your patches before submitting them so you don't get emails
> from grumpy maintainers telling you to test your patches so that they
> don't break the build :(
>

Hi Greg,

My apologies for submitting patches that broke the build. I'll be
careful to make sure this won't happen again.

Regards,
Kuen-Han

