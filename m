Return-Path: <linux-usb+bounces-29633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FB8C08053
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 22:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BE463BEF60
	for <lists+linux-usb@lfdr.de>; Fri, 24 Oct 2025 20:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01962EFD9B;
	Fri, 24 Oct 2025 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k0VdsHCZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757512EF64C
	for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 20:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337192; cv=none; b=IeFtWcRzYS9fTaGSH/yCJi8WhW2dd82Gyd5i3O5g9kFwq+CWasnhzdzu/2wQOQ5106avb594EHduarDQvgjamOJrVu0cQCCAHxjVaw1C4baWk1Pl3kzY5Yz3lJC43OHR72+UB1p4fFSMSZ/xQrTdwnpqAksEX68ZAc22p1P12xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337192; c=relaxed/simple;
	bh=+RHhii+jY9d8/ctuTLvU+Zz7XMoaS0T4paIu7a6dNwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKt1IXW6Rjw9Wg/UXOqt48qrfWhhmcwxTzettTkSawYv8Xe8iIu5A/jr2DIXlLRZn2RPaFbapcTVuYZHNUAlT5Wv4XH/mlI3uTaSbkGx6D/f0IRq6Xbh+FhsogrDYjUdvtmMVfpV1LslvHQf1raitNvVBkIHZFHcsqDRpVLcbps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k0VdsHCZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso19297355e9.0
        for <linux-usb@vger.kernel.org>; Fri, 24 Oct 2025 13:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761337189; x=1761941989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QCy1zJ6sxY7XDksdN+ZfQfMEyEv9pQCKJ+rvcvU78wE=;
        b=k0VdsHCZrs+oe91bYbdYPb5P97QGYRhdBBZ7cJfRUcM4LuyVzkJjUiODND5nMqVskV
         IhY7iFfRrBYJipUIzdbV4l6jSDUuEdkvhv254IWPaqrxSG/XelHnInd0LVGtufm5lGvV
         5RbO/j9eVXVvnD7MxRDTMm6lZDoENKnfPpfhPP4Iw6AmtA0z5TJoSemwEf8j7aA3hRvb
         daxfLgVrIi6jcNmGJrMy3S73+NxV+LZg3lgQhaYmIwwggzVH8hCijDGMThvDspIMccMo
         W+0VeQvMgacaay/gH0rUdPd6J0zyq255S3Op9PeELp/XFyQZ3QzodGvirk8A2cmdKmJZ
         /1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337189; x=1761941989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCy1zJ6sxY7XDksdN+ZfQfMEyEv9pQCKJ+rvcvU78wE=;
        b=jYosdxT1m96xlNyc6aBFPhR0fmZaDAQyxGIEXXLLfvccl1otAyU+id1QOIT/AEIbGH
         AvKc61+F2/6gv7bCYUnO5GCt5BfLUaOaX56N4Lvf/Row3FIUXZf3o/o5M30sCk09Ti/F
         wMzzTfueOMS7/0GA5psOYuoxwwKP6Xfbr7x0bcklOtG6EGZFK2fTNxBQbb/g1h32iAA5
         QAYO7rULirEDPzWR/u0LJBX2cQ3SKXsAD9zCR6IraCuz6W2nCbAJBTLF+l507L8L7e5l
         0AbBz0H9E5VwGVwkGtab0G7YX8ZOPQu/jHV2blY75mibOCCnAQxafAj2Epg1PDrMLXWf
         40FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKqHISW52jwZ1JQnVVrYvFXBRWfSknDbCD0PaHpyA8X3rQ3PHKKa0u6Du+JuYrOYb76BMx+XYc3h0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAw6lDqxAjrd1BncmMD38yCtZB6nrFAQmJK7kdPnHgwF9MZqA
	knTTwD/gaO1xqqaEklIcYlT3/BkgS4ScrN7DodvAzma291A6s52Kj0UCUqJXimFH4Ws7+6OHL1/
	8FnJn
X-Gm-Gg: ASbGncuoZNfeYx/3fNDNDFMGGd7zd939bu5JF5bRtS4Hv6e/EjrbqDfKu+g2SOFvxbG
	25FgU6hbRJpwrhwWfIFlMt0vqLf8YpS8f9vsEla+IEIt69jwaB9qmJwXf9PQ5axaGK7mxZKJABx
	stk8pN3PMXiBMuq+iiiAiqUzytZAK1W9MdaKsqDDGgpesFGZjjFSYa08H5eawJ3fmDXo59e2Ayg
	uNhvEcC8mBL0uOLMwVtoxbPU/Qgjcn6d0yejwdJyTs6AQdnMdTdKG1w8/e8B9oIHFxEh7eGzfQW
	gitQsG9p3HfVJeOOwMFc60WLeo3h4kIkA6b68KU68aNPi6NtMM57XBMYWJDB3nuNG0QQU7uHJxo
	pHXKpJO3ObJCHL0pF348Lifeo711UMWCK5sgrs0WagEa7cxIHFvsSOuvhBaczSN4PD5pzpaEsGo
	whZdJVlFU=
X-Google-Smtp-Source: AGHT+IG6QzGaUz34lEPKz312/mkWIT0AABjVhY6oKHLl9C22iV9Fx/QpFe3UaLiPniDFo1+dMTxXZw==
X-Received: by 2002:a05:600c:4510:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-475d2ec5729mr31422505e9.23.1761337188441;
        Fri, 24 Oct 2025 13:19:48 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dcbe5381sm584965e9.0.2025.10.24.13.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 13:19:47 -0700 (PDT)
Date: Fri, 24 Oct 2025 23:19:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] usb: typec: ucsi: Add support for orientation
Message-ID: <vbbz2jfisxnjiblasbtay5mnaphsio5qnjrqbxjztykdvgvxfl@sdicu53m3pil>
References: <20251015-usb-typec-ucsi-orientation-v1-1-18cd109fb0b7@linaro.org>
 <2025101530-skeleton-able-6523@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025101530-skeleton-able-6523@gregkh>

On 25-10-15 16:00:43, Greg Kroah-Hartman wrote:
> On Wed, Oct 15, 2025 at 04:50:36PM +0300, Abel Vesa wrote:
> > According to UCSI 2.0 specification, the orientation is
> > part of the connector status payload. So tie up the port
> > orientation.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++++
> >  drivers/usb/typec/ucsi/ucsi.h |  3 +++
> >  2 files changed, 27 insertions(+)
> 
> Why is this a "RFC"?  What is the request?
> 

My bad. Posted as an RFC since I wasn't sure if I tied the ucsi_orientation
correctly, meaning in all the right places.

Let me know if you want me to respin this as a proper patch.

