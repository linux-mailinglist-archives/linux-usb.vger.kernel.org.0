Return-Path: <linux-usb+bounces-14373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B296610D
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 13:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B3EE1C2372E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 11:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAADD18F2D5;
	Fri, 30 Aug 2024 11:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Thz3RyBM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82B7199FA8
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 11:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725018796; cv=none; b=ie+y6Gs4Dj5Vr7L5t5N2//ka1r1ywQGZr3hHiRzhsJ5MXCzIo+6HEoMs//Cm2BmxYjCif+h7ya+fVZZUl5G+KCz0tbtocNZ9DD6jVns3ZS/ym2fxPMa6BiA+rrUMP8CamFPJzJihk5xVPnNjicsxfmn9Kmc9Bes9pR0fOUKSQN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725018796; c=relaxed/simple;
	bh=TaklMqYcDgmkkp4b24nlIdgyNbfAbwJRjZK1wU83df4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2q0lT6adgmhiju07e4RqnvY9Zay5WgEtNQ1jT+1TiLLiKBt0vrtpOfFlEAMiRQslIX5KygPtxVjmSRMlh9tvPvtjvvtBjFeP3nxcv6SoWlnnEt/b1pKLCcs5FHgnLUDvSI1eePmk/GxuwAyYzspkLb4Z/7Bzc0GWQu2x4H5Cv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Thz3RyBM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5353d0b7463so3150090e87.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 04:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725018793; x=1725623593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uv9ecrXr2xujd8Gma8wZ2yf9eNAhmsRqjn7nUMfDdw=;
        b=Thz3RyBMNHJstHetpQE/kC71m9PCdDWZz4n1m4jkwcjvAxvtRRgsAjm3WksPzfS1zS
         CXI0TdVoswReRWjyLiqIEqe3NFbkVC3PI3MTBYGlv+zF+Z6lWTLYAWxrsinIHxedJjrf
         d2PyZMaC1D2kCJanGqkEMoAwV3moxjDt5sHGHruhh7azshtupobN4yjbbDY8+UD1GBOb
         B1ofl/C/jFjRFqTbdH/prXvB4sFtfSIOXI69aD4DCL8rVJOZPTDz1roOAxxI4wUd6h4b
         N7occ0Hw2kTGQrgC6ML76Zoj0nCsSqCGxp59xQToIOxJkjeNRhMqrLOwyMpPZoDJZLxX
         WFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725018793; x=1725623593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uv9ecrXr2xujd8Gma8wZ2yf9eNAhmsRqjn7nUMfDdw=;
        b=HAzwl4TRWqR+1velz9N8UwK+SLlhuFs9+X5EAQbJj1NCnygKEGmqb2cLjAvw6TA6sg
         xrgOR7v1uCEnaVjCxNOW3GbHtYjKua7OpBVHSavurCLOqOXw8pUjVTDo9XqaNJgvrwcL
         Vp+rbJdqpgP3CdvdxFL4U26Oba9CN5LKNk54JYsUQ9idLSg6vSkx9DdHez1AS2kdhKcg
         R9sPgu/2x6HSrc3C95o5kSYBzC1QWnjTh+zOxCeFb/GjON2PU8evOPFIKtCfwaKp98wA
         Ulz9459mZnmuXzNF4SsA9cz8GHw7xneN02W0itiSSS5XkakIKIhkX/Awn1m+lDydgva6
         DJhA==
X-Forwarded-Encrypted: i=1; AJvYcCXRDeETT8+FBokqlJKsZfXC0RfwnEWC1PWe2razo5pXulNpLkNLJUGY4DGEAjhudOr7+9fbgNq2SKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB4Tupd7B+5q6sH99xGdD2d3tf4pXKmM219dytCDCA/s8IIVfQ
	96EkmrHJulPhUteGzlZvxILqvuRTEo1hlUbLk2ur8fwvmljyhiis
X-Google-Smtp-Source: AGHT+IHg8HAN5X4CufhiP9qTQl3Sy99DTFZWtytFbwA2NbhyUWhAn8TPaobxRQ7o38DcmzdRBGZZAQ==
X-Received: by 2002:a05:6512:3996:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-53546c02e0emr1486608e87.60.1725018792285;
        Fri, 30 Aug 2024 04:53:12 -0700 (PDT)
Received: from foxbook (bin33.neoplus.adsl.tpnet.pl. [83.28.129.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407abf4esm572183e87.65.2024.08.30.04.53.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Aug 2024 04:53:11 -0700 (PDT)
Date: Fri, 30 Aug 2024 13:53:07 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 0/9] Various xhci fixes and improvements
Message-ID: <20240830135307.7c57baa8@foxbook>
In-Reply-To: <39d389c3-1b3f-4a11-a40d-5c2eb46096bc@linux.intel.com>
References: <20240827194625.61be5733@foxbook>
	<39d389c3-1b3f-4a11-a40d-5c2eb46096bc@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Mathias,

> Code on top of 6.11-rc4 can be found in my
> feature_transfer_event_rework branch:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git
Thanks for pointing me to this.

It does look like a very promising approach. This is the principle of
"matching before handling" taken to the extreme, as nothing is changed
during the first pass through the TD list. It seems to work well.

I feel like the counting of distances from ring->dequeue is a little,
I don't know, unexpected maybe, but it does indeed produce surprisingly
compact and simple code thanks to those segment numbers.

That being said, I've always been a strong case of NIH syndrome, so
I implemented a similar search for passed TDs which relies solely on
walking the ring in order from dequeue to the event DMA pointer.

So I guess we will have two implementations to compare and choose from.

I will try to develop this approach into a complete implementation that
actually works and can be tested. I want to maximally preserve original
behavior, except for obvious bugs (I found an obscure one already) to
simplify validation and review.

So, for example, no removing the skip flag for now. I'm not sure if
it's a good idea at all, as it frankly is sweeping bugs under the rug.
I have one HC which sometimes silently misses TDs for no known reason
and it misses so many of them that auto-skipping wouldn't help anyway.
OTOH, when I get the TRB errors, at least I know the HC is screwed.

Regards,
Michal

