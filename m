Return-Path: <linux-usb+bounces-34092-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKpUNfOEqWkd9gAAu9opvQ
	(envelope-from <linux-usb+bounces-34092-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:28:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F4212968
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 14:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FB933021E47
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 13:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849EF379EC4;
	Thu,  5 Mar 2026 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcEHA+Cm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54FA3346A5
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772717226; cv=pass; b=nG6MmT/ub2BiYZPpBYLDSeRijiQe1AU/lIaNpgsaJ+N7fs5xkr1fyiSTyQbdABxO1C5M8Nj5/9DmPox4Z3no/oY1gmLhmtfVrgL5jzSPo8wrY0mDKsVE6BXoghpham0MIfjm8bHj6Ch9urhfnYni6alOhmCoaa0HEZJaXKeGM9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772717226; c=relaxed/simple;
	bh=xFjuTMci+55P26kE4Dvurtiga89AOfw6x1SicyyIIVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNtQafZj4IRifEnVnswVrPQ93rf1KZVrowtsO6F2+NkQcznohwCkjVB4thP4LbWYkFPD0Xnue05oHUhUd6KLeswa1iGhzqgE/3a29Ys5C3hCo6tfoeQIp82rmHaCPUEvi2eDt7p+e7EyMVFQmk6HEx/GtW33vg/8MAhDJSI60FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcEHA+Cm; arc=pass smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-413c2977db8so2040337fac.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 05:27:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772717223; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMAohRmKfZuN0HXu2RhKZlG4P+zhtdLiGIIsDQ1dAgRqSl7JsllNTnuDgHnRqCgwpK
         ULQ2DfH3Mv+wxHFvJDCOOCQgjqBnQ3u8WyfCYLTfpLkxA3vRAqxUKl75lOmMR97MSsz7
         VAnldrpvVAxupD+3FXLzmWWKghS5JzjCPNfhFpRJs0fRrUhVP3SYYAqw0y4ZoQar7FOF
         3FDQ63fyqQkWQTGh1ueeaV0on32adqmhzj+FbEBsDkUzuDg6pfoXb32DDsiLQ2NyelQt
         fk9spOVWQ+MyLevA8Cd4looBX+36SgH5wwKQEK26ESrMMNTwi1dqfLbGlnsLxqivkmIe
         9Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xFjuTMci+55P26kE4Dvurtiga89AOfw6x1SicyyIIVE=;
        fh=4ARh6XXBDSKs43tdKA83hxvKALfMLelQr96nt641Ih8=;
        b=V8EdGcd533SZw5CPs9zmSIptnps2QRc7dMy+cKFsUFxaNpMAvT9AvpdFoIfoNroNwz
         nphClvWHT12kK8vQycaJOeEin0J5UR7YAV5XaCW/AKUd9ZiVN7lsh/F285arPxPmvuow
         tgb5etdJAfy7zC6A5bCOXDqZLooftT/P1+KfpWUB7uo8CV1VRRX8sgg3FWn/rycofI6L
         sygLSufnRbsQ7AMFZAwxEAwVJmfGQzsoI5mX9VMmm9BX44SQROZhoTfGuFnIdRFDMyrS
         T2u0DGHYTh5yfFgIRToO576m4xVm4DgCbKIGlEFn2VtRQCK+nXVcZBfE/Fs4xYhfq2z/
         6ADQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772717223; x=1773322023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFjuTMci+55P26kE4Dvurtiga89AOfw6x1SicyyIIVE=;
        b=TcEHA+CmtWgsoGak6PnsA1B0X78btx9X5BwVtvvcYkHLpnq3nSsQ+KRTO4OG3grQAP
         yRw6mx1eVaW6I+U2ccuPpCmsC7wx7EjlhGVRtAM970xtVzv0u28mjQH34e+wBaStjWjZ
         3XMH8LicifEzhh9xmgBtiK+vz1+5FMmrrLkTIOw4qImb2ENjCGdnwAyd7OIgNmAPVQAt
         YKu4b89GEhHuMxCYDRuEjAxKlWIRq8eQrFFa1Y7FcUP1WDyHXGspKRHauGitUDW+Z1Gi
         Hdrh8q8T4e8QM+4VPhwWqab9lrFV0nZHKpeECYK5K/4EEDiVW9ey61NnCZ7rqJkK0LCk
         8atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772717223; x=1773322023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xFjuTMci+55P26kE4Dvurtiga89AOfw6x1SicyyIIVE=;
        b=e0pjFbFMt8ulXXV38FgwXfMf4x10mIUcjygPdxwe9zKYEc8vOPRgdxIc+WlAGulC11
         u09kEK9Tdf1+r34lePQHNL/s0avTzmNPfVZfbzsRAGRSsi7f1cxYIJ/+HkoYvrnTg66U
         T8K4sJyPfRV3aqzb6ugeQ9YhlmsSUm6re+445GKsA3hxehKx828neB9TTVqGYgqjADrh
         HCPHQFKGS7HYGOauY5Rd16/EtKHMQPCBOLsH4A2O4zjzrg8REBzunY0MB92Bcbt05VGD
         ZLJCf61iubc6UtE/YeqizIcB4cP67OOOV+kzHS1m996PTVb/1MOaAX37gm02QVqbj9vz
         F9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCVPAUfSF8+TUSTs/rhKjzi6xMIvjuaLJtd58eXopc6b9aDFzDagGs/SoYDi337P2JMIe1oKMwnQNzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIAvISi4w8FO0zDBWztZKixWNi0esJt48+/NI/dSQMwFshNuxR
	Dk+/vZYdx6KAS8PsJfnbHuxRLpA2CueBH00t1CJ3mmtF7jb4izrjI5vfMTP/+laIxN9J6ezrmeh
	QIAUuiSmaZ8f1DiprA/cc6re3+G82O9o=
X-Gm-Gg: ATEYQzydWGgWGf3qXdXB2hbUPgJoVGkZ09USi6BL/r99G1tqWCbzvdr10+nIqYi/28R
	AEoV0ks1zlMSnv1QkzxKTPjdfLwg7DKv+/3kbiqwTPHisFoRpqsz+wNY8eOUu5TASFLltBVu76D
	w+eAfK1OR2bUInO2PdVmdinhV+/GXXiuIernsTnLTyowkpmNkGfdpLbkCyhK8LI7spKO0hAzsE7
	kGFp8JzdIWSa5muhAevOP6iaQxd/RTLWzxUZNutWYvl1ghV9oyAkZ7YwoFlrATUYMfqyIk2+8G2
	t3PzXaFfu0FqEesnbbwFkyx4ZSMHb44TM0T9V1eFQb2gg1QW4XUpkTGtkwHiZo8A1jC7dhIqJyQ
	=
X-Received: by 2002:a05:6870:f295:b0:404:27f6:c993 with SMTP id
 586e51a60fabf-416ab5c0a1bmr3328083fac.21.1772717223530; Thu, 05 Mar 2026
 05:27:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
 <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com> <CALbr=Lb6Vir4+O-=8-iL7M8=Gqgm=VUp6s+XGVC75QixFaSmOA@mail.gmail.com>
 <678e1fc6-356d-426a-aec0-f0bf46c7d3af@suse.com>
In-Reply-To: <678e1fc6-356d-426a-aec0-f0bf46c7d3af@suse.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 5 Mar 2026 21:26:52 +0800
X-Gm-Features: AaiRm53PiiMcdxLTlkbHzzk0LDbe28FsgBHujavBVQxHqf7NkO9MrZLs0N6eX9M
Message-ID: <CALbr=LZVqqYmV_1qZvh2-5pizrkDE=kqUW_Yb6GWPu65gVFnLg@mail.gmail.com>
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, robert.hodaszi@digi.com, kees@kernel.org, 
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jia-Ju Bai <baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 3C5F4212968
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34092-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,digi.com,kernel.org,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hanguidong02@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.com:email]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 8:44=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wro=
te:
>
>
>
> On 05.03.26 13:28, Gui-Dong Han wrote:
>
> > Specifically, wdm_read() accesses ->length and then ->flags, often
> > without holding ->iuspin. Similarly, wdm_in_callback() involves
> > multiple accesses to both.
> >
> > I am indeed nervous about this pattern. Without barriers, changes to
> > these associated fields made on one CPU might be observed in a
> > completely different order on another CPU.
>
> OK, I rechecked. And indeed it seems to me like setting WDM_OVERFLOW
> and WDM_READ could be reordered with respect to each other in
> wdm_in_callback() and that must not happen.
> What do you think?

Hi Oliver,

Based on my shallow understanding, reordering issues typically happen
between different memory addresses, not within the same one.

For a single variable, hardware cache coherence guarantees the
modification order. For example, if a CPU writes 1, 2, and 4 to int a,
other CPUs will definitely observe the changes in that exact 1-2-4
sequence. So set_bit() operations on the same desc->flags should be
safe from being observed out-of-order.

The real danger of weak memory architectures lies in accessing
associated variables. For instance, if we write 1 to int a and then 2
to int b, another CPU might observe b =3D=3D 2 before a =3D=3D 1. This is
exactly the situation I pointed out in my original report regarding
the lack of barriers between desc->ubuf and desc->length.

Honestly, lockless algorithm design is incredibly hard, which is why
drivers should probably just rely on well-tested libraries instead of
rolling their own. I am definitely no expert in this dark art, just
know enough to be dangerous :)

Thanks.

