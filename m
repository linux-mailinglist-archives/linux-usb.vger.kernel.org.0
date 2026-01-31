Return-Path: <linux-usb+bounces-32951-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDPwCuxWfWn9RQIAu9opvQ
	(envelope-from <linux-usb+bounces-32951-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 02:12:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62EBFE5D
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 02:12:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4630A301F9C3
	for <lists+linux-usb@lfdr.de>; Sat, 31 Jan 2026 01:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0000831B107;
	Sat, 31 Jan 2026 01:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DbM1u7g6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F28F125A9
	for <linux-usb@vger.kernel.org>; Sat, 31 Jan 2026 01:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769821921; cv=none; b=YEsDq0Bq6kRinIgDAlZynDrqyq0lLomq6oeTp5k1bIVHo4Ake92SzpXdUgpvYve23Dgc3p3O8nQmnvrzCrEzfPrbUyW2h7qoenYBrfYC9rQhPkXoVmrX7zlVSfKcx0GJ52RrHsVt0YTISOCp+/SmktAkDrjeiVQJ1sSnuFJds0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769821921; c=relaxed/simple;
	bh=P/AkJ7VMQl7xg3h+SCs73opP330uFlSO7pps2YFNAtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nvk1bif7kpbRCGsMuG3aPBxMy+nRYci4BXsponrco0n/cKJzYCIk2KfCxfYn+WHFgviyqgbL9eD3Fth4a3Lm+fLJ9D2L2h17L8bKKWDYA/UXa9FJtuW7a8DXaVfdyD9rmcCqE/4CesqCH8c39mUWhE66mVZfGzSfMKluMvS2dE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DbM1u7g6; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-658d4059b79so3757403a12.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 17:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1769821918; x=1770426718; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EPpl6A64UKlYlKR2j1fRkib4LdNnz2WqgktVIjm2uzU=;
        b=DbM1u7g62eaA22G12YDCgw6FfPrC9AGXLGX7iF0rNmBPWfv/u4ap+cNzhL1tarzl2z
         40elyx8w5CpfIYhbj9YfS3kVs9khisjfZ6QFIDLnMrK5rB9ANTysweVCAImtMiQM7iZt
         bNrL/HGnZy8cozCygh8QbZd8D7rEEsdY84Zew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769821918; x=1770426718;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPpl6A64UKlYlKR2j1fRkib4LdNnz2WqgktVIjm2uzU=;
        b=QUW+ha/w4iAZdgoXTLlDSEYymFv0LkYwOoNpLEidt8LNXPBD+LF0ZkBAtEcV6nizPV
         UU5jJGf9eDHQKhyLe1UkDwLj5CKfwNgehX59x2TnkvfVji4l1ldXFKVVrr65s6cwanAX
         UFKLgyd1frH2zhyC2suLLowtKeGgb0/AVCwEDFrdCiSGMRI/Ioj2nKgcxFcR1Z29nRnL
         YnihhlB/Gypf+gYcp1hnol+PizGntII53g5/wm/9ui0ogS5XCZw6yeLPa193SfSVqGlE
         iPlTNqW/1PR5cfmgt/rCTOqiVvYCEmITNGmOwhgJ7WOzbiIKqdIB4askMsj22UMcILlp
         ghlA==
X-Forwarded-Encrypted: i=1; AJvYcCXQFkwXemS+V1ebc55BMnYW7OIm3AO26fakCEu5S8ZljLi1mnkacZeiPHaMxE2BG6E8HSwMRgu5Kcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9F8Bad7eOYKqtlKmnl9f9jBwd3v3ZtmF79M1xwGnq0OqNPUs
	1qH4zkHwKCm5zpWjA8j/Q0CoZcyXCzA2TAyMLjkwSh8+UPE+2tvCnKUevCuUJY6dGepR0xHTywt
	nkFz+kZY=
X-Gm-Gg: AZuq6aKkXL3PJm8eAOX81JOfSu6I7Dse7mf3RDAgMIYAo9jFrJ/miepHNLaHLjsepn3
	MfSa7IsuVHFPzdXQ3EiCfytFCmKfZ+V1SyxI1P6OsXi2lhElQoVHOsZ5FBmgMssgzmuEcuoGqqv
	VF2WvpIaq24ETXzUu4E7XApHffjgmTU2+eva+P2qMGhdZSIH8bMmxmcHcS43i87BPJd6YhfL7p1
	eRqqqPXctqQHQj5w1qmAGv4hK34u/Aa32662Xg0ncoGThbqk3XBQZELEYdiO01i5X11LFApxSU9
	Jwq8VwA88LeTfeWFr4kcQlTqplfl7N9IVOA8grnPcyniqPs4Yq+N+JShR2okV1b2Lnoa1/piGAE
	vT699G/LWV8Szxc1fLtcL+Jx8U0g1XPr/dVeZnMbBPZl+PDgZHFdxOBsAy+QyWa2yLR4Y4rdakE
	mzl70Biw0SssvIaXkFT7LGb9PcVDIjxBwo97//u71xIKnRXp/aCL3mkOml8BgC2vmxy3pTotA=
X-Received: by 2002:a05:6402:430a:b0:658:cc59:161c with SMTP id 4fb4d7f45d1cf-658de563dccmr2795030a12.12.1769821918178;
        Fri, 30 Jan 2026 17:11:58 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46abb3esm4784701a12.32.2026.01.30.17.11.56
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:11:56 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so3390080a12.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 17:11:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSsgL4UE3lvrmTvpA6CHTcFzq5lwmPtV3Qq0+RLU/4I7djd8bs1YEG8DVLXCDTcH4ZB61bze+5kgY=@vger.kernel.org
X-Received: by 2002:a05:6402:35c7:b0:658:ba49:96c2 with SMTP id
 4fb4d7f45d1cf-658de54e61dmr2863591a12.6.1769821915767; Fri, 30 Jan 2026
 17:11:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV> <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV> <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV> <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV> <CAHk-=wgk7MRBj4iwQLHocVCa94Jf0cMEz2HzUAS9+6rGtnp4JA@mail.gmail.com>
 <20260131010821.GY3183987@ZenIV>
In-Reply-To: <20260131010821.GY3183987@ZenIV>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Jan 2026 17:11:39 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiXq-bPyKywNOw7z6ehrVReyS-hSPuQkJvuhJWfXGFm=A@mail.gmail.com>
X-Gm-Features: AZwV_QiG_nByRrd83VYAdhaCU5_carsYUlImGLyJR9w-28CTqo3phlyWLRwFL8I
Message-ID: <CAHk-=wiXq-bPyKywNOw7z6ehrVReyS-hSPuQkJvuhJWfXGFm=A@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32951-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,mail.gmail.com:mid,linux.org.uk:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BA62EBFE5D
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 17:06, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> I'd rather go for a spinlock there, protecting these FFS_DEACTIVATED
> transitions;

Yes, that's the much better solution.  The locking in this thing is horrendous.

But judging by Samuel's recent email, there's something else than the
open locking thing going on.

          Linus

