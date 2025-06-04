Return-Path: <linux-usb+bounces-24497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D7ACDE0F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 14:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE513A63B2
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 12:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EBE28FA85;
	Wed,  4 Jun 2025 12:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hsrFCLWI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117C5238C36
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 12:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040409; cv=none; b=C9go+N7/m0JU+Rc9LxbMZj/xe94kGcJE9mOpjRM/F1dEnCx5a0/qnnq64Npn7oiLTzLBitzKuwDQxXuOTRA8x6ye+KhCXvC7i/Z5h93w5+zhmjvfJpNzBBEMFczqZZhNZmP1rMBHK5ZouX4888vmAKz9dyr+c0CtBgrxzFBpiTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040409; c=relaxed/simple;
	bh=V0HyZf2gOux8fh6ZwdvPK3QndkbmomnelOEU2Zv5HCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=irHH24tevBJyzy3wGdJBEIZKMT96/FoMhkukeiEmWkqjZFsAv7Zb9feaz4bWFb9+OfepRLyragWuhHW/j5zuIR8vwbVzvGFa+SiXkoYZX9N1yFHTM1zSq5FXjTkZpIQUEG7HNO5+hJ/z7llQltBBRGcPraUfPBJqvNQ1gKJx+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hsrFCLWI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso8213a12.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 05:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749040406; x=1749645206; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35jbq/O8qXde5Ngmc6+WbHTRIiZn6TNHGMbDQohlu8w=;
        b=hsrFCLWIAOWhebqGyUZPtdQiZWeUYZKwaAtNcpfSAqWeVouWHi0M/5TD2Di9VQCtRP
         jdSwt/0xs9eW8OefEDLGLkPwmFfHP7GTABu4L2uz3hpIvnhBgK1EJlVAt0pQhf0n3VA8
         NrtqpLE6osBZTi2hIVgt7CQ4DOrl1BJRWqrwLKzxDwmocr8We8G5cV6wSN8ntgrEFvy7
         sEuZ6YL4U/5FYU7ELSGlRr23+05RfUqhSYJTyga3RigflH6EFcC1p7Z959GF+5DYR6GD
         CTLB3AMhptlavftfwC8J46PwFd80NW75YrtjFLCRQ6c99+rkwV8HDA3WqB3RViFUy/aZ
         Tt9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040406; x=1749645206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35jbq/O8qXde5Ngmc6+WbHTRIiZn6TNHGMbDQohlu8w=;
        b=Ij80Mk/g3apeepWdATJ1KN0RaWO3KxKDbkq2TWXTzIEZ0dHULx9BW/ENd687W6Ccu3
         NMErTCli6jjsqw/jRw5/hTymGeHx2UR/DFubeFYs0HSZK3gd+PqePD1u5wcGYMYhFbwg
         sXrY0+1LM84LgyPP/ziEslR9Fv8z0NSRTRAJfIXGIW+S0wsRolz3OSywCE7bF8R3hvGQ
         k7hGmcyER7mDo/7G6Crzb0wthxjh+DBTuILn9Jz1/YqLxzs2CDLVLYtx6svxyEuKRPlb
         n+4+QxTc+zd96A3CMJsSZca3ueOCv+afTg1VGpIVVAFYAnIQ26Y+Pzz0lPZB7Y+Wriaz
         4ENA==
X-Forwarded-Encrypted: i=1; AJvYcCXsqOjbMYnJ3aixUCcjWrk98+Yaxb70OrRffd5IPqgCEusDF+hyqiNjWMiplGRKPEtpw2fU81sd9rM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0xyVMp1TkXEoh+9ODCMDGTd1n9E6pM5bNAnidkXiu4yUCELA/
	jja84eEDMIY2/zBoBA1MpFwTuvceiu+gj3HYN/jj5o8ov3arGcl/D0F2xcExINu2X1Tg8CVYLzL
	SXEClFG6iafkATq0US98OJqd4zYHafDCKk9FXW3D8
X-Gm-Gg: ASbGncsXqJAMm3qgs9VKZB7ZNMhScvmlC6WFOfqb/vnIcVkJ7XVRaXrkyjj4/ae12Li
	aprdPsIzFtrJb2DiOA8CRQ9qjl+yTPv6lUb9KJzGzs9fB+Fya1lSx8iZW8Uxafa7U/fQ0qaFQ8h
	Q/7mu2NtjtRlw3NUKn5XyaaiBvkrqyyihWDcU0FN0ygnug5QxpuqDph2CUR2UAQsjsp7xUIQ==
X-Google-Smtp-Source: AGHT+IEk7Imp1OmtRA2HzCYp4F71lZI1Ku2lyPIaNKIN7oFD91XLzjJ08tylnHIxk+wRTMTPFlqyiLvnzmyaMN9jvCE=
X-Received: by 2002:a05:6402:1485:b0:607:1323:9c2c with SMTP id
 4fb4d7f45d1cf-60713239d19mr4733a12.7.1749040406204; Wed, 04 Jun 2025 05:33:26
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604082449.2029156-1-guanyulin@google.com> <2025060407-geologic-excuse-9ca5@gregkh>
In-Reply-To: <2025060407-geologic-excuse-9ca5@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Wed, 4 Jun 2025 20:32:00 +0800
X-Gm-Features: AX0GCFt2T0HkBN4LrA4l1V6h8zyLMTF_heB40M61uF7A7sSq23-qzTh9t4bgM-A
Message-ID: <CAOuDEK1471toXVEiNySQtmrRTSPwzo840Q2d5pw9M4fCOfsgTg@mail.gmail.com>
Subject: Re: [PATCH v14 0/4] Support system sleep with offloaded usb transfers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, gargaditya08@live.com, kekrby@gmail.com, 
	jeff.johnson@oss.qualcomm.com, quic_zijuhu@quicinc.com, 
	andriy.shevchenko@linux.intel.com, ben@decadent.org.uk, broonie@kernel.org, 
	quic_wcheng@quicinc.com, krzysztof.kozlowski@linaro.org, 
	sumit.garg@kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 6:56=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jun 04, 2025 at 08:23:06AM +0000, Guan-Yu Lin wrote:
>
> Is there a reason you aren't cc:ing the developers from a "big android
> device company" that is currently testing and finding problems with this
> patchset in their device testing?  I will require their signed-off-by or
> tested-by in order to even consider accepting this patch series based on
> the issues they seem to be finding with it in an
> internal-company-bug-reporting-platform that I seem to be also copied
> on.
>
> thanks,
>
> greg k-h

I'm not sure if the company wants to reveal its testing right now
since the company raised the problem with the internal system. Hence,
we still use the internal system to communicate with them. We
understand that "signed-off-by"/"tested-by" tags are required to merge
the code, so we'll keep working closely with multiple companies to
achieve this.

Regards,
Guan-Yu

