Return-Path: <linux-usb+bounces-17780-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB99D5047
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 17:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB456B29E84
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2024 15:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92B0132122;
	Thu, 21 Nov 2024 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x7doaq22"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FF1990AB
	for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732204740; cv=none; b=sHIG4CB7MiXN55AIjrx8iY7B9qZslYKMnsdVj9vIBlNvyJ0xYaOPyI40SR44J1rRzbPu7hXlHnciMFhsGXL5WuBxLT+H2gr8CBUpOojbwhq+x7jUv+A1Tnj7CFp/TNY8YYK92T1tfeWG2LyB2SnogcWgVoDcN7QgHI4tOMmFUpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732204740; c=relaxed/simple;
	bh=pFrMJGTdNZugv6XDF8fHZzVtTHQL14Q/HPkLdIQ2wzI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bp7tEUP+qx8gJsezfp4xnbsIwiDzr7YYA1AObQvVApbWEAc2fs8ND06yXa6oQLLdSk4jUIi1aHf0a+MAAXwU1A57VDi6J5b/knI8k0XT/+CnM9tHzntS5rmnNUgDMdxZEJxdTLDnfY5bwRfjfn8J2SICtvWW3jPvsg2Z3aeiNfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x7doaq22; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-381ee2e10dfso667825f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2024 07:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732204737; x=1732809537; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pFrMJGTdNZugv6XDF8fHZzVtTHQL14Q/HPkLdIQ2wzI=;
        b=x7doaq22vSQ0pm9FAAYq8/J+EA2p35G36kjP3eb+Bq7ywxzej10gp/QT64UL9Q7S1f
         VrmhhkEGpu5Tt7cneKqsGM8p9P0wQEiZHDn8VbOwP3vxke7jJwSG+VFmqONmX13aiwnL
         e6SuVhyukt1zFa5g+FltwwM49GHGhwcCZlathkAZsAmSEGv2HK3eclt+5F5wraOo6W3+
         vYRd9p89/Nw1cQA1Rmapq1EBijtmVkkFcrNWB2P+esTwoIHfLeMUvRP3lARJJ8vAPtwx
         QEvcio9m9FqvXJMboLfFwaFfWYzyjQyDxXahMp4gLmc00gLPt92nHr4hh90OIz+7Bclk
         b9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732204737; x=1732809537;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFrMJGTdNZugv6XDF8fHZzVtTHQL14Q/HPkLdIQ2wzI=;
        b=iLfrkWkTC9HUpDqBhe2MI7runChuDU4xhGuRmFFz0PtYUyG95N6qGzi2oGL8N0R2SD
         827zKPuQ5rk6kl/6i9dvcVGl21X99WtQnQO8eWcLhWLLIfVZNRlZJZLk+yWpHx0xlUrO
         EhGexQian+/0VcoKJc+aU+AhVBR0g7E0zGPx2JF/N576mgX4fjsWDxZNInyS/aDtBkvh
         5LPa208+fF4pJd5wSYF96ozZIs/d2AAs1CxTNGVbtHhuyPltWPyYXTwNsMbhd89kR3on
         dGPpnQeMl5FeiwvUrPFxUPltdkrslVKJMGEpl6zxFigjARCcZMhAhR33dk/Y62pmoSPH
         IDNg==
X-Gm-Message-State: AOJu0YwVD9J29VLVtBxz7E/t2Fo7WY0JAG9Fr7IFBX+nVojWyVqYEBXt
	YJmr/+pjvqfHCuJrwx1EQb96EEAtI+PPCf+ZdWC3zrxXyhboV0Fjz9tayTcg4Rc=
X-Gm-Gg: ASbGncsYpzRYwQitl6ETjzi3AZAMYF1uQRrlXZjMO8uyQ5fIu5r9M2010AFAjqr+VZl
	JmgwTjtskyGgfig/tpWp+Kf7uXLdmDmVd2PXtT/cc+/viN7fjQ5tuuRZ2Gx4zSweHsFNA1IzWrZ
	mTCB6MLY5EfcE7lYfkF65qdRHdw8Kmweszq50kqex5u/Ooh5wyFh4VI+yQjDMolOkLNYWcuuFSg
	v+oLajdPl0eBVjlHZsGEywyaIL18c9dqR8/9d8DnYWIXzzVcGShQQ==
X-Google-Smtp-Source: AGHT+IFqiy9MujKqONyEZZHgE3agagNKMRNjtU/Mt6SiTzgaOIHjP5bZsKjt1uuQoA4qqTr6ZjRx4w==
X-Received: by 2002:a05:6000:2a7:b0:382:49f3:4f8d with SMTP id ffacd0b85a97d-38254ae417amr6022945f8f.15.1732204736868;
        Thu, 21 Nov 2024 07:58:56 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b45d179dsm59969675e9.9.2024.11.21.07.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 07:58:56 -0800 (PST)
Message-ID: <e40f27c2323077d9b35fac7572f30114b6e33372.camel@linaro.org>
Subject: Re: DWC3 runtime suspend on cable disconnect while UDC is active
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, Peter
 Griffin <peter.griffin@linaro.org>, "kernel-team@android.com"
 <kernel-team@android.com>,  linux-samsung-soc@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>
Date: Thu, 21 Nov 2024 15:58:55 +0000
In-Reply-To: <a40ac04beb4501ad95b50f79be3495315e38a880.camel@linaro.org>
References: <269e3ad7cbdb3b97fb8dc75cae4d487ce7f908c3.camel@linaro.org>
	 <20240809231012.lmgqemcwjdfiaxak@synopsys.com>
	 <cd87836fbd0a030d0b52902e04167fe044ce447d.camel@linaro.org>
	 <20240813230625.jgkatqstyhcmpezv@synopsys.com>
	 <a40ac04beb4501ad95b50f79be3495315e38a880.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-11-21 at 12:34 +0000, Andr=C3=A9 Draszik wrote:
> Unfortunately, this only works once: After restoring those bits and
> reconnecting the cable, USB comes up as expected, but a subsequent
> disconnect with the same sequence as during the first disconnect doesn't
> trigger the DWC3_DEVICE_EVENT_DISCONNECT event anymore (others still
> happen,
> like DWC3_DEVICE_EVENT_SUSPEND).
>=20
> Kinda looks to me like either I'm still missing something, or e.g. the
> event
> is somehow masked.
>=20
> I anybody aware of anything related by any chance?

Hm, the missing DWC3_DEVICE_EVENT_DISCONNECT event comes when I insert the
cable another time, i.e. after the DWC3 driver has reconfigured everything
after cable attach. This throws everything off of course.

Looks like still something wrong in phy/dwc3 interaction in the Exynos case=
.
I'll debug a bit more.


Cheers,
Andre'


