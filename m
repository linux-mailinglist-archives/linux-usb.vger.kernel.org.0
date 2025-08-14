Return-Path: <linux-usb+bounces-26833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD69B25ED3
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 10:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C4C79E6D5A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 08:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C222E92B5;
	Thu, 14 Aug 2025 08:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CFz2J5Dg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DC92E8E13
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 08:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160115; cv=none; b=FmON9hvDY1xyO38FnQVfpxGdW+KN6QQeDWVLGlV4nLJD3jGGudzpKKk/kmRys/WST+3epBF4LsD5W8HtBWhrvNNzmHk6U+kqsXD7SZq2RBqIMfMZ9o30QIuHcVeEHJCeDhjSouQAlfHjPFGKO8enLO3+7z4rmpRTA4R7FMbLMrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160115; c=relaxed/simple;
	bh=DXoZWllPvSAlTn6cKguWUx5XsVI696Dlfnu+ADK3Vug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZrXuxyiMMGrq8agX+28rvyOiy8rdqzBglVon8B/TocgD+RwiecUkLzGQl0wpDJnZatmR7uLsTKFYPMYKIzJfebxj6MID7aNGk0tsTC0YC83xKQMGMdw/xRSFqGt9yzynTESvRn1tD1D7VXv4Jf7/+BvzWf1hhp2viQazfjJSTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CFz2J5Dg; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-74381f217e7so468927a34.1
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 01:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755160113; x=1755764913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXoZWllPvSAlTn6cKguWUx5XsVI696Dlfnu+ADK3Vug=;
        b=CFz2J5Dg2T4Q44h2Q6ahAS3/PtT2Vz3DpoKx4nbNwTNpr3CATw3lrO1JAyiut1gOgy
         agWLpaDv2J27PpXB/Wnv0zGJLViX76+skKoFXjhOvP+Ewqq5tKWC0+1EnB6J3sSYBmEf
         C2Fdf+u9w6j8reQC4pF3zpAG8Ysf1+Aw6bMvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160113; x=1755764913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXoZWllPvSAlTn6cKguWUx5XsVI696Dlfnu+ADK3Vug=;
        b=Q/GhD8ke11Q4QffGW68S3Ukc0W46metr1KakUS6riSSs7TPOPjMFMHCnJ8vIo+m1ta
         S+P3lTKmC9qFM5qQayrf9Y3uKwECEnMu9F+TU/0o0njQaCdOfWyru5eu9wp+qHrFiZ9o
         hoOKYacCl0VjMOtJz0/IV6PgL42iCgGQH/nFUCrmtTTpmXGXJXbDFBj/R9cB3R+CVh83
         TRvxx0TPw+o0lfUufbVfimQDVC0v1Wd3h4neftN4SwdofErbsMawNnnyaaORwJM+e2nC
         pdJjxXYKrpjoDYwaXFTuJ5aDCyvHe95r1Li0Gvzsvyi5KHKsIh7zUcvRn1AJvRyFwvTZ
         RSCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0EpP02n+dU3INRY4kV8A0PAlF7vX8C5/TCm665VBurFUBfSNjK432dmXzXwx06uBP1zAn1XSdFS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YygYeRxCzjZWPnqXBzbaFx5EgJtd77Ey7mTZ1REAvGt5J6Trpxx
	4lrCW3t427FtqsVc900bgx6J+hSLR6zelo+0T7N5HrArWTDlRuZxkSFiyu/Aa17w+qSbxwePsTK
	n4WlMZY0de5qyqan7XGPCapjOya0cktGSDdZYedZf8lmSOhGZBRf2zQ==
X-Gm-Gg: ASbGncsMPwImmCw5yBoZs5o1wDk4xrw23PfNo1TwF/Vj5F5opyX/Dz8jLTx2y4jqbVE
	tqp29vFdiRiQgvcaJscsT0UppZErarfg6ZKqZzOZMyHOdKGwfWg7SuLPIcZzuWJQeZk+4xmCtx1
	zYkCP4QV4UdoLFtfrv61pqaDGfsb4KjFiqcMaRM77mC4ukYzhpd+0nBb68E8gTH6B5ClOQSz+7H
	Xv4oRVvohMcXaFVxk0cjQl8WjLPMWKa+A==
X-Google-Smtp-Source: AGHT+IFzeNU7id7rlH8AtFJTm1cePeOA784ZDto12yMUCjCqT2q+uwgR13V7z+m3dpw+DNaYtWcHDCtnfdbNOZZRXJk=
X-Received: by 2002:a17:90b:35d0:b0:321:27d5:eaf1 with SMTP id
 98e67ed59e1d1-32327b48f77mr3326450a91.25.1755159739419; Thu, 14 Aug 2025
 01:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804090340.3062182-1-akuchynski@chromium.org>
 <20250804090340.3062182-5-akuchynski@chromium.org> <aJn9ZSy3w4zW4Xvq@kuha.fi.intel.com>
 <CANFp7mVUFZyF8z0dN-Mo7ntPOXh06ZD0RH5GyvJJymOXrhSD1g@mail.gmail.com>
 <aJsoS3EXgoLP-f-E@kuha.fi.intel.com> <CANFp7mW92PgjSWyJq7Bz6ZLJ8ZgnsCRw2kAYAjKX3yymKW9hBA@mail.gmail.com>
In-Reply-To: <CANFp7mW92PgjSWyJq7Bz6ZLJ8ZgnsCRw2kAYAjKX3yymKW9hBA@mail.gmail.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 14 Aug 2025 10:22:07 +0200
X-Gm-Features: Ac12FXz1UN0w6EPEh01uDLgnpov_q6H22DAPFIMRA5Ihvr9O148EKDmKL8f4WE8
Message-ID: <CAMMMRMfo4n_xZPZG++OXoXJTeHuzzSBL0Bossn7+DMZMoRbqjQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] usb: typec: Expose mode priorities via sysfs
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:34=E2=80=AFPM Abhishek Pandit-Subedi
<abhishekpandit@chromium.org> wrote:
>
>
> We interpreted this a bit differently (as just rename it):
> https://patchwork.kernel.org/project/linux-usb/patch/20250616133147.18359=
39-5-akuchynski@chromium.org/#26431992
>
> Thanks for the clarification here. In that case, we'll get rid of
> `usb_priorities` and `usb_results` and just add a new alternate mode
> for USB4. The vendor ids list on usb.org
> (https://www.usb.org/sites/default/files/vendor_ids072325_1.pdf) shows
> 0xff00 for USB4 so that's what we'll use. So the attributes should be:
> .active (similar to other modes), .mode =3D 1 (unused really), .svid =3D
> 0xff00, .vdo =3D <usb eudo> (if supported).
>
> >
> > > As such, our current API recommendation looks like the following:
> > >
> > > * On each port, we lay out priorities for all supported alternate mod=
es + USB4.
> >
> > This first part I understand.
> >
> > > * We expose a file to trigger the mode selection task. Reading from i=
t
> > > gives you the current status of mode selection (single value).
> > > * Detailed results from mode entry are pushed to the mode sysfs group
> > > (via entry_results). Converting these to UEVENT is fine but a more
> > > persistent value in debugfs would be useful for debugging.
> >
> > This second part I would really like to handle separately, after we
> > have a solution for the first part.
>
> Ack. We'll reduce the series so it's easier to review for mode_priorities=
 first.
>

Hi Heikki, Abhishek,

Thank you for your review. I have addressed the feedback and plan to
resubmit the series.

Here are the changes I will make:
- The `typec_mode_selection_init` function and the `name` member
from the mode_selection_state struct will be removed.
- Patch 4 will be split into API and ABI parts.
- The entire series will be divided into `mode priority` (patches 1-4)
and then `mode selection`.
- The mode selection logic will be standardized to function
identically for all modes, including USB4.

Thanks again for your guidance.

Andrei

