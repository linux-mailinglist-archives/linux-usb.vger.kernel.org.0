Return-Path: <linux-usb+bounces-38193-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMAdBxHoG2oZHQkAu9opvQ
	(envelope-from <linux-usb+bounces-38193-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:49:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E813614D98
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 133E53024C88
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 07:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F251E379987;
	Sun, 31 May 2026 07:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2AWljf/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273EF25B0B0
	for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 07:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780213771; cv=pass; b=XXDvex9qVwgD5N42gvJfW35dWveJQhylWlgw3u8GO5FGLdjL2nRISmhiSX9BEsT3Ce0Mym/GggLfuwQCtjZKrpObGkAaKdUDz4P+TmM671AnwTPy8YJNAhzo3/tHAXuePC4ABYFuK2oTwa7HBveekIKXqpp0I3BSkumcCk1hhtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780213771; c=relaxed/simple;
	bh=sMS7GYTvIGw9t4knGm0u4IRsVsbC10HLsX+n+My6Jno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KZ75oJ7mtK6ivJUbWSFGjo1CgyjooZxm3kiotfgt/dgiDBw0ZZEcLFg3oOOyuinLzZmOrLjBJLPf1QScOcwDDedQEMsqThoZqJrFxi7tw/J42VgjaTd3+ETzqQ1RMOa/dKBiPZ8w2hQKv5UmBFaP7bmD4yM5U4vCvohIJoGy+jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2AWljf/; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd85ebb368fso2257214466b.1
        for <linux-usb@vger.kernel.org>; Sun, 31 May 2026 00:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780213768; cv=none;
        d=google.com; s=arc-20240605;
        b=CwSfqBfBNSvACo8ttcX+QzpNdd9J7wO12mx8p+j3x/+YnXeCayhFkbvEw5/8fsxTsG
         cQu4j5s96p457v3rNAr2aQJLKWAMQlDurC3TqwXpscV6Q0Hh9WvK0CDHT9YXCHvsyUI7
         En9aJ0cVSn2TvMD44AZzN+BccbS5CIcY3HoYyqxHnwdkf1TMPaWKRl2M89qDvOjMpPRm
         lOYejWttxdy4r1vzXkjDW+WdH1bJOFAfTNQRttynWAgLeEQtrYMd3MP231Z5V+VSqiqR
         09pzbJacgxrwaRyuFxOeE+MNbbCU7f7jPFgNUUF/wJVsOBDNchobgkP3ARb71zbYX2l+
         dbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WzG1ujvTDf8fwF1ohng9opuHiQ6FwqBF/HdsW0QqzuI=;
        fh=ImnvTmhUCDzFDWuafngDjfFHiGXMCZD9NBo4B/fG3f4=;
        b=TZDe2J/IxB7j5IPtxb9ZZStuft0I50gQRCEmC5EXMNw8Dw/uu1+ih43wuKKsClntyj
         emCsAI4kTGnhAIzRZe7vUkHowD/rPSxWhCApmbAotaFbMxh2U6QuvarVTS1rQKPVuH1Q
         dgg3QYQMxZ86k6YKuJQxQPqoV+Zef/ucVQMlYlTeQz3KmgbV0ylqQJgxWTu+pGojxwJ5
         d57L62e5NTb8IS/08fR2nt6ww8+U3Yzpnjj4zLN4+zwimkZM0TrxtMcpSh9WYMQgJ2B0
         rOMWXj3BLUIEDTE9MM8bUxkdhVuxhkUmx8UBR41AsMhyDcBIHfFnW+hwKRTOESQrmPJ/
         RTlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780213768; x=1780818568; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzG1ujvTDf8fwF1ohng9opuHiQ6FwqBF/HdsW0QqzuI=;
        b=e2AWljf/VGjmgST7/TVitsZW7irx/OSqDQQLIPKUWD0iCvtMx5rsYXe3TqhWwOjfAF
         pdV/2+1kQpW8DwHOwKCU3B0FE2QmnQeCTK/7HGHMFaBWkha+pmqqJP+fRrFyYuziPDoP
         MTqEfGChxe2l5kw2Xs4BhfTdtJyOxtixoWDzTIJDZyzrfiRrsdIvW6QBfr4oxoZ/UN1I
         QNFKT13Oyec5S/WM7wQXUaF69/etaSGVz4qqsnNkmJUXVuGAMQdJpLDX23AAKDGUe+jc
         6XkJL7Az727oY1jx4mWBGu+rpy/AaK9NLurTlMc/wgPuWxNYvpkruuLoRM4q9sI+Fo0g
         MZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780213768; x=1780818568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzG1ujvTDf8fwF1ohng9opuHiQ6FwqBF/HdsW0QqzuI=;
        b=BRhyeNGXqLZubm/awWtcN4oRh8BObVImQRgyLD2uRutcT+VKuwP9aW+o1eEVQd7jSl
         SLpccAtaKisuXhRShKdtgJcAhTACF2milpYeMEHB7nGOnFLWTvqVAigkxmfd3/J5CmHz
         g+gr1tB51mYCQIAmUE4VmON/DqEK57QF5BAxWv387YagQGymADdOzL27PpU8Axw2usya
         MVS4sReuWsDRnZnepxgzUbqdJw6SVqstxoDfnIcmA/9nunkVpHBOSYxtZ1GU0+kngODS
         s+pJjq7hKW5xoz41AL+17aGrnNZsxCpG53P/pgdi/Z07Bz3BjUCLqCvCm3aolJj0IZYI
         wN/g==
X-Gm-Message-State: AOJu0YxfKaSa3H4npozsH9r4QCykDrlOmbrxkP7d4GayFvwQaT9XjNpt
	rAP6jok5OHWNtEjo4sok0q1+r5Ivz4FeVGzxW28KIZydTg01+zi48FpCZ5NLYRsLCjB2BfnP7oL
	E9YD3bGTAHguBREBjg/OAZxfihgEu4io=
X-Gm-Gg: Acq92OGepM1YONZhGunNjimIX85zd0xhCtVqegYorJ7eSEUNCCr/y5bbRGXZ7CLKlrp
	imeEQ0pXALooPXXyQ5icDD/MswhxgscDYr9hxgkpVacdyl0qS9OKGmpT+ROFMt77h7+rCfcwF5p
	r/0lFPihU3//tMKIvHW69TJGxS1RoZbiWcEQQdRP/9KKo8oJNCp/rkTxflzeml0h6K8FheEHPrh
	NaEdHEFHPPiYT26+3ptTAzIQwfKbq0od7jHOGfTCxTqS6V09bZH3yzOO4QPqqz3HprEvFoAWdRu
	UeCHPBi8BzEf/W18yA==
X-Received: by 2002:a17:906:9f84:b0:be1:d908:ce23 with SMTP id
 a640c23a62f3a-beab3f3433fmr280087766b.21.1780213768123; Sun, 31 May 2026
 00:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <351656ab-a188-444d-a09b-cf304796043b@rowland.harvard.edu>
 <CAFgddhKPYFKNDDESxvo4jwBCw=mnWWx7Jsmr9_LwawtUpkx8Fw@mail.gmail.com>
 <2a656f5a-bc8f-458a-a1bb-e66cc3a122b8@rowland.harvard.edu>
 <CAFgddh+6O+pnbrw1szM7_Q3Xkx8423qRptW=Yhf3UbBZNu0ZWg@mail.gmail.com>
 <242c4d8d-fec8-4693-9c17-91d763f68985@rowland.harvard.edu>
 <CAFgddh+3Ksi7aj=ZNdn0qum8zQ=d_HM=hVtoH224rEpfhamsXA@mail.gmail.com> <96dc88f0-15b9-44d0-9238-128e80dac02e@rowland.harvard.edu>
In-Reply-To: <96dc88f0-15b9-44d0-9238-128e80dac02e@rowland.harvard.edu>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Sun, 31 May 2026 13:19:16 +0530
X-Gm-Features: AVHnY4IKsTRkHZ1su1SbYg83I6fsp4PZYk0Riydixzv468D2A2KN3iVl7doUpx0
Message-ID: <CAFgddhKrwt7aJSNO0mgtm_wFjnMWp3fXCA=XT+LpKva45+Y3tQ@mail.gmail.com>
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org, 
	mathias.nyman@linux.intel.com, sakari.ailus@linux.intel.com, 
	katieeliu@tencent.com, johannes.bruederl@gmail.com, kees@kernel.org, 
	dengjie03@kylinos.cn, limiao@kylinos.cn, wse@tuxedocomputers.com, 
	dev@a1rm4x.com, vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn, 
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38193-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,gmail.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikhilsolanke5@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8E813614D98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Go ahead and submit your patch.

Thanks.

Before sending the patch, I wanted to clarify a couple of details:
1. The workaround succeeds when the initial configuration descriptor
request length is increased from 9 to 10 bytes. Larger values such as
16 and 48 also work. Would you prefer the patch to use the minimum
known-good value (10), or a larger value such as 16?
2. Since this patch would be submitted as a follow-up to this
discussion, should I submit it as a reply to this thread, preserving
the existing In-Reply-To/References headers?
3. What should be the quirk named? I have currently named it as
"USB_QUIRK_XBOX_CONFIG_DESC_FIX". But looking at the other existing
quirks, that name doesn't seem to fit in. Rather than naming it on
what it fixes, should it be named on what it does in the code base?
Something like "USB_QUIRK_INC_CONFIG_REQ_SIZE"?
4. Should I send the patch inline here or in a fresh email with a
proper subject line?

Also, if there is anything in particular you think I should do (or
avoid doing) when submitting the patch, I would appreciate the advice.
I have read the kernel patch submission guidelines, but any advice
specific to this submission process would be helpful, as this will be
my first submission to the kernel.

Nikhil Solanke

On Sun, 31 May 2026 at 07:14, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sun, May 31, 2026 at 02:17:32AM +0530, Nikhil Solanke wrote:
> > > However, there should have been messages in the log saying
> > > something like "unable to read config index 1 descriptor start: -71" and
> > > "can't read configurations, error -71".
> >
> > yep there is. I did mentioned in one of my replies. It does say:
> > unable to read config index 0 descriptor/start: -71
> >
> > Attaching the packet trace with the USB_QUIRK_DEVICE_QUALIFIER quirk set.
>
> Thanks.  There's no visible difference between the enumeration under
> Linux and under Windows until the disconnection occurs.  Here's the
> relevant part of the Windows trace:
>
> ffffc588ce0c3a20 0.327827 S Ci:2:001:0 s 80 06 0100 0000 0012 18 <
> ffffc588ce0c3a20 0.329841 C Ci:2:001:0 0 18 = 12010002 00000040 5e048e02 36000002 0301
> ffffc588ce0c3a20 0.329887 S Ci:2:001:0 s 80 06 0200 0000 0009 9 <
> ffffc588ce0c3a20 0.332841 C Ci:2:001:0 0 9 = 09023000 01010080 fa
>
> And here's the equivalent portion of the Linux trace:
>
> ffff88e64c1fd440 0.965292 S Ci:3:003:0 s 80 06 0100 0000 0012 18 <
> ffff88e64c1fd440 0.967582 C Ci:3:003:0 0 18 = 12010002 00000040 5e048e02 36000002 0301
> ffff88e64c1fd440 0.967613 S Ci:3:003:0 s 80 06 0200 0000 0009 9 <
> ffff88e605143ec0 0.973464 C Ii:3:001:1 0:2048 1 = 02
> ffff88e605143ec0 0.973467 S Ii:3:001:1 -115:2048 4 <
> ffff88e64c1fd440 0.975670 C Ci:3:003:0 -71 0
>
> As you can see, the first three lines are the same (from the fifth
> column on).  The fourth line under Windows shows a 9-byte response to
> the Get-Configuration-Descriptor request, and the last three lines under
> Linux show a disconnection and consequent error.
>
> Since the traces agree up until the error occurs, I can only conclude
> that the cause of the difference in behavior must be something not
> captured in the traces.  And since there's no way to tell what it is,
> the only alternative is to add the new quirk flag that you proposed.
>
> Go ahead and submit your patch.
>
> Alan Stern

