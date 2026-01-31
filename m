Return-Path: <linux-usb+bounces-32946-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E6OH+pKfWlZRQIAu9opvQ
	(envelope-from <linux-usb+bounces-32946-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 01:20:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EC076BF9DD
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 01:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0AFC3015D01
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 00:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8C12F5A3D;
	Sat, 31 Jan 2026 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="A2kNyFng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8DD2F25E0
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769818855; cv=none; b=nN/ajvI54zKY/UVoBXe6i5X9fSl+wMrWiNzrSY8OdI6cRoWIIq/Zm93Sx9MlLqo9Oz5HaPmvWgLEphoVGHCe9iFpnFXWz9riWjBxhoLDaxKYw9MXVYc3wzi+vcxApFQC4V5Gys2wOI2kG8x3DMNUEowddK0tPPWnX18Y1dnkQJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769818855; c=relaxed/simple;
	bh=w7+B8N3XRoFg3Of/Fw9iyPoy/mghU2Qrl0CPBbBgDGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HwJQJP0RCRuXMq4M4WT24BfyBlMmJm2LsnQnsQ2q3JJlBNNFHS9uPurcMLx+PzprANRX5dLaZMwRgK0rcGplw8go1nW+7v71iVVmT8tkM7B58JKkc00H/QIkRPAsUmBXl39f8NzLkHCKvmGePiR2K1CEZAFMqrzH5T30kSidPmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=A2kNyFng; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so417073066b.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 16:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769818852; x=1770423652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qV4mmOV+uOXX/Y9XduJfQAli873FtpKVEKD92eDGYCM=;
        b=A2kNyFngGL1xPQbXopdoYmVdqExJJ5lhS1o11wCWr0KU9mF1s+FOXrOBvC9NrjYATh
         dTsOYa8nfWT8QqcLt78mIdA2cGKnI7o7Mq0d9HcsnyYLcqXeT97uvmqd130FeeEeLEYy
         tGhmQtFc7YWtRMWTSfmKslEGknb7g8XhvTcs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769818852; x=1770423652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV4mmOV+uOXX/Y9XduJfQAli873FtpKVEKD92eDGYCM=;
        b=BsyQdibrJuYT2m0qMm50JtlPgJ29YOC+QMvdkgZ1GIE4FJB9D230sXv7hWpLGBJ12q
         xvw5fnT9u5RAuya1tYc/V19rC9LT1NK6U0ZbH41QGQOtUZ1GfOZaem6/GqMLboRqc98N
         tJcbfVQjJbSxcqqhEgkFjpZn5iehovXbopmO7OrZ/9+aTxXw/ER4mA8lg2bzqDlhHiD8
         0nRysnDutz2fUU+gP9M8CWCIOm6MQeD2CzM1bCiHVtIStVRDu4/5TKPsV9p6o9r6OMkC
         dz11JW54QSwQHxP1k+8i/WqCJQlcnJkYonyR8vUFChXDagwx/RF5ssldco1xEZVqvyUT
         FU0A==
X-Forwarded-Encrypted: i=1; AJvYcCXhiFP5flJI6B7zJwc4DZgGu0/x4txf7eq5J+BKwUP9gxa8blfYhdza2Cbc3byOWAHe26wMLXJrPyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YztkMS2xv4vvMmXT7D1+wmyVYTbeQXQqtEKbF5W3XrZpO9huzZE
	5Bc6Uqqae3Xywrtcjrfu/vK2uXiowBJjS9Z6reYoB+WMHehUD5JF5Xt1RYmCkWbn3+YWgxwaWKA
	0D9Ugabw=
X-Gm-Gg: AZuq6aJU9jBvbecukAVjKNQhcdfq4/wQ2DJ3nAECVbaEhIxmSBeUBcyC5MRYZgb8Egp
	GTmD83FyYr7wsuv0wAX0/iRMVWH41SnU4U/BC9FXYgm/0DWR7r7AE55jdwbJQraubx49VjGeiJI
	+oKpGLKJt7fDFr/0bjl8IT1m0mJ+81EVuWQwHub0kWSGnbxSDstcU8nA4i3muZEDLw/d29DbgTt
	9TYvwY6bZZIZxnzDAQjfEH8duUWyN+QfvzAMigrYvxrSC9YVXQK7mTR6c64aA6lUqAaRX/j2tzp
	GH8gR93mnp/Od2842HGvTTeXCPbkv3yqjGPaqx1MV6wY1aI9HtqkYMBTt17zvvMGCwFnRoo+2r1
	aoq/kAlm9fl0EKLVd6p4cFDvWCGzRm7UPYohowJQ5twhb2T1X6mtrjdKTfcTr9vGAWeGoVQzP1h
	X6JfePfQ8SoKOuJqA/QjgDoTh9jbAe8/F6MqnVANYAjbTdNhi4eLmieeFEeSkC
X-Received: by 2002:a17:906:9fd2:b0:b87:2fc3:3c72 with SMTP id a640c23a62f3a-b8dff6677dbmr288541066b.39.1769818851815;
        Fri, 30 Jan 2026 16:20:51 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b44527f9sm4732400a12.10.2026.01.30.16.20.51
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 16:20:51 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65807298140so4437247a12.2
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 16:20:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR6lHuR//ZMNUYQJWFbwOjDG8tHA7IQ18NR48BbrpkPLeGNr79lNd7XDXHKj3ciXtsX/VkHJyhuN4=@vger.kernel.org
X-Received: by 2002:a05:6402:1d54:b0:64b:4f44:60ef with SMTP id
 4fb4d7f45d1cf-658de593957mr2779765a12.27.1769818504441; Fri, 30 Jan 2026
 16:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh> <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV>
In-Reply-To: <20260130235743.GW3183987@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Jan 2026 16:14:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
X-Gm-Features: AZwV_QjK3epqif7-e_sBGUc-n0f418Z3nV80PkvQC8yX5DIdQ4ynfWKt9EE0KMI
Message-ID: <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Samuel Wu <wusamuel@google.com>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-fsdevel@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32946-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.org.uk:email]
X-Rspamd-Queue-Id: EC076BF9DD
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 15:55, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> So we have something that does O_NDELAY opens of ep0 *and* does not retry on
> EAGAIN?
>
> How lovely...

Actually, I think that is pretty normal behavior.

Generally, O_NDELAY and friends should *NOT* turn locks into trylocks
- because user space has no sane way to deal with kernel lock issues,
and user space simply shouldn't care.

So O_NDELAY should be about avoiding IO, not about avoiding perfectly
normal locks.

Of course, that horrendous driver locking is broken, since it holds
the lock over IO, so that driver basically conflates IO and locking,
and that's arguably the fundamental problem here.

But I suspect that for this case, we should just pass in zero to
ffs_mutex_lock() on open, and say that the O_NONBLOCK flag is purely
about the subsequent IO, not about the open() itself.

That is, after all, how the driver used to work.

                Linus

