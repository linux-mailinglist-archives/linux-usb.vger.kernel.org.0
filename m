Return-Path: <linux-usb+bounces-31156-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953ACA2D12
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 09:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8936B3050CD9
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 08:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCF332AAB2;
	Thu,  4 Dec 2025 08:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkPhal9r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C223321B0
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 08:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764836581; cv=none; b=fuyykkhdEcrp6K/oCLNrjiS3k/MlwMGvNFNSeizSoz0iG4gPSYkQGPSQlDiQqyQ+j4IgIocc0KlvxJZ5g9B7AFVwec5sOWGydWBvftj3gkZ8gss2iLY6IBAbq98KL1J7NFsF+hHatQSakE6j3BCo2vX/LD+vy9rYJaHAzfoSIHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764836581; c=relaxed/simple;
	bh=kL3SQEfq6BJxShhFeHrcmbElw0/hAk4/Uf9gpJ3VKW8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fTTRUt0NRepjh7B5lt2wNulTv41v9UF+Y1anVFZLOfFB9cJS+n/5rxULQxNqL3nYQEgx3n/4Wubj0wduMBobTNKVaEmBZykA4RD0SUy2G8AsI/ohQYvDP+WXfBeNxsp9cinJFuYfRqJgagwH9w445IDW1a2BpEqCHd6lOinc/Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkPhal9r; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64162c04f90so1101878a12.0
        for <linux-usb@vger.kernel.org>; Thu, 04 Dec 2025 00:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764836578; x=1765441378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF6zYEayclXc5CmIu5UDVJiU0M1nOODSxzsfbEcpTTk=;
        b=CkPhal9rReVU9/M3cExewprw8sYro98scswT6cQfiirg4Kjg/Y9JMAwWgUhLyQBWCI
         AyGFr87tTuMmso/ZGIvuEnQA/GgySYzcZmsfPeqa5z45B3iWo7dDmw5YkyN3/OLNEtRr
         SqZqtxdcQlxEPsnOAcE27S7K+lmwXMd720IshRmgAcoJaoEbbuL7PjAo5OzGu762wEEA
         Ob5FDYwqCsGogTexwcYz/Ae8IpFkU1tsqg4U0DiFhAaQ8V8VulhEFupyKhn61m/yw3zb
         nbPGGZ9QyImj0J8R1bLnFaA404/JNpqdD6GAgJXGBtiPCZjUbF34aT25qAagIMmqkix2
         XlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836578; x=1765441378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xF6zYEayclXc5CmIu5UDVJiU0M1nOODSxzsfbEcpTTk=;
        b=X6oRbFaoasv4+KVoJ4Ld48hEdaW6h6CJTSG2cjnEwoV+/TVPB0zk8iAML6DUiwZqP3
         jyhj3sh895GQNiUK3XA8SqSBn96NQRa3mo4Y5HnVOhS+opJuNpuZNud/tqk9zX4tKRDR
         vvJfOwr0q1F+BoKmRf4G34MugOqM9IUA3kTrzRWTm2nXl51SJ2xUedQ1YjBmIBZTEUos
         /U0Kcs7/mU9x/Nly4J8NDZt2hk9U5cbcuhZwWAVh2Q/YXEctQTs4W0C8Pz1R3SUaDqLZ
         9gLDKzdQBABWhgoZ3atrozJd1o9KbdsRpJkQyUUEq4nf+2Vj/Bq61tYR1eMFSDhIEOpK
         6xFw==
X-Forwarded-Encrypted: i=1; AJvYcCXwKEMjENPe/81VhVL1CyiSzlZxagrA6agHdbGCPqQWY4p/8E2aGahEZIrMmZTVszxan9KecnYa0jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTUSv9tVt1TrHETVlpMDNuH9Z8QpaeYqOizoBF9T3ztetOYLsR
	h4SLlUF4GwxmYRNk7y80GVwWsh+yL/Pd6ary2vnkb2iGDWXToP/zMDxw
X-Gm-Gg: ASbGncsXi0arD2GwX/8GYOzH5YBRIuiNorNCsT6UFX4USYBQgeRQo7AokTdddtspnlU
	0DNNpXLVc7dlhAZxivMbd/5iED2jsG+4SKnVyiSYyM7CFPdC0Tuu/2rK1g0SFca1NtHKV1LOnYS
	x7gRv5yTdkkZ9Y4qchxVu493QKjaypOy8qm6MHNUzJUH1vNWqExR+YMEUmF22/baHKN3I3ny4g8
	uZZ+svImdgLO2zG+SFC2w/llMoOBNfTZY67cUvXfSk3jmrCOXi354/prHDighX7aOkziHpFa3W5
	MmadXVivLWxodBEscj9tUv1keTmCTFGeSi9NkdMymmNTA07j5sXM7yzBzxAcwXyVhNHUSmO4Xg1
	/Yw5hm4lhFVN6/dGLYmBnmFAKGdYjqcYpFxC3lvS65mxC5WkwUZjScm/o7u2CmOQAONDCRdeAaW
	Z7/o9fHJY29aRDsIZ/y4WzwOY=
X-Google-Smtp-Source: AGHT+IE1o0xamSzizAJQO0MaXvNYOKirCtvorFJ68sjRV1qQI31jkst7apkZlAgVDuUInIgVfGdNSw==
X-Received: by 2002:a17:907:7f92:b0:b71:9c99:7b8a with SMTP id a640c23a62f3a-b79dc77dfcbmr501982666b.49.1764836577695;
        Thu, 04 Dec 2025 00:22:57 -0800 (PST)
Received: from foxbook (bfg212.neoplus.adsl.tpnet.pl. [83.28.44.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975b94sm67464566b.40.2025.12.04.00.22.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 04 Dec 2025 00:22:57 -0800 (PST)
Date: Thu, 4 Dec 2025 09:23:59 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Forest <forestix@gaga.casa>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, Pawel Laszczak <pawell@cadence.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
Message-ID: <20251204092359.134635bd.michal.pecio@gmail.com>
In-Reply-To: <3e4vhklrg4692n7hbh0pnrlhjkva68mk5v@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
	<20251118105929.330f0042.michal.pecio@gmail.com>
	<3e4vhklrg4692n7hbh0pnrlhjkva68mk5v@sonic.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 20 Nov 2025 14:18:00 -0800, Forest wrote:
> On Tue, 18 Nov 2025 10:59:29 +0100, Michal Pecio wrote:
> >How can you know nothing is logged if the machine becomes
> >unresponsive?  
> 
> By watching the output of `stdbuf -o0 dmesg --follow` when it happens.
> 
> Same results in a GUI terminal, a text console, and output redirected
> to a `mount -o sync` non-journaled filesystem. I guess it's possible
> that something *tried* to log a message, but if so, it didn't get
> logged. 

This involves userspace, which stops working in cases like panic or
full lockup of all CPUs. So you may be missing some final messages.

If you have a PS/2 port, connect some keyboard and see if LEDs will
start blinking - this means kernel panic.

More reliable solution for getting logs from a broken system is
serial console. Maybe netconsole would work too, I have never tried.
And it seems it may also be possible to use xHCI debug capability
(but it needs a special cable: A-to-A without Vbus).

You could try CONFIG_DRM_PANIC, but it doesn't work on all GPUs yet
and it will only help if it's a panic.

Regards,
Michal

