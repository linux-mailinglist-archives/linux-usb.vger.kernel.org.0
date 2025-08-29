Return-Path: <linux-usb+bounces-27371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFD1B3B5D1
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 10:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72B4C565FEA
	for <lists+linux-usb@lfdr.de>; Fri, 29 Aug 2025 08:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFE72C11C6;
	Fri, 29 Aug 2025 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDxvfMn8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1A5298CC4
	for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455300; cv=none; b=bCKbcWWF08n5mxjDAUW7djLMC4imH0g7AT98Isk5c4vGlqVouWpfs9gc+DQ9h4wiZXA4MnrpBSloNleqBxmpGVMDt1c1c0CZPxWQJXqdkthpAWbBncS1bNmajh8VukrncnBxMzwJ17VggUDycC8XuLxxBzc+9gdcmYNLswvjjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455300; c=relaxed/simple;
	bh=C2zKlk/K3DzxTRxqf7JjVDsustBJpstv0Mt8r4ghJBs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdZ0hDbarhBBHcDyuVH9HHJ4elZwNIz3mQIXiJu5v3xPa46yeojtW/KduAoZNaKXblu/X0lpkg+yGEZdqrGLPLGYWo7fXBnkiyCuG+DhixUIQIdmXXHS4gNOBe7qkZuiboeuVVUTGAtRDtJQgPa53PQKgUm43ls71jLe8FvjnIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDxvfMn8; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f92a69d4so14198381fa.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Aug 2025 01:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756455297; x=1757060097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2zKlk/K3DzxTRxqf7JjVDsustBJpstv0Mt8r4ghJBs=;
        b=IDxvfMn8POPe8Uc+8Ks3GWSJ1McKGbIhDNhZDQQzKdGQVTzjHtROwyM2Z1Q+18Vaeb
         0SGmQpTdvtIGtE8oUxAjM9rg52nV+zYuyHwrTmyZO8RkmjXJOsAX9iipftGoGHbSdgAk
         O9UsXAR2cCscnon5b/mtcUf1E2XiaLz66sCIL+/IbugFFj7/rDGqNFPvw4FvGQJfTtFa
         abic/v0TPUA7tWm8JnVDXfXWIe9ueXoGI4KbTYN3NsWboHfsWtRsBki6WI9F8Tx8DUPJ
         Q3uNJQezMoRXwfJIasy5IVBtHsMbBOBlIPMhjTfWPiV26afWCOC8KS4JhutUObWR9yD6
         Ud3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455297; x=1757060097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2zKlk/K3DzxTRxqf7JjVDsustBJpstv0Mt8r4ghJBs=;
        b=mMbfYEL2fU8/2LpJucLv+62gCmUuHRM+y/lh1J2IV6CIGqoT7Uy0MY85SHlC/Foluu
         9ioNVRcxiU0T6zes7cntHx32XwkLszMLHpSTrttbDHG9pPxCwO5yzt8rIUFrJwA/lD35
         BZQTaaD6ZALCJAJZjWrZ99ps086qBasQMeeZTij4BFxIhRuVYixEl6kKGszIlZVO/2Jh
         Ic2JAwNdws1CTRzaM+Ze+fDxGbbnG3wol7pcwKnozz92NqbyOVha2e16YzG8+ex9Bdyi
         DsvEC67msfORERq+JpW5f0DqKAoaVvKIHoZREvRRSQNAouiqLBJmHkoB8z3vid7L732/
         JClw==
X-Gm-Message-State: AOJu0YxpJHchJU8HrsCVZ236HDRCxUVcu7LMvCR0pYrzFS4ME4HJLgnN
	pkjGu8IzghI3jBmmLoZvVVeX9KtgLbkmWnu2NqR1cd5fs6R+wxT8/A0IZRtOPg==
X-Gm-Gg: ASbGnctCshEsBGAZm1l0d4Tc3OGmODEP5DCf5xE3kUJEzvdGOTg0PRKisb//CmXUYRz
	JAyh30RuhnZmhzTE3CJNPQa2vlsUEG+CScgxGMdESC9riMDBjscnItCmnnaYz1OOwJVppdUr/T0
	UP7y4Ec3SB2OY1T2IUFrWl8S+ObkPcu82C2XmGIxsJBceUGu3twWnemQdcNLQyZs037KDznoq//
	e2QaYIYcZ00MN3uLd/txAVK5+EUDqkVI75tPZeKdMvK0XwyUVdK1mz+zXsuapt+KwJA6g1KYiHo
	elc6hJYBBjrjuozx8acTDPHRJ5I2lomRzOXozj9qES0nZB0VnDlJ1OUrnkbPrPD3twHt2nKRSKR
	JTOMZIWtxuadE5epVPqCGppwCHyhsKeCRAnc=
X-Google-Smtp-Source: AGHT+IErDJmW6JFKphKHhNlXK/fJO1e2Nm8oBTcasDH24dkLJ18NsaFZFrQEAUZ2tUJI1zy774rxzg==
X-Received: by 2002:a2e:a9a3:0:b0:336:7a63:a491 with SMTP id 38308e7fff4ca-3367a63ab2emr47588461fa.40.1756455296621;
        Fri, 29 Aug 2025 01:14:56 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336b468ac23sm3280011fa.23.2025.08.29.01.14.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 Aug 2025 01:14:56 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:14:53 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 4/4] usb: xhci: handle Set TR Deq Context State Error
 due to Endpoint state
Message-ID: <20250829101453.75c38876.michal.pecio@gmail.com>
In-Reply-To: <20250829100649.6eaa94e9.michal.pecio@gmail.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-5-niklas.neronin@linux.intel.com>
	<20250822101514.3a730f4f.michal.pecio@gmail.com>
	<20250825091552.350d027e.michal.pecio@gmail.com>
	<7b70c5d1-b83a-4bce-8d3f-9e181a0329a6@linux.intel.com>
	<20250829100649.6eaa94e9.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Aug 2025 10:06:49 +0200, Micha=C5=82 Pecio wrote:
> We generally try not to queue multiple commands on the same endpoint
> to reduce race condition headache, but Reset Endpoint is an exception.
> I don't remember why, but I thought this exception is necessary evil.

I think it's because handle_tx_event() knows the completion code, so it
can assign accurate urb->status (EPRORO or EPIPE). I guess it would take
a bit of work to separate updating status (immediately) from queuing
Reset Endpoint (later when pending commands complete), though I haven't
really looked into it.

It could possibly increase error recovery latency in some cases.

For now, we live with the headache of Reset Endpoint executing
concurrently with other commands or their completion handlers.

