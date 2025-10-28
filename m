Return-Path: <linux-usb+bounces-29758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7696BC12FD8
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 06:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 244523520BC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 05:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5792027877D;
	Tue, 28 Oct 2025 05:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fwuZd8ZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4320B212
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761630018; cv=none; b=WPqK2czH2BteBOoTrh26wGG5aOk8KwO7FAuZ8gqBNGG0GnEBUtO+gd3Zjj3S/7ubPTUiqZCIBT+2SSx5Bpf9ESuqHkJL2GGunKnSnvmpcemqMv5G7YM2i6sJWgLykENPED02aucLye6Ey/Gk6YmOcW2bsOESRQAwh5htd9mSWEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761630018; c=relaxed/simple;
	bh=MBBUGXoG1YUz44tfK9dC7obCvP9yR1LjZ/0B16rOeOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DMR1M3pasB2w2TOIbenrkHGM+Bzvy+JH6iOP1bOK9vctnNqpsV5Gof5OCXS2agzoZp9RCK83mTwqHJi04MRRryu59jQ0q1JVb/x5YgKB5wBv0xzrNF676Vm0FpeOErMCZ2c9D92RfgKkhoBTYkF0APx0ceQ1oN/hg5J6mHurT98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fwuZd8ZV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-586883eb9fbso6858623e87.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 22:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1761630015; x=1762234815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Wy1ynDaI6taIoYDlBwI1sYFOXKyWHxR4eO6K9jXR3Y=;
        b=fwuZd8ZVEWP4uMu43LltAFWYVk0A0CIeqBXYz7Oio5sw5aovqMwPoCePQPBZK3/Kxb
         RcBEz8kS5ocqlpv33BCOaIco/SDP0wMXL9476tP/lIJC5QvHanTjSAn/p5Nkcn+SY2pW
         x+joHfELyuIvp76pusuFv03F08RoqNeutrS8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761630015; x=1762234815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Wy1ynDaI6taIoYDlBwI1sYFOXKyWHxR4eO6K9jXR3Y=;
        b=sTeoxOHUaqCiv1qHlQ5g+o3QiCP4jWIflLhL1QitwgrHMGA/a7n4O+XAMZdivM4pN4
         vqqRPF5v1rKfJKZEI70Q7NvUzsMDC/96IETF1cJzagvrFACbuWMhTeTQR35XY08L3vVz
         Rcd+nv5+dTADYS9sovzHeG5uCDqJc/fZ2IgLb3Tdfux5XNMZvk4Bcl2jQg5RazLctVst
         q2J2HV0J+bORZSVvqLCKWjWWibW8g72cVLOQAHHb6A3s/SCQuBPOtfUt+FC98UXNM/fy
         1MDisVba61V0mwlfMRdaBzahcQ9GJO7gZXXIVkzuFnah3KQwMokDMR20I70MgeCIqTi8
         7LDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvwVgywpHAlQhf3uMV3S86gWzFqk8RX1/gCuqxd4F7/bPI5xM7oTeuAiT4hLt7vgYdXfWKVslyAmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqWy2LKUH7ZE/43yplOWLK+bV4kd9EAuYqF6w8ks3uN7COHtdY
	1T1Lf6rabCXp0rCiPYS0HCKtUVSjmbJC8VOud7igz3wShg0fs8PLCj7Heav9tXCtAyLsSGuFTbJ
	dM13SoQieIQ==
X-Gm-Gg: ASbGncve1J8Wi0NwG1uwNk5gz3TV6hJb/Igafb20UzXM8hoyHAkMg3yw6aA7Xrt2sab
	+bjEZvRVcNHynEaIPL6T/jjmM+XceMNFMZ4NKty90f/JTcYlCypVHWjS/m9fwjnX0ZBk6uJBmx4
	RGIUi38KszmU2K3mEKaF/VIjYZa2zgqDHn8OcLXBbrH2ed4Yelc9Cdea2+GprhIBeMwXahSuj9c
	/O8Kh3uEYTDuptS6j14ZK4u+/X0D2vmKSD0V+rYW7tExlWEU4X8gtwdGIJKhpFpxfighOgazpG8
	E51RJ20HVrt9wCF8tM8zDy05fVEZ08Th0R9BbWe0tIc/NfivjjMSdWTBbM7qs9ltDje3aYaGVRS
	OsSUVf84hKKWStKC944t5x/gEqGNb2jbAXIO58XJQOhjGRf6wt8PsF3Blqujop8SS+g0/8CNtxV
	TnsM75of8BWRb7nN5ZS1wQ/oCFH5oRhVA8XEGaIwmjNGItQULcQQ==
X-Google-Smtp-Source: AGHT+IG0OpotYLas3qnC019qgQvSjJYvRVOcQa7DEFcIQpb5UEONWc/QT8KBe+Zg2p+eLfTjBD+aUA==
X-Received: by 2002:a05:6512:2344:b0:58b:15b:21df with SMTP id 2adb3069b0e04-5930e9c5352mr930724e87.32.1761630014746;
        Mon, 27 Oct 2025 22:40:14 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f83c96sm2770754e87.101.2025.10.27.22.40.13
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 22:40:13 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-592f3630b69so6617494e87.2
        for <linux-usb@vger.kernel.org>; Mon, 27 Oct 2025 22:40:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZDyG1BV3M2xMQQlLDM8NLN26R9MLoRuZR1Quihjia16OO+e1CtZdQ+CHko8yB84TgtWWZXQvxJhc=@vger.kernel.org
X-Received: by 2002:a05:6402:5346:20b0:63c:1e15:b9fb with SMTP id
 4fb4d7f45d1cf-63ed84d11b8mr1725392a12.22.1761629565035; Mon, 27 Oct 2025
 22:32:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-32-viro@zeniv.linux.org.uk> <20251028015553.GM2441659@ZenIV>
In-Reply-To: <20251028015553.GM2441659@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Oct 2025 22:32:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCnWNXcmZAgxfV9p8rKJfjxcceNzaxia41f675+yEdfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkREqIMu_f1B9dwguEOjRWmmtrQM-BuU5ACiXPx-fVfEkz6aAECfx6yPOQ
Message-ID: <CAHk-=whCnWNXcmZAgxfV9p8rKJfjxcceNzaxia41f675+yEdfA@mail.gmail.com>
Subject: Re: [PATCH v2 31/50] convert autofs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Oct 2025 at 18:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, is there any reason why autofs_dir_unlink() does not update
> ctime of the parent directory?

An autofs 'rmdir' is really just an expire, isn't it? It doesn't
really change anything in the parent, and a lookup will just reinstate
the directory.

So I'd go the other way, and say that the strange thing is that it
changes mtime...

That said, exactly *because* it changes mtime, I think the real answer
is that none of this matters, and it's probably just an oversight, and
it could easily go either way.

               Linus

