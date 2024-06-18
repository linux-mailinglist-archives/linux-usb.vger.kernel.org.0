Return-Path: <linux-usb+bounces-11399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F026390D6DC
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 17:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3F1D1C23E90
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jun 2024 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FCD21350;
	Tue, 18 Jun 2024 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1y8xOys"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B421EB2C
	for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718723531; cv=none; b=lY+CZ1UdJV8YM0f+dIcxqCWndaWRdFBI4/47i2d5C5GX8KI6iC0xeIK8kANTOwIxD/26tYzIKJTa3luosRDuxakOB+DhWgeXfJaP/AVisZ+fCivqH4r/S3juN1n5KH5HYCJTF/W7ikNIRWpGzCtlwhRrafqrt+VgE1Xjrck99nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718723531; c=relaxed/simple;
	bh=fHY6e5S339hn1tglFAEnJlLPu4FNbNaR5Q4xwYltsds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxQxBPxW0gdGU0lgrnQpBUAKqF/aSjzLRavjuo3brVLW8M927hKuIxQ9rHQsvAsTUdr1Lg8ROPyPp//Q6AjC2sMGXIm3XPK3yhi15xgoQwPTYAyo+KFberBXw3TSialggD+ZqMQLFQ2tFpdaUNIZrbqGB1Hb3z39ju3FymFrABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1y8xOys; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6f1dc06298so676565466b.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Jun 2024 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718723529; x=1719328329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHY6e5S339hn1tglFAEnJlLPu4FNbNaR5Q4xwYltsds=;
        b=g1y8xOys4RoD7ADPxaEwPbpVBJ1uqRFdf+dKl+j/F02OCGFdtuZEQjQYiC/Dy+ZmRG
         twXXXLkqn/mcOcUcgW3pIz1jIcNwUECDVuxDYwKO9xO8AWcRuLrNouQaqixPFzNwRHSZ
         HAtTBoH/Qzicy+6RYxPYvTo/MOeRlCRQb4kQopjT/qh1Xta+dxUyhzgo6K9GTVIvMNO1
         LmhPG9KWUsZ15XLIZysRzogcWocLqq8TN5DwF+H15llvSdKMN0O/cIH0E6TMTglBdYcl
         uqboLgCLX3k3hQONPXTCHwbKSVf/C4z0mCE9k2UYjAZ1peuiCQZ2Asf5u+l6KAQoqvyL
         L1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718723529; x=1719328329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHY6e5S339hn1tglFAEnJlLPu4FNbNaR5Q4xwYltsds=;
        b=bT7uLR7y8NhXZINSQWcaWkvnCmAImkI/unfTT2c45Ik/wWABRm9A28QcZYDyO0nCCB
         x4/yAQeYrFGoyIRV9Lcx+4gbaaWqmPe5pduWP216YW2OYRyn/09PzSkongKuRk7IMo8t
         8w+8b1auoEUKflEbmWx08LNsewnuFlwlSIqLVQ9DAw6keFLJ8mRDZTwG8DuSZYeER74E
         CLUfNpDOI4xEx7UF8Cb/NFPLk5V38PoLa8LqR7vM8mnzoYjmaadpR9Oj5pXWRqGoLNbU
         Xo1VYbh0+wnbkbmv3A6/a7O2C/a01VeHL0xqyMjvUmjbBEkWirDYZ7uvprmQBWr6t2AG
         /m+w==
X-Forwarded-Encrypted: i=1; AJvYcCVieTwvkXWIqgObn+ebkKmj/SrFONnZTamlClixkx/f/3Ij0zRssiLjxS+npviAQLlf6pWULBBBBm1seJVNbMuBmP5ut+Ssap4V
X-Gm-Message-State: AOJu0Yx3tblBPWSYNBixzXUqj86s9RqikOuT66rwNRPLlykJQ/To6FSp
	dVvRr0b9NGhpxSLwoKELr0ljpwt908ce+RlwiIVg6yhOxVVIR1QvnURnHc4cwjWyDwKyulWmMHE
	/YP8SMNcTRiyHQjOrohpvZWQcHdg=
X-Google-Smtp-Source: AGHT+IEeW+re+XQXlTckA7WALBeDFjP2tB0cwc5nPQDB9pfgoK/CP5D68c24BC1Z0MFtm/BoPIte5cwBKFXGFYA9zVw=
X-Received: by 2002:a17:906:66da:b0:a6f:bc2:e579 with SMTP id
 a640c23a62f3a-a6f60d2ad84mr846780166b.30.1718723528399; Tue, 18 Jun 2024
 08:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240617100100.1628147-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20240617100100.1628147-1-mika.westerberg@linux.intel.com>
From: Yehezkel Bernat <yehezkelshb@gmail.com>
Date: Tue, 18 Jun 2024 18:11:51 +0300
Message-ID: <CA+CmpXsdHVbyp=jb2zfYbUssmNR=W88AN1B=_8H5WJNqeiY4kw@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: debugfs: Use FIELD_GET()
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Michael Jamet <michael.jamet@intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Andreas Noever <andreas.noever@gmail.com>, Aapo Vienamo <aapo.vienamo@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 1:01=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> From: Aapo Vienamo <aapo.vienamo@linux.intel.com>
>
> Use the FIELD_GET() macro instead of open coding the masks and shifts.
> This makes the code more compact and improves readability as the this

the this =3D> this, probably?

> avoids the need to wrap excessively long lines.
>

Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>

