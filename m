Return-Path: <linux-usb+bounces-32949-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INddBXRVfWn9RQIAu9opvQ
	(envelope-from <linux-usb+bounces-32949-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 02:05:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6FBFD82
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 02:05:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B74F3004DF2
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 01:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0526F31D38A;
	Sat, 31 Jan 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HllqAs+/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1671314A79
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 01:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821549; cv=pass; b=qXy0IdF9NU3kXrwBBmIQmC6aKpbf4mW649ZnKLHELhLn546WvWByoKIShyq4hns4sHs6n7VWDDyGkKt9/0fNARL4HmFrflFSXr4GfBVa0Rtp0BjNkz4AbaVirUrPDD8szNARjoPQRHY/HP0MNUoR1/QNVBcjWHLsYWIwK0+Ares=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821549; c=relaxed/simple;
	bh=xauAVDrNEqxXuQQDfkuXjcLzA9iR5d/8KDCLj8SlAUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDltHPvMioGoQDdjwGqQvGWchvZkN/V8ydBjc7aNjWscTi97C5s3IpgsADXDD7Wns9A3KGgsOGGilDyaiDM22JepMNZ7jDkN4QyzjyO2R2qF7cZF8SyP5gvwWE5UfJ6PoxegRDIU6It4DKZ9Ne3Q14bfyRKsz+9tbe2o7I8Vzuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HllqAs+/; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8849dc12f6so402784666b.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 17:05:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769821546; cv=none;
        d=google.com; s=arc-20240605;
        b=HrthXddlkvml5aTJBeWtX0igNPSW1AUVU+oq/lq263pRg7yB12uWbS8zACk0YcQ+lT
         YLGZl070QQsoJqFiGQgrRK5jltETAAAmpsNMCFYU4bjFitE56RyNHrZd2nwa978J7Gak
         +uJcBimXF0FcjWOlaHvu0ehxo6q4kHUxTrp1Ibo+XAL8Fj218RhvlCeiG0eAaZTs857z
         /dkLKIgd3us/Jnck1JQTIosMKOcMGv2U6Mv5UZ+oV/uEetj1rLev/mVnd42kHi5i6U14
         SlNDaeICED0ueL/hhBpM/czGf+fC1ehI61VMe4qTLl0F71ezlagGrKPaCS0tk8jWZIcW
         XhRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
        fh=/M+GmKCiJIYVF5JOgr1BwMzEed7krYK5P/URoZH6Dt8=;
        b=RsFZfq6TjZBU9vtF50crkE6UbhDlbIjcGyojf01Rp8O/tM1XPwiW6W/leGPhcpi0kK
         nC+q6lDXugvkVjCcWzVY+dtSkbaP8gaaTtC94tBidPayZAMGGUysZ4UECi+cUfm2F/n/
         fb4Wt6Yrsnuxm/1TM27Uhu2D4IQsfnrQ8wI4JRfMOEufZtXGqNcO820VVRFRDlDEAFSx
         uBKLVRNwpgh4pT0gus2b4qCUxElTr0yZdLNT+uR7ZpRAmb3j6oUmy+6PuLIOwav+nvtW
         cdtPdGmIBc0bW8UZrH2UqSMu1/SSQ8FTrDZkFghQlPPizZaUy2Atg+3FI6H61UuJz5f/
         IhbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769821546; x=1770426346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
        b=HllqAs+/IWHE2+kQ9ii8b5Gtko1h7Ik70Pwl45FY+prbj2XSVoNyELK+flYSa2NQo8
         EXfzD6mw0oX/ZlcIu3rfD3gSpUvxACQGYIH/Tl36lScTzSqGPf7KX8gtg3w/jdI+zaqh
         b70RFAKtyAAsDtS1eh60MRioJEW4g53yrxfS3kn8JvPA1T8gyDJ3TbalXssoUOVJkQbB
         jvGjJObfMMQbMdMBdGn+zwg4BMNPdymUx9VX9d4oC/MnBUwn5iYrXwM6DX/OcGYm3wZH
         /zCPYr3iPl0vH84xBlQRUFtR3PnsqszdSt7W3HzHNo81Di8s17L3tMFO2MgvOo+9Qs0Y
         at9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769821546; x=1770426346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WR8rpY2KGV4n5Wdzx9LxUGbuZ8iHOgSWcj67TDHRUAg=;
        b=ncCDnRGOgHcBFmp6JUKUmFXp+eL7JeFOPn0s8ww1Wvo8gvYOgKZZ7+qpJQYhp1/NmG
         o66g59AOLPnW+rNHkBMYiLg+keAagaksyDxtR3zwXX/B1sMT/nFkAdW3FwmBI+9SMDoU
         LnwQqFS8Cwp2UdXMBsYRFDubwmfd3gN/+xdkSkGLCuvAUBzJTdrLRzkPzhFqjqKTbqc0
         HGbs57h1RCDYNl6AK3Swjr0GI10/SP2JMQ4TsGd8niNLViCzdQXFnWF2APYee0VEa6kO
         SwIHKTJkVbD4KbrIqkgWWRRS1s3TO+ySlxSVo7raQitNXIX9ElCsbb9cQhwuy5vnrKMR
         YiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn3lYJ7HIbqkw1P45ftd2CKPfFF2uwmASgwwjah9cApQrKY9N41CRvQ+sMZ8Qsq57PgzChjteRSts=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAiPpvEEPaMcd8aZONC6ktNyHLC1Zq+Ebgp7CIlszhrxXy+nfg
	Ud9lUcGrmukLNrZNS4KQU/scTpb/LViZ+w4Fel0zx5ps/ttToZrgjaycQzIRs+tkGqjqL2HYJkk
	lmuJYxIQrMYm7SWU0utd0N13SzS6zwtfpUqzGP4gU
X-Gm-Gg: AZuq6aJjKLdxOUGOeYayXple58GBA7zfXhJstICPDIRgNXUt6ZH0paToHOYKaR8UXRT
	nlatJUrcQTQG8jSOe4P3Se+NiLEhfpMHoZntHUwoouESysyNtZG4PeQBHKxmgaqUySpUjEi9//g
	2g7Jfqrq9tcN/erCccxCn9fZJrONBYBD88tljXltl3KPjNJOLUub3TlshzVUN6tsSikJklcJicn
	/Y5L6+Uke6MzNcuVqet1+tBKKiFxkHr4m/gHOcOCdXlPtgGDnHiPm0mi/WcSSrzrX0rfnf5gcG3
	0aE=
X-Received: by 2002:a17:907:3e0d:b0:b87:322d:a8bc with SMTP id
 a640c23a62f3a-b8dff696c0fmr254282166b.31.1769821545900; Fri, 30 Jan 2026
 17:05:45 -0800 (PST)
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
From: Samuel Wu <wusamuel@google.com>
Date: Fri, 30 Jan 2026 17:05:34 -0800
X-Gm-Features: AZwV_Qi-TVApb-UR_yhUuzDZcqy8acCYfKVdTsorIhJOL99wmGwpM0Som40uK5A
Message-ID: <CAG2KctotL+tpHQMWWAFOQEy=3NX-7fa9YroqsjnxKmTuunJ2AQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com, 
	android-kernel-team <android-kernel-team@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32949-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wusamuel@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.org.uk:email]
X-Rspamd-Queue-Id: DBF6FBFD82
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 3:55=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:

> So we have something that does O_NDELAY opens of ep0 *and* does not retry=
 on
> EAGAIN?
>
> How lovely...  Could you slap
>         WARN_ON(ret =3D=3D -EAGAIN);
> right before that
>         if (ret < 0)
>                 return ret;

Surprisingly ret =3D=3D 0 every time, so no difference in dmesg logs with
this addition.

> in there and see which process is doing that?  Regression is a regression=
,
> odd userland or not, but I would like to see what is that userland actual=
ly
> trying to do there.
>
> *grumble*
>
> IMO at that point we have two problems - one is how to avoid a revert of =
the
> tail of tree-in-dcache series, another is how to deal with quite real
> preexisting bugs in functionfs.
>
> Another thing to try (not as a suggestion of a fix, just an attempt to fi=
gure
> out how badly would the things break): in current mainline replace that
>         ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK)
> in ffs_ep0_open() with
>         ffs_mutex_lock(&ffs->mutex, false)
> and see how badly do the things regress for userland.  Again, I'm not say=
ing
> that this is a fix - just trying to get some sense of what's the userland
> is doing.

Ergo this didn't make a difference either.

