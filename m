Return-Path: <linux-usb+bounces-38277-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF8CMSR+HmrnjgkAu9opvQ
	(envelope-from <linux-usb+bounces-38277-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:54:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5686293AF
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B23783028458
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2026 06:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFE173A6EFC;
	Tue,  2 Jun 2026 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWZ6YLfe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E77A3A05C2
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780383162; cv=none; b=Evz/77gR5IKdDMYWfr9fc63dgMaY5DlLLwVAUbyRWCTo5KT+tt5h6H6kTX1irhaxtkzYPE57coSbKy23oclzGF8U+M7L+xBoZwXks+LUUHhCtQI3olbMn3zIpuFA8DScxnC09m37n4o2UG2sqfGt6rgk7Zb/0r0aXiTBfUnLc3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780383162; c=relaxed/simple;
	bh=1SHssq8wUsxsnClMzPJn6dKJ2uWJmS46IDRfw+rknRg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dowbRxFQc8ELU2CFUuHZciO6my+vgwtUo1yspE7aXe9nnAJB7Yl2TMBBtUhemlUKhmIa8ETLSzKPoT2xAj2cVoN/Mg8JiY05nM/hdnW/StrspiYP8Atpj+cQ0ZwLMD5RjlLncVxnBoKJi9kFwDW1AuyGp7NMJ+wRIvSttxvhpLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWZ6YLfe; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-307263ad0cbso1931160eec.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 23:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780383160; x=1780987960; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75+k/sM4WKXlh6DnXfZoqqjR3nPpFTsqEzSHfS8spjc=;
        b=BWZ6YLfeNzzeRIPkuqUtQgpzYDhF2d5o7TQR9XBDdr2RK7W0aigDAVx01en9/hTxWe
         M9J/6TK2q9MJiuURLBPFdCUJYdd3HMORN0HQ6o9Kko7EiPHrk82k8mkAELi1exNiE8WH
         YI4eY5CmAITy6J1lCGXCWxN0JsPLCBjqLaIwpcLrBUyJGuQqIzadisElBDg4rhebFTxa
         8aT8GtZobidh4t3azxnr9rN27+1dSXMXlLGrB4zzgKkQlNqCiqsudh27Kj+lLE8BjLtW
         fOr8roDBrYe2oXSZLbLpodPDiC5SkCPK9S/O8olrack4Y98ysCO03P3+P/4tgW6r2HuD
         To1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780383160; x=1780987960;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75+k/sM4WKXlh6DnXfZoqqjR3nPpFTsqEzSHfS8spjc=;
        b=LWej+RPpXHkUwGDVD3pA1PpGvCOXQ8zI3T/1SPXCzCkCOPAqa2rGG7r3jXXeih2Zpd
         YauisjKTiALSeyRH+b81S1Lq88/j0yUPZIxdIYl7emT9TrZFLKbFR0YPW6/gsskJv0BU
         1QVjNvMnno5cpDP/kpb1bPjAG9iKWYSSQUDJIidzo6Br9AOsjeArKB1TT0WKS/xZhbPf
         1mwXCG20BrpCFmQKXIxTILNYOlprONpF/rQ9ohqz0IUgR7ksPROA+Ta5AYtqHaYk5X97
         QCNKWdyXydHJ7MnnNAz8M0Ygi4p2POGNm7npeMfs5JBFeQdK3vz8xj1mkCXnCFcBlGAj
         SSKA==
X-Gm-Message-State: AOJu0YwLqyl4iojPa6XifpbV4Ca76wcC6wXqOyAYH3jijDdITuBmp4J5
	TXH9RSepbdaZ/vM03c7oDnxaQ8xW7X9hzhNisamm/FxbDPKvjfbyPBpm9tLPSEHVyWE=
X-Gm-Gg: Acq92OF2FUbYvVCgr2CQYzOj9TsAZB3KbC6r/Y05CG76G4JbGgKWFjSi9T40Up3HK0p
	1RrAOhTC4kd1emNfy0RrsP5RBETjau/dM0Mk5D7QcEJnNQAR+SqdFjrmB41TGOld2IAddnBiZlr
	m6azajytCkWjG4xjWRRVfWaMJAabqo2FuLArn+xp24IgZ7wWsSKyDgzH7TP27l67wpZtrmxzFyl
	DcWP/+B5qFbLx/m+2wzAPi5FgAzWIeAqnN8iGthIOR8lIlj+Sqgp+OUhAyXDB8TBsi86NbXefvr
	uZJfR5LcMgmZOhN88LF7Rz4lBKNuUTygVmP5LsVvFvkEmv/gfVuRruVSAXoPBhhV7P3Xmmg57qw
	qvBoisp9rdUqJejlIukDg9xfO5aAX3TVqIsdfTjd1YIeuv7eirOLJwYaJ5Io8vuSLQ0EHbxe6pd
	GO31sspYw0iB0YCuTuMNTMJm++jZqktixe9h4WQpe6splVo5FvGtY56rPd
X-Received: by 2002:a05:7300:6da3:b0:304:cf6c:4cfe with SMTP id 5a478bee46e88-304fa4d506emr6728777eec.9.1780383160380;
        Mon, 01 Jun 2026 23:52:40 -0700 (PDT)
Received: from smtpclient.apple ([2601:644:601:140:869:edd6:7c75:df77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f316sm10441027eec.19.2026.06.01.23.52.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jun 2026 23:52:40 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.4\))
Subject: Re: [PATCH] USB: EHCI: inflate max_tt_usecs and implement sitd
 backpointers
From: Brent Page <brentfpage@gmail.com>
In-Reply-To: <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
Date: Mon, 1 Jun 2026 23:52:29 -0700
Cc: linux-usb@vger.kernel.org,
 Michal Pecio <michal.pecio@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC0D612B-B61B-4652-9CAB-FCED814F46AC@gmail.com>
References: <35666FD0-D108-41FD-8CE4-CD8F0DD87472@gmail.com>
 <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
To: Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3826.700.81.1.4)
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38277-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brentfpage@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4A5686293AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> That loop adds three new "blank" sitds to iso_sched.  At the end of=20
> sitd_urb_transaction(), the picture looks like this:
>=20
> 	+-> iso_sched <--> new2 <--> new1 <--> new0 <-+
> 	|				                              |
> 	+---------------------------------------------+

But for an iso endpoint, the schedule should never be empty (except for
when the very first urb comes in).  So, there are sitds that are already
scheduled before the new sitds come in, and I think in total the picture
will look like, e.g.,
	+-> stream <--> new2  <--> new1  <--> new0  <--
	|		        --> prev2 <--> prev1 <--> prev0 <-+
	|	                        					=
  |
	+-------------------------------------------------+
Then, after

2177  sitd =3D list_entry(iso_sched->td_list.next,
2178    struct ehci_itd, sitd_list);
2179  list_move_tail(&sitd->sitd_list, &stream->td_list);

is executed 3x, the schedule will look like
	+-> stream <--> prev2 <--> prev1 <--> prev0 <--
	|		        -->  new2 <--> new1  <--> new0  <-+
	|	                        					=
  |
	+-------------------------------------------------+

> As far as I can see, there's nothing wrong with=20
> allowing the first uframe to be partially occupied as long as the new=20=

> sitd is added to the end of the uframe's queue, so it doesn't delay =
the=20
> sitd's already there.
Oh yeah, I see that =E2=80=93 because then the large sitd can partially =
occupy
the uframe without needing to be broken up.

> But in general, things will be simpler if each new sitd is always =
added
> to the end of the queue.  The code should be changed to do this.
To be conservative, I didn't change sitd_link() in the patch.  I just
submitted the newest version to this thread.  The whitespace formatting
should be correct now.

From,
Brent Page


