Return-Path: <linux-usb+bounces-13954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC0195CB58
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 13:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC6361F23A69
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2024 11:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C62418754E;
	Fri, 23 Aug 2024 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYQGJPMY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A798187339
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724412363; cv=none; b=lose66YKhEYrlkad2R6AUKlXuJqfYL69BF11LAKHqO9+icOPf6RnpXKQFGaE9jyseWv4WZ4KZNaIAzHJQYrnHT0DW0/ZzIElWw8eCPTmvdLAReNEREEIrHK4WxF6/l6BHCT7yeGLqVxNkRowqbSqiDFmNau3ZyuSFq8yFABVfMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724412363; c=relaxed/simple;
	bh=cQW6gIzgs+CeDYrDoFOi4ZisRHPzYPlTLhFkaakH6Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKlubfAvMvnF1ZqxOBOtic62ozjHIms+jNIlHHWXWotfRN/eoyBggP20wyOAd7wIChzldtcSToD0hRKTCGvRUwO+PbJbe+lSEDR2WpgFHoCEVfHT1AuOOraZTQGs8DaL5ZSANb02Owk1OI9brIodAqpWfu6SLjDlUFJR3RhpKjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYQGJPMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C7D7C4AF0B
	for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724412363;
	bh=cQW6gIzgs+CeDYrDoFOi4ZisRHPzYPlTLhFkaakH6Zw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=aYQGJPMYJhVNkOWdaQt66/ftfnqIqnUYGpM8ZddD0/Ap4IgbWQVfdazfragZFnrod
	 7UYmexEKda5lJA1E1YBDr5XOq3z6IuKKDREgQsDuJR70onQ0MJEv0DB6VoILuzblTX
	 0Kss9N21DF7cbGbzDR3KZlHbYOH/7ZdfYLPmE2C2Zq+E/Qy2xPEBRMCP7WrHC6/yG6
	 AjQUFHk5EZD3BzsbO6WdBx9yidfwh2ePLmBzpRD/5/5HSQSQUCsZwv65pQkXmgqwM0
	 yD0Tk1LKxgZ6ZHoMDNL8Jjunfg594ssKdCuqeBtZlZ0ljRwIEY+lKEEBAavCbKPHzu
	 pDq8XtTAEcgmw==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6c1ed19b25fso16524937b3.2
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 04:26:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhhq21lRO721KnAjEnwrlzH4gwDhVJUA0TX/rfz42V5W9h072GfVeMBB6iig6GwS1Tj3CfACGiTnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiuj4H/r7orVVQObcZAQFiA0YEQO3XUcNcnPJ8xBF5eSF81aqJ
	vytJxkkp6oIAQ5pgrhTL5UF4Xk/4LNw9SGiJZOX5hkHsvMNRMLZ2LZxSWHil4Gv1kho75IpViYa
	GArzP/gZfnbgrfPx3HxfDnImVLnU=
X-Google-Smtp-Source: AGHT+IFHznpOPNAj2zMvvHXZ90TgWM9PTPWCtpyFVTzZHZ3xOCnxB3eR9yuIWmQ6JYSXn9BFhGwB+60kBxB58mReW20=
X-Received: by 2002:a05:690c:74c1:b0:6b0:4f2b:29f0 with SMTP id
 00721157ae682-6c628a9f15amr22872447b3.29.1724412362234; Fri, 23 Aug 2024
 04:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2> <2024082340-ream-crumpled-9434@gregkh>
In-Reply-To: <2024082340-ream-crumpled-9434@gregkh>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 23 Aug 2024 07:25:50 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6nFH36mpLGXMNzmxR5sQpT0fDFg5u6-t6tXNBaUJKabw@mail.gmail.com>
Message-ID: <CA+5PVA6nFH36mpLGXMNzmxR5sQpT0fDFg5u6-t6tXNBaUJKabw@mail.gmail.com>
Subject: Re: question about Renesas USB3 host controller firmware license
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, linux-firmware@kernel.org, 
	Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 5:25=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Aug 23, 2024 at 10:14:18AM +0200, Marek Beh=C3=BAn wrote:
> > Can someone who understands legal mojo determine whether it is possible
> > to add this firmware to linux-firmware?
>
> Please ask legal questions to lawyers, not kernel developers.  Would you
> ask medical questions to kernel developers?  :)
>
> Why not just contact the company themselves and ask if this is
> acceptable or not?

Agree with Greg here.  It's best to ask Renesas and have someone
submit it to the linux-firmware repo with their Signed-off-by.

josh

