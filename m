Return-Path: <linux-usb+bounces-34630-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOX6GA4FsmnCHwAAu9opvQ
	(envelope-from <linux-usb+bounces-34630-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 01:13:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D641426B8B2
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 01:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DDA7302C314
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD92C282F18;
	Thu, 12 Mar 2026 00:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZ3aR1Nc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3A26C38C
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 00:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274376; cv=pass; b=cXJXvAwskhIRwE25hdHCXrVaR+hYj4EihVuVTqnneMIUa/EnYkMMXjboY1lXfPK/zulUxInLnlCd/S/z/ZdOCh1g4NSRE7LEQyQwOGaW+9z020ZB9VzRxTUotcU+GvCPnnNjdImVTu45LEYyHC9Dr+Z4PRDt89nndaA4niBwruU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274376; c=relaxed/simple;
	bh=Z45OterBDP2JSXE73eWoxcqRXimE3kZG3qq1BZ+cUOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO63wz7QtIyZgMwss9OGhUWDL/dqrT2Eyn2m1XgQOD33evv3oLESMJdYCCwnsFbTouLfipsAXMsj3285Wf2hFGGXlbobVz4u3GMzMnWuiix2AckjAahoBVY7i5HfYni95oR407zc55VrvtfQH/xCuX62WuN8BRjDhg3FnkMHSxo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZ3aR1Nc; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b8f9568e074so56335766b.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 17:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773274373; cv=none;
        d=google.com; s=arc-20240605;
        b=PQaNx+XstV4mBYO5Y9gIFAuRK0NUNaTfT+X7HLu1sLwyrJa95ceCR0P/qzAwQwoiHy
         +Gl3VY6efaxMxggT4xeObcArM+S0ZYTlUQcIz9HOIA9DT8JEaizTXtszLVUoxsvtttW/
         0OF46zFDliuKZkMrp4yLsz5nvU+otz4FzLsdHYWtZIg4PuK7qrung0SS38iTE9pPaxoT
         +JytNaFMf7KuJBCPXkCGqnT6UtiJGkRsAgPAr7Xs1EsNKRSlamu4IzPbFcsc8xO3XbJE
         uQ8MzAQlQnjwjSNqjWgjoJfLFcEdJ/7y3WaKZGY1xfzVZSQZ4wxh/j6v7EWilymxq92p
         jxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niNGb8zSNOiZi33GG/eK88N9FqlVPDb2fO/vkduMi9g=;
        fh=vNWlNtruE1gKM+HFMZAAvdxA5tTkM8pswYGbN4iJ4nw=;
        b=AXLAu7Pv7TF2DKFIeL6rMOFZPmsXHa8R+RYJhIo4muu1azR0OOvgESSlCYM2F6Fe13
         qSsuFdGSO3usqtsdLI0jygkiGFNULWH4fIpJvhzw6ftBC4NfDNIj4Hgoym2fZUsmsufa
         m8DBX1U2brbtnHf5BjtEOoqbH072dtzUNZI1L5IZPGWCDI8B7fwTFN3u/4nkSJXZgadq
         yYPr9uryLCjg365UZVl+ZuvLI+kGH5/+wiM3o+b1U0kjKWz88yVt+xV34qcFYV4JDNQp
         DBFEJzPJOkMmHHVkHqjveN89MpmeVlKzGmdw6QLMvZE+Q9jOtC/E7d/ekxmhlbhveaeG
         f+AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773274373; x=1773879173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niNGb8zSNOiZi33GG/eK88N9FqlVPDb2fO/vkduMi9g=;
        b=AZ3aR1NcSvKowoC7vCMUbwYhYwkOHWk9/JlEANA7iUPNiqriKekHO9Wb2A24QF0isy
         myoWAKNlnbhiWsUQD6+PQkESuKz/hM0rEc8IkaQFoFCA4NeHb5yOJ2OYPmiHAS9foxwe
         rG9kS26g2UgwBw/yn28FDC2Tw61b+OoAB1vzGD/Th5Om/HTdoQvgkcNnaqZQ+wyT0Tr2
         9VWLEks3NlaKuTqXzDo6vll1NB61aMN8bVnFSg6K7kX4xw8ePQdE0I6mQ3DqFNa09EW6
         1vntmo+zyEAE/+dMs3WobCRTOEOjuUjs8glqY4MpsrUBMkgqYU3x7RkXHIAYarBhQ5gP
         hS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274373; x=1773879173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=niNGb8zSNOiZi33GG/eK88N9FqlVPDb2fO/vkduMi9g=;
        b=MpElafO1wYMY9oUR0exwkRMmFhKcSd2ZbEBtoN/Y+lFXbvjkJzXR+T9f1d7mmwO1oH
         rnHs6A0q+ipFG+fFmHgJuJeBeTCH3A1v/UKoGDeGa1ACYfixYerUjFFewFbw/J/2mLjf
         DmazxkWbVUDqOxDKgiGPxMaRZralYKgxuLAf6BG8RIM/mFSoJRqJcaLGPmNNVirBMi3+
         zrYJXu8GYO3zUUHI5sCVWyKLUcQmkqnjvof9SP+yY25YvNWpABW8awDNZbuWFatfl8eQ
         /naRyuHbfi6u3gNadDwIvNdceeWQIZw+1sAEABQRORi1+7smmkaQhWr1ENP6d/fzikxL
         01IQ==
X-Gm-Message-State: AOJu0YwksTG51H9Hh31WbSZpOHyYvwVeSm044N0H+8k9Yaj1JnvlmWEo
	2OeP4WXG+jOZWQAmRUbjs89XtnG4KPh9ijFqwS921DjZGK5MgthOvMsDflp4KHxKGBSqxbYPQoq
	7FTFv/LRPuxQumynmas7sVxpimyIjVLU=
X-Gm-Gg: ATEYQzwNXqoZeddm2vcNA25AsNRqrLVSJ+wl+TWRRpuk6rJOUMiUDB7lCL0PgpuVq1r
	pBPgVZhWmkVX81WgdfZ3rECE0CQcxcsQlrYTBiLboz7t3OSvHswKyodzecUdBnW3McBHraXJiYl
	82uJh5Zl5rI9zRM7Ht7WDey8rjSFSNFn5cyn/WVwyxCcbI8Htp4lMsOE0Av8XRk6CYmgA5dhoQJ
	jKlNZko4x24L8bKCOt7hmpR/u+vdL321n8kDAlYjRm0GWpX7rgT3FxbctQgRyM68bn3EtuKiVKm
	NybP3wa4CpB+y/tnW9NOdsWsp07IR7bMHOWYJ88sNdcVcprDLHwbEekwnrA1AmCWK25asyy3kUP
	Nkdu6b+JriMgLQTXA
X-Received: by 2002:a17:907:9307:b0:b90:e278:a09a with SMTP id
 a640c23a62f3a-b972e58e86bmr270124266b.55.1773274372542; Wed, 11 Mar 2026
 17:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311232347.18257-1-rosenp@gmail.com> <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
In-Reply-To: <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 11 Mar 2026 17:12:41 -0700
X-Gm-Features: AaiRm50BtfKrrZAVcIzzrO96lQ6VMb4xLc1b96uWGTVyrN4JfHuvhY5_y_RqJhY
Message-ID: <CAKxU2N8_ZsHR9Uzpw=XbnsFiBoY=ai7AZ2_LbEw72ouCVwKb7w@mail.gmail.com>
Subject: Re: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: linux-usb@vger.kernel.org, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34630-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D641426B8B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 4:37=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 11/03/2026 23:23, Rosen Penev wrote:
> > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> >
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Move counting assignment immediately after allocation as required by
> > __counted_by.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> Hi Rosen.
>
> Thanks for your patch.
>
> I have the same feedback as Greg gave you previously on this.
>
> Each line-item in your log should really be its own patch i.e. v3 should
> be three patches
>
> [PATCH v3 1/3] Change kzalloc + kcalloc to just kzalloc with a flexible
> array member.
This is probably the only one worth anything. I'm getting requests
elsewhere to add __counted_by though.
>
> [PATCH v3 2/3] Add __counted_by for extra runtime analysis when requested=
.
>
> [PATCH v3 3/3] Move counting assignment immediately after allocation as
> required by __counted_by.
2 and 3 as you laid out should be the same. 2 without 3 breaks runtime anal=
ysis.
>
> Or something pretty close to that.
>
> There are several reasons for that
>
> 1. Bisectability
>     The ability to more easily bisect patches.
>
> 2. Logical separation
>     If a change deserves its own line-item in a patch
>     then that change almost certainly deserves its own patch.
>
> 3. Mixing stuff up in a big patch is confusing
calling

 20 insertions(+), 25 deletions(-)

big is wild.
>     I look at a commit log and see lots of things going on in one go.
>     I as a reviewer or say someone tracking -stable and deciding which
>     patches to pull into my tree can't look at a patch a "just know" what
>     it is doing.
>
> So v3 should please
>
> - Have a cover letter
> - Contain three patches one for each logical change
Maybe some other time.
>
> Oh and reason 4 is the most important !
>
> Patch count bragging rights !
That's just pointless churn.
>
> ---
> bod

