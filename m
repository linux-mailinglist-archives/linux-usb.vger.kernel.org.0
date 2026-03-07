Return-Path: <linux-usb+bounces-34173-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OYEFtjZq2lWhQEAu9opvQ
	(envelope-from <linux-usb+bounces-34173-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:55:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB122AA86
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A29F302AE2F
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 07:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2B8385515;
	Sat,  7 Mar 2026 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFq4FHo2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE7936A038
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772870094; cv=pass; b=RddHsxx2DSGsJc5npmTS07q2tXXSyZMm9G4zTwx6uErdMNmmL22X/RcT5euWSe4fzA9pRkfAVdBUAtHxbNvZ7krMpOIBBudZfuH3ru3rWAeH5fja1/9npKkVNXwwJW41J+zlBZL6MOD+dpGUFj7bz+Sm5W13yKpw39mgLTaIExY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772870094; c=relaxed/simple;
	bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxbSZ4bIMwgVFU+XLiSkesO0AL8u9+Mnx/xc3fpp+ASpztq5LU+7zhygOL3Z5vheFYILWlL/Ix/2O9LWSvbcplsXrLL8F5JM4BJRsHcpskyNNSseBAp+SSze6c6JOpSIdsUiZyh8Bdg/SxU4GkNGQsrfmyFP1cxSN2MDEf+xKWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFq4FHo2; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1713223466b.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 23:54:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772870091; cv=none;
        d=google.com; s=arc-20240605;
        b=Kh8pv3LZ2B4oQm42a4lkt1Gv/Uzf8v2nhPDkBzS4v7S3NbcaBJBiYGS9jBd6loMKp3
         dlYVGsftyJ68hnmWxwvSycpAWZkknSoaCjAHEOstwFthI3z48G46zUQc9XEOQtt1XbqW
         U0xAvWoXhhj40D+eulTuILw//qX2lw9FC62qq8fqTjYIMBuUA9Tu9MUQZKrIsPuoJw/B
         vW/GH3kw19m8vAU+utInqIx1Rj4q/LRqEat39goLDKaiAyVrpYjhbd0TSn/PUxzOXoWG
         wlIo/EZw5E8grdQ/JtSgX2XJY7ays4A/nUutVj+zC3OnW8D7/+4gV4MqA//IRnBHy3gu
         2YVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
        fh=a6Xg72lGPrLniNC3He8jOrQnSkqOKhfz+gV6S8KWLFg=;
        b=bepyr2pqoVWPs/QLpYUmeSBoxZd5iOWt7c485hG/jLv7GrdEfbKauGfFFL0QXG5hDn
         EOVde2x7nvl3aHa3b35EOELc8qtuTUikp6QeAXbjq9dJ93KyJkQ0ntcM5f/llfgmB7jO
         oavcUW0s1imris5TmsbG/5iXKAB3n7jIyLfUWOTF9BpwZvryZzIgXoV0MqZRxgs/Y5vk
         jwaL5IP8c3iqMFwAcKtYIT9te2HHIAb8qgQFR/pM/DHb/sktvj3xOONvyMBk37qYpPIY
         qgoXFisB0BRo2eX0KA+GF1skgBKCouGpWdPtuku4g97odXSKn71y5CcJk/PlrEfz9mbX
         mSDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772870091; x=1773474891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
        b=SFq4FHo2ONkjWPOn8LhIuP+UTXfYiCVEAjO6SIiOopsN2+Lvctu+hK+JtKSoGwOlaZ
         AH/Xz9BBf/N6Hs2fIJaqvwAsee8PffhfB6OjKHEd2Sqn8icWc9i1IJcyMPwHkk1yN7EV
         /MdzV/4OE623b8Yr9QT9x1nDt6D4ABFlRRkLc0K+vUqhmziN1flDGVmvHcxq80vaVJT+
         Z4XlnjLDvazLrzSBmTujIodvvCMVVVTymPr2NWq62xgsj5BZ3hMyqdLf8PnNxy8HjvYr
         GJOJ+n/9qTjUt4qiAK+0rYdXZvnr+2ANypNiFBzcAKG7iKOm8KDfKtlPkmOyDDQeIj60
         6FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772870091; x=1773474891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QVnyD7hsnhP8n753bAsP3+qmoUZRR9RXleuCSQsSxKY=;
        b=t9q0l+NJ4E3J961Bj0glp2/hl8oA+tepPnVM0Omcd3jv3vIu45xBtPj6mVq30luuCm
         BbRwskgkbC/lc2DoUQazAf4oQOOrwUvNQQmVTG0oWRkFOGuoo63OjcoynSEKlT/voIpw
         DB+Xvny7HtzDNjULkMU6mmi1wwVgySDfBbsWgYC+kZiZmcjiQ30DEPgrkkFsXGb9EXID
         TQJfmSUPAJ8vKtIO4YAdWxPy69Yj8gsR5/gQKxRLawqe+7GbkUK/S+9tR1NU43UkEyB9
         sJfaMqXQPd+of1G3z2OkxjoqdWl32rPGXkf++TokKQcWW6DW676KY3ASrqFvZ1rikVom
         AhcQ==
X-Gm-Message-State: AOJu0YwT+UVEo1nBIHDRllVcZAmdlIN4DUF7eKHEk0xA9E7zhkcv7t88
	QgTLOyyCmWGtC2aRmSQNrHZotji7aCstDNqkOeLRDbSQk1EnrtUkms6ut5hyiKehWtIDy1m1nW9
	MDl5jCHy4AInXbl200Y5vPc4MaPQYpig=
X-Gm-Gg: ATEYQzyPdTIEoWjHp7NYd0QjavrwTVC3F4e09CBeyBKsRyD0bFmCHNOWiFLOWLdRYMB
	mRjcu0BrpdyppQc556EEYm01h//neuxDmrsf0hFnLyy8J/BTZQh+kC0UsBNWPnjNhdyYB3N0kgv
	kWUm9cI90WB2cMHA/yTgB1NHZXjWFI7uHINJUcta59WRGimbgeM5CsT1vvTwXndfPwePNtvnBZc
	rPC6gSK25gfPCQPke2laetgW5iR76YLdeGdakaGZHpIB1z7QL1Ht7ovGC7rj6IvKxy8RKa7BMVx
	NV90Sr4cdC37LKDKT/I9O7yxzOYC/Nq+CrktOKKjGGYNabI6IIShxYzhVh0nRepnRTWb
X-Received: by 2002:a17:907:3c96:b0:b8f:abff:9cf2 with SMTP id
 a640c23a62f3a-b942dbce946mr291841866b.4.1772870091056; Fri, 06 Mar 2026
 23:54:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306222148.8200-1-rosenp@gmail.com> <2026030739-uninstall-blustery-a91f@gregkh>
In-Reply-To: <2026030739-uninstall-blustery-a91f@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 6 Mar 2026 23:54:40 -0800
X-Gm-Features: AaiRm51Yiq9XvlRO7Dr2WzRwUYi6IebGYs75nvZ3r4roy3Tw5wJoxXYuLTPNolk
Message-ID: <CAKxU2N85iE2_zWS0zLa=UcYBvOorqNRAqiwUvur1Q_qKT390NQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: simplify allocation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"open list:QUALCOMM TYPEC PORT MANAGER DRIVER" <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E3CB122AA86
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
	TAGGED_FROM(0.00)[bounces-34173-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.868];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026 at 11:21=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 06, 2026 at 02:21:48PM -0800, Rosen Penev wrote:
> > Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> >
> > Add __counted_by for extra runtime analysis when requested.
> >
> > Shuffle some code in probe to provide a clearer picture.
>
> That's a lot of different things all at once, please do not do that.
> Remember, kernel changes need to be "one patch per logical thing".
Maybe I overstated it. It's not a huge change. By shuffle I mean move
assignments up, which is partially a requirement of __counted_by
>
> thanks,
>
> greg k-h

