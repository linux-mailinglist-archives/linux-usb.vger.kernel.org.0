Return-Path: <linux-usb+bounces-30957-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F48C89232
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 10:56:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7475234CAF3
	for <lists+linux-usb@lfdr.de>; Wed, 26 Nov 2025 09:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D78230103A;
	Wed, 26 Nov 2025 09:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i+l523V/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9792E2FF668
	for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 09:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150836; cv=none; b=WtSPG2Rqy16D3L/yXZBnAaiwv4Uw3sN42HSo+AD2/wuSz2zbUlvcmoTmJ+G4HQNaQNOcM5ElAfKGx+g291PfSErGIUQEK3+O3XDtxI5RXs4S4FI9l19P4PT58CjPjEypy/1LU9vJe1K05CwRvHQZY/BM58x5EGO6nmVjfrF9Imk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150836; c=relaxed/simple;
	bh=YbTM+VXgZFSN5n3XGK101BeawO3hUMbaETtn+zpI8/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQov75t5xiNFM0vF8toA/qaetuiRnby6c2FoEOn/xZ/nFpjhbZLLWC77WJVx0dgIrklbc0v74n+AJ7dZXPhjHAzIfvj1WfYdIykONegm4RKkjMuMotZoEqyLcSkt7GvgnE05EwQlSZxV6WslX/hoTaC5goFGt0C8ZJbkFXjaONg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=i+l523V/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-595910c9178so4320990e87.1
        for <linux-usb@vger.kernel.org>; Wed, 26 Nov 2025 01:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764150833; x=1764755633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbTM+VXgZFSN5n3XGK101BeawO3hUMbaETtn+zpI8/Q=;
        b=i+l523V/IPBA6edmdAx4AwZa6T5nsPlYU1gOfmP4yZC0o1nxLq+5liLjKTzUdboY54
         cww5xNQgi3qiRh8tQAo7QTMMnsZGKDkMy718NYlg6pv/1rW1Os20DKRMKZb1dwoE309z
         MGEct2k2LN2WFJ/Fl5ZljFVTrBJNEZY154ThE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150833; x=1764755633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbTM+VXgZFSN5n3XGK101BeawO3hUMbaETtn+zpI8/Q=;
        b=XUIPU6Wi25DvyJYq37UVqrBp8X8gt3RazaxyqVB4shuPdKE6unabIh0IXw89gBmiyS
         N35eMzE61UaWSCfnCdywIwHz+mew54aYdDgtC6KRqZvUvMHSDtebuzSAPJ1n/fmwpV2t
         98rhBALYiMIei0QOWGDOGYFC+wjf7N+rA72qQxtVSzUUI1Dr1VuStmycaA4Jn6YMQ5gy
         nk08mfJm/g1bf1FFkMSD505c4Z8kWvnsb5BcQvU51WYlru7qY55TIMkDc2xE8GGUbsmY
         h/jmvK269zqpYiSIsd7RxzYdNUREABR6E8TcTgqSk8GJ+RFl/2ce78+IWqpzrRjNsLAa
         36cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSSS/lqD1V2dLwWMPfNY+QDBMMZG9FR35PGG+hvHjtO4Agl7QFwrVIcB0+qTIwKg3I0sQLElRlQC0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUyz4UuP3LGik3MLkP7h3lPwdPMPX7IDaUfOpNDHHjwQIQUM2B
	YoC8Bv713gfFOsNpxh4jN4azbvqm1ny3Kh/byen6lpq1RbaJq82BkrdA8jfu+F7auMKAxjmVy2E
	riYItJ2Dk3rV7Gm3d0k1A7w3HTD3MxL4RoQ9ECV0=
X-Gm-Gg: ASbGncspYcwhkLhwb7ZlJuvSM0PSxWfLGNBsxeknP4gGj50UIPqboHrhoTqIAMYCnHg
	NcBljU9ajK5+zYVxo70wWkIzD1O+5aUCQnzr+5pSHjIFr+Vcep/cgXPSaJNMRPxrX5R0gDz5QGj
	7ngf39rtieHr41OOrEApbA64/2LFFLors6IL9vgJjUPXs7qcKKquO9iAGXuREdr8gTkIVRIAaL5
	Cmol+p6EiPffJnXfp9aUJoRlGdO3ZOaC6oF3vIMDMc4DvJ/OhdDegKQic/4MdBIeY+ivnLBxzlK
	MttDTw8HJSNgsZE41lnqS1w=
X-Google-Smtp-Source: AGHT+IG/4tv/7SQSPGY5crXATgGdwFZg7KgwVg2LnufX3+fBL0hnMCEYrNSvWqCLbaeswGJxoPPO3NB9XJT4wN7dL/I=
X-Received: by 2002:a05:6512:3d25:b0:595:8258:ccdf with SMTP id
 2adb3069b0e04-596a3edc8eamr6515297e87.42.1764150832742; Wed, 26 Nov 2025
 01:53:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119212910.1245694-1-ukaszb@google.com> <2f05eedd-f152-4a4a-bf6c-09ca1ab7da40@kernel.org>
 <6171754f-1b84-47e0-a4da-0d045ea7546e@linux.intel.com> <e7ebc1da-1a94-4465-bc79-de9ad8ba1cb6@kernel.org>
 <CALwA+NakWZSY-NOebF9E+gGPf2p0Y5FLOZcpLfSbt5zkNm_qxQ@mail.gmail.com>
 <2025112537-purgatory-delegator-41fb@gregkh> <CALwA+NaT97vDjuPDQsjR=iNrV79A4k4AC2awVPeRCyubBezBhw@mail.gmail.com>
 <2b072886-7ee5-4cb6-82c6-e13819a9f7de@kernel.org>
In-Reply-To: <2b072886-7ee5-4cb6-82c6-e13819a9f7de@kernel.org>
From: =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Date: Wed, 26 Nov 2025 10:53:41 +0100
X-Gm-Features: AWmQ_bmuqJqMHtTvAZ7UDSINggKn3KHvTN3rfBP2mSvyELL5zI9f5a9pchntMQE
Message-ID: <CALwA+NYbyEB+KrtS9MreVgY7zb1dQ55OL-tVRc3_mg-zQsz+CQ@mail.gmail.com>
Subject: Re: [PATCH v2] xhci: dbgtty: fix device unregister
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 6:39=E2=80=AFAM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 25. 11. 25, 15:39, =C5=81ukasz Bartosik wrote:
> > I sent a fixup.
>
> I don't see it on the stable or usb lists, nor in my inbox. Where did
> you send it to?
>

I sent it here https://lore.kernel.org/linux-usb/CALwA+NaXYDn1k-tVmM+-UQNJZ=
QEZGiB4QmBfv1E6OeWyMicUig@mail.gmail.com/T/.

Thanks,
=C5=81ukasz

> thanks,
> --
> js
> suse labs

