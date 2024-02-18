Return-Path: <linux-usb+bounces-6685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B88593A6
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 01:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 052651C21049
	for <lists+linux-usb@lfdr.de>; Sun, 18 Feb 2024 00:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C874B15D4;
	Sun, 18 Feb 2024 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGpVLDSE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FA57F6
	for <linux-usb@vger.kernel.org>; Sun, 18 Feb 2024 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708214578; cv=none; b=SamlvPKNQNGFyD5iCQIGDnF4pIdfC2e7e/fz0xoALiJFg1WwRNWII1LcrR9XoPFpFvTcbAL+pFMjw+n0o77SNt96wlnY8F0txqpUrZMIfpArdiOVvVN0+bLbqXHcgNC78oLnuflE9VC9o0sEUpw8RtZ7rzkrvrSSPT7L/ANhLQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708214578; c=relaxed/simple;
	bh=XETWQTQ7mdFrfA0T6BRD7/nVtrEglQVTjeLnRI5/3k8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B4sZza88lxPjNzMtORv5vdU1BwD9fAbXBdvkGP6G/8RyBBXEUAS2mi4Mrje+dJbeD4WT+W175RlsRWTjBvtZsH7p+8US/iLfghQiTPtQONBtIuPVCH906VWrZAbP6cbhyV5PdzHUd8oWVQX4yPFBS5/ozldxfiSIOv+hk3dq5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGpVLDSE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56454c695e6so137861a12.0
        for <linux-usb@vger.kernel.org>; Sat, 17 Feb 2024 16:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708214575; x=1708819375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oE9LTndHYLj9mljD3qEA474yMhU6vbE1A4MGIC2GMCU=;
        b=DGpVLDSEtyM4K3WN7I5GU2lteM6AQVhGHxfK/i4y6/vk6Ucjf1luNdnRsNhTeTLrJR
         /3c406RZMisogv2Dls2ImhYKs6/h86tERo+pLhmkjMGj7qrycIqOkjd33Yq8RsN5ltLe
         YkDNheznNhLwpL4qORhqsnwAK3DgrKphpqFXL31be0vyAsI63nTHvPAd8h+lhp09SwEu
         Xr1M+srNy/9UaqVD7KrpW8oh4aS37f9hnRF9gy9A9mC2aL+wy3RUbUCLaHnCCHBfShA9
         Sc7VPLe+xb3h7FWtV70kWEhVUKsQdXoA0XQTBr2lKJUkyBbCBMYYqSmifctguYgssTVZ
         VnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708214575; x=1708819375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oE9LTndHYLj9mljD3qEA474yMhU6vbE1A4MGIC2GMCU=;
        b=ELdKeJydoO6mZglFmk3RJB7tglwGCsApoNSAIwUWRymvxE0MOe/Qw0A9SAUtFWZvMk
         RB6O4ADVI0s/IXXxLPCYbedrUsJhtbFSSmjS1lPF+uDeKsnlf+lyrqwF/24ThYvdw56L
         oegxzL4GmilXIcZcuymQAmRDhk+Fjqua2DqOBYsJr+Yc8P/+vktdV8DhxkGS6A9uao01
         XkOsJJzWG3jwqmvcBHzlZhykWIZQaoJHDZ8vNIK5uGw6ZDNR4eOybB00lgDbc7OQdgcd
         gpAKbLQWVkcMLeeQ4navzJoj/ud8gQOL0370rjLTvvVwhT4jZlO3XM14wVfhrDPkk/Ca
         u6vw==
X-Forwarded-Encrypted: i=1; AJvYcCX06lMkM+CEWy6PI8TD4qqz8olU1ywyvVIRyKcxCKjna6a5PJfVD7FxhOMnzyBxIJBIdynKWL0ZVMLToubY/MY/+ajIVwvZQzKD
X-Gm-Message-State: AOJu0YzmkYzsNOpuX+lGKejx5M2PkB2zcB9+eEKju/FF7XZ0AIcwpWQ9
	TJkLhmhfH+pVbyx1Ju3tiM1pObSB+ZsUlGpJggpxjoujv31o8JPM
X-Google-Smtp-Source: AGHT+IFQy3ixYseu/UPMdGpwMyFH/1yaObf1+RaTfYLYI/ItEO8Z8t3LqVwRWS1yYAdKgQpvHps0Jg==
X-Received: by 2002:a05:6402:43c4:b0:563:c951:838c with SMTP id p4-20020a05640243c400b00563c951838cmr7654746edc.18.1708214574882;
        Sat, 17 Feb 2024 16:02:54 -0800 (PST)
Received: from foxbook (bfd245.neoplus.adsl.tpnet.pl. [83.28.41.245])
        by smtp.gmail.com with ESMTPSA id l8-20020a056402028800b00564427855b5sm382872edv.44.2024.02.17.16.02.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2024 16:02:54 -0800 (PST)
Date: Sun, 18 Feb 2024 01:02:51 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org
Subject: Re: NULL dereference on disconnection during usb_set_interface()
Message-ID: <20240218010251.7ef703ab@foxbook>
In-Reply-To: <261cbb28-60ec-4a0e-8bbd-2bd328a39c8a@rowland.harvard.edu>
References: <20240121181815.4ab01525@foxbook>
	<2024021724-dweeb-peroxide-2036@gregkh>
	<20240217202611.6337879c@foxbook>
	<261cbb28-60ec-4a0e-8bbd-2bd328a39c8a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Here you see usb_set_interface() called from the UVC driver under 
> inappropriate circumstances.  To fix the problem it will be necessary 
> to fix the UVC driver.  It should not allow itself to be unbound from 
> the device while a user-driven operation, such as 
> uvc_video_start_transfer(), is in progress.

Thanks for your explanation, I can see that this is indeed what happens.

I produced a small documentation update patch, hopefully I got it right
this time.

I will notify linux-media about the issue.

Thanks,
Michal

