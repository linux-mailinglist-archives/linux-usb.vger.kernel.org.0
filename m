Return-Path: <linux-usb+bounces-33447-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePEAGCoplmnxbQIAu9opvQ
	(envelope-from <linux-usb+bounces-33447-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:03:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B77DE159BF8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:03:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B60A302AD17
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A9734A3BF;
	Wed, 18 Feb 2026 21:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j7DLD0Pd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB39349B05
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448610; cv=pass; b=QLqkenLzoSW3lGF1Ud1dUJh7VdgdwTGgA+TA7/d7Xcye5cBldoKEEi2mrHqt+THF1jznPBtreJQoBUP46HpF0+7DYH06q7QD0JQ3JVeIHo57//ikMvXtzqTWUPiipMN8qEJuiP0McwhV3A+FCt8Bwn0wtyFr+vi4nVDQ09HrjYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448610; c=relaxed/simple;
	bh=DJ8wzyp2FFkmYZid9u88Pv/8g1IljBl2EOEle53SzR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ur4NRv5Y3HKBAqNUjrO3zPguCcdfvbbRVcs3syePs9qr3Ne4c5NrW4LZ5s/gSGj4Tfmgy+fOFZu4a40onZpZpmwqsllIK8nPGANG/c3iPLD322mpGK0sCJkM/7yzCRoYJdBeYCfbzrujjt7WfRJ+KnDpJXohos/6+Z2qPJ/Rh40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j7DLD0Pd; arc=pass smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40423dbe98bso111522fac.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 13:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771448607; cv=none;
        d=google.com; s=arc-20240605;
        b=W/hyT9y9uCQ86cbDuOOamoHvEz/RcotzP2cQdv/VrrklwKDSnpZ9oD6d7cXFw45CNx
         KyZWPA0mWgnrYWJX4p8uKXPVoRHJp21TPub7hqoxvQVSV3QjtZo1i5G3aN5RMo2lyxJc
         eHFw7XIL9Xr1PEhu5yoCEzKYlpQeIU/qprIbMih0rwZAwG455BAheX80PjhRUt4Wzj8d
         sBBhTcjjOqUWDkP82TwsUrZ1YUwOslYTFxdE6r3PgX7sRPsdtFZC/bIyKFWHEMd2XxEc
         5bZ+R3vmsNtJ2gl+CY5VzY6zKicB6GIiFDFpVFx001ZWU/z8WDSgZ0aBFnOS7wUPKuw6
         f3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVA9YBNA1fdXiz0UctTf2u/4Ct4n6y531ph080Dnnug=;
        fh=MUcibEy1ngIiO6AST121JK1UTYX0I/tNPwVCrQuYdXg=;
        b=fz3jWZ03INpU2AQUBSUTrxMSLFd1+21IN0uvXUiViwWZ3h/UP5qmK3xJFc5MwmuKCP
         XNL1WdPGuTaJ1kxdvLnvnQBQF2zuM5S4Q62011GWtNDs7/Dn/ikaJP35AUvMtuzOAMzA
         IFaX0WxU0USxxM5Y4qlIftI9wBHegAkFHTJ9jS+BhN1iJS8gjZ0mYz17ef9008Ml0hCx
         qhpxocauWjgOv7JFTesjYCSu3PTOE/tC6tjz52oF3vMi0Tb3JZNgyANyK4p0WBLa0cCb
         NtdiaQmA+586ZlPj+Kk94HJgjZ04KskBe00/d1I+89a+1nL0wQNRfTYsxQQxb9qihroV
         3cYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771448607; x=1772053407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVA9YBNA1fdXiz0UctTf2u/4Ct4n6y531ph080Dnnug=;
        b=j7DLD0Pd6UG3OmY8T9PtWS0BlGYK6IdRrlY6dCktQ9AMamN6YCDh45AsIepp2I+uDp
         A8EFmemguHdOgTWat1rMrKjBraMKh0CuYEB3ebdSQM4o0cWx/t2zoW6gJpo0jsmvXr5A
         +fV3SMeLTtA/s2eRi5MTIZxAiTqvjl3YSvbOITsfqv6Jz4WaPc4GbIdPYhMBImpjWGLT
         gMhl+PH0opM2k2T/6XMcmzkL+LioRxkNO1uyhqUd2Z65FRdVK3pFUe1VMg33D1kS7H0F
         8rCgTwMyZi5asx7PkbY2QNmhmod9Dis7d5a26yVUcYd9CaczORliOkvPPtvhkgZEigjF
         vJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448607; x=1772053407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rVA9YBNA1fdXiz0UctTf2u/4Ct4n6y531ph080Dnnug=;
        b=O9A+3GYaiSy09+kJyVkM22+mkdB2x6Ds0VpMtUvrbSJOxGCrKdiNQowLZXwYCG7t5+
         379zzD3x9OCnK8S+pr3XGKqMtMAIvKMx0317u5Qq7kLcGHqmwe2PvAAyuh/dNeHAYC9r
         312boGM8CqGA2ofhuuSnBO0Neku4qgboxj7VDnSgEeGnc35e69gbjhVSspkJBMHce5qe
         74mzQD/Hauv9ar2DenkxXU9k6DxoyMcxFWMKh4qSR0bNUEvdBxX/Mk9qTfOZ+lXkzpYd
         s2+h88x+DyHHD74oBu0TElDt0Bekj+Cc2laLsciqCIF2sJmaAEo0wFT9L7CeWhJQk6y1
         ZXrw==
X-Forwarded-Encrypted: i=1; AJvYcCXw4q/2CnPqE61TIHFdS/Ca5rVzqigd0hm3jpOzEPmcsb4TbzNA5kNBHba/Rh2WBItP1gf2OmXNLRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+UD8dRGTbp2uFhgDM15SfW31vZa0wZ+RXh6tZbkgAU3kRfFo
	KDxOW1NXcBdLhGq6+aDZaD/QysqgFj1OIQ1p0ewxxPCe0obcWob/XtchHgXAAbMy8r+e+L6Zil3
	UuBdRYkqx22/U9zoPFXJ2dewX/29RDDjBJH7OQDiP
X-Gm-Gg: AZuq6aLxyZZynm/5RBe1uAEnzY5Bzxus42iLzAtE2DJZE6blirLUYXmUQ/oeue+0zgd
	3w3vdvC7FNXGV2W9MMUlDKi7AJbEAMzj8QWmgd0kRcbupcV/2fJMfU9GBWNSODGK+Ta3xTz4kh/
	StDMlqk0AR/Jpweb5BlsC3yPBrX4rGj54SpUmwjNtQ+/mmuGEUPmlaLERsuoxK8wj1cCCVoOcRZ
	WRwvCi7du6A3Shvc2cEXCL6MhktF6bInklOd0MX53N5XT7/4n811DkoAy8G+bWV4dTFGeK4dmKP
	qXfpgJ1HALSFb7J8/gV7eDlgzSfIlawGOxwC
X-Received: by 2002:a05:6870:8a0a:b0:409:90b3:fec2 with SMTP id
 586e51a60fabf-40f0d9e2c0fmr8635230fac.50.1771448606434; Wed, 18 Feb 2026
 13:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com> <2026021821-iodize-trolling-3bde@gregkh>
In-Reply-To: <2026021821-iodize-trolling-3bde@gregkh>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 18 Feb 2026 13:02:50 -0800
X-Gm-Features: AaiRm51Gd8dHBwfnHk9aQlWaxGUJY1GBMHkxJsqjhrYaAkgrFVx_OpuVl2I68JA
Message-ID: <CAPTae5Log9f33u2gGtZSHZWZU0Q_cAgHJJaOD+M6dratsWFL8g@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-33447-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: B77DE159BF8
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 12:56=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 18, 2026 at 12:35:04PM -0800, Badhri Jagan Sridharan wrote:
> > On Mon, Feb 16, 2026 at 3:04=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> > >
> > > File-scope 'tcpci_pm_ops' is not used outside of this unit, so make i=
t
> > > static to silence sparse warning:
> > >
> > >   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declare=
d. Should it be static?
> > >
> >
> > Thanks for sending the patch Krzysztof !
> > Can you also please add "Fixes:" and "Cc: stable@vger.kernel.org" ?
>
> Why would a sparse warning fix need either of those?  Are you wanting to
> just pre-load my "WTF" email bot to go off?  :)

I am still learning :) Wasn't aware that warning fixes are not
supposed to have those.


>
> thanks,
>
> greg k-h

