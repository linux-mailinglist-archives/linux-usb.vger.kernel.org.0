Return-Path: <linux-usb+bounces-5188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE0830C3D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 18:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23C32B24590
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 17:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919BC22EE2;
	Wed, 17 Jan 2024 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC5S88Rw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5E522636
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 17:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705513753; cv=none; b=SHJRUpFnZwQ+m5ofEEDcPrjqTS2HrHMmY+LKJISEFFXI+zSJGY73Qd0IZrm6q/7jO25DW59Kp1NYdA4JPoHNTqpDML2IiEOAC+n8TEQYUHgGb0PIvL3p4mXK7UPMyHCq5h187T7/+PrIaeWxfaUQ9TpwAnSLxcggiMtz0U0uD70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705513753; c=relaxed/simple;
	bh=5WQg6RNKYhg9JqOJCq2/HPmprF4g2J9hlbFH7Xx+ppg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding; b=n87YMAInf1R74mZrDFqJ+7CJ09DH4Rj8J1MiOKonR7W4TMz2WWTzqXYij49nfK0aBSoST7NnA0v/+kYsS7DmqOXRLxJyK68ePk4kDgY8MAa7hr/XxYJF3Y48uOOg24l49ZeD8A0+IjiXd7M8eGEXEDj8usW0R/KrluYRapPHDc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC5S88Rw; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cd880ceaf2so75321731fa.2
        for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 09:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705513749; x=1706118549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOGqHRIBlFh4drud5EsSemoQ6W7z6KIUdnnEwNY8PEg=;
        b=mC5S88RwZBYKbwb3MI+h8rAv21H1iVTDvkFZVqyI0+yk26zp1OndyMSttDfjDx5Ffa
         DAPvzH8T/7TDFx70ISVTd4qW2OcxcqVPKmy19PwU7yk9A4O0G8w3w+USpEetmC3CsKKM
         7xKsODe9Zy80IGv/JdK9mUk846GLKrIs+5y9H0G9lMoUDCJhIk2RCKYTJRG836rhnvzQ
         plOadSF7Z2hqssBxgRmvAQcmywzzc/EhEfhKL23wAR47Quot7CcX2qOOlWulCbKpLGi+
         PIdso/DgQq5YOn322twXjWZu9LbXhl6iNRMzQMdE8BjeT1L0ct3e1qidM4EvLWyxLDLs
         X5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705513749; x=1706118549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOGqHRIBlFh4drud5EsSemoQ6W7z6KIUdnnEwNY8PEg=;
        b=M20InODj8A4XFK7i27iZXBfBp9zghmGAWniyfrwGf2mj+baN0nt9MXoqLxBZyhFH2c
         uJiwFGowakIV/Hq1D71Z7YKs2PjXZ73lZEBjPsmCHEKojaA1hDaKCtyZs8fqJMYDM9W4
         MqXYgOxZaC9R7j2+TA2HsUVLz6T8MZd6P/1bTmZ0ArLH7b1e4r4HHjaP6bxHlpeMpdP4
         mVNxl/jhq/qVaeb9ybmNSAy225Oz6/fMhMggjXFy0MU8oU3vDn2TyeZ9ehrzgGXO2Dd2
         woFzVjbamWrjGwvoH6YA2v7tbJaGB3FSbl45Cj5l1QVpXMIZY7Q49cpL5ceYepW8MWkT
         2H8w==
X-Gm-Message-State: AOJu0YyFGcvV0i7rUCDpy4NusMtCgOyzfz5NHAfQkxpVtaqCw7rSZErW
	xRIuHqcEfi6qfQOUN1/gKVN1iulFew8=
X-Google-Smtp-Source: AGHT+IHRSEHPXTvWkhU7TPgS2VZeGm6UEHKyDolzAFWnpQlSwAuZTah3GyWewLrK43sOThHKxb9ksA==
X-Received: by 2002:a2e:b0f0:0:b0:2cc:eefc:20af with SMTP id h16-20020a2eb0f0000000b002cceefc20afmr4529263ljl.52.1705513749378;
        Wed, 17 Jan 2024 09:49:09 -0800 (PST)
Received: from foxbook (acgk57.neoplus.adsl.tpnet.pl. [83.9.238.57])
        by smtp.gmail.com with ESMTPSA id m13-20020a50998d000000b005551387bb85sm8598092edb.94.2024.01.17.09.49.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 17 Jan 2024 09:49:09 -0800 (PST)
Date: Wed, 17 Jan 2024 18:49:05 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [RFT PATCH] xhci: process isoc TD properly when there was an
 error mid TD.
Message-ID: <20240117184905.1800b1cc@foxbook>
In-Reply-To: <f6542354-d6d1-be22-82ed-5dfa57aa8337@linux.intel.com>
References: <20240115172709.0b6f2bba@foxbook>
	<20240116153618.2527463-1-mathias.nyman@linux.intel.com>
	<20240116232045.76da750b@foxbook>
	<f6542354-d6d1-be22-82ed-5dfa57aa8337@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> But yes, if the last TD in a URB is a multi TRB isoc TD, and it has
> an error MID TD then its stuck until timeout.

If there are timeouts to deal with hosts failing to respond then that's
good enough for me. It should be a rare case anyway.

I just don't like when stuff locks up forever and requires reconnection
or reboot to clean up.


> > Would it be possible to retire the TD right after the first failed
> > TRB?
> 
> Probably not as a normal error handling routine.
> We have the same "Transfer event TRB DMA ptr not part of current TD"
> issue for hosts that do issue an event for the last TRB.

Obviously it would require keeping some information about the retired
TD to detect subsequent completions and to prevent freeing of its
remaining TRBs. Probably much more effort than the current approach.
 
> But for that special case where there are no more TDs queued it might
> make sense

Wouldn't it still require remembering not to free the TRBs too fast?
(It seems to have worked in the early days, but feels dodgy).


> +					xhci_dbg(xhci, "Missing completion event after mid TD error\n");
On second thought, this could also print ep_trb_dma to be useful in
debugging "TRB not part of current TD" issues. Although anyone able to
compile the kernel with DYNAMIC_DEBUG could also edit as necessary...

