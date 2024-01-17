Return-Path: <linux-usb+bounces-5182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AD830A23
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 16:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7281B1C21A00
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 15:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52E221A18;
	Wed, 17 Jan 2024 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b="oEwpqqAF";
	dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b="A2njVorL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B0121A0A
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705507013; cv=pass; b=sRnxMguwmwb4tgfw4yyLBEyn4FXn8KKsi4ZkCMScU1GhtdoBKHcX2VKy3Jcu0ZlGlGHe6GvCAAmtGl9MdesaEl5qcupnEfVChE/UXIhVUCS8h+AbfEBJjZtiIFUMiDGCoC4Lcsb0toloOzJB40sn1BqAtBPyuH0TQmIn6H/eMrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705507013; c=relaxed/simple;
	bh=5XQUZI+ZS7eoVBCf+IpyH+1tDe3B6hrR/5buAo7aG7g=;
	h=ARC-Message-Signature:ARC-Authentication-Results:X-RZG-CLASS-ID:
	 DKIM-Signature:DKIM-Signature:X-RZG-AUTH:Received:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type; b=ut9PmmgSvBLRyDr8KfHxHcCbE0AcEtuYcBMxYKNT/RVOgz+RF4jaju72jdblbReTfNM2m5O7cJcrhHR+vYJUtvcjVM9OFZ3sMZFbA1YdwrYiI/Ay9yN05ej3JqrP+dcQ991wcaJYQoc3AfESeKWLes+Hnofew4Pr9N3lM8f0ncM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org; spf=none smtp.mailfrom=clisp.org; dkim=pass (2048-bit key) header.d=clisp.org header.i=@clisp.org header.b=oEwpqqAF; dkim=permerror (0-bit key) header.d=clisp.org header.i=@clisp.org header.b=A2njVorL; arc=pass smtp.client-ip=85.215.255.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=clisp.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=clisp.org
ARC-Seal: i=1; a=rsa-sha256; t=1705507007; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bh93zjE/imkb0r4C2qR/kSSytvqR8NQfxS+aXWUJ1nF05hnEJo/Y15T8+0mQxc5pKJ
    cafsXJ6XeIYjnIV0DfcFwOVBOXf0AHcQQYELtD9+SX4mOsmu++SzBtGmjOUuLCCKxVvf
    suLWNOR/tmD/z12zMX8zecaFo306lmDI1CREI8UzIMKUJk/MkiQ5tsPI76aqTef6auFD
    sgRHFnvbSuqh+KLgvedz783S1rCmsXmmWBBy9RyDUfiKgBMSNrTeH8qbBLzajSq4D6JD
    cqutMiwTdsXvbs+FIxmfVDmgvrzVe0xMM7CiS+ePnICjcUlGoWS3eoFagQCKqB1tvI9o
    Lbvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1705507007;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Tvw4zPVQuHrP3fa8Gz10G8oSTcD122jkPyaUScBsyZg=;
    b=LBG+Q0GvxWMUf1BJ2FqEhk3Ftsup6n6+Gn/uYY90nCHmLpKfySyo8zgvmrtFZTcZWV
    VcI6j2fvttp3+7LZAsGFBZQh97s95bwX4p0K5BnS/EBw5zdmy4O6NxEPcp8cRc1oL6lO
    MKTSxtjo+RHOzss5fvVTGU+S1kKJNc/ddH0mYr60otA2Doa4BUXXLVL0n0qylwVn5XW2
    Rfd0vXBRkD7WJo9f6MY5qKdR6tKVzOE/2g01nhsDJfO+TkIgpt3lxg5JnHm+XLWZk0jH
    x4eVg18kGK/FvcZOsOW2FeTnfl7fy1PIqEdnRsRJ0O6ycpPEld6wXSiDDatfqRGtuwAF
    ytGg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1705507007;
    s=strato-dkim-0002; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Tvw4zPVQuHrP3fa8Gz10G8oSTcD122jkPyaUScBsyZg=;
    b=oEwpqqAFA8fo41aUg7pYbVlNqskqc6FW29w4U23WaPwqOtJmaSy4GAhYt34SpfkWmo
    hZVd1RUEx8sOIC3EUIqG697EHCUz3v8eFIbvhou2fdVXLFWlbc3OH6FIdlHLpdulkcFg
    BbfNHiVqcBSEMwzeNbkbwJqoghg32vd3Nbc7ylBJXGruwwWS5Ylx5mrPKZT3vLJyL9W9
    SceQ33b/AOFz6nRnZDLp1dmE90uIjYpY5mIizLFmV0JU/lSMdBzusIkD+UWutiZ3I+QM
    XG33g1RIKMBaVPn1U7mdYQqsOtEvUGTipoouJd8y15oBz3/DyDDm2ZQW6Pdb1xksd9nJ
    0Bjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1705507007;
    s=strato-dkim-0003; d=clisp.org;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Tvw4zPVQuHrP3fa8Gz10G8oSTcD122jkPyaUScBsyZg=;
    b=A2njVorLCjE2fxRT8NqnG3KopM9CdBkgzdznlP9bDR4noVvhVrHAo/XALw8NOsPdsq
    fI6N9yE4iNzcTvbrM5Ag==
X-RZG-AUTH: ":Ln4Re0+Ic/6oZXR1YgKryK8brlshOcZlIWs+iCP5vnk6shH0WWb0LN8XZoH94zq68+3cfpPD3fBonz7dJLi1xPuooJ6RC45Y4g=="
Received: from nimes.localnet
    by smtp.strato.de (RZmta 49.10.2 AUTH)
    with ESMTPSA id c5619e00HFulYKe
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 17 Jan 2024 16:56:47 +0100 (CET)
From: Bruno Haible <bruno@clisp.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Lars Melin <larsm17@gmail.com>, Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Date: Wed, 17 Jan 2024 16:56:46 +0100
Message-ID: <3172447.D8ZAKjAxdT@nimes>
In-Reply-To: <21712025-0b46-4afb-9161-5d1f1afb502a@rowland.harvard.edu>
References: <3750407.VQhiAETyHQ@nimes> <2270283.o7ts2hSHzF@nimes> <21712025-0b46-4afb-9161-5d1f1afb502a@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Alan Stern wrote:
> > > Slowing down all RTL9120 already in the market with this quirk is in =
my=20
> > > humble opinion not a realistic solutio.
> >=20
> > What else do you propose, for those of us who buy this hardware (=E2=82=
=AC 50,
> > it wasn't a cheap one), connect it directly to a computer (through the
> > vendor-provided cable, to an USB-C 3.2 Gen.2 connector, as in my case),
> > and then experience 1-2 crashes per day under Linux?
>=20
> The proposal is that you keep on doing what you've been doing: Set the=20
> UAS quirk.  Then your system will work, and others who don't have the=20
> same problem will get to keep the advantage of quicker transfers with=20
> the uas driver.

There's obviously a speed vs. reliability tradeoff here.

On the speed side: Do you know the speed difference between an external
SSD with uas driver vs. an external SSD with usb-storage driver?

On the reliability side: It makes the difference between a usable and
an unusable computer. I don't understand why you seem to prefer that
I have, by default, a fast but unusable computer rather than a reliable,
even if speed-limited, computer. Isn't it the opposite throughout the
industry? (For example, the CPU clock is not overclocked _by_default_.
An admin can overclock it, but the default is to be reliable.)

You say "Set the UAS quirk", as if it was something completely immediate
to do.

  - As a tech-savvy person (and former Linux kernel developer), it took
    me 3 days of investigations, web searches, and reading of kernel
    command-line documentation, in order to get at the solution.

  - For a non-tech-savvy person, it's basically impossible to arrive
    at the solution you propose. They would have summarized their experience
    as "Linux is not made for the desktop, let me choose another OS".

Isn't there a more intelligent solution to this problem? For example, the
uas_eh_abort_handler could, instead of just logging the problem, tell a
system daemon that the configuration of the particular device is problemati=
c,
and that system daemon would change the grub.cfg (or some other file that
stores kernel command-line parameters), so that the quirk gets activated
automatically at the next reboot.

Bruno




