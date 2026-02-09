Return-Path: <linux-usb+bounces-33188-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCjhM2C8iWmkBQUAu9opvQ
	(envelope-from <linux-usb+bounces-33188-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:52:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B910E616
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 11:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E0BB303A6C2
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 10:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEF636827A;
	Mon,  9 Feb 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kalN0D0P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499D9368283
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634186; cv=pass; b=b0AoAs3zYXswMyJ8K50p9tFbGwXjGc6Dvkiyg3xny/E2EKo1lawHbXev1QdF1/SUKEg4eXCqIEP5rvpB+vwGVrJ+sxAMIHHe8OCwTsYnixRblhX61efqNC3UWv5YrgjJcsVC3w/JCRBrLdeKYqNyMPMR9NRqywH5rXA7XYq2/fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634186; c=relaxed/simple;
	bh=08/7/xGSuxMbBDwIG1erXdK27DO2BwHmY91O7UVKmPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvV2aIBp/6hZmB9X2Mm+/hhko75GTTa8fbXePYpYQ7shxYOd+5yo/rM2vfcuYweWZgPmrgVIy2FnwJ6uTAxG9s5XIa9aaLG5aJ9/SfjhLiMTKP3j3GOJmJ8V5BNns8+mUtIW8jSohTL8oYgowqkQoQYGi0v16Uf3BArQJLVprTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kalN0D0P; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124a95e592fso1905448c88.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 02:49:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770634185; cv=none;
        d=google.com; s=arc-20240605;
        b=atm2JVw3DD5HcgBlhiVMtb/tlvd+e8Q0A57aR7fVODLM3WqvJBoVJuws/3W1eI1FX2
         kFjEv71hjN53F7iSCgYOAuldsphMtRfyFUqJbAlLC+SUMS6iPwwxbhE2hgznrXvVijaB
         w4q8PtrwHkXX7tmKWO7kvCI4XKp4zi1hOJusxOoiaWXeWZjCdVcgzQkrp62iXdUffiZi
         TjlSGU3DQ1hqX9U83eVYQ745FTf76hY6O8wDZn1ZC7Syo1wzMZrGZg3825hTeR8mXbCu
         IGS3idqEzAhEuVuZd3f4YPFcZs13RbFfnpC6QyA1ErlxU2yo450sJfZDJDdtcNMqcGsZ
         VKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=08/7/xGSuxMbBDwIG1erXdK27DO2BwHmY91O7UVKmPA=;
        fh=Vp2aWF9owPQ21RRKkomRmfQp7KE8MFiJkvS3seo3sAs=;
        b=ie+kRL4IAnXCakHwx0b8fvuqs1sKsYXaOyWF0ruYLG2E1v+icDIQGHtiApr8cWDPsj
         h5jGO1mSSXM03X++UvC8KC6e0I8dIfPZ1eAN3F52N635dD9GA/9uuZM7oz/dOV/2HL5R
         EWqk8F5qD2bOeKA3SpCrPjGh3wxsS4RBkdZnLpyk3lAT2LZbenObQKRP9s17iCot6wbc
         zOlMO0ublA2S1MrOdtYGyTXJdwN+zIExMFihjwc+uR1b7piWmntz1n+oPnJorB+hGKQ9
         8Mfd3uoFPevWS2ZO8F9Q+k/VAPR3auLIQCW1PdAKnG8xm0RrejOn9W0/ophulyCECzD2
         FIqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770634185; x=1771238985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=08/7/xGSuxMbBDwIG1erXdK27DO2BwHmY91O7UVKmPA=;
        b=kalN0D0PkHCgsniYYvAl5fjXUT0m9MakKD1WBRMnl8t6rntLM0hDTxypm4bmaOSc/e
         56/g9S89yXUMWRDeZuyGAkJXljTsyjt/+trh0a0BkmEqTG1KPqD3VmyVtQXXTlZlCGyr
         4OLtZNW/YsvHyAZSjF0DWrEEJIdeE/6tcMqGNW7qolpgC646wXBd0CjTvhmxhFf/rhty
         plah9wcSgqiCuRS9mH6rMyntiZrS9msYn99YvjBnEJK5GyT0NSHPRNN4d/dys470fHJC
         dbkgn8TqqzA/Xd2ZMvm/UOVMWhxnPTtgZR6XEVSQDs6IZHf2Cp93giQ0rvDnSSDbO1QA
         42tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770634185; x=1771238985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08/7/xGSuxMbBDwIG1erXdK27DO2BwHmY91O7UVKmPA=;
        b=p0CFeigDvZbgKvrGd1LiGFB5Loq+fTKQlgzDvo+HLCzwmodGNIppPNWGbHiDErppsC
         j6ibymOA8R40LOqKSomXBtBa6c4uc+b8xyKXglfXsvcDDKb/mrV1zg3MhUZDM0M3sG7F
         /mjgajR+mhcOxjjjApl4umQY/YgKu8PkcdPmu5VksmDEXV3iXdFjRicJH5JMme+/wDyY
         hZEL+Bnnp8KKplqw/5LoHT08HjZaXWT69nEyzviUrFkTLbHZR/Wb9G/+TGuGsvG/OCaJ
         qgzpfMrtB7K02R5zLCqFjvX4mUIEKAUMHKjwZHRTbnAQPJIqA2D+6zUGDv4ir0d+HtsU
         Zhzg==
X-Forwarded-Encrypted: i=1; AJvYcCUGjdj4KAijGSFn5ZcD6eylbGo+XwqtUMTZIFOsNYdzbXQkEBoeKwFr3MUWIfv/e6KAjV7n+85x2fM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsCssJlidT2vG8tpenU5SLdKYFwd2zVtZfdltyyDhclkRqNxLi
	CCNRbeWXR8YDRnCEvcvuD3kwI8uxVJL4AaghBOoHS006xprh21ZSmUIFrn0YgYGbgyDLSGOpXdo
	ita7b9nDLRtQPaFOBYtHN5659M3v/xYw=
X-Gm-Gg: AZuq6aKAk2SOcLaTk43SqmqMto7BFqBcUwJVcRW40Rk3D7/BfEUDBs5CmT2oPH+1GGS
	3hMf7fRpkCW5b8h8KQYg6kwm7pt3CWbyTh5+Dea/0R8xyuKobamNDFkBp8vBYBC+cv+SLoqJVu1
	CCT/riiKpxWzmHBXGmgqkHXtXNlF9cNXKkXR4JTE+f9829Ohedaxe53Sco9WqXdnvoHboLh35CD
	mbhDBl9m0Ma15OR/Sxof6vtHBlxwV5efHSSd4E/XlFiFADjjQUUh7x9STNXaqElGknEqMpCnN3p
	gNfTaNw9y/CMvlFv3sHDEZe94TDL
X-Received: by 2002:a05:7022:a9e:b0:119:e569:fbb4 with SMTP id
 a92af1059eb24-12704178c7dmr5839940c88.35.1770634185215; Mon, 09 Feb 2026
 02:49:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-usbhid-eproto-v1-1-5872c10d90bb@gmail.com> <a31763aa-77af-4e13-8708-b007ed53277c@suse.com>
In-Reply-To: <a31763aa-77af-4e13-8708-b007ed53277c@suse.com>
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Mon, 9 Feb 2026 11:49:34 +0100
X-Gm-Features: AZwV_Qg6Rf0O8QeUVCTGL44qcDTkjiWWGRpFRw6zv4HPFAeia2dGGKf9ZacJZKo
Message-ID: <CAOQ1CL5Ea7twCdqLb2YfpOCpwrydakMnhf=K-puc-SBQYOnn5g@mail.gmail.com>
Subject: Re: [PATCH] usbhid: tolerate intermittent errors
To: Oliver Neukum <oneukum@suse.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33188-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email]
X-Rspamd-Queue-Id: 701B910E616
X-Rspamd-Action: no action

On Mon, 9 Feb 2026 at 11:06, Oliver Neukum <oneukum@suse.com> wrote:
> On 08.02.26 18:10, Liam Mitchell wrote:
> > Modifies the usbhid error handling logic to better handle intermittent
> > errors like EPROTO, which should only need resubmission of URBs and not
> > full device reset.
> >
> > Reduces initial retry delay from 13ms to 1ms. The faster the URB is
> > resubmitted, the lower the chance that user events will be missed.
>
> in this case I have to ask the obvious question: Why wait at all?
> It would seem to me that if you have spurious or intermittent errors
> the right time to retry is immediately.

Agreed.

This patch is intentionally small because I wasn't sure if a more
comprehensive fix is wanted.

Regards,
Liam

