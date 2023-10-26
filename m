Return-Path: <linux-usb+bounces-2227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2997D86D4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 18:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45FB928206F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 16:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E4C11CB3;
	Thu, 26 Oct 2023 16:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRTlygfz"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C705381D5
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 16:36:55 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B59C818A;
	Thu, 26 Oct 2023 09:36:54 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-27d0acd0903so928366a91.1;
        Thu, 26 Oct 2023 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698338214; x=1698943014; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6mEQ/jJUndEhke58xoYtbcLMqltQaUgXEZRUu92m1g=;
        b=SRTlygfzoA7DLOy9b+OIxaZdPPJyroeziwmBVDTV1r8HxVw2haeyOXB/mwCU8RFkaP
         ak2MbWjHkJ5XlyKVTZrs4m8gZ1bVBd+eqSF1MXj+3RWk1Tc86ezmtj7EwN9DNSjxBe42
         J5yLDmB2uI6B8ATgvPF5nEUseOFIbKZcccR/hsN0R/o1RW2yPNv3oIRv+volzV1y1+y0
         2Q3S+/CrRPd0KFvYIjFYfGXw+z7LYSfobALdu63fsVW6D/STkfKxa3NGlQLZpXtL+u2Q
         g1V+gwx0uny652CwpPnThDzf+g1+mMtEaopPFLtQqyLOBb1PPbuZVF7tS+rHPz9o2LnA
         w/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698338214; x=1698943014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6mEQ/jJUndEhke58xoYtbcLMqltQaUgXEZRUu92m1g=;
        b=DWyJvIKBUo0XcKkzWbXvKq1dZlu336r3YO6hY776leH9hAgHkmgy5MqjiV7yEamYrj
         f9xhLMu0FOvw4LobfZDGc2eQE9sAdViBVpV1IOqZ8BXw8ux1SjL55wLqHeNL6YrM5tgS
         H2htXmLAvFKhvkfr7n9rY6nTa3cSZHc3Kp3AKjzxVCHtBs55z9otnXIRp4D2O+38BiG4
         hPWVn0eMN2FnavVI7G+jsQwwgyDZA5aOs+v4dXcZQuknq77FvFrqDkWAyBT3kX/bEgQB
         CDd9Toq8dRS9i1/xLY2mLOHQZmrEg6MnsqmEe75vuOyDnwNWjAPUCJZ7iTDN4FJJmGPw
         YJOA==
X-Gm-Message-State: AOJu0Yy171xgKdsb8KQa8EU+/upFINNmKB4+zbjUucgPDlNVohF/Z5tK
	8Lu7RHMP8tp296MU2OXSSnrO8YeaNfxdnyXcKjw=
X-Google-Smtp-Source: AGHT+IHPLjytrDUy/OHJAGwxWJrCqLWDhA4MfCUvQr71kgNrPpxJ998yCpt6MVuks3TbhOCiuTscaTrqWARMjyCOtKY=
X-Received: by 2002:a17:90b:35c3:b0:27d:61ff:3d3b with SMTP id
 nb3-20020a17090b35c300b0027d61ff3d3bmr17026289pjb.38.1698338214118; Thu, 26
 Oct 2023 09:36:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0db45b1d7cc466e3d4d1ab353f61d63c977fbbc5.1698329862.git.andreyknvl@gmail.com>
 <eb637fd7930722ff9dfc2ab4469d78040ee2a166.1698329862.git.andreyknvl@gmail.com>
In-Reply-To: <eb637fd7930722ff9dfc2ab4469d78040ee2a166.1698329862.git.andreyknvl@gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 26 Oct 2023 18:36:42 +0200
Message-ID: <CA+fCnZfBder34H+zuONEkzJk0_Li91H12AxsO6rCY286RYjFrQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] usb: raw-gadget: report suspend, resume, reset, and
 disconnect events
To: andrey.konovalov@linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 4:24=E2=80=AFPM <andrey.konovalov@linux.dev> wrote:
>
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/=
legacy/raw_gadget.c
> index daac1f078516..ee712e6570b4 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -65,8 +65,9 @@ static int raw_event_queue_add(struct raw_event_queue *=
queue,
>         struct usb_raw_event *event;
>
>         spin_lock_irqsave(&queue->lock, flags);
> -       if (WARN_ON(queue->size >=3D RAW_EVENT_QUEUE_SIZE)) {
> +       if (queue->size >=3D RAW_EVENT_QUEUE_SIZE) {
>                 spin_unlock_irqrestore(&queue->lock, flags);
> +               dev_err(&gadget->dev, "event queue overflown\n");

This is wrong, no reference to gadget->dev here. Will fix in v2 or
send a fix up.

