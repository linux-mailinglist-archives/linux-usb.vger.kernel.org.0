Return-Path: <linux-usb+bounces-25459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05247AF82A1
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 23:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1C4E7B60C8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jul 2025 21:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC0B2BE7D9;
	Thu,  3 Jul 2025 21:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Zv9tRpGk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917F29B21C
	for <linux-usb@vger.kernel.org>; Thu,  3 Jul 2025 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751578066; cv=none; b=h/HexfK5riW0H+a2UKtO5pu+qWfVrvIxkDkgCSKX8shUBOZjkGQ4m22hfOgEHS80LXaWm9UUCxlXlAUvc8p80XAsGy0ezpw/J3QbzAmXtVkkY6e2gsnrk/1cqCiYAF+6BRmQyDNbmJxF5DLWw4ad5Ci+85lW+P0u7A2S6ju4P34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751578066; c=relaxed/simple;
	bh=pR1IIRHr8ArJ0Y+JNiMFcAvCzTUuROwWD3R7Ya4SR3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gnVEh2r2clHsNPvlMQirtcOjUPYoOwBrP2JIQFQB5dyO48tFrY9z2HCqy1ZrI2MEpC9NXUmEYYmSE1pt99xutiEKV1SyGiPH9PEiS3psXiEo0Oevo4c+HZUxQxXam26KZVaDEJ6uRZNzUorql+O+q0qFXQMd9bv3mgJlDUdZSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Zv9tRpGk; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d20f79a00dso40999985a.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Jul 2025 14:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751578063; x=1752182863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uU8YCv9CcoLMUipTRqeJpo55S+l6K/zToV39VgctkOo=;
        b=Zv9tRpGkLIyynsSvDOZxT7vBTsqaNcVLmHPXaT9PLaOp7626SQUDxZsxrindIEeUBQ
         i/GQhAiyJ7DpTuYEjBgFZC3aKwjT1fL2oxAHUdU/QJ3OEo+muWQISq36mv3f8ozQaEsR
         VjOoNJzzLigwgVI00ry4ZBQ2ieAqt02BAQ7JKVDMM8XCDnGT/dJlOtTQjMcbN1mO/nrV
         2Mhf06OaNv7xyq615uimzzJOdlBDU/EOdpB5IEvdSYBGR56yM5rOFqa0r3H9aJNcUTfB
         dFUM6+FDn3ZG/xtjEJ0NeA3fOGWKCgP3gMf4wZZtblhMaEFevPcYIP6iYkmGtKiIRnLH
         siFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751578063; x=1752182863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uU8YCv9CcoLMUipTRqeJpo55S+l6K/zToV39VgctkOo=;
        b=O/ZsQTayZZEwRBEPFpBc9Q0VwhwAxD6mrZGJVySkbbNIWaugybY7xkzSXH79XMWxQv
         /iu2GgTb5aWjSlBMECjH9y0Lw609zb7SFZsBoHYxCXbYM3oeRi/QOO+FF993IA4ek53z
         yuN+h3KLb45GQ/RHwA+rJEeptBV8pcTxjJrx9y5niVr3qh+j9UEQ49/nLxtJl3xelpeY
         tINkWp9OT2zoNzcY68Z1DU4Xa888P55u+HXXpEjY+YMaP+OwM78eB2DhKWQpf3VZ02O0
         rWfc9U43RmU8BmnT1yuYVPRgma7yBGuQvVBbbpOyHbpYgkoOVtw03tNGIt99lR6urQ8s
         T9fg==
X-Forwarded-Encrypted: i=1; AJvYcCVd2RkKyC9PzBVWMNKyyZH4lY6hRZihN2s26oxu4b3j739/MJnEOJFtRg3rEQ2nml91iNT9TC5S9fg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzVAU4qjC11g/P0AmTEb+qztpsH4B9RgjpzfbdREU2zFQ0V89Q
	DQpvSCrueNZvD4KRTNdm6gQWfDLTyM0FEpMM6ZTczlf0Le6GwOR6svXE7LrZ97Wmwg==
X-Gm-Gg: ASbGnctsfPgqqkeOdRJ2GaH41pCXs79gidQFa2lnEmxPapppansGoV0m/xjnidOHrvo
	RSoUKm5+D21Hlxkhv35Rt6UfTseZWlwRgetk6gqP8kBxGsoCasFVV3YflrR/z+CYsV39aGHAMYk
	4a10mnAvNEQSMHnse8vrcvjeHMHXaEjqdAyWln7dcRwak3qDHPXBUa6WXkbzWLcFaqV/dMsfnxO
	nsolYKz83K+X0VeS8y7FTQQgUuP2tfQAHvKAggk84WmCCFzehZBMG9G8BlLcYvvj1hVAWSHC28W
	0cQsToiVuAmwosPqp+eGZRmGNKwLH5aCkEVDDyYilZ0LYP0P8B4eV8kFGZ/lSGk=
X-Google-Smtp-Source: AGHT+IFayeYDIBHtgolb1suqZFOVVasoaMun4Cb8238l1PWvfo39hWVGjmS9btydEA6scnP1+J1ijA==
X-Received: by 2002:a05:620a:2495:b0:7d5:d49d:3e29 with SMTP id af79cd13be357-7d5dcd0a63cmr70764785a.45.1751578063435;
        Thu, 03 Jul 2025 14:27:43 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::35a6])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbd94242sm54327185a.9.2025.07.03.14.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:27:42 -0700 (PDT)
Date: Thu, 3 Jul 2025 17:27:39 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Hillf Danton <hdanton@sina.com>, Mark Brown <broonie@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
Message-ID: <b1657fab-b34f-4f52-94e7-333577cdb450@rowland.harvard.edu>
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
 <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
 <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de8af03b-4948-47c4-b9f8-68f7e4112264@I-love.SAKURA.ne.jp>

On Thu, Jul 03, 2025 at 10:48:56AM +0900, Tetsuo Handa wrote:
> On 2025/07/03 10:20, Tetsuo Handa wrote:
> > Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
> > used for post resume purposes") with cc: stable.
> > Shouldn't we revert that commit and seek for a different approach
> > than wait for a reproducer?
> > 
> 
> Sorry, wrong commit.
> 
> The line was added by commit a49e1e2e785f ("usb: hub: Fix flushing and
> scheduling of delayed work that tunes runtime pm") with cc: stable.

Mathias has posted a fix for this problem:

https://lore.kernel.org/linux-usb/20250627164348.3982628-2-mathias.nyman@linux.intel.com/

It hasn't gotten into Linus's tree yet.

Alan Stern

