Return-Path: <linux-usb+bounces-27938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB84B533B2
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 15:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DE53BC7DA
	for <lists+linux-usb@lfdr.de>; Thu, 11 Sep 2025 13:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0595D32A830;
	Thu, 11 Sep 2025 13:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrnZIKv5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D376432A822
	for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757597165; cv=none; b=dRi6of3SRxaV9jgX666m89noi9vsVCtuSndAAky6DVoJeB1MZi+XvftcKR/Hku/pWsFxxeIT2CtZT6667e4wl4xMNjxTURDtq1MtxwurPnbt6hd6a0EFgR7QkuqkZhGia6t0NjLD0yHSAqzQTlfNsKBiSi1EkisKEPozlT+VW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757597165; c=relaxed/simple;
	bh=bck2b0HUyvf0F/4ArW7/OnJRrl2YOIY5cBIvwDrnajM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nBeqQ+CpnadG0cNAEqqvbBO8GevBzPCWSTFq3fRrM8SMScggG8l+Y13VrlnPWiXXyOJMEwP6jisfmkC6Yk9mA0S+gWSXHMIaSXugw7hQm7o7SgLesf3bDjWmVkDi6ovgkaC4VMzkIlVPat0ED9Oamul+wAo/CWb8sU1UNoQpmAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrnZIKv5; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-552d3a17a26so244885137.2
        for <linux-usb@vger.kernel.org>; Thu, 11 Sep 2025 06:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757597163; x=1758201963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fdmTjQ3zuf0zvoi7FPSNx1/h36C75iwg/2B5LQDt1k=;
        b=QrnZIKv5mhGqugMTADC6dnpRI2/8eP0/fCiqDI9eiGuQvhy6SnYn8LFdSv2c8BI4hQ
         KuhCURF7G8pGTXDCGQUXAeWtiolgUPrIsvtU18H7G1Y3/SeVfMuHrqae4gdWzW3YiAS2
         qJPn5XgCjQ13ShN/peFfBiH8PV6eSrgQnNT+YZmM6RjJ9Fh5YFtIVG1u/GYOHJgXXMRO
         2UWoNtrpE5K0u54WVjskPJ7xY0cUkTSV5gzK19K1w4Dn5F66PxEr9dJbRpIjsd4agbCa
         mbOl3LoGOYgKKRPJY2LUTOKr+X9G8wYDcBPGRhxdDmMAgyMjSpV688lrMiaGoyp7IDuw
         k18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757597163; x=1758201963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fdmTjQ3zuf0zvoi7FPSNx1/h36C75iwg/2B5LQDt1k=;
        b=dUf2bN/RuJQNke+xWlNlhTbZDNQe6So844/LVCE4Rx7UufWOgKw4PIQ2XrAHLhEp4z
         /Kb2BEVHJ2cZJ1f9ZM7cVxiIRJYFib+394lz62njjNbTU+DbAucB6kCps4DkL7ibN0gM
         Ky60+/ZpFpzkPLta+o+5Q6SNPgeowRli8+PKqTB4MeAGHBoVvoDELNc0/+VKE+Ru+5ZK
         tAlC+K9bjQdwLUqXHX4+NcxbTDevFYjNCK4J+mGYkY0gN6HTb6hBff37Q761apB6ZHsX
         uJrM2Zf8+KqrqdeVs1QFfCy11sHZ5tk7QU7mep1Co+OTmGJQSuT0k2n5WBpnWuxjQWvL
         0J/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZqi3C+cC9Vxgj+LkbwV0yDIM2edPzq6TUfaZACu9cY5/Sob1g+r3bCPEf8ey/C2h6/7mc2k0xPFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE395GsPHkHrhL6l+ynww9uDESQc3QOdXlE4i24WplTe8hEfCq
	FA4q7BKl4wd2kjClHAW3ey3doN880XTIVd3TxcdBuZBsbHhu1oc6tl1C6mmvUjLL8j37RqsevFj
	5zYlykba13rMMuzjUzOQexeYluaWK0io=
X-Gm-Gg: ASbGncuSU5kNiqnvM+USwWNLhX9zEXS0ri6hgMIhG50w9vMJrhNMKPFkp44wZi6s5VY
	VVbRhEwyJHUVBey3YjYBMGuPA0bCxlTqMWHVmEXoXqyAgWjMvl5EMayiP1uGk0m2gOIVcBfvMFO
	4xwsc0iT1MUqQgtg4cZZJMEH7SVGz0IZxXqrblKsBlc3fEw72wJYvorH+Oz5LvjXG/HGZOg8UPh
	6Bplb5tQFQed7asCNSn9J3Ux6reFgIfU4x/l5vIalSApg==
X-Google-Smtp-Source: AGHT+IF9HHTf/6XsZ4xmdiVceKWAiZfJlu2nUBunXuEeleQrXxA2m4sgS4aY/AJqPtQQMw8wN97GSp36mzUPZNs+cMc=
X-Received: by 2002:a05:6102:d89:b0:4f9:6a91:cc96 with SMTP id
 ada2fe7eead31-53d231f8bcamr6485049137.26.1757597162651; Thu, 11 Sep 2025
 06:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <385dccf3-234a-4f83-9610-81ac30bf1466@rowland.harvard.edu>
 <20250909161901.10733-1-ryanzhou54@gmail.com> <2025090959-italicize-silly-f628@gregkh>
 <CAPwe5RPxRhvYmoDZF792Vwv638kt+Hk+CYoJJCmcjewGp8NfYQ@mail.gmail.com> <2025091023-joylessly-finlike-8382@gregkh>
In-Reply-To: <2025091023-joylessly-finlike-8382@gregkh>
From: ryan zhou <ryanzhou54@gmail.com>
Date: Thu, 11 Sep 2025 21:25:51 +0800
X-Gm-Features: AS18NWCxyjTDGGLxyQAVfnWFUrASUcULEFlA34l1zFRHyjFJ7Q9X875EKse4BK0
Message-ID: <CAPwe5RNF6gPkD7yt6AgZs=0ATeGrzBdeQEcWx9j=1MJwzfn5OA@mail.gmail.com>
Subject: Re: [PATCH v2] drvier: usb: dwc3: Fix runtime PM trying to activate
 child device xxx.dwc3 but parent is not active
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stern@rowland.harvard.edu, Thinh.Nguyen@synopsys.com, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, royluo@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greg KH <gregkh@linuxfoundation.org> =E4=BA=8E2025=E5=B9=B49=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=B8=89 21:07=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 10, 2025 at 08:56:36PM +0800, ryan zhou wrote:
> > Hi Greg KH,
> > Sorry, I didn't understand your question. Are you asking for my patch
> > commit ID? I've resubmitted patch v3, and the commit details are as
> > follows:
> >
> > commit 92bc5086f53404f6d14d8550209d1c8cd3fa9036 (HEAD -> usb-next-devel=
op)
> >
> > Or do you need the commit that introduced this issue?
>
> Sorry, I mean "what commit does this fix", so that you can add a
> "Fixes:" tag to it.

I initially targeted these two issues:
commit1=EF=BC=9A 0227cc84c44417a29c8102e41db8ec2c11ebc6b2
usb: dwc3: core: don't do suspend for device mode if already suspended
commit2=EF=BC=9A 68c26fe58182f5af56bfa577d1cc0c949740baab
usb: dwc3: set pm runtime active before resume common

When the DWC3 controller is in a runtime suspend state, an interruption occ=
urs
during the system sleep transition, resulting in USB failure to resume
properly after wakeup.
The detailed sequence is as follows:=EF=BC=88refer to commit e3a9bd247cddf
merged by Ray Chi=EF=BC=89
    EX.
    RPM suspend: ... -> dwc3_runtime_suspend()
                          -> rpm_suspend() of parent device
    ...
    PM suspend: ... -> dwc3_suspend() -> pm_suspend of parent device
                                     ^ interrupt, so resume suspended devic=
e
              ...  <-  dwc3_resume()  <-/
                          ^ pm_runtime_set_active() returns erro

Post-analysis reveals:
    =E2=80=8CCommit 2=E2=80=8C generates unexpected error logs ( runtime PM=
 trying to
activate child device xxx.dwc3 but parent is not active).
    =E2=80=8CCommit 1=E2=80=8C disrupts USB recovery in this context, attri=
butable to
the following factors:

    EX.
    RPM suspend: ... -> dwc3_runtime_suspend()
                          -> rpm_suspend() of parent device
    ...

    PM suspend: ... -> dwc3_suspend()
                                     |___dwc3_suspend_common()
                                              ^ if
(pm_runtime_suspended(dwc->dev)) then skip suspend process
                                          |___dwc3_core_exit()
                                               |___dwc3_phy_exit()
      PM resume   ...  <-  dwc3_resume()
                          |___dwc3_resume_common()
                                       ^ pm_runtime_set_active()
report error(error logs : runtime PM trying to activate child device
xxx.dwc3 but parent is not active).
                              |___dwc3_core_init_for_resume()
                                  |___dwc3_core_init()
                                      |___dwc3_phy_init()
                                               ^ phy->init_count++ and
phy->power_count++
     ... Next,usb connect (Note: dwc3 is always in runtime suspend)
      RPM resume   ...  <-  dwc3_runtime_resume()
                          |___dwc3_resume_common()
                              |___dwc3_core_init_for_resume()
                                  |___dwc3_core_init()
                                      |___dwc3_phy_init()
                                              ^PHY reinitialization is
prevented due to non-zero values in phy->init_count and phy->power_on.

However, during my submission process, I found that Ray Chi
encountered the same issue and has already merged commit e3a9bd247cddf
(usb: dwc3:
Skip resume if pm_runtime_set_active() fails), which fixed the problem
introduced by commit 2. But the error logs (runtime PM trying to
activate child
device xxx.dwc3 but parent is not active) introduced by commit 1 still rema=
ins.
I will now evaluate whether to proceed with further fixes for the
issue introduced by commit 1, based on Ray Chi's submission. And also
I will incorporate
the relevant background details in the subsequent commit.In my view,
commit e3a9bd247cddf (usb: dwc3:Skip resume if pm_runtime_set_active()
fails)
appears to be more of a workaround solution.


thanks,

Ryan

