Return-Path: <linux-usb+bounces-29207-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67647BD2213
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 10:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B16561897EC7
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 08:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508A72FA0F3;
	Mon, 13 Oct 2025 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDYaiRTo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C3E2DFA26
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345188; cv=none; b=ORUm2e/SR4i+KrGKca2sAdbCRXbd2fmNHs+muU9TP2ADr+idG2utmO9bjTXYQI3pf1Meizp0xbYc45jQ+GWKeJT2V8njf59hwj002+NKPOjiFrbREkqJ/NjZOXZTja9z/Ed5KThYxdZiWM+9R8cITIzTLi5ritCbv3fBb3/9jZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345188; c=relaxed/simple;
	bh=7cwF3WgejPsTdfh++TpqyIzPN+K+naMUAxCgf8y942w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjGo6R8BV5ES3x6AnArsy1p+Ctb0W8DSkmM9kbHmg0TeIJcBClfxKHw9zCIB1+JLulh48Y25Bh+edgpwBB7rbgXjZCoakMtJiPBeXXmdWNbx5SdN0fvT0/LxraS6aVTARXMlROuSBNd0Fsy54hy8rVn70j78lBKVhy3bOMc0w8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDYaiRTo; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e44f22f15so573309166b.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760345185; x=1760949985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3I8HDTKmykm1bS4GjgXYsvQFoV19LpdDQ3Kk8ezHzYk=;
        b=fDYaiRToCOTCnEqk9LFb/zAueM4E3l08aSOnJEejQStItKoOghjWZRz6mrIZJjJVGB
         wCNguyV2jh6tegB8bV6KPb+bFXmcFc6tXY6ASc1lYDKc5S4U/tc7/TJzn4/CO2GkIoMX
         +MmM8km7Y8ewA8XTtHtD7Z87e2U+QlYO7yMyNqqULe5lU2UlSa11T4scm7Jm8pbHh999
         fKKu10aOV7F8K0xFau5uTHcwXuTa2oKx546Edt3EzA2JwQjpt0YTGOHSW7r6myWzXVrj
         IkZK2QVsUQ/6ow9hzYtQRi1atvBl2swFlFUtWZQu5n/IPHyyc/IxJfCPnL1tpZv0Imjh
         t5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345185; x=1760949985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3I8HDTKmykm1bS4GjgXYsvQFoV19LpdDQ3Kk8ezHzYk=;
        b=JjH2pz7hpMaNEfImyVL+iWh1ouIrt4YrKYyGm0IRE2/tkP0rHqUWUBEd6WZ3giRGmI
         lmINqfDrx8Orh7dYhFNej/Im0RaLkiNcQOdmL6nvsUBuYtbtg+CeP/9JM+jMPDnbozqW
         DyMwwJXsdznymfsKjxkCzGYK5tK73P7F+FWfYKjUmXbgMQSa7bwo0Z7yJL2p0lN7DOXo
         mVzSmwADP+nfeFw5OEck1xbRn1nSXe0GxB9Rsbk4syjzL/Lry4VRx8Sp8lH9tsd+9CtT
         7hxHqFCtJsC+nI74v9Pvbd9u/dNY/IETXFmA6PRRqWO7tXBBpugBVT75A7DxNrHRacFP
         toQw==
X-Forwarded-Encrypted: i=1; AJvYcCWz5E4258qClA7Ak5wfkyJnJUi+GVyOlWmACNXCULPZCYaeT+SzfogZzPeZ+4rGFaerxVCu6GoDouw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSp3WXgm7YVYU+Z2AIBBoMxuAJ2rShJ3nbgBHV+XgZr08/0XfY
	/1Y0BGXmf3+6YRynkcc9ru9NLN+WRUgsdjIir3Ea+VFbypAchK+LxSDb+l0M3A==
X-Gm-Gg: ASbGncvH6GQO/TJroFCaTc/Z1BE7nsQjwENYJFGzyt/vYE7qVLdtJD8P/KirbmLaEjs
	+wmhnCJkBppdm/rOrnXCRShnaqQzhvmV2ey0I8h8x7kWw4O2ItmYm3FDAclwqRht7h4eKfRkByX
	FtrOdvwB2HIyXjE5MLeZQrzDMKtWD7rY6ZFm2e0uyPW0qdRiTs/qYVgM4Pr4wBzm3w8JNHP02Jr
	JGHV8UfHBnSI+a3/veKUxyObba1u/1LythIDxlA4SHSs+bC8VGzkpr5VF7RjCbJZ2Qr6xvsPhW5
	mcDGI88dmiH8pr1zhVlz2FJ1Qo40X/29zBYbiYAnAdI0gCE/nRIkyi6uJY9HJ8eUCqBd6M/RYql
	LX/RRTbsWL6a3RZteRFpcJ1SE5PCLb6LtSUbJvHMEmywz7W0QclxqgdUJ1Vg/5nnh
X-Google-Smtp-Source: AGHT+IEASmiKOWzXLjdX2B0k/y0hA3kT10SgwtYD1q3D+JJWO4vis0GLW+aT6MiCYb4KF62KRQI8Mg==
X-Received: by 2002:a17:907:3daa:b0:b45:60ad:daf9 with SMTP id a640c23a62f3a-b50a9a6cb4fmr2296678166b.3.1760345185286;
        Mon, 13 Oct 2025 01:46:25 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c124a8sm881024866b.51.2025.10.13.01.46.24
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Oct 2025 01:46:25 -0700 (PDT)
Date: Mon, 13 Oct 2025 10:46:21 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Pierre Tomon <pierretom+12@ik.me>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB disconnection after mounting file system
Message-ID: <20251013104621.29418939.michal.pecio@gmail.com>
In-Reply-To: <4cjC4c3F8BzrTr@smtp-3-0000.mail.infomaniak.ch>
References: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>
	<2025100905-gestation-founder-3e70@gregkh>
	<20251009160731.58dd47bb.michal.pecio@gmail.com>
	<4cjC4c3F8BzrTr@smtp-3-0000.mail.infomaniak.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 14:31:59 -0000, Pierre Tomon wrote:
> As soon as I mount ext4, the activity LED flashes continuously on the
> dock. This does not happen with NTFS.
> 
> I tested it for about 10 hours with NTFS, even when the drive was
> asleep, no disconnection.

That's suspicious indeed.

Might be that mounting ext4 somehow triggers a bug in this hardware.

Does it work normally while it's blinking before disconnecting?

What sort of USB chip is in this HDD dock (lsusb)?
Did you try searching for other reports about problems with this chip?

Regards,
Michal

