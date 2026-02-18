Return-Path: <linux-usb+bounces-33450-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7+zrKNwvlmktcAIAu9opvQ
	(envelope-from <linux-usb+bounces-33450-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:32:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6515A21D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFE553045647
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9603314D1;
	Wed, 18 Feb 2026 21:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3ot8o/By"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2397231B823
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771449911; cv=pass; b=EOSQsAmmekIQ3wxYVstIzTYJymc58i+j+3bFk8JaYLK/Cr1CTdUe79ltpIcio+nPYoOchEvypx1EQpOfLes1TJd2gksdPvkVNg4k+Bit1PW/M+jNV6FYEW4yPRKE5tUTaepKCA2TvHJjAZ0NGpeYj9QOMmSADEymh7j473oV/xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771449911; c=relaxed/simple;
	bh=ATUEfL/dWToyK1ygkRpn+OEGJP4+n+De/RmDRHV+fLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWWKk+Cu4YSCgEagXx7UuRlkAevdopJuvbZv2X2m/shM3A9Squx1K0X4HR7neKPWJ8rKXMKqyXCOv6juHEq6Rd57D7RkbUYPgQVRgy3WaTBHSUX39d6sFvNkP2RqbrTxy/ziO48n47urZO5/9ApZoXQrr3d6xW9rD5Lx4b24jpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3ot8o/By; arc=pass smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4094b31a037so156988fac.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 13:25:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771449909; cv=none;
        d=google.com; s=arc-20240605;
        b=i04Pq1zFQpQCW5GPISscxIq6RHgnCvLDnZ46B9lwBlIIxPV51wAUQBNZpRWR3mR5RS
         WWk3d7W1byNyztD0WL2isdxAUuj8q9dTGzo071syQKdJjX1lppKOKw6UH/f/BnWR8Seb
         0TVyWGpPg7+tLPxkko9pHLL6TPzNoryrHh4JoNxHS15atnaCwK17NpNFdCRMgZQ4MlK0
         ULNxUniook0eND+jVAZBupqwChYwbZuB35D5IlaPI68mjiquse0e7BpM3ZbV/AW12akr
         bqN6F5LI4k/HuyY1isUbKxtbmSEEMdzo4Oxf7xNWp7NsfjkMncWE2RwoslSMhRHwWLsJ
         WvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZVQaTfw6nZNLBjMCaY2dXXiJXO+HtzP2VkM5hQK9SVc=;
        fh=V7QkmYTkUo4WMc8sruwsQzhFBt9/SJCi1CtPpElkOTA=;
        b=hhjToNQwQiWt389OBjbs8WIl8nLzN5RxGTHitG0iSjeqkuAu5IDkUkrj/LXOLi2bWG
         Abw5b9gaGz1e47VNfrnO0CwEkuoPsnvalFSPYEYIC/6Ib3mkaDSq3fOsw+Jv5ARe8yXy
         FStUdAlHJ70zOfAmkBs7Oi9yJUoAymTo4xKy2u91qzzLdfhe0KCijKD0cuqsUFtU8CGD
         rt8O5jEd686ctbw3YW1Ag3DPKgBvl1egwf3iOP3pFDGrjUONyXmPNVqkau1sHJ9MHL3D
         gsxVjObJ525KKsD0yWwXWg3WmGMhF37InmgjN9dZCqaGP895lcxjcAeetWlX1nuTaNaz
         XWVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771449909; x=1772054709; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZVQaTfw6nZNLBjMCaY2dXXiJXO+HtzP2VkM5hQK9SVc=;
        b=3ot8o/BypBnPTM6zb+KjcAd/9SmZ/PV57pJVe97t25IwdwO/suLM2XgD1xszlCrktR
         2AVLg4vj0NXkNB6fgT9Y9PLppmFj6gOf8XsxEjZaaIB5SUixnuUG4aE2u9jqR/AfeZB5
         ZZabO9zH9H/Ywh1f1F5Olm50hGpatmE6zfIjz/zOQEGFdcX3PDolE+Jj1ufmFFqNo/4x
         30Rv1wggjTnEPVsV+Gi8+iAHB+pUyed3Txjy9eeAkBRhJ6xOqli7NCPjWQPsII29dEFM
         f4inUZqbLxbf3CXezV2qaH/HFPYSwZKqyR6rQMDCyEQu7mJPulivovtkBCUykfb6kzjA
         9vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771449909; x=1772054709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZVQaTfw6nZNLBjMCaY2dXXiJXO+HtzP2VkM5hQK9SVc=;
        b=IUnPSIDRPOCL5nD+mzCJ6RbntGMbyjalGqRcabkSbC8aoIbYhA8PVVgiDlqzTkkLJn
         wjnXIJkKp1RONqjR8rS5kWjfKaAnA8Vi9hRWRchjOllUUCrEPgNNbJS5wK08xWY/1MsX
         +7emm2p52NAbJzwiKTHmIcyteWkRttrzn1S6MLqSDqYiN2EJZB3wVg63Jzd4Y+FqTC6e
         QjvkaAgRn6d6uENL9xLbAwca8gFVay7kqRZyLLuPxVn2+Xi/wYSrW5MH2v54RXVUEjk2
         QGHjUpmnR+MtGoIp9NDZAXGXdC6vum3p6y76o88beI75CCq/YvJTbewv2UHbcmSKHoF7
         HH3w==
X-Forwarded-Encrypted: i=1; AJvYcCVU//ljUfV4AUELE8bdykuvjtUHx/QRdtal0vXunbmNJZpg6dPAOLQ9o9M3EW4YFbyzi0LEGbkkswg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6hLZ/VeKHCzK4uHxmH1SjV/XIBFJ1FqeuZee1tQxNYv5kJJq
	2SNJbLSHwTfBwvUwQ8NlWthhQcZ370nQZjO4DtKIRjkZRMeGhlH0fJKWq1Bb8AJU6OjTZ6tiU7R
	WoAnJoHOjYq71AIvcFIBIam75HP4k8QZ10u+7Lpp5
X-Gm-Gg: AZuq6aLsfj2ex2pM2ASINe8RoFoXp6X+rcyqlqzF/F3JkG4DVy1WMhdKce3o2BO5rKO
	6sXCfgw2jACZZERVj5LkPiDqZQzXGb2uWcKSahC1q8a58+9+aTDTh2BJGFNpI60hGVZi7DDwQTY
	DOBuCFsKuFnhb7qi/4y1zC9fl1Y7u7ZDo8ykn9711Iu2c6ofpXAdrNo0qfomhiCukipaj6DIs1j
	HfiGDaZzN9/hBBX0fQfRM7X40tvVrTgCOpqTebXvQwMu4RiQ6xkT9KsDEiho2LfITBrZx7UPRE4
	i1oSJW2Kqlx5kYhxjUlsGQFBYnOJXewzRN2g
X-Received: by 2002:a05:6870:c216:b0:40a:40d3:871e with SMTP id
 586e51a60fabf-41539f1250amr340952fac.34.1771449908668; Wed, 18 Feb 2026
 13:25:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
 <2026021821-iodize-trolling-3bde@gregkh> <CAPTae5Log9f33u2gGtZSHZWZU0Q_cAgHJJaOD+M6dratsWFL8g@mail.gmail.com>
 <2026021802-chemicals-reoccur-a35d@gregkh>
In-Reply-To: <2026021802-chemicals-reoccur-a35d@gregkh>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 18 Feb 2026 13:24:32 -0800
X-Gm-Features: AaiRm53YddLoSswhClts4gPdV02NK7lPL8vvS8Ae26fibe3xm10Qe-5hcOUN1Z8
Message-ID: <CAPTae5LLJX9oUUe_UJ_C2JfKY449rdkK1ahDCt52KSCezERrBg@mail.gmail.com>
Subject: Re: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33450-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,linuxfoundation.org:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 11F6515A21D
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 1:19=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 18, 2026 at 01:02:50PM -0800, Badhri Jagan Sridharan wrote:
> > On Wed, Feb 18, 2026 at 12:56=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Wed, Feb 18, 2026 at 12:35:04PM -0800, Badhri Jagan Sridharan wrot=
e:
> > > > On Mon, Feb 16, 2026 at 3:04=E2=80=AFAM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> > > > >
> > > > > File-scope 'tcpci_pm_ops' is not used outside of this unit, so ma=
ke it
> > > > > static to silence sparse warning:
> > > > >
> > > > >   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not dec=
lared. Should it be static?
> > > > >
> > > >
> > > > Thanks for sending the patch Krzysztof !
> > > > Can you also please add "Fixes:" and "Cc: stable@vger.kernel.org" ?
> > >
> > > Why would a sparse warning fix need either of those?  Are you wanting=
 to
> > > just pre-load my "WTF" email bot to go off?  :)
> >
> > I am still learning :) Wasn't aware that warning fixes are not
> > supposed to have those.
>
> This is a warning from sparse, not the build.  sparse is an add-on
> thing, not a part of a normal kernel build.

Thanks Greg for the additional context. I will keep this in mind in the fut=
ure!

>
> thanks,
>
> greg k-h

