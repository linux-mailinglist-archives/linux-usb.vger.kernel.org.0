Return-Path: <linux-usb+bounces-26184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B26FAB125C5
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 22:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74C213B10FF
	for <lists+linux-usb@lfdr.de>; Fri, 25 Jul 2025 20:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0598225A620;
	Fri, 25 Jul 2025 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H3lVmFoR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD31CEADB
	for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753476349; cv=none; b=odWro3P2RzTrYfS21JajW5768e/V51CzvLU4H3h/q0wAWQ/M/OoV6n4Y5FhwjmW9mzniK1gfzZwSgFs6mKX4gYITgMvbDnxyHru7kkhHZA/E6i/lf0kC/rrIsA11WeRjHCtOKyMF96/KRTaLE75p28tYBcZmcs5/tfI8Ejmxqug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753476349; c=relaxed/simple;
	bh=ML3wJzicutJ7pzzOS8eBw3LcVt5abqgOJBY1Oc5SJuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XE+bfwg0/JqGxkHTWDuwCoDhru835DUIQaGWEDtxO6lBx3+yGE/bVU7JyTVdMu0+frm1WLvqfIm2PNpb963V39gVQtc6iTDKg9gLitdhJyGNNVsmgQOxwwd0p1wwX9ibybI7CA8aFO/OLmHIta64WZxDCbwN9PPznak/hPZ7KvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H3lVmFoR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5551a770828so2611768e87.1
        for <linux-usb@vger.kernel.org>; Fri, 25 Jul 2025 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753476346; x=1754081146; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dkFV7hywCaEtlGf8Q7mOLQIOdrHzvmI6g+XiRXRO/yU=;
        b=H3lVmFoRNQwYPfeO9iBYuLeITvT5MfGwDaTZSBL4vFsmPXyN4MmzuptVIqFGk/RsET
         V/nHPKAft0ZeRN2EubE69vkH4mDwygKZHC1snpsD1wZ1XTeMAtllKdA5qBuZ4bjo3zox
         lEtQEPDLGrheUbzzUcji3f0r6dzdxRBscfxo/xi8BI9/54iqIzuX0awLnvnyWcJgJmzq
         xsseyVYJ2PVzIcU8ai65heX8iQGEgZDdr3ojx+ImVw1cdeWSwNCKWyogwVGmiog42dQE
         z4gKNr5JPLRcAIwzscs5B+PMlvkYMDQ9+aytomfLp5js/YrucUtkBlpW8qt/W5ULTj39
         fNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753476346; x=1754081146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkFV7hywCaEtlGf8Q7mOLQIOdrHzvmI6g+XiRXRO/yU=;
        b=K/2+RpmcpKkQXHDsy3kiDeRDNNfVTYOMs7AxoExma2KqnS/+q69pOAORc4+eI35INa
         v5qPV6gYGvsNUT/zdpoZDUR2mrM3J7EaqGFNPmGBELwVL9yZj22DZqdP6lULFGuQdwBz
         Q2RLEWk1p5AZ0QToyFJygpfQYKmlQvQlPMhaXHBCOMy36z045CTA/KxXjvjwH4puKdlG
         n+EIpxRw6bxVd9QvdKT2CUazz7C+4NIVSjXS0+kp7FM5xUQZ9bO5dB8vLSadrE5FIzwv
         0ApLJLSRgxkV4oMnZWFTKr4SR2Cnb1E207DU5Bs3YvgWVR+sQQFyy9D8Ibpy+vWH2zF4
         OqVg==
X-Forwarded-Encrypted: i=1; AJvYcCVWeERRjDYA94zA7JA4G1xPUg4Bs64XAhkv0RO0kr1/dnZCVVOKUAfcl0lmiQ4lxC4FMwYWnUAX0TI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzdMAVO/4wLWFqNqc+j0tma+fk5UsRK2FdvbR80vGXcKBwJt4m
	5fjLSxpXZRBH2RqeJPMh5DLH1qz7yWW8iCQisMyI9YX8p/+++xfIUCVnRoTujFGBfO5gpS4Bo1d
	Dp7hUD5NKF48FOhyi/VpJsCSQrI7WgPxoFVZuHfhhEeHsDUBuTxl8ob1DWsg=
X-Gm-Gg: ASbGncueHwonDtooP30ClMMbUH6ANqNuW4uftYp9zwoWD0sVYnRcaOvv8rGJ9z3/JM4
	f4SNibjQc3d5Abrbb+pYmWOIFFe3+QKKF3pZRn6ceOgPi5LDZDuItkFvFAc5zFXf1Y6NNeaCI7c
	o8QResksbU/7L277dZhohKB2xNoxtRAwdpt1wA7FUBkDE8QJsO15Jh8NMFNLXYaZIDXBXQvUinh
	wAqO/2fJgV9h0RfmA==
X-Google-Smtp-Source: AGHT+IHH48TMpDfzEN/GY0NLk20jn5GyvCErTtW6GyBV2cgMPoLiDuPLD9Pt+FDD3Nt+B3TDEvgLB3LL4Rp8lrPZ7CM=
X-Received: by 2002:a05:6512:ac8:b0:553:cf7d:7283 with SMTP id
 2adb3069b0e04-55b5f4808cfmr1002884e87.33.1753476345590; Fri, 25 Jul 2025
 13:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALU+5Va_zeqS5YK7v3HNvDKkg8srqc87P5ZaQUK5tGFUMyNrkg@mail.gmail.com>
 <42f4753a-f7db-49a3-ba40-8743a78684b4@rowland.harvard.edu>
In-Reply-To: <42f4753a-f7db-49a3-ba40-8743a78684b4@rowland.harvard.edu>
From: Olivier Tuchon <tcn@google.com>
Date: Fri, 25 Jul 2025 22:45:29 +0200
X-Gm-Features: Ac12FXxD8K4ZtrkE9PBWaB_iYkwnoMBGmcB3aMxN41S6-C5rqYsj2xJeiUdU8XU
Message-ID: <CALU+5VYnZfp2CqXqn7X14J5pGsXyHDOcC5mOCZx4nKA6tjzO2Q@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: Add gadgetmon traffic monitor
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > The UDC core is modified to add an optional monitoring interface defined
> > by struct usb_gadget_mon_operations in <linux/usb/gadget.h>.
>
> This does not appear in the patch.  Was it left out by mistake?

My bad, sorry for this silly mistake.
Files will be included in the next patch.

> Do you expect that other gadget monitoring modules will be written?
> If they are, assignment to the global pointer should be handled by a
> routine in the gadget core, not in the monitoring module as done here.

I have no plan to write another one but designing the API to support it
is a very interesting approach. I implemented it in the next patch.

> There should be a similar optimization for IN givebacks.  The data to
> be transferred to the host was already recorded by the submission
> hook, so you can save space by not copying it a second time during the
> giveback.

After a couple of tests, I found that the payload at the Submit ('S') stage
is often meaningless (zero-filled) for both IN and OUT transfers or the
payload size is already set to zero.
I simplified the logic to drop the payload for ALL Submit events.
Fixed in the next patch.

> Would it be better to keep the event but drop the tail end of the data?
Thanks, excellent suggestion. I implemented it in the next patch.

Thank you for your review, Alan.

