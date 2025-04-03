Return-Path: <linux-usb+bounces-22498-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB2A79D0B
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 09:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CBF816B797
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 07:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA7A24113A;
	Thu,  3 Apr 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PPgxtJ8Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0631224AEF
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743665692; cv=none; b=SFyi/UDwE00WyO7kOTdt38yg65tnLit67kBoeu5ArtEzZHyuSp+GN3MdV0HKsR0Ggf1VPrYEBJvT+pVaFr677TiYPU1EXBxrxZi6YMHZrHc6XEBm+PDDRA/BFPCDYem2iG+bZ/Cg4QlnW1mL51c1NeaVmBLu2Bn2M+7Z4rGOUbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743665692; c=relaxed/simple;
	bh=FqA8AsYGwvW3YrhIbWVs+8hraPapQxzPW2H8ASfaLM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ShdHkGEjqBxg0dif4o0Kv4TJX/GLq0mjeH9nPS5l58LKOgDSw7CX2dr1VOTo/JMysDsd05TwGZMH403/nvcj+7sSfnm1hwbevcx5liITIiPd23AoXYQGoZk7OplRQsMhwqvBtdR54noMk5KVnweQoo+7sBjw9ORq2WgfVw5QMAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PPgxtJ8Y; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso20017a12.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 00:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743665689; x=1744270489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pob0B1xSt8guz7TnO9Uz69O+jO9TbQeADA2e6N2ED/o=;
        b=PPgxtJ8YwqNNgd2UegPvHwCNMFbMW6BZUJPo3bMkbBUUofuHLVkHXpS20tCPuHePhT
         pRw3/d1XaA6ybm3eby7qtI7Sa2F3mUpO0T0WS7CGNrONxoEbPfyWD5hbbN+WxN5QcVqj
         K2/mQeSS2KJeGpzQqCWbl9bx3TCrJVJ3qNYiIuT41fBnbY9E2kiWu3ZsAwP0XhgOLwv1
         b6qvlnA18+Rj1Hwd2RDaXL8sQSZxu3ijrI6Lt0TM8+/k3SW0S8zwnpw8FU/6yYVzyCHw
         fL1xdix1bVNEfAlQJPBIev4EjDxVM4MJ3FcBJM5rzvqCpjdhwGAyFljHCokGTxHRcENw
         EIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665689; x=1744270489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pob0B1xSt8guz7TnO9Uz69O+jO9TbQeADA2e6N2ED/o=;
        b=tphAxQGCU5oCSLP2q3h9t6Y6lvbia7HtmoDEldio88KEvmj+P1YkiR+lf4WZIM/Xk5
         LVeH9HuvK9umxHNuNwMt3/HMHBB1zB1MyA+yWR8zq8lYmDDUrZ/I24CT5MJfp6j+Qet0
         +BvtY6eDAf7UGgbWAhe/8djfy2+SMkmvISsBKA78E/mK1dIXWAz4ffuah6vEJvBRkijj
         stfTBq5B/uv052fWug8Pl/GrBq/paMhZ8pkGFY6fNhTjKTn4A2IkZm/SNseY6CWFMQm+
         hr3qHRL2X/OlRiwBVoymACQmQGlkJeV6rIewyrF7Yw5chwPAa3pUukN2502WIFiUv6uj
         kdJw==
X-Forwarded-Encrypted: i=1; AJvYcCU+O3ehlxfGIylOut+mE6Aew28p6uYcsLU5G4jt3N1llmYgZ7PBH5wJmwRcaNbuTn/GmeE8JGrFlxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcKx2k+RmyJybdVx6NH1jOKgNqvr9mqAJqeQijQocE9y8qjJG
	nGwnpwrkspHfLA1ZCLsdPC8S44UOp80kA7qpv0o9sLSihbLIU+8Cz/WLNHaCVoZX/VRINmIMMPm
	taV5BbaFo0CafGEvEZMn5rQpAl5i4HQql1q2h
X-Gm-Gg: ASbGnctY+ffGRWm0MFWk6zUpOEc+vgRvYqQ9AtN6dZ9XXfMhcdZGT9ajahkGq1nBJJM
	qJOvGwuPtcpYeVgWsC99oTrickteUI2OoAo3HZoU9ER2YVZUjvS0g/jBdRT/bM13cuew4z09whW
	Jv2GsXssELNtCN0hAwTkaIXirL6AkPPJ0ytF1YBQ==
X-Google-Smtp-Source: AGHT+IE+5hUOsVQIEBoyqGPnAHWLj1Arq5YvEPmq2wnE+48wqnUfXVG25Q93jd6nnQ92sFrmjjkgjMM7CuAelLpLDT8=
X-Received: by 2002:a05:6402:2039:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f086e41de0mr46731a12.7.1743665688535; Thu, 03 Apr 2025
 00:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401062951.3180871-1-guanyulin@google.com>
 <20250401062951.3180871-3-guanyulin@google.com> <fd54ab58-1357-462a-8e3f-a785f7b56813@rowland.harvard.edu>
In-Reply-To: <fd54ab58-1357-462a-8e3f-a785f7b56813@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 3 Apr 2025 15:34:00 +0800
X-Gm-Features: AQ5f1JqQ_Jok3E6UStWaxXhdV0i6jD5LI1ZGrbW_UIJBzllLHLVe_pRao7Ilcyk
Message-ID: <CAOuDEK2Ukhe=arXQLqfcksxXbpXA5q-9HHd-yr-rn_qrPjXWoQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] usb: add apis for offload usage tracking
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, sumit.garg@kernel.org, 
	kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, elder@kernel.org, 
	quic_zijuhu@quicinc.com, ben@decadent.org.uk, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:24=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Apr 01, 2025 at 06:22:40AM +0000, Guan-Yu Lin wrote:
> > +
> > +     /*
> > +      * offload_usage could only be modified when the device is active=
, since
> > +      * it will alter the suspend flow of the device.
> > +      */
> > +     ret =3D pm_runtime_resume_and_get(&udev->dev);
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     refcount_inc(&udev->offload_usage);
> > +     pm_runtime_put_sync(&udev->dev);
>
> The USB subsystem has wrappers: usb_autoresume_device() and
> usb_autosuspend_device().  You should use them instead of calling the
> runtime PM routines directly.
>
> The same advice applies to usb_offload_put().
>
> Alan Stern

Thanks for the suggestion, I'll include the change in the next version.

