Return-Path: <linux-usb+bounces-5243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73591832178
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 23:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF241C232AE
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 22:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A19631A94;
	Thu, 18 Jan 2024 22:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZriE1bO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984DE31A71
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 22:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705616206; cv=none; b=oyCkJ16jQXPBuIl7Cekdx6hJUmpcHPD0/9KQs/A68/FwQxTnmapd7bKTX5eQOaRPDwCrjqEAGY89b7DUSYzZKAlBXdfip7niilzkmQx3uQ08/cin0/vEx+/RoWNpTOBODb7X9FxrNaDcDaxjORHjYZy6csAHJJOAjOHezBHg5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705616206; c=relaxed/simple;
	bh=BHT5kU4YQreLginNFn8YTFxnExu+dfBRaifhOIOnfiw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WSyEy/KIZKQBTXHfZ1EkVVrXU/pkVO0oN8mtaasdyI5VZ3Vx9Mzy/c40EHpvqYEHhllGbD8nyVdkXMJl64HVYKJtYljPyCzGVJG51KzciYPI2zgsTLGOm3WrnnnMLzPiKnpuqwlW61llW1f4/lyiTY5N5Xd4taMyQFw3fpkh4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZriE1bO; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-559f92bf7b6so377779a12.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705616203; x=1706221003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWoDBBF9FahQ8KEqaS5y3zBTtbKYiDn2l/VTvFt+kUo=;
        b=SZriE1bOw4gOCRSlGCeWCXTt3BxLd2geJmISPPiQyVAFvQeBbDbQlFs7Njg8H4NB7C
         2eix0EBpLz8EhnxP8e+iumVPDmFmXSvPqd/vsSQtTA09UqIq1USGiIJCFl2vTIymuCbr
         NpUbdSh0E7qQ3Cielkrc+PU5xz+Q+D73YWSR5j1nDGoVc/lbeq84hn48wFnq6AgB4NzS
         YTeDdxvqekHMA4c26ySV907vEA8llKWsfJUNcRO42RaViw8eAZFb6KR3tqMIZJy1qUG8
         wyUYEgA0ucFGdTB+8wu0JiU+/cunzIDEEuOTeLtXtiiZBuGsaP/K9/uP5U5ukB3Eh9A2
         UzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705616203; x=1706221003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWoDBBF9FahQ8KEqaS5y3zBTtbKYiDn2l/VTvFt+kUo=;
        b=hnYJHIKd+iPWPIdbxtcjcVYZJ2dSAAE6+qfmRQkmHCP2vp4LV6LIm113xHWFICemkK
         plyOBIwd6B2owy7kNoJYxyPjRsv4KJPBwAwOQJsBMrqEQZVv8PlQML7vdYtVTxar9mBY
         OQwWMBDv/7SJ9mxhTWlC7mk13M74Z/pbpcK8JzU0IkW/anLuF/m1Whi5bhETHMkGDvvF
         piO3S4cBR6oaRg6+vVCASTzmwaM81BwlgPj+98gG29OGyAbzSjMEYTKRYkRcE3BZ7Jkz
         +dtty/MAQXWufOOyjfymTGR/D7bE9PehG7PDm9MGMarK6kXneqkbiuSB5lPIqg/WqB9+
         Slwg==
X-Gm-Message-State: AOJu0YxRQTq4xiWpeHhGDnrCbvMsARLxG4FcXPMDiRc8VWF9RF8xAIvj
	3JGnxzf3K+aE5fQ/YAipFj1BJZlVfZJOMkO3Oye3L94cy0mxGNt/xgrfMJEOz1E=
X-Google-Smtp-Source: AGHT+IEiCWYQN5eyLsAC0DtQTMbEOGoslUtLZPyHiWPioROa9makVaNvBiCeytectuTXfeIJy7KEdQ==
X-Received: by 2002:a50:9e84:0:b0:55a:4bb4:ec18 with SMTP id a4-20020a509e84000000b0055a4bb4ec18mr48968edf.3.1705616202567;
        Thu, 18 Jan 2024 14:16:42 -0800 (PST)
Received: from foxbook (bff125.neoplus.adsl.tpnet.pl. [83.28.43.125])
        by smtp.gmail.com with ESMTPSA id fi16-20020a056402551000b00559f8fc62ccsm1657359edb.29.2024.01.18.14.16.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 18 Jan 2024 14:16:42 -0800 (PST)
Date: Thu, 18 Jan 2024 23:16:38 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFT PATCH v2] xhci: process isoc TD properly when there was an
 error mid TD.
Message-ID: <20240118231638.46c2fe1a@foxbook>
In-Reply-To: <20240118135652.2629101-1-mathias.nyman@linux.intel.com>
References: <d9a72d01-0c8c-9dab-f405-268a66f47505@linux.intel.com>
	<20240118135652.2629101-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

My usual set of tests passes:
- no spam on disconnection from NEC
- no stream lockup on random errors on NEC
- no spam on disconnection from VIA
- finish_td called with right frame->status on VIA
  (checked by means of extra printks)

> +		/* Error mid TD, don't give TD back yet */
> +		td->error_mid_td = true;
> +		td->urb_length_set = true;
> +
> +		frame->actual_length = sum_trb_lengths(xhci, ep->ring, ep_trb) +
> +			ep_trb_len - remaining;
Not a problem with this patch, but I noticed that every single use of
this function ends up adding ep_trb_len, maybe it could be inclusive.

> +		td->urb->actual_length += frame->actual_length;
In your first email you mentioned hosts responding to every single TRB,
perhaps with the same error code repeated each time?

I imagine it could be problematic here if such hosts really exist and
if there are enough TRBs to execute this line twice. A check for the
error_mid_td bit previously set could help, if this is a real risk.


Thanks,
Michal

