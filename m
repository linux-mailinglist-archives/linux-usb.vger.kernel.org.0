Return-Path: <linux-usb+bounces-28412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E10B8CD59
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 18:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237D5188372E
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 16:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A10223DF1;
	Sat, 20 Sep 2025 16:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RCeFWDfK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F918EFD1
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 16:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758385975; cv=none; b=OWxK9Eo6VTraaGfSKVETM8/xu812SvCH5mXhH5q/hxBRuhGFSZLpBfg/vTTJJ1uGpzwvbIvA5YPjyOJ1gOYtxpXQdhN+Tn+2Hmpsg2wFJvoxsOjSwWADYF0cNTXKvNWaGiVRlPgZxSQW+CskcwmYSwQQ0wu2hSULE4bH8pAayb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758385975; c=relaxed/simple;
	bh=mNO5F5NJlTITJbrMxJ3wyu2jz7VIBwYhTqCKBzbt4xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0ZFC40rXjOCNzD708qQdOPkw8kyocebYtJBZUTxIZtA8lmktH3dOXijqTjswYvppsfIzEj5jfL/PVwo8IcuaP5us0yBJfjqnf1nsq2oa6vQvSQA5m6YLjYSsBDaH3HvmhVWxZGOg5+sZbfeEcHfgqtc7fTb+uowWgOYuCiwoMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RCeFWDfK; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62fd0d29e2bso2183287a12.1
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758385971; x=1758990771; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GvLRCncIiqRrC6qT6Y0+vbtoZaqXeTLbbsZoYra2n2s=;
        b=RCeFWDfKrLBVBygWhWlXYOzNH7ITFKTGugz9GKNVwygMj637ssMopU7XEmyqxW0oj5
         Zsn2XcCMVFD32fOcVcJzZFRPrtpRP0GLcT4TnIt1B5hxTu9+fMRcWh3mRocTi/AN4SJG
         ZJeyLxfX0EX0L3axXfrED8cXrXmDSqqX2dDIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758385971; x=1758990771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvLRCncIiqRrC6qT6Y0+vbtoZaqXeTLbbsZoYra2n2s=;
        b=WVeV+6dvnPFb+QyXxnGR3pULvymXgIqJJZyy1Ql/AQQYigaFFb5djph3nBgiXztHVH
         cJfVQqm0YutaPfmyBhtmEouYctFvGKunStYyk+y3WBjOSvPcHoVxIM7sK4EFNq2CkCL3
         LzkIEyjWms9Eq1T1DvcB4Izy5OqJ1UMipiCBNvVTm+y9WrIQGsHeX8YcFRb6d0jXuPts
         Gqn0b+oJfvrz4mVQSZpLP+2LAMxU6zDvoxeIVssny4E+TCm4qjNNOcJ+9PwHFdZsdFMj
         bD45aGvszXqzbvc81cBqgETwOzGLLwAypGQZT3KdQJo8Xsaguknji2a2Kmhm45AgFLda
         8Yuw==
X-Forwarded-Encrypted: i=1; AJvYcCV/4u2/rrVzF0ybkoXrg1sbrpel6KwapGzKtKSAXszfLznnIcd4MTodFwVKBbS18f6DslPHSAI87zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDrWsaVVM4FixoG87t1TFm1UZZICc6ruwkICNsuD355LSVXoPv
	OmBZAkb9rcc9G+/1HKl45XW4MrJT8vCEoYXqVHLExwDwIa6Qmsw4dTlwa5jgnJobUK6fN+3Q7fi
	v2E+c0eI=
X-Gm-Gg: ASbGncuHTUu18UzuagieRB8DlQauTlw7ITYQmHU1kFbfeAq4hdXl69J90munnIo2tf3
	HuclbZ3YcFBsj2SEhBlUEiM/rVzcn6xKiXfA5rtbVtOIyM2KF9WYBIK1y4j/HXJs7K92d8cx2Ei
	xzIqxfsEUeiCtAVQXSEfHx93J4Roxy3VO93mr1Uo3roCzs91vf7dRraWLFLhvzuoQvzNvEvt7cd
	Ts99s56/4fWXRQAdKUr40b6EKLusHjiMQGlT5VjCjBWBPn+S8hp+Gl+TMldz3iCMe965pxWn17M
	mps78/qmLUunhj0cU4TK8NMv4+Im0l+giVuqXk91zPluLcjDT1rvxnW2jT2CJYL/ZeytbbCMGNP
	d8djPgi5pRm6LetShd1jIq+Fut3zJiPT9I+3nv2nMsI8FdG4G/B4yHmo3MpW7UKx0B3S1/9GE
X-Google-Smtp-Source: AGHT+IGvZrkQH03RlEYYQEakuEhSQbjGYsxKIJFoOxwB1M9/HaAimQOJJVZUYCZwAmNo/rheL3+6gA==
X-Received: by 2002:a17:906:688f:b0:b27:d8f9:3970 with SMTP id a640c23a62f3a-b27d8f939d5mr347272266b.25.1758385971371;
        Sat, 20 Sep 2025 09:32:51 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28a990f6e1sm137512266b.37.2025.09.20.09.32.50
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Sep 2025 09:32:50 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b07883a5feeso600726866b.1
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 09:32:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUv0NWwRIPG2gCpWB7inVO0ekPjCaV4R7t7fYQu3bVaInFmZVPo/XZyp8RtB9q/qBCMSwh/JetNcc=@vger.kernel.org
X-Received: by 2002:a17:907:1c89:b0:b1d:285d:155c with SMTP id
 a640c23a62f3a-b24ed88702cmr706169166b.7.1758385604052; Sat, 20 Sep 2025
 09:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920074156.GK39973@ZenIV>
In-Reply-To: <20250920074156.GK39973@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 20 Sep 2025 09:26:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiXPnY9vWFC87sHudSDYY+wpfTrs-uxd7DBypeE+15Y0g@mail.gmail.com>
X-Gm-Features: AS18NWCBuRxfjxFE7tKBAQqhhkva7pQWM9EJwSLVmis6atYjgiGA5eqHrxKhjLE
Message-ID: <CAHk-=wiXPnY9vWFC87sHudSDYY+wpfTrs-uxd7DBypeE+15Y0g@mail.gmail.com>
Subject: Re: [PATCHES][RFC] the meat of tree-in-dcache series
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Jan Kara <jack@suse.cz>, Ian Kent <raven@themaw.net>, Miklos Szeredi <miklos@szeredi.hu>, 
	Andreas Hindborg <a.hindborg@kernel.org>, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, Kees Cook <kees@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org, Paul Moore <paul@paul-moore.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, linuxppc-dev@lists.ozlabs.org, 
	Christian Borntraeger <borntraeger@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Sept 2025 at 00:42, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> The branch is -rc5-based; it lives in
> git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git #work.persistency

I reacted to the "d_make_persistent() + dput()" pattern, and wondered
if it should just use the refcount that the caller has, but it does
look like that alternate approach would just result in a
"d_make_persistent(dget()))" pattern instead.

And I guess you already get the lock for d_make_persistent(), so it's
better to do the dget while having it - but arguably that is also true
for the dput().

I think you did pick the right model, with d_make_persistent() taking
a ref, and d_make_discardable() releasing it, but this series did make
me think that the refcounting on the caller side is a bit odd.

Because some places would clearly want a "d_make_persistent_and_put()"
function. But probably not worth the extra interface.

Anyway, apart from that I only had one reaction: I think
d_make_discardable() should have a

        WARN_ON(!(dentry->d_flags & DCACHE_PERSISTENT))

because without that I think it can mistakenly be used as some kind of
"dput that always takes the dentry lock", which seems bad.

Or was that intentional for some reason?

Talking about WARN_ON() - please don't add new BUG_ON() cases. I
realize that those will never trigger, but *if* they were to trigger,
some of them would do so during early boot and be a pain for people to
ever even report to us.

BUG_ON() really should be shunned. I think it makes sense to you and
for automated testing, but it really is absolutely *horrendously* bad
for the case where the code hits actual users.

                 Linus

