Return-Path: <linux-usb+bounces-38162-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDLxJXybGWq7xwgAu9opvQ
	(envelope-from <linux-usb+bounces-38162-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 15:58:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E66032B8
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 15:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1895430241AE
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 13:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67FC3DBD44;
	Fri, 29 May 2026 13:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L34BpxqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2C33BBCB
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 13:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780062946; cv=pass; b=TsztIhM94lfZemYQAM74rULqsBiPtZ/tcLP2DBQZT901812iEiAFg4t3uPo/9IEcfXZuhXYHceGhwQl7Sx8XCUBhsqBzyfZ9BPrxEGPW/C9Uur7Fn222ZudSbSZtwHSAjNACNajwIQY/V10gIZw7jVrYrmPs6lNi6e+IiB1fxx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780062946; c=relaxed/simple;
	bh=5PmsSwNmFu5rM5sQIi7uJjLndzgLivt0NR4J02TMjC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdW/+Te5navANDBpAK6HDz+fKB8g0UDSODwWHgtZXFZF8qlVvK93EfSKsMEOETB4liWMMULAF3xnQIborbjv4X/2wk8oEjwqbcgCSfBhwKuto5SoI0yrpuJHmuNvgAl8id42CQJ4cPcnJiy/1sPzU7i9tC5XsjTWA+Yz9W3ulzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L34BpxqF; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6587cee8b57so15371838d50.2
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 06:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780062941; cv=none;
        d=google.com; s=arc-20240605;
        b=ElaHCQuZRUllPXwvwL5nmoY0ZkYWw2d5iE+blNzEwtLqUdQKxqkgSAFX1ogF2umpqQ
         SXkL3GHrhAI34c5IDZOOI0Ir8PxGOXLbE9EgK609XNXnkBkPnRwP3mLmTovuvQ27f+wK
         XXPaZ9y6jZlXxV0tVFUdKNxTbduqAjFbBWJ3Q4//HlAmg+JnfgG4DyLBiN1JWHK+tJ9S
         IqAOTCezksFeMyoZXcachJq9hKK7QzEAQPD72j5ikrmoeILUtE+88ghhp7QMtHXXPTAp
         /z41qn03HpEqM7Nq7NP9TVgjz4oO90D5K7rk+CcJF/XiT/9dH0xgCaYE4a0psT5FvSsM
         vzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yT81wUkrHXZfR96odZooKlpRhvygrL4C0xiPKSli0I0=;
        fh=ETasJDgZ4xrSp3PjRqNrjuDjEa6lhBcmifjH2ABkff8=;
        b=Cxa13CwGICY9c6B+elTZOhVz7nZHf1+WEDNrv71B2CG1OdSJkgoXx2z4G+ks6VbRLm
         XlpPWnyC27ov6gO9wxZIQfpbzYLx0hghXbzeX/uRwyjz12M/3/N+rA4Iag7M0ZD8L6cR
         FKkR1Zu4im425+N+5X9rRCKlYkNWIIJE2/IK5eMS9cixE+EqRXhPfHt/fzsUjX4EO1Rz
         rGEWTxiweM/QSpjYU55dEbny7iSMCwmcbXdrCIyXU13X6VS5kMf6mB8Ttk7oboLOobKG
         rldJShGs2NcPNm33o7lsMe+CccarA54mt97+/Mvs0aRdLL62o+6g6+eLruHWtaaOSMrP
         UuTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780062941; x=1780667741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yT81wUkrHXZfR96odZooKlpRhvygrL4C0xiPKSli0I0=;
        b=L34BpxqFdWeGuHwWbYvta1Bc9tOyFsxHq1H9P5MNe+va3j9IlhfHw8W4Ky+cKs1Zh5
         Nn1FDW3hwTZZL6m1U0GkTFo178Pwt3FAjC2SadB8rDrG92gE8dkFmTnZ6+GtvYIQF+vP
         g5BU0G5GY3kAEbAgmmKKJk4luX+Dj9cxIcjoyz7wW8lJnkORBNX5g9453MxFbHmRqXJO
         arVnzi5VIfzeGkshcdsL1/R6nGee7Wp7y5/pTK9fJbSS/emDqWWQEUSkFiSzXrtlO+si
         A9mPAn4wdgtW7lGFWSHf1zULSEdBeSGTd4s3k/BCtUVWot+6sE+RrabiLW8b2K8oa3IP
         sivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780062941; x=1780667741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yT81wUkrHXZfR96odZooKlpRhvygrL4C0xiPKSli0I0=;
        b=HVQQeLAvEzHHf129ssBq881Ems1hzDCHCUyZrHe4K2ptOSmgvYdj9Prk7boHjDvatw
         BcJf/JkfBPFLjc58xzv3rOgHR0eRYR5EvqUk6e8at8ykVhezeTymSzKvGjrxyzmW1YD2
         2iuybw3TpAN5wmQw5XjwRGQS0/WXnON52LgDQX1RltxDdNlqf377YzIOTg3w7HV6hvKo
         a7SbnKed0J1yD+GPgBsp7+39EePl1qEL1eWV5EjJ7t7gyVWLE8u2ccSXg88QeKQ39DB8
         08eOBz51HNqJ2MnzBzsL7aoI/b/IuYsOFQeTpg5ZTIDPkXSkRfmogz0L4x/EJ3LIx8sp
         B+ew==
X-Forwarded-Encrypted: i=1; AFNElJ/djm3i/g8TMfrGUf2hlzE/7Az7GOE9hNunH97mpfrvMf5dF+SoktbwBayYZFiqpvgLxr+ll09BzxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxukeQwAOYg7EyxRLwscWj1b7rq9xFzcSGLMi2onUM2gAK6If8M
	R128+8651BX20HTJ5k/6P30UG/R2kHx682bS49JBIJnEiKBSD2nxAu1KdiEh/qGqbJDKKfvAT47
	ZyHtaA+dmgFQZHud0rXecxvznbwDevf6axAIj
X-Gm-Gg: Acq92OGW+JRNooMn6duJ7MJEcUNhGtxIo4kNrBHGCODC0828cRc/PrilikAaza/0EId
	eqgNag9685btYVEdPsAdT/iPsB03ns8g8jdCVDy1FsQ+kJjNoq61r5ggYt60JHxouLsRn7gDmsG
	Qhk7BoGYnInfiiNPjyy5Bm4ZE0gzThmCvgVZ9o83DV4IiebbuWnhxsJuruyAWp5LIPI3fBcB1Qe
	KkF8+dmU7k7SuYEZxxdOfjZXWZFM5M1pkI8Jf6tZyplp1lLaMY4SwGRzU1cI6kJte2MnXiXuu8f
	GW2MvhX8PuO9+EDKYB0=
X-Received: by 2002:a05:690e:1444:b0:660:5694:9e58 with SMTP id
 956f58d0204a3-6605694a0ddmr1409061d50.7.1780062941469; Fri, 29 May 2026
 06:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528082751.204898-1-ginger.jzllee@gmail.com>
 <5099d6cc-c8bc-4fdc-97cf-31e96a57e0c1@suse.com> <CAGp+u1ZoHA52vPL5msC29BM5g3xT9c8-A20tAs2LHStnuwMmbQ@mail.gmail.com>
 <7f78b968-3cb3-4194-b709-28e45946697c@suse.com>
In-Reply-To: <7f78b968-3cb3-4194-b709-28e45946697c@suse.com>
From: Ginger <ginger.jzllee@gmail.com>
Date: Fri, 29 May 2026 21:55:29 +0800
X-Gm-Features: AVHnY4KH_r1r6hD0_2Jv0MNnXVWg8FttfnDLqAluXshTkZ-0Snw0Fs8cmUdmnTA
Message-ID: <CAGp+u1YOYe_H8d1NRz7ig-tV+EhQ9djr=f4q1FFtpxc120+NDw@mail.gmail.com>
Subject: Re: [PATCH] usb: misc: yurex: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38162-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gingerjzllee@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,suse.com:email]
X-Rspamd-Queue-Id: 124E66032B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 6:31=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wr=
ote:
>
> On 29.05.26 08:58, Ginger wrote:
>
> > I think the intuition is that the global exposure (i.e., the
> > 'usb_minors') of usb fops should be disabled first, so that the
> > subsequent nullification of internal fields can be considered local to
> > prevent concurrent accesses.
>
> Hi,
>
> if I understand the logic correctly, the order in yurex_disconnect()
> makes sure if yurex_open() and yurex_disconnect() race, yurex_open()
> will never see an unregistered device with intfdata !=3D NULL.
> That is, precisely because without a lock the race is unavoidable
> the newly opening task will be guaranteed to know that it has
> lost the race.
>
>         Regards
>                 Oliver
>

Hi,

Yes, I believe we are on the same page about this patch.

Regards,
Junzhe

