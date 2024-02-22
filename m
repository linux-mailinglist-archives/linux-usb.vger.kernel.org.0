Return-Path: <linux-usb+bounces-6880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43685F571
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 11:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7451C22AAA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 10:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BDC39AEE;
	Thu, 22 Feb 2024 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="UEGvDNAZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC22B9BF
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708597026; cv=none; b=mnFgFNBzOys6OyftjNZJUL6qjbBu0qIZuDha24i6ytPGMsjnUbNZ5pXW09vjwvNBDusYAmHKguv4uk+n1449ygoqUFcBIG6P40okaGwluHHXUMvxeLCYnHh4Idky51CiH/TK9nShZnd5YXQlaDcRdJ6If3l9jiOg7CW7Lsc2feY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708597026; c=relaxed/simple;
	bh=LhIhb4RiB61MmihxrRNLgjJ4lCywNYdh5fpN69+wLC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GFuL2p9yhOcRuevp2YOii8NEM6EBXvYsa6BIyUrV0VNh2ySXFF/ZlqK6IfjNMWVUsGluMRnmkk7GnO74PeGaZIdwmTjNBPi9+mLitpvIFxxtCb4wnDkUzj6whUCj3LF+OczBp/3fvzyE+Svt7qEySvCMPDbv+c2RjKULBZJ5nb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=UEGvDNAZ; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708597022; x=1740133022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hQyKWsydAFlf3cuUBZsUkNyD7QdHs8gaU+33XwBiri8=;
  b=UEGvDNAZr4cS3CxZLijpHMz1T0Y/HD9FJ9O6sMN0WkalPNRzGvPt9rJ1
   Ew2nvfXkqrxrGdQfSIFXsE0zi/whCwP9pVtBJ2b9LQBM+X8rG89qiCNxf
   lIfPqtwN3J8oEDolzCafVnoa7CF0Y3cvv6E/ynq/RVehX+wxFRMQOg2Jq
   /OD70UiAuFKVVsRHJpm0gCvIp3DyINeDIt6cG8iIZyBBO3Gh/OLcRxC25
   hnpACerQ8bboz8npuwxhaDjil1qAERajOHyyQBKFYTLl1usUeRvp9PbTd
   C20zfB7rWZBWkcXZGo0B3+9PKEw9QOCgf3pnULPVr8XcyWXFf7jT4AERV
   Q==;
X-IronPort-AV: E=Sophos;i="6.06,177,1705359600"; 
   d="scan'208";a="35542425"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Feb 2024 11:16:59 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D7F96280075;
	Thu, 22 Feb 2024 11:16:59 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
Subject: Re: usb-next tree has patch applied twice
Date: Thu, 22 Feb 2024 11:16:59 +0100
Message-ID: <8339216.T7Z3S40VBb@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2024022225-curfew-operative-c98f@gregkh>
References: <3469745.QJadu78ljV@steina-w> <2024022225-curfew-operative-c98f@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

CC'ing Sean as well.

Am Donnerstag, 22. Februar 2024, 08:47:28 CET schrieb Greg Kroah-Hartman:
> On Tue, Feb 20, 2024 at 04:29:04PM +0100, Alexander Stein wrote:
> > Hi Greg,
> >=20
> > on the usb-next tree [1] the patch 'usb: phy: generic: Get the vbus sup=
ply
> > has been applied twice:
> > * 03e607cbb2931374db1825f371e9c7f28526d3f4
>=20
> This is from the 5.18 release, from this email series:
> 	https://lore.kernel.org/all/20220425171412.1188485-3-sean.anderson@seco.=
com/
> from 2022.
>=20
> > * 75fd6485cccef269ac9eb3b71cf56753341195ef
>=20
> This is from a newer series:
> 	https://lore.kernel.org/all/20240123225111.1629405-3-sean.anderson@seco.=
com/
> that I applied from there.
>=20
> So how did it apply cleanly twice?

Apparently the series from 2024 is v3 from the older v2 one. For some reason
only patch 2/4 from v2 got applied before. v3 seems to be a rebase where the
apply went unnoticed but the patch is again part of the series :(

> > causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe USB phy:
> > [   11.006720] usb_phy_generic usbphynop1: error -EPERM: could not get =
vbus regulator
> > [   11.017817] usb_phy_generic: probe of usbphynop1 failed with error -1
> >=20
> > Reverting/removing the patch fix my problem.
>=20
> Which patch?  All of the ones in that last series?  If so, why did it
> apply at all?

In my case I reverted 75fd6485cccef269ac9eb3b71cf56753341195ef from
usb-next, because that very change has been applied with
03e607cbb2931374db1825f371e9c7f28526d3f4 already.

Best regards,
Alexander

> totally confused,
>=20
> greg k-h
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



