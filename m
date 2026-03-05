Return-Path: <linux-usb+bounces-34078-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OTsIBR3qWl77wAAu9opvQ
	(envelope-from <linux-usb+bounces-34078-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:29:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B3211A72
	for <lists+linux-usb@lfdr.de>; Thu, 05 Mar 2026 13:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AED93027066
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2026 12:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB15839D6D9;
	Thu,  5 Mar 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGF85Ypv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6F733066D
	for <linux-usb@vger.kernel.org>; Thu,  5 Mar 2026 12:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713736; cv=pass; b=Pibb2dX8bMicvnFAzqTx53PX3JSSkTdFe2pW59Cs6TIBXj9O0ycdn/lugy2YPWmw3l4wRqkdTLXPaB7Pvixk0N33S4lkcELTZcMjIHt/gVvhydi6GkaN9Ji57BPqo3AxtDXauJpQYCdL9LpfAROp96wqLcPkogw8zMZCJRGa2CA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713736; c=relaxed/simple;
	bh=hNaOI9nMgeiGsp+pMrfHkJ/ab/C+q2uvXZcZTRYXmPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tlwr4hP8jbDL3tMmTvMlBxo5kR6Dzzx1mL1aGw5tNfIvCKTL6Lm6kpP/5ZuTbWGfUft9hFachdO72ahReEAhJX7vVGbLvLg9MUJxylTIkryaXIy6H8FW0RkarXKkFyWjW3NH2UXdG+CxtTFtEz+bGhYuFP8UfRAB3xynrFfcE7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGF85Ypv; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so2014449fac.2
        for <linux-usb@vger.kernel.org>; Thu, 05 Mar 2026 04:28:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772713734; cv=none;
        d=google.com; s=arc-20240605;
        b=EgIWojptssKocxTZ4DwZJzwPBzB9LBZN3K8/HSutg0Muu1JOVkHftw29453uCOdYs5
         P2QzbSBrkqwNSh31KvLD5Vb5MdzYmTYqq2Fx39veLPi6eNxXwhhX6Ok4kld4n13CI/aO
         0yJw7uyjo3OR20iosUmLO2IL0SnjtULVeE2D8d3pSjSi0AzskX6FDGi5dZHR4tyx41Ia
         gCBRB3Bj7zx0zzZXtIEEbS72FxX52NFhZjljJRE2XJIxsKP19nrc/tNhkxJFpqONlfJW
         OgPplUoh3tu0ZSS/puOajdzZtorYHdn6XtqxZogFtykr3yfvTWU6D1fEiJxdm3s2Ss2F
         mqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hNaOI9nMgeiGsp+pMrfHkJ/ab/C+q2uvXZcZTRYXmPQ=;
        fh=iSiOAMoupxgtarH5h+TI8UoMNEjVqdRXHe03178baN4=;
        b=f0AZaCdUyWnPH2TMixgPyJxJxM9Opm95wlpX/0HWzBiBb8XAnb+tau2BmMYdn4ZQJf
         82UIU/sDF8FnStwjw8cFYvYVD2vo6JFz+ua0YqhPBgNFRPtlV3J5t1i5deAjdLSpJhVS
         7QXb4Y6wn3o9/h8aDp/YPrcoSeDMWIXiVPCjOSi3X6rS+e7eZXPtkxFWcOye2zhXJxq8
         kyqxlD84jbIp3ubvW1WZDe6lpQ6USB06jvAZP1HE5f+zHdBZv0F9Jwy0EAWK3rKWjIJN
         4u31x7zksnOE9f1eRRjdfMVgZXdxLIuSLXP70tVlmq+nOz7LSip8vsaRoNLe9IsJ+RE4
         vhQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772713734; x=1773318534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNaOI9nMgeiGsp+pMrfHkJ/ab/C+q2uvXZcZTRYXmPQ=;
        b=YGF85Ypvci/Qw55JkSmILKsscunlCgC9yZ0qzb7s/yLHxvPBBv9ADVtUyJOStXEiYf
         bi/4jvHlx/sn83kb0pQvtNkil6Aif5YsBGAIcz57UtWoFHtk3+bMJuMx4oKG5m8XafKX
         qRAXbXtXm6J7Bu2Rl12t2icR7quynwvzDB6TqIVE4myK2quPGbfigvv69vh+UxL9Wyst
         CKjKwKBAJ71n9PEzpUapURlPCe4p0V9/7xonZtolz0b11YJA2cMzGglpNd/Yxe1bOE3X
         vKSoQnLPHO6c9WlCOIH3r5j70ZgZgexsq07emDRbXziLnW2RGcx2qfWtFGcUnB4EFCyu
         WL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713734; x=1773318534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hNaOI9nMgeiGsp+pMrfHkJ/ab/C+q2uvXZcZTRYXmPQ=;
        b=UAk20cL+mDF1aIkkH3rWw+Vx9JgBcWrzlLpE2taG98hZAdJuuwzW13g4oWE20W+2r5
         QXt8msg4naOXueg11TS89AXKx5x0BG/9C5oaUKWWjhyQoCqB/R4WcWDBnNT/RFCeJv8P
         1ohuC8GVr/ctAtF0dHbxLu4H2Hc1zSCwndN4mpOyrxCOKgAZGJ/oa0SosmU3yyQINT7I
         boMp9p7i3lRRnMqjQM2fFmWrUH8S3UZFu2XJt17PNGEEm5Rr+oxMvkaiK7jOkaS68DfK
         DphsbwXCqOCvh7XfTZE2VmC0DgGUV1Ui9bIq1vwdh/Xa7SXqn882shUxyP1vUq6ii4vb
         n44Q==
X-Forwarded-Encrypted: i=1; AJvYcCWycIaBIqGgr3BMo1/UFfqR63u0m2A4rhYFaSkfY1A23wZaLmO4NwDaCJHKO/3TwpNxRtLD9a38GWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKAPqZPXreFBUHIP17i8IOOX0Y7yteghCxd4dJsZu0lk5Xkcb
	SNhOAMNCun7+41ycHdgflkVQO3PLxc+kUCe/Lww93gqD2UmYsXFJkpO83kXkwq31FkWr4vHdGOQ
	6Rh+LmSAf2t4TgdptGKtXRxqAlnjTr58=
X-Gm-Gg: ATEYQzw0icu8ruix/EwGA3Z/sSZh4OPLQ6Q6Zq3nNFxjM4QGj2ZVR9HZNf05qs5Q7IE
	qv1DC3lP26XRnFozjiODVsryIY0zPBgD1/GPwZf9fZdujYuIrnhSrFy20DuvN7Ci44WPWz7ByFK
	ir8kCYiLFkiFzCgT+HwE0f4ENfjadV9tshcxHQRLIU4YDiXOTZ/DViRb3Q5+rIt+OgKV8d3rDi9
	fgYUayDmdI0jVw4U5T8pV1I0er32inhcelWDXWHEpjjf7yNZZMRrTHpCaNFuH1wl3NY/clPrXID
	7gBcfZ6v2NF7w1myJC4l+Zdh24dTEOjJRc4zaV0khhjeIRjcPnLJZ88KMJexfQ00OQMukA3ZOGs
	=
X-Received: by 2002:a05:6870:171b:b0:3e7:e420:6229 with SMTP id
 586e51a60fabf-416ab50cdccmr3046096fac.6.1772713734061; Thu, 05 Mar 2026
 04:28:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALbr=LbrUZn_cfp7CfR-7Z5wDTHF96qeuM=3fO2m-q4cDrnC4A@mail.gmail.com>
 <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com>
In-Reply-To: <f8c304be-c061-4656-b7ba-83150c2b8746@suse.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Thu, 5 Mar 2026 20:28:41 +0800
X-Gm-Features: AaiRm50gWmo9gAYH01KiBcaLrwowAFJrJwerpsL_iqysIBmm6bOID5RqxSdHac4
Message-ID: <CALbr=Lb6Vir4+O-=8-iL7M8=Gqgm=VUp6s+XGVC75QixFaSmOA@mail.gmail.com>
Subject: Re: [BUG] usb: cdc-wdm: Missing barriers in ad-hoc lockless buffer
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, robert.hodaszi@digi.com, kees@kernel.org, 
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Jia-Ju Bai <baijiaju1990@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 416B3211A72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34078-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 at 7:35=E2=80=AFPM Oliver Neukum <oneukum@suse.com> wro=
te:
>
> On 04.03.26 09:41, Gui-Dong Han wrote:
> > Additionally, the driver relies heavily on set_bit() and test_bit() on
> > desc->flags for synchronization. These bit operations do not provide
> > implicit barriers, which might lead to similar ordering issues.
>
> Hi,
>
> going through the driver it seems to me like all relevant cases
> are covered by the iuspin spinlock. Do you have any concrete suspicions
> or do you generally distrust this style?

Hi Oliver,

Thanks for taking a close look.

I did notice some potential race conditions regarding concurrency
visibility, but I admit I haven't constructed a concrete, harmful
example like the one for ->length and ->ubuf. Analyzing the flags is
less intuitive, and constructing a clear failure path is
time-consuming, so I eventually gave up on building a strict proof for
it.

Specifically, wdm_read() accesses ->length and then ->flags, often
without holding ->iuspin. Similarly, wdm_in_callback() involves
multiple accesses to both.

I am indeed nervous about this pattern. Without barriers, changes to
these associated fields made on one CPU might be observed in a
completely different order on another CPU.

Thanks.

