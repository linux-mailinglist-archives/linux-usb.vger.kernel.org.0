Return-Path: <linux-usb+bounces-25972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1676DB0B088
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jul 2025 16:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F5981AA65F3
	for <lists+linux-usb@lfdr.de>; Sat, 19 Jul 2025 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BD9146A72;
	Sat, 19 Jul 2025 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Urq9Gdzx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375B21D3DF
	for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752936495; cv=none; b=b9LLy8zBtugKKnzaDGy6NPgB+XxTRfwi7H8ReebaBxyn2pYKYjPN1z11igTErOhz/7v3O+iLgPFrVw3x/OjX18SMEY7lV7wJg5GT+gAtc1W76Gv3fvNAcpeYDzeFi+kATQ1e4z3Egi2X7ShrHk8Oxe51C6lEldkylRjLRPdKIBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752936495; c=relaxed/simple;
	bh=28XnBw7q177szPp/TEn7iGwfbaGLu0lOkwxbxmfTAFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4K6FVYsJ7GOYzNeo4yPOcO6aShcuvGFin9c1UOjxaK9vpPrt1k1iXwH0c2Lk0wEOrQtu1VT7XKQKSt8scThOQ3J6Eyq0/B/kmjDPSnRXlEpUiSVAZ/IMEKM413jFW7++yuQuKpTFBYn0WeZkk3dNoSxol6KP8DVn8RVqLJh8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Urq9Gdzx; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ab8403b6daso31451031cf.2
        for <linux-usb@vger.kernel.org>; Sat, 19 Jul 2025 07:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1752936492; x=1753541292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GktA+Qc4C2gku9tgC+xGfCvYixZIxS7PIy2EBRiNL8Y=;
        b=Urq9GdzxQwqC261OTzPmkAWGPRdP5R9W8inZhU2iuFfINgcuuDjHVckfDrHi+Mkknn
         7RvQj1BEfCw+FyDv3eEsir1KMcyodduzyoH+Sx/+MPIRENILLlrmQFR438o3jEcKu8gm
         /EXF/TVxXLSpAv3u8Blsoeoy+sSgqQgPxTr5IbvQJSc0nxU507DZ/T+naEbAVRRuJWnl
         Vcw8+hELlE17hT+G8zIyJ0qxXorPaRBZDD985mRc4o849Bv+bsiznfAJPA+/aRWKZzQ4
         1pMr4GkIj4CenAj6FvCsc4gIsHiYgAIqh2QbriWFDWyHcu9z02o8CKtgmdV4CWa8Q/9/
         Xesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752936492; x=1753541292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GktA+Qc4C2gku9tgC+xGfCvYixZIxS7PIy2EBRiNL8Y=;
        b=JGCdcevjMwshUbl90ZgPoYGoWuqxDeeMuh9s8uy6wAnbjAHyC0if6WuFwHkCStha3q
         W9FtEK+Tj9SuKAJyqkQ3L9HA9G4QPOlRW+JDGS3+ODTBbIWQyjSLY1i3gExrkg8arhfP
         wadgmjC8FMw963DUFwMTu5WzppsVTY/7JCasriNwno2otv0Yw9sneH+Oq4mc1RLimyL+
         nmyz8TSTgBFCBJOGsBB4NI12PlpZ5hiJE6dwUb/J8jBtUnUaBEfVwb9PzOVVc+ngFJzT
         ukuvuAK6Vpu1daWEeb2cJEud3N5rgJ9ni2Idp8hdViAqzoOapqMqh5Fyd2pBbQS0hEN8
         IAlA==
X-Forwarded-Encrypted: i=1; AJvYcCU3kXWsTqbHmR4rxvGeJ+R0AM5QsMlq5fVmcO1dv+WuexjqDGpWO5Wy/SUe2FCM2TNwW2nGqn6h07g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEI4VVuwq7JuWgh/gtDnmdeWypf0WlkMiTeJFFrj+gqVWELh73
	8nZA4jJ145trP2Ku/VM0Xk1QPEwGzz23lnjVOmXzD8iOEJQQ3/7x/3k4tcM6MoD70w==
X-Gm-Gg: ASbGncsMHgdAJc22uyF71FqR7aXx2UxbiuUaCyPBfYwAqNlGjbMJgw0cMsbFP/suuty
	XGsL8n8ZYcSqBhyqkV5Eo4SWrHd6znXKzjPvnUXzR0UuUXOl+UvExV+PcNBgHhA7CEnKlfP/qjP
	3RLrp3WhEiDxQU3c7246l9yPX6MfsvpSqu6MvbJK0ESqWgnXUTKwboTYs8Y/DIc/0+CeBuWXKqB
	CYPLYRkWFV1PlQenT1m4QKiwPJLPLhIC4v8dOkjl2hiuRQJeL2Ls7sGRw4GhYA/ZGP/Hgm2szYb
	LR77Rrs+4tut+ghKw6B20nNqmfVKf8xyqoIM5SY7xVctiNkMhAHLC+kT09d0UHOpb9nesaRvwyS
	LB/8UnHBwOfCjlGEXD+yxKSo=
X-Google-Smtp-Source: AGHT+IF+rERqamMpsCeMReo4+AhIbc/oNuC0Bp58/dxdqIZvmhBxs9npo13uMROLsAZUUSfk2u6LoA==
X-Received: by 2002:a05:6214:5096:b0:6fa:fddf:734b with SMTP id 6a1803df08f44-704f6ac577dmr182774486d6.24.1752936492301;
        Sat, 19 Jul 2025 07:48:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::317e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c9250esm208771285a.89.2025.07.19.07.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 07:48:11 -0700 (PDT)
Date: Sat, 19 Jul 2025 10:48:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>,
	jikos@kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: core: Reject report fields with a size or count of 0
Message-ID: <a2c3537a-8ddc-467f-a9f4-b4d413914914@rowland.harvard.edu>
References: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
 <8a4eb6b0-f640-4207-9f05-83e06080410b@rowland.harvard.edu>
 <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lrhydvc7huuqck2kvqzobqt7hhwt36zwsa2i3fpegbpykt5q43@2md6gfitjlb3>

On Sat, Jul 19, 2025 at 10:36:01AM +0200, Benjamin Tissoires wrote:
> On Jul 17 2025, Alan Stern wrote:
> > Testing by the syzbot fuzzer showed that the HID core gets a
> > shift-out-of-bounds exception when it tries to convert a 32-bit
> > quantity to a 0-bit quantity.  This is hardly an unexpected result,
> > but it means that we should not accept report fields that have a size
> > of zero bits.  Similarly, there's no reason to accept report fields
> > with a count of zero; either type of item is completely meaningless
> > since no information can be conveyed in zero bits.
> > 
> > Reject fields with a size or count of zero, and reject reports
> > containing such fields.
> > 
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > Closes: https://lore.kernel.org/linux-usb/68753a08.050a0220.33d347.0008.GAE@google.com/
> > Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
> > Fixes: dde5845a529f ("[PATCH] Generic HID layer - code split")
> > Cc: stable@vger.kernel.org

> Sigh... I applied this one too quickly before going on holidays.
> 
> This breaks the hid testsuite:
> https://gitlab.freedesktop.org/bentiss/hid/-/jobs/80805946
> 
> (yes, I should have run it before applying).
> 
> So basically, there are devices out there with a "broken" report size of
> 0, and this patch now entirely disables them.
> 
> That Saitek gamepad has the following (see tools/testing/selftests/hid/tests/test_gamepad.py):
>         0x95, 0x01,                    # ..Report Count (1)                  60
>         0x75, 0x00,                    # ..Report Size (0)                   62
>         0x81, 0x03,                    # ..Input (Cnst,Var,Abs)              64
> 
> So we'd need to disable the field, but not invalidate the entire report.
> 
> I'm glad I scheduled this one for the next cycle.
> 
> I'll try to get something next week.

So then would it be better to accept these report fields (perhaps with a 
warning) and instead, harden the core HID code so that it doesn't choke 
when it runs across one of them?

Alan Stern

