Return-Path: <linux-usb+bounces-32925-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEZsJdxJfGktLwIAu9opvQ
	(envelope-from <linux-usb+bounces-32925-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 07:04:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C44B78E7
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 07:04:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66A073004D91
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 06:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C398325F99F;
	Fri, 30 Jan 2026 06:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3P40mDF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2AFC8F0
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 06:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769753045; cv=pass; b=XheNQ55O7A5j25/sCLebMt/G0kvUnAGmGQTp6uGzQCH/HYzwU01iQ/8tTtvxco2Mn840tATU+cSsnDxuO6dTEyPSPh/w/gHN3ZLhA8Dn86RGrYKoykQOzvhHTrT8fT5S9TnXD//3AT1Cb+y2JHYeBAmpBZxjKdn38OZQDh0aZTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769753045; c=relaxed/simple;
	bh=TqnPwCACGIUFFWDJHHUK1JGuQRWoKGDyh70bGKwd3ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IzamhsQh//8l/+M0xHFJFW39txgpbHan3hNz3SBHsuRWJauZ8VyuXZf6bmoJkuJC1Wk4VU16vOOjq/kbPg+J7mcQ7Gkp+nq1+nAV5kKQHWL3jWYZ4h497hEXMNGjvsv/woD7YvPD+bralleWE84tszsZXos4P+yLSjbt+SjDMH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3P40mDF; arc=pass smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c59bce68a1so133326385a.0
        for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 22:04:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769753043; cv=none;
        d=google.com; s=arc-20240605;
        b=DxR3awmPQ3AZMNFpQx2eo0kWFNAjHJQbF+jSiN4Di6JJLGUNZducwRTio9D5hg3doL
         6o4BaK0o8vODI96enp5ETmFhouYN+4vj+1CpMgnseMaH7hq/coYgSta+Oe0rn2Dov+7n
         uBFlsUfP9cciPbEGHhTTd6NnbFIEL0QspvEFE1EQbg2xYHxNtLkNUbPd6s7bcImb7u1S
         v1gsabwA35iOYV5X2l4TchknVaFRVedQIE+P8aPdgiZppYMX33s45KATglsvu9k7EnwB
         V39ActjU15tzdvVa8kOzc/WwxRmQIdxvQmI82xc8NYZZOeXeKEZeJeM14BrUevEbSaYS
         bEFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLTlE2K2MR5mDtrdqzU1WmojW3Ny/QsaL78Z8YD9DYk=;
        fh=WIPVVV04You4BmRcpklsLxQMbomsR+/AxaMxxz9spYw=;
        b=kNURCe64Y592xaoQ1XKB0pide+G2/8CfWBsHAXjtIH7LucNB+hRz3gt2AD1Ryz+5LK
         xB5XNQLPPI/Nj82tb3nxa1ZMI4BDqdS+/OWHAL5htHe7IypATpSUgm1UFUFqk/7Z8IwP
         9qu9ER0RrMh9MIoeDoweS4vBItgQcOaj275LV4JJDFqeARamd+iwDQQcPpIU/CpxlBW3
         VqWyATBx8AzXVAeETi6hAfptHMtLFQ+TJ8hZc8+Tw1NR7G/cGFe+IRhR2VuFJ8kWUlfO
         OxH6D5q+jIaJOLjrmD0lanKs+8GrJVpvDEnveWKKycf5BsQOopVfoFhxeDkgcpX+aVTK
         izmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769753043; x=1770357843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLTlE2K2MR5mDtrdqzU1WmojW3Ny/QsaL78Z8YD9DYk=;
        b=U3P40mDFCKjgxSPMqD7QNtHXqihvGI6qXVlKFIFfjAEvZjakflnVe5IpyOf18uM3JE
         suoWlocHBb5CkJeYr0Ua0flUMfieglCN44nssAJvkoTLiKsJ0gQEhOiTXzS8Pp1eDILw
         oXb7Cho+xh3evugxOV42pNTembWJf6gCDNSi2wje/s07SXYjgYLWHJEjOUB3JXtDCXLl
         dNGIQ3ns7gVWer4Fkmi+dQn53CvateVFgOkRKTFJAXzxSXrT+NL6hiqiZyKDnoSe6bNx
         Y+m+3b/N1yGnF2vcM9WuIv15obohfnQIz3J2Jz08U95fnIq4cEMsDTe1oio/S9M+Hkzw
         in/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769753043; x=1770357843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pLTlE2K2MR5mDtrdqzU1WmojW3Ny/QsaL78Z8YD9DYk=;
        b=IvQQ4U/z+NhS1mBPmTI7KYhw54yNVK1Em2MAsD8ArvbpTudWXdfNo2oHOggAbN3xpN
         tV1W2e914N2pr/gHv394saEPg0ifX+Sox2AC2Mvpmqd/aFYvwgmg9g/b5vwjOfCigD5P
         uHQZPgcImoe5b6Nb3Gy5hRANT1n2E+VQN33zAu2KD3nG/sMsBua3OO7b8tiCkzFxDAj/
         PpybWuTJPuDXlBVVeNCx2weVLJIQQhZwTb7jofogCSKtIxrcaet3eBr8AZ1pJniQbPhQ
         vp51ROoSmVjWGvUZx4oqhPCFu4WU91LSzKi8D9I0pXp2LKjHLMFb5yAqNL6yLZZZ044z
         FuTA==
X-Gm-Message-State: AOJu0YzWzpG71fzG8IGI8FT6f3VI+0IY6blGz3FInQmzV2i/o2jBpPs1
	GAZ9G8BAjp03J9hgXACgxGUbqp3k8Q5PLLYdMlg6dQTahDJMAqwjLHyKCuRhBEScpl+Vm8eEf+8
	//7a+dhArIQPVxEZIHre7RdfwEWr5vsI=
X-Gm-Gg: AZuq6aJu/PB0sitnqPll979n9dy64xokVyTgBLARMwIwhimN28Ogotdm6NKhthYtxso
	q+VqJ+67/BmtC4/EtFLqdcpNYaYLtPoR7Eb7bXjWdaI3jXqAgYKZzygzQqR4UY+eAvkdBgBIXkA
	pb/J9Ae21n9m9uX9LZBe5ieMimmsybBNJuBtXxp+enJdIdZovAaBQ8kZnG1MfkFMnLkS5E1is5m
	Ix/+wNUUSAqe/xQoEVARfuiJutBTnk84BVeAJgta/4cwo8FYq6j0mUjkBGUYTbEMtwfqciB0U5g
	jgA5dMp9XFEEGezfho8VE15z5U2y0vaZX6atGlktUTtTHnUjZoJWYK41
X-Received: by 2002:a05:620a:2683:b0:8c6:c08d:275b with SMTP id
 af79cd13be357-8c9eb3017c3mr256150785a.58.1769753043012; Thu, 29 Jan 2026
 22:04:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251211062144.138796-1-enelsonmoore@gmail.com> <576ae551-0ed4-4363-b19a-8c4d1692e1ad@rowland.harvard.edu>
In-Reply-To: <576ae551-0ed4-4363-b19a-8c4d1692e1ad@rowland.harvard.edu>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Thu, 29 Jan 2026 22:03:52 -0800
X-Gm-Features: AZwV_Qg9JqnS0SwY0S9hZobzXj19qH900lWgAAIFgQTxA3LvKrH-RC_aIo17uNc
Message-ID: <CADkSEUiHa=MiG8m9uNx-k2BcQibVep+YGdYsdhABdxo5YvDjNg@mail.gmail.com>
Subject: Re: [PATCH] USB: storage: Ignore driver CD interface of SR9700 USB
 Ethernet adapters
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32925-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C4C44B78E7
X-Rspamd-Action: no action

Hi, Alan,

Thanks for your feedback. Sorry for the extremely delayed response.

On Thu, Dec 11, 2025 at 7:06=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
> This just a statement of fact; it doesn't explain anything.  For
> example, it doesn't explain what the patch does, and most importantly,
> it doesn't explain _why_ the patch does it.
I will fix this in a new version if you think this patch is worth merging.

> In particular, is there any real reason for ignoring the CD interface?
> What's wrong with letting it bind to the usb-storage driver and be
> available to the user as a virtual CD?
The driver works without this patch, but the CD is still visible, and
it does not contain Linux drivers, so it is just an annoyance.
Is that enough justification for blacklisting it?
Is there any way to have the storage device be ignored only when the
sr9700 driver is loaded? Would that be better?

Ethan

