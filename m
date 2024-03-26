Return-Path: <linux-usb+bounces-8434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D788CE06
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 21:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28DBAB220AB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 20:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455AF13D250;
	Tue, 26 Mar 2024 20:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INRnaBi4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F152FC0E
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711484084; cv=none; b=sSTeJmBqKo5NVz9ej2Q0lF2HqEq9EPxRtff5nAfbuNRX//Xe1agmgUbhFeWRkhFUsIikJ1GmhA/Oa/eGp6yjwmrd37x9p4AD2IlGoEi0XSSZQvUTZqu3R/NkBo8MdPSK7U7tN1C4N5+V368TFhD9ow5J/uEbLfNdINgwRuWAK80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711484084; c=relaxed/simple;
	bh=AIDg54CoL6Ubf+FqncjdhAH/D+9MbfFvEQWigiZZ+qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aub2sjuvyAJbFTc6OCN/j54NE0x0W3CdYiihaLJgiBTTY4u3vuhkYj3hklM/hzXuEvWYRVSLocH/Qz24OJC2b5eIxJc9nz+VOTPhACD7jyDO1Ahz7F44pwqsZsN/ew4K6bgGicD8mm0KsUPxaonX+3ri+S5+/uB252Q5+bdW5fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INRnaBi4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4715991c32so723369666b.1
        for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 13:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711484081; x=1712088881; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O7KKL7FuvhoP9fd2VZ7iJ9LKbRsE6K4k9QOsKwTSq5c=;
        b=INRnaBi4zDsirvN12eDOJdaxyPryjj0ghBjYsG14njnTHPEfpWcRs0lx2r/WbMiicj
         YxTq2AmKh2asKSAyAVlZEgVk7Gtoy3+LcRWzCM79iHuvUrYXK5GQQukz/ScoKmPUzj1g
         99LUrfGxhpNOZGByIweqOa2XP/0edmQCm2kbFaZ20BwDE6WeXAMqMUYSp2hHNQKjCKmz
         wULfB7HriSlMRisw873gad1eenCdYOxQ4j0a4N7Fdz0L/kqbyiN21MSEp7cv8iIBCVuq
         9R+4WsmqqbtWoCgUPOw/h+3CNuVua7CSmB61nACu9J/CQCq+DtXSBVSo2OMO1zO4M2cV
         2X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711484081; x=1712088881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7KKL7FuvhoP9fd2VZ7iJ9LKbRsE6K4k9QOsKwTSq5c=;
        b=e+9sBzcUIyljCdoBbHl+nbPMPyGLDMwVMtZK2K4oJDKru1G1nK2Vksq2iGVqUyOFAL
         OjcsVfXqlYtcUZp/qsc19+RDF/kdYW2Jk0G6F+e+TMUj0Fe60kDLoQB7AnWAekTWuysz
         xB3HTScg4y55yaVBuAkARZrBPly/gRGJdof/ZJ+QLXJFAL31Hs5KL2lsLueM/cnUiYmi
         QQ4kDvDd/uwjnoQ9U8hSfQpI1YUHn9q2n/+ppeRWvknUlubnqWf7AbdgsJOGEUnOnL6y
         S8zm79wQ4S+SWkSuFVCmZW4UOT0vNdJKUmlDFppjKny4IwTVx0qe+TY4h8KUtTdxpVpg
         JoqA==
X-Forwarded-Encrypted: i=1; AJvYcCWsDP5Cvqh9Yy4voAS8CgQU/HGeSOaideYTOjeTnXVws6RBZ7gKqqlezQTWWGyyOkU9XSoV+0Fi15mMXCWE+tvwPbEJIzP0PQDq
X-Gm-Message-State: AOJu0YwpAXrtYQeZ3g9hJ+3wyvaBqS72z3tk0ZIaqJKMB72jyQU5sEFJ
	IkX7mh/rmcQ7jkliFmZYXutqKIY642KMO7zSx6bK2C18VX3D9Y7tf4wGtOwiHI0RrszwoUIy2wf
	IN+CC8Vg0aP5p/ob3RPT7I585emo=
X-Google-Smtp-Source: AGHT+IHtqYFTdSi00gA9R++GHxJoDOUb2QNbQuZR89JCQ8gyzRtI0mg/LJpdNKIx9q1h+8maRzdgrz63HMslttDTVzk=
X-Received: by 2002:a17:906:fb9b:b0:a46:f69b:49b1 with SMTP id
 lr27-20020a170906fb9b00b00a46f69b49b1mr518818ejb.46.1711484081018; Tue, 26
 Mar 2024 13:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312055350.205878-4-alexhenrie24@gmail.com>
 <20240326150723.99939-1-alexhenrie24@gmail.com> <20240326150723.99939-2-alexhenrie24@gmail.com>
In-Reply-To: <20240326150723.99939-2-alexhenrie24@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Tue, 26 Mar 2024 20:14:04 +0000
Message-ID: <CADVatmOwsX+aSGbh62gU+9GTkgz3iwAQDjcnnwpDxSBtdNe+ew@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] usb: misc: uss720: point pp->dev to usbdev->dev
To: gregkh@linuxfoundation.org
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	johan@kernel.org, daniel@gimpelevich.san-francisco.ca.us, hkzlabnet@gmail.com, 
	reboots@g-cipher.net, mike@trausch.us, Alex Henrie <alexhenrie24@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 15:16, Alex Henrie <alexhenrie24@gmail.com> wrote:
>
> This avoids a "fix this legacy no-device port driver" warning from
> parport_announce_port in drivers/parport/share.c. The parport driver now
> requires a pointer to the device struct.
>
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>

Acked-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>


-- 
Regards
Sudip

