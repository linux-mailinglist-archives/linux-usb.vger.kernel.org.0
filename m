Return-Path: <linux-usb+bounces-11424-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CC90E4E8
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 09:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C1891C214F1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jun 2024 07:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A348E75811;
	Wed, 19 Jun 2024 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1aLRUv2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C927733
	for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718783527; cv=none; b=V05xLfz+oHagj09wY99YGzatG7cs9FDa2VAnvC5J5kH5RKqtzISIvqv+qbuwSbXVcWDAmbRIPUTOouhrGFyukwOKQlPf6ihJyWkLBKfNixMaGEZN2HUmFxvQg7H7+0WtnI+L6MfaSm1DthU4p2xgdnfyztTrY9n6rxlAboHekwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718783527; c=relaxed/simple;
	bh=A0exdh70HTc9l2mUBJK/aJuYdxk4YWATKjaCkWrbpm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUmw+q0FwwzENHasu0iU+/coIvqp2KxJXokfp4gCf/9Azj7E/YNOTrhjCGwCIlMAKoPtM43LVEwrqYP5wAuEfvILorIi41Af5L4WJ4r2s4sYDINrLus1kRj2SAgl4+GPXtnUEdBhG4K4HBarLGP8OxNZaDfqYj4wa6cbd2WEL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1aLRUv2; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6fb696d2d8so20099266b.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Jun 2024 00:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718783523; x=1719388323; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=joJUKuJ2Rs9m8+hoz39Cx0hD1MZCc7Pa9ztq652DXXw=;
        b=l1aLRUv29wGf4kKbyyp9ectuRChvTECuDKgg5CQHz3CGWi1caQaCYJ+Aibr8IXCLy/
         ug9yVSnG+91wpEsm/O3Zj7fLhAJgPf6ox3OMue8D8rTYqfP/M9nMUHqwZ0vqXV4ge3sQ
         zgY6q69HmBEygy5uHu/cs6Ft3wO7JRW9xBFTitwCMLnEkMWqNz0j8vSmD09zIey7vWvQ
         T5c8A+1XpuaUDkm0Pr+fHSMXLljH2lzpqhfmZRACfVoY2Vp+qYr7Gbqm6Ks53Mgvfs3l
         5qtrGD88+BpX36PcFyqU6Rvz8kh2daYGxMhx5v+BwqehBygNKNvA7NTDzrRsYQbnS4iP
         05UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718783523; x=1719388323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joJUKuJ2Rs9m8+hoz39Cx0hD1MZCc7Pa9ztq652DXXw=;
        b=OnXGxkw1/UkzO2iqfjEBuhLLa0e9LuxXsithl230GE3dUfyS5BkwYj64Ynb1+tmmVU
         Rv7O0gPn0fJpEVgNSTXwd7aYd38uROlSn3OaVE5NDDqDN20wOasgqLIO5lJqrPe2juPt
         EKr4L0AXIcs0IEnJqsPMxK8paX79m7pVeKGexrmbXfpkbvezN6dWYmZmVrUFL7UHQh6b
         SHOpkJmTotCSCkkW+Z1qVChxKtqBF/F3xrPgmdBlZC9Hmi+G/QfXrDj5MXYKDSYgZQoa
         fX6ZYcxC7/v7hOOt9DM7kgZGsxi8LI+3eHSiTq96TI21Zi3YIAxT0M+YsE+L7+U6cs2p
         z+ew==
X-Gm-Message-State: AOJu0YzKqr+8vxhz0zgX3fesnWby33Ova9NxYcIUmab07pMoNCTdR7tx
	l8YXqrnOn+A0XG19yKcKpvbs1A3VRjJLrZZ336ftvqtb5/xY7RhA1gWoo5PBq+k=
X-Google-Smtp-Source: AGHT+IGpZSyCBM1ctPNu9vG0gstXGluFERe9BNjDSytJnEpDZQ/T/Z489JeyCn0Jju0XJtouR7x+rA==
X-Received: by 2002:a17:906:11cb:b0:a6f:1b40:82ab with SMTP id a640c23a62f3a-a6fab7d6c27mr100778766b.76.1718783523351;
        Wed, 19 Jun 2024 00:52:03 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f2263sm16533378f8f.83.2024.06.19.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 00:52:03 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: typec: tcpm: Add callbacks to mitigate wakeups
 due to contaminant
Message-ID: <9ed00210-bdd9-4864-abad-5decc69ea0f9@moroto.mountain>
References: <1d6a5eea-2f87-48ce-8176-b50153b27c09@moroto.mountain>
 <CAPTae5+EoFCMK8k+mEsoUArCamx4JSw23J1u5Vg4ei5w+dyPhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTae5+EoFCMK8k+mEsoUArCamx4JSw23J1u5Vg4ei5w+dyPhA@mail.gmail.com>

On Tue, Jun 18, 2024 at 02:00:52PM -0700, Badhri Jagan Sridharan wrote:
> On Mon, Jun 17, 2024 at 6:30 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hello Badhri Jagan Sridharan,
> >
> > Commit 599f008c257d ("usb: typec: tcpm: Add callbacks to mitigate
> > wakeups due to contaminant") from Jan 14, 2023 (linux-next), leads to
> > the following Smatch static checker warning:
> >
> >         drivers/usb/typec/tcpm/tcpm.c:4620 run_state_machine()
> >         error: we previously assumed 'port->tcpc->check_contaminant' could be null (see line 4607)
> >
> > drivers/usb/typec/tcpm/tcpm.c
> >     4600 static void run_state_machine(struct tcpm_port *port)
> >     4601 {
> >     4602         int ret;
> >     4603         enum typec_pwr_opmode opmode;
> >     4604         unsigned int msecs;
> >     4605         enum tcpm_state upcoming_state;
> >     4606
> >     4607         if (port->tcpc->check_contaminant && port->state != CHECK_CONTAMINANT)
> >
> > Assume that ->check_contaminant is NULL and port->state == CHECK_CONTAMINANT
> >
> >     4608                 port->potential_contaminant = ((port->enter_state == SRC_ATTACH_WAIT &&
> >     4609                                                 port->state == SRC_UNATTACHED) ||
> >     4610                                                (port->enter_state == SNK_ATTACH_WAIT &&
> >     4611                                                 port->state == SNK_UNATTACHED) ||
> >     4612                                                (port->enter_state == SNK_DEBOUNCED &&
> >     4613                                                 port->state == SNK_UNATTACHED));
> >     4614
> >     4615         port->enter_state = port->state;
> >     4616         switch (port->state) {
> >     4617         case TOGGLING:
> >     4618                 break;
> >     4619         case CHECK_CONTAMINANT:
> > --> 4620                 port->tcpc->check_contaminant(port->tcpc);
> 
> 
> Hi Dan,
> 
> We could add a null pointer check before invoking
> port->tcpc->check_contaminant(), however, it would be redundant.
> Unless port->potential_contaminant is set, TCPM would never call
> tcpm_set_state(port, CHECK_CONTAMINANT..) and
> port->potential_contaminant would not  be set unless
> port->tcpc->check_contaminant () is NOT NULL.
> 
> So the assumption of "->check_contaminant is NULL and port->state ==
> CHECK_CONTAMINANT" is not possible in the code as it stands. But we
> can add an explicit check for port->tcpc->check_contaminant() in
> CHECK_CONTAMINANT to make it more obvious if needed.

Nah.  Forget about it.  When it's a false positive, just ignore it.

If anyone has questions later they can find this thread.

regards,
dan carpenter


