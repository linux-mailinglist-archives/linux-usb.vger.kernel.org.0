Return-Path: <linux-usb+bounces-34137-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH/FEtd1qmnRRwEAu9opvQ
	(envelope-from <linux-usb+bounces-34137-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 07:36:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F3321C1F3
	for <lists+linux-usb@lfdr.de>; Fri, 06 Mar 2026 07:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 978003017319
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2026 06:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E0B37186B;
	Fri,  6 Mar 2026 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N6MFIjBN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A38937187E
	for <linux-usb@vger.kernel.org>; Fri,  6 Mar 2026 06:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772778923; cv=pass; b=b4mjt275yS1yAmirAg0FeVBVwpoeWeGmPsPPw/k5+tZz39BSvNlsyojcn3KK1GV+6kYwqEsWoyqpHG1hjGXpxR0rz3Ym6YLxbPxeRv3W8gozSC0FmytAhApqHpl8Rq1ycZZ1LrLcXDt7ImSkxq4BcqucBWzsGAq/4vTvOBcNhCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772778923; c=relaxed/simple;
	bh=LLL7f8AoH9xuYgZ/2JpqWyPvosYePGD9rCowFPjNoF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coluSXH6B0Gl9zjb+wqDQrFuuIBEStgpvrKVnemHZ8hF0YO2b31NhjGZV+1027mMmj8MlWp59raB78/fumZnMxvRG8JAOR7ll5VsFI1OHfvUoub6/Iiq4bbPizNG8MeKIVMA4n9JH03qTLI/H7MnMEPFXcbrgTq0mwKv94eh/RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N6MFIjBN; arc=pass smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-66151557d0cso2402202a12.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 22:35:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772778921; cv=none;
        d=google.com; s=arc-20240605;
        b=DO/B4I+AOHH9QrlEKQgkx8jMpofWEoiCIei9PBjr9Ja68vYMcqJmhjR7bhi/EhGILl
         6qaJ2vZLNCJFBMLH3U9Bmy1ySpW0GcuFAzYkixUstN8SJ4xRARt6KSTqDlRaczuIi796
         riBSNJFjKE5kHqxO7D/9i60Hn05tFejulOsMNCL588JbkJj3t6PxGXKA+DGZJveKCMjA
         n5vvZ2jX8y9B+F+8qfXlGwBKZ91Skn0FqxsgR8/wND45IKu2Bpuq6ZvU+i1mDAgWdhVm
         vvxumyTU8A4TT5b3t9kZwbo//HPN8PbJXPgvv5Jh67+LMchZOPk7je5KGu8Vk4skpkBB
         B3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xNL4jAlivYRTfLBLAHWr2rZcCkwi45HNIOhMdjJ3bBY=;
        fh=4z2PlWcVfBpwRJ0qt8crGuJQpbdAMXxDVtTtkZHyvtM=;
        b=UaSfx8BVC89PLRa95NTEAvKhTKjUsumNdCwQh0n3IeCOzI1lWHRJ2Z1XU2JspwTIcU
         wokYCAtcC1KE9Pqcv5KYxf7UqoZNjbOuM+7qbqUueDIMrmepMP9O2SWpxCK4L5urVNZF
         2lOCh5qb7yw1/0s3qdqFxtPWiY/8bhnpcYNWpV1p8xEj1hndoh9UOZGFD331kwWUmqgU
         IOoiyMexm4sxy30jwTpLZSvT8MK02ztsp2P7OwZ3AjlwrBWDWNxlksdcdj/rDPgzoQ95
         knbi8PoFLZDI4U/BBeJuVZ5dWn+Qj04GUDvzEUEOnR+LCMbDpDGVP1HB7+FOt1DrZweK
         /cUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772778921; x=1773383721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNL4jAlivYRTfLBLAHWr2rZcCkwi45HNIOhMdjJ3bBY=;
        b=N6MFIjBNR7icMQ4rktVVpSE/Q9xo+uRMjk4T/0NaiWgAQI+lEksNQqI8IBU6a79u57
         0KTwmd59M4O27RtGz8vEX1kSWGujmIHPTdV4FKqYKrz3mzG7mh5Z8+NFtm6cYXWG0EOm
         8KVU+PAoexGRp3R01J8PzWjop4tsjL8yzCN+AJbvskyglTObVJirTlO5KP3C4sH4WL3p
         7MPpa5SuVHMRW3dK7orrYjKiv5hScrjTo3Jr8UrQ8PJhM+e/bRz3YykqWhosdxknMhbx
         I5gKcuzB2myQUKt4PuFwVhWCV2LEqCXf6xiJMOVyMUHPFtDthE2VhmPYW9ORN/WKdmYT
         onjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772778921; x=1773383721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNL4jAlivYRTfLBLAHWr2rZcCkwi45HNIOhMdjJ3bBY=;
        b=YsY6oURZLELeF0Xnp5fmR6t4L/4Nv+tX1SpMJ5yN7sO3EsqwZFUKl8iNLG02yXohJf
         NPV5wWJ9d663O/Gnv3K3gc8WwPqTbqVpjosAmW7WnSXT7jarH7Y+K2LO1xWZx7YooyJw
         pJdxLtk6QkWwbXQee2RtGkBJVszX0kUocW0KeCPX7SAbmEZ4exbiISj92OfE6jq1Chor
         b8KCLb3kXuztodrYauyyRUxiFkHLHG/1nSjFJ81M3Gee8ws7ilIHxQ+SxNUhDJ8lTW7b
         XBlWW8NdTj7N5lQoudejf6oVXcB1SIoEX86tF3/CoP9Zzqb/+Bj70p4zQ0gJANGuSX0m
         I+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQp3rsavxJaaWVbLuVtkMtLd9ZGnLEZ91p7ZpvdzWQjaekRymy2bcu5uHU0vcs9ISgUQm3WOFh/90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRTWcSAexh8aW+HAtxQXd/A0f1FmM1Y59gSpKWvuSMj5SZeikb
	UUpcPr4mqIdqLbKnA13pt5llKO/nb+uRiMZxM2pkcl7GqQqfxwftMVhSLtyQjWsuvjLYX3Sn6ok
	nUf3sP+uCRiAPj0eceWo0uWzr7onkR6+fCRm/A1doJw==
X-Gm-Gg: ATEYQzzAep79JQaBs4q3OhxVg+TDQoRh10MrObLBDIN6NXe6FEVtjmgxqVw1/FopWOO
	1UbavKJPdO/rIlAlsEEJMf+OqgK7vBat1C4CQt/j+yMy9xgvq7AqWBJhtUZiGk3ggvjWXiKYXJa
	Xa5qHF8Wd+1mzgesjGy1/p+I61qI018VcjRV9UKKdP4SZ+M+iUArkOnwkQs54fMITQUaq8uwer5
	tf8wO9paaQZfp1WXn/VdjnwpSSZaFRNtMnaRBwrhj5K0gmUSW4s5+ynlTwWcVegEbUfReYuPT0W
	CWCu93Sp1/FT4DNSFTMwGA==
X-Received: by 2002:a05:6402:430c:b0:65a:2ec5:99c0 with SMTP id
 4fb4d7f45d1cf-6619d4565b4mr515487a12.3.1772778920490; Thu, 05 Mar 2026
 22:35:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304090408.36774-1-zeeshanahmad022019@gmail.com> <aag8-unh5oLLajDh@stanley.mountain>
In-Reply-To: <aag8-unh5oLLajDh@stanley.mountain>
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Date: Fri, 6 Mar 2026 11:35:08 +0500
X-Gm-Features: AaiRm526t-4j_wOAfYCQliw0R7nmZCx5RMU5GQA0Od974ipJqdE4kEYaJurCOA0
Message-ID: <CAPBWGpEi77+sksNLazw=dtyA3d6fBn-r10917k1rEzwzT3M=gA@mail.gmail.com>
Subject: Re: Smatch: False positive in __dwc3_gadget_kick_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: smatch@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 51F3321C1F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34137-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zeeshanahmad022019@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Dan,

Thank you for the explanation and the manager's joke.

On Wed, Mar 4, 2026 at 7:09=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:

> Just do "return 0;"  It's more readable, since it removes a level of
> indirection and we don't have to think about what ret is.

I agree. Since the !ret condition ensures that ret is 0 at that
point, using an explicit return makes the successful "no-op" path
immediately clear to the reader and removes the logical overhead of
tracking the variable.

> I always recall a discuss between my managers:
> Q: But if we do that then how will they know where the zero comes from?
> A: We'll make our zeroes will *extra* round.  :P

I will ensure my zeros are extra round in the patch. I'll prepare a
clean-up patch for the USB tree to implement this and silence the
warning.

Best regards,
Zeeshan

