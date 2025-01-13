Return-Path: <linux-usb+bounces-19235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4187CA0B297
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 10:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18B523A2FED
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2025 09:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2792397A2;
	Mon, 13 Jan 2025 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fVVyH5ax"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6A0145A16
	for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 09:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736760033; cv=none; b=gIyGhscOg0RYi6qnW7oFQ0YBQ0rtOXN033pETU6lacom7RqZobtYkH0fWzMhiQbV2Rz8eVK0ckfbcqR5J+P2Z9esBQ4rwVV/SRcki8V0ZhElfV7xU4yLheW4wLsZhXYFWvvtMWYtIyiuOgi+/QAmyGluPEmRuSicBhmc1LxN6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736760033; c=relaxed/simple;
	bh=6y6FM5CdvmPb8+MfmKu/FmViiG57nRhmZfNvS1ah05g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMlr8jsGKWRvHR+BHFMSwCnQdAa93wFdvCfkYk1jG4XQw0v1E0rA67PeGFS4FuFG8pNBtt0La/75O4kV031YT3u2qiKvCLpcRR8hLyXu4hvQPtlXvw/mQzc3NZzfJZtmpOdn9HhvyVGge+98wzueN5B1b7XwxYtXAko+3A/Ay44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fVVyH5ax; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d0c939ab78so8263a12.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jan 2025 01:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736760030; x=1737364830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/4LCm6hqojn+qHFmCLAoYVzfOY4Op+5HV5rfgAUzJ4=;
        b=fVVyH5axlOObJOtkQUmfkzLgdukvVNA8VTlFvT+CT9ifzlx8zDnbS8m4RqB+asPmKK
         P8xTIARUp79jxeMX+kd/aIhRGl3ybwN6Ql4EiBELMNy4p348aEks+/8+DYGLOiwItZQo
         T/w0zZTIVYR5m6rSxTuIpR9U1jWoyQ2Q35Lnlc28RkBzWAzbQWYqDLm+Ml+JTmsuVN3B
         37MS5yM5e0yHEwGuwkibyOMr9cyfJmPrcAK0t+YZCtEm7va3MMmgTbvsq/EDxQLLonBn
         FygqVu5m1TTUwktMmdB67S4651APg6kWxmpXT5yWfjX9KnFf/8/nOmu6CzU6pyOFzIZX
         Bc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736760030; x=1737364830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/4LCm6hqojn+qHFmCLAoYVzfOY4Op+5HV5rfgAUzJ4=;
        b=nCRRY40Jy+HjaXPhYk3hnRSnp9ywkN6Da7JOSAuCUdLcgqfCTIKBWcr9NfP0APmWj7
         haA7FKVrfqMGlHXihjE5OgjICL4oHn9KaSnmSZP6Cko4dCpybOwy4UJQul2sfSYs5kQZ
         PATQAeVatYz/0tJnoUjIIepjb/5nRXhWBmffO+SObwqAsOSZz2CdFT+39JIkRYcPWcy6
         i4NTtVnaRC6dHdhhCJIy0/c7oAZaX9XLnoM8h4XoamAYES55KbRO24JivQguRlPICqtl
         QmayBqWy+9+NeLiDxcGLIEYJ3WnfDCNw+e/zqmkNIKNzD/KvcHJBpjsZ82WKqXPZrPY5
         zP0g==
X-Forwarded-Encrypted: i=1; AJvYcCX0SQazaMayRrWViJ5O7NOEYU5wFeJNmyZ5PhTsn5kIq/2rRaY1E5hNyh86co2F85L9G6bTy3QG+yY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfn+9ZfUkTH94pAQpaw4iqpP5bh5aiX0v3ZSst3xTTmq8euiu
	6d5PcrQvN4CFQGcImsTO4SxP3qKw9niYKFTB5eODJxoFCheOWEj+BezakAt3NWdIP5qUsX3HN7N
	1weLHTDtCg8lQaNs16vBNTWBk6UqIwo9v1EcN
X-Gm-Gg: ASbGncusjw03pZ2DtkST59IdFKprycl2YC5+5f2EcfaA+0sAilipuZo7IPxRk6IPnCe
	EDU42hz5Rk8g54wshKvV1wjzRYNVi8NIIgxlCkNCv
X-Google-Smtp-Source: AGHT+IEg7B6sa8kO1AH0hpeIMDR/48l+AHxj6bO46AJ5YTcTQK2k/+3G1LFqJhUr4ugU56tEt6QzsGNIrGSfT6tXGhw=
X-Received: by 2002:aa7:cf19:0:b0:5d0:acf3:e3a6 with SMTP id
 4fb4d7f45d1cf-5d9a0cc9fedmr201810a12.1.1736760029676; Mon, 13 Jan 2025
 01:20:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109035605.1486717-1-guanyulin@google.com>
 <20250109035605.1486717-4-guanyulin@google.com> <69a4ae28-dbdc-48eb-b77b-147f58739913@rowland.harvard.edu>
In-Reply-To: <69a4ae28-dbdc-48eb-b77b-147f58739913@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Mon, 13 Jan 2025 17:19:00 +0800
X-Gm-Features: AbW1kvYuELATJIqQAKumBgqZEHTHWxZH3hcbiwOD3x1ACqQRB1c4AQ4z2kZ05z4
Message-ID: <CAOuDEK07M3Zj6uYZ0CeygSn-5tXHoueL5JQc2xZV5jywJR5GAA@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] usb: add apis for offload usage tracking
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, 
	mathias.nyman@intel.com, perex@perex.cz, tiwai@suse.com, 
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com, 
	ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 11:04=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Thu, Jan 09, 2025 at 03:55:07AM +0000, Guan-Yu Lin wrote:
> > +     /*
> > +      * offload_usage could only be modified when the device is active=
, since
> > +      * it will alter the suspend flow of the device.
> > +      */
> > +     ret =3D pm_runtime_get_sync(&udev->dev);
>
> Note that this function will increment the runtime PM reference count
> even if it returns an error.  You probably want to call
> pm_runtime_resume_and_get() instead.  Likewise in usb_offload_put().
>

Thanks for the heads up! Let me address this in the next patch.

Regards,
Guan-Yu

