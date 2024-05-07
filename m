Return-Path: <linux-usb+bounces-10060-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B754B8BDCD2
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 10:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55FD2283AAD
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 08:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D485413C81E;
	Tue,  7 May 2024 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGK+C+dI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092EB13C3FA
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715068870; cv=none; b=TLItggcC8zRGmYvrrFDlQzViEH/ZRz6+y07FQ7/XiUsnbMIWcy4BBpt4lAgaIxBdkN7Ha/pI+NHgJM0/AVOn323wPvyQOoXIbGm0vyITTVWWJ6wYUkZrWko2plYkq0SBEqm8vim9/dLHvOeomRS7TdLtkbWpXrl+rZrhv1EN5oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715068870; c=relaxed/simple;
	bh=bXag455ylZGzl96UGoBAmiidiOvnA0ofq+j4dogwep8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PDBPr3aoK+yUdPF7m/3JvQY4B6kvrsD83KtKDOmrJMZ1Gv+w0FBMH14QPAYPYIRWGDjYIqhS+Oh3y2NkQDdsHUXg5RAuNmGR2GCKgY5R+mvXtr2sqpgqjZ6AJh1YrZDYLNP9SanMhFTnBk2WkWGJ5oLPD0pBI39O7JrJzWLRPiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGK+C+dI; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5b206048ac2so1024397eaf.3
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 01:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715068868; x=1715673668; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDyPFleqleYcJ5Fd1UMhIISilDhBC1T6q9Yqa+72S2E=;
        b=FGK+C+dIti2t5OdGHbUGUF96rVLzC+NOwZDeOoXkh65/6s36ZpSg5z1ZR5BlRG65Wa
         lMXzV5hGeBbZj5L+49BaYzN1sG1d2pfZfwJRpnkYMXpo1SzXh3WaAVsQOayjU71HuM+X
         OTbB3BEkS4jA6JSBjR3je8SQ2MDDT5HkwY9m01GjplgT78nADbHqNXHhTpRFWt5/v/0R
         FVPjOAV8MlV4IuKqfXJMhIiHhlX+OxoFElKjnRARgrxVAnfSTjF1E8nrRSlC8/xv3dfv
         guQAIC8sWV0VCA2DScIpFeBz2MxLEsRs4KRICTU1LivBMMv8BTxg6PAFpZ+Aib9pFLiB
         a5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715068868; x=1715673668;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDyPFleqleYcJ5Fd1UMhIISilDhBC1T6q9Yqa+72S2E=;
        b=sRRniVMuJKkXXeIwFGe9s2DsnieLgTQ7J7tNc5FKTckJlrkguxoIMhDkN2ZlP6Uqzk
         fANowWuHzdslkTlX0EapfuMX6V9Tbe6mz9zDvLOUMBdULLu1aK0U2XlxxBfqkl6h90lX
         cFWZBILgl/QGSxcacCjU3RCS+/MzqI7bdqalE5nF8QWxD9aqYyjE+ihWnWtpu49R7vJA
         NZqq8esMLVfklrxk91xhh+NA/KercdnkzBND45EjsUC+i6KivHNwzaD3Y7Uwitaj1zge
         +fl+3UC2kj17Q5qfkP+ws0gW+HS0uLVlBpsSty3OFqmnzyKt22KloS/KugTvK1NByATy
         skqg==
X-Forwarded-Encrypted: i=1; AJvYcCXtA/4h0CTKrMgbt9dE7S6zI31/UVNtWhOO1Wp2j5l/R4rV8QS4JiI8n8vupsvh1Y402EwRNrz9Db1AHA0QKGseasX49H9NKf0+
X-Gm-Message-State: AOJu0Yzl3ZS2vmOiMp922aG0h0c8TcD8mZ+zKDKZ6vL9fpBs6cobr7EO
	iWYbhBJM6nTlQ/ipLIc8Vcx/kSHmh4p/KMPqV0OMafaTH/HfluAW38ZUykcGfKWdrhzM8zP2w5h
	6wlrscxXyF8iRL3lg3KgrkTzTOVQ=
X-Google-Smtp-Source: AGHT+IH0osMNX1+w8wpZ0DBHkDHnQHgdCJKOXvE41nCxLHZsBQVlzDQEddIKcO2WcXUpLf9wKlTSjQTjTgMHZrQT/+M=
X-Received: by 2002:a05:6820:2a08:b0:5b2:2b9:a503 with SMTP id
 dr8-20020a0568202a0800b005b202b9a503mr6855751oob.1.1715068867940; Tue, 07 May
 2024 01:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240421134752.2652-1-linux.amoon@gmail.com> <20240424012100.srm7zjy26in4w4c5@synopsys.com>
In-Reply-To: <20240424012100.srm7zjy26in4w4c5@synopsys.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 7 May 2024 13:30:52 +0530
Message-ID: <CANAwSgSmJ321NkTXkuXn6uhOzsVBbZzbNwmKnTLo2F-H_odCjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] Use new helper function for clock and PM macro
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Johan Hovold <johan@kernel.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Thinh,

On Wed, 24 Apr 2024 at 06:51, Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>
> On Sun, Apr 21, 2024, Anand Moon wrote:
> > using new helper functions for dev resources for clock and PM
> > to simplify the code changes.
> >
> > Addressed some review comments.
> >
> > v4: Add Reviewed-by:  Alan Stern  For patches 1 - 4:
> >     Add Acked-by: Thinh Nguyen For patch 5
> >     Fix rephase commit messaeg for patch 2 and 4
> >     Fix some typo in the commit messagee
> >
> > v3 changes:
> > 1 Use  new DEFINE_SIMPLE_DEV_PM_OPS macro for PM operations
> >   Thanks to Thinh Nguyen for your inputs.
> >   so I have to update the $subject and commit messagee with using new
> >   macro.
> >
> > 2 Drop the dev_err_probe in return to simplify the error for clocks.
> >
> > 3 Dop the devm_regulator_bulk_get_enable patch.
> >
> > Tests on Odroid XU4 and Odroid U3.
> > found no regression with suspend resume functionality.
> >
> > Previous changes:
> > V3: https://urldefense.com/v3/__https://lore.kernel.org/all/20240412142317.5191-6-linux.amoon@gmail.com/__;!!A4F2R9G_pg!b2EBzV-UTfuvwSmse-8kl4jsq8t4KgBPT_G--QCG_TDV4atcywVQgLHPFGmxGnPASOKOmp6r0xyI2DnUnRp_cur6Ew$
> >
> > V2: https://urldefense.com/v3/__https://lore.kernel.org/all/20240404071350.4242-3-linux.amoon@gmail.com/__;!!A4F2R9G_pg!b2EBzV-UTfuvwSmse-8kl4jsq8t4KgBPT_G--QCG_TDV4atcywVQgLHPFGmxGnPASOKOmp6r0xyI2DnUnRqoIl7uEA$
> >
> > V1: https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-samsung-soc/patch/20240301193831.3346-2-linux.amoon@gmail.com/__;!!A4F2R9G_pg!b2EBzV-UTfuvwSmse-8kl4jsq8t4KgBPT_G--QCG_TDV4atcywVQgLHPFGmxGnPASOKOmp6r0xyI2DnUnRpJKM0R2g$
> >
> > Thanks
> > -Anand
> >
> > Anand Moon (5):
> >   usb: ehci-exynos: Use devm_clk_get_enabled() helpers
> >   usb: ehci-exynos: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions
> >   usb: ohci-exynos: Use devm_clk_get_enabled() helpers
> >   usb: ohci-exynos: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions
> >   usb: dwc3: exynos: Use DEFINE_SIMPLE_DEV_PM_OPS for PM functions
> >
> >  drivers/usb/dwc3/dwc3-exynos.c | 13 +++----------
> >  drivers/usb/host/ehci-exynos.c | 27 ++++++---------------------
> >  drivers/usb/host/ohci-exynos.c | 27 ++++++---------------------
> >  3 files changed, 15 insertions(+), 52 deletions(-)
> >
> > --
> > 2.44.0
> >
>
> The v3 of this series is already pulled by Greg. Changes for v4 are not
> important. We can ignore v4.
>

 Anyway thanks for the input, I just tried to update the commit
message relevant to the changes.

> Thanks,
> Thinh

Thanks
-Anand

