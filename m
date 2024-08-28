Return-Path: <linux-usb+bounces-14233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CD596288D
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 15:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F70C1F2331C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0BB17BED6;
	Wed, 28 Aug 2024 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLbfBb6X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C819316BE1B
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724851507; cv=none; b=EwWO6y4F03HWvxCdRO9Em2Ww0IU5Ge8LKTGz+ENN6uIFb8aumpV8KY8r6EQv75qwv5OAvmavXgYw3yMTYedImAvckw5qqq2vgqggZrPWOsXRanULQm9MeebgSaKE2XYm72dy+PHpmOgFiRG1dkl3csG767eJce37Qo3szC5pYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724851507; c=relaxed/simple;
	bh=LPcxLvR8eoW3P3pMBuUQSAZQMzI2AW+DLFYBha4bpsc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0AjR5IPDF3NoB/bDjFS+0/tLPPW6jFWOjZyrpjv48a8Ihf1eiUFOp3uGCD/2pwFhLk69Kh3wmTebFvFsp/gJ0qNQK2PeW8SRQbFa9bYN7qJE5XdyGfaUEwI2MsJSTIwWPyR3I8bQ/HMhfxDmmB69VdANF3+xEZYtBEm9CcePjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLbfBb6X; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f401c20b56so5694261fa.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724851504; x=1725456304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqap4Ee1FkAELRBcADX4oNJwSNbzXvAn4Ie6soOaHyQ=;
        b=ZLbfBb6X3WOWqvQ4h/Hd2j8yQewiou+RSBKepFGzBqgS5a+nbm2fI7DszH0JT9HSk5
         Ls7Q843gddk+lETIvnRKWCejKEA8IRdCj0VTIN5k3GzKEvC52QGQSagosJOz2jpAcuF8
         MzaJ68vih0o5z/lXd3HaMZtE0Wbo2HGGdbK+jf+YIY0N+rqqG2L7xkTa/Ur1woitCqVK
         FjRXahtVu/PllniDgLJrGyNsYgS5c2/Lvn+SbOTc+vxO1tP1sCuDq/rAx++jt/ch6EtK
         +u2IWhw1oEzoKegw9lY06yjDHQD9Zng7T74zLNcpxOdLWj1AObP0c2v7kvzARvaDFfOv
         8AnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724851504; x=1725456304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oqap4Ee1FkAELRBcADX4oNJwSNbzXvAn4Ie6soOaHyQ=;
        b=meDFrl+c5n8Hzlxd5098HBGYZcBjBIwGSxMoPiSRjMO5QDInVKeZEZuOLTaqZJat4+
         tS3zXaRGCg9vGeXuzDAQJjuUSpo2K/0e3Jo2U4EffKEo4SEo5c/KrwxsInRLRceZdmPt
         pwSB9V4bv02B8bu1DapNaACij0dfYsNC4pQfSHC4Hoso6dNQjr/Qw7p9HjD4paAL4KMK
         sTzXEcdq/ConnK5xoLUZluoNgpI7QN+j/xjqu8UGV5cYdJa9/2izO8IVPrMCYxIBS4Ia
         77uEJ+49JnEsYxnnCOhf1am7+zmNaSyO3+WRn6++raWzjB0zlYajjZyG2ENfVQHjgDA1
         GBpg==
X-Forwarded-Encrypted: i=1; AJvYcCXtJEV2HywVkA9T2jwb7Vetk8Ec7fDnDebU7IRto4kWqvuafML8HpvLSVATT/1a0ZCZjXOdKk56QPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFluOT4/YmNzDiEpPlaKJuIzSDb90Yey7Ibd2Zd/jPnI56rn6
	JTe5C8KtOv+Dicjb1w5kLGj3TfxBLFST3G4VLJ8EcijhRDXqqXpfnVPJOg==
X-Google-Smtp-Source: AGHT+IF7eiFKu5fIeNSMxLlKZvq0NbIAxRXZcTyynAHSYbfR1AEBmPv820iOIU+cyW+jUP2e76m+NA==
X-Received: by 2002:a2e:9fc2:0:b0:2ef:334e:7c36 with SMTP id 38308e7fff4ca-2f52324a4aamr8232941fa.6.1724851503330;
        Wed, 28 Aug 2024 06:25:03 -0700 (PDT)
Received: from foxbook (bgu114.neoplus.adsl.tpnet.pl. [83.28.84.114])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f4047a695bsm19380451fa.18.2024.08.28.06.25.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Aug 2024 06:25:03 -0700 (PDT)
Date: Wed, 28 Aug 2024 15:24:58 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: FPS <mista.tapas@gmx.net>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/9] Various xhci fixes and improvements
Message-ID: <20240828152458.06188919@foxbook>
In-Reply-To: <60d7c5a2-bbc0-4c08-8973-5b65b9695400@gmx.net>
References: <20240827194625.61be5733@foxbook>
	<60d7c5a2-bbc0-4c08-8973-5b65b9695400@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Are you sure these are against 6.11-rc5? Or did I screw up on my side?
Absolutely for 6.11-rc5 (but -rc4 works too and -rc6 likely will).

Please try again without --dry-run, some of them will only apply on top
of earlier ones because they touch the same lines. If that doesn't work
then I may have screwed up mailing them.

BTW, #3 is logically dependent on #2, but the others could be reordered
at will IIRC.

As for your audio case, #4 is probably the only potentially interesting
one, but it didn't help on my sluggish ASMedia host. It should, however, 
at least eliminate the "WARN Event TRB with no TDs queued" on USB 3.1
and newer hosts.

But the root cause of those audio issues is likely elsewhere.

Regards,
Michal

