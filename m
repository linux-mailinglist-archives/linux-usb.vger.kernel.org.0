Return-Path: <linux-usb+bounces-6886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0709585FA30
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 14:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93ACAB297AF
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBB0134CDC;
	Thu, 22 Feb 2024 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Nb7hFprt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A91E51D
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708609613; cv=none; b=JSiJuVQt5CIb3dXDeDrBHeltcU2DNxqJJZ1IrLYXVr084BSMuw6x0BQlLPuHV8FFKS8YveUh1p/yDBk2KDPUSukg2O50a8TeafKMxkuKFab42CnlHvE5xjIgociHeckJeVDtJ4pDYvchSaZSfDWk11N/2BpOCNbN9O+QTgSipks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708609613; c=relaxed/simple;
	bh=pHcVdtCHC+o6S1ao2AJs5zE5dJXIwQEZzVnI+LszEnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EMhb4Ubez7ezfoYLlc6rFhVe9n7Tf0T5dAbl0B52G07pWBOyPKjpfqsPnTn6NkTYaExYJScZqZyAcHtcnoptfSBfhTjfEycPO51CXphY2rdCasr2IoUl/189vy5/AdS1J+nPBr6UB+8OdYy90dH6jKJgLopwHCuZ8Z3mmmzBMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Nb7hFprt; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1708609609; x=1740145609;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v4fgNg5h4cAL0+F34ZOI+NCXRJLYBXWkc3kNYOCnzS0=;
  b=Nb7hFprt8czWP4DQ45UDqsXmudXmhRei66Cuzvw5eVtgH+VjwvVjWEiy
   MYGaReZg53tpjcq1HR3Q/BLSF2FEdNd3SIIhFWTqLM7itQ8Gyd9+qYYF3
   OXPUmM8fq2v0KuMcxtbLLHyN8W4jH74IZ+64vhO8PNH9p4Z6MHdKbcO/C
   BeB2eCZW9EpGef+CWTlsGruNS8jY4us2Csi2wcEGOHj3gNh2fBdDq3xJ0
   lpkwFOOSw3z/TfcAha01oTJ9j3u3IC+1IMuAGEuaHPnhcgRx5i+Vd1ygk
   KVkVjkQXFvlzqPfjH8H4ibEm3PKsYGwnQ38FNmwf8un4vu/Rv01dYxW1z
   w==;
X-IronPort-AV: E=Sophos;i="6.06,177,1705359600"; 
   d="scan'208";a="35547800"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Feb 2024 14:46:46 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 98CD7280075;
	Thu, 22 Feb 2024 14:46:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>
Subject: Re: usb-next tree has patch applied twice
Date: Thu, 22 Feb 2024 14:46:46 +0100
Message-ID: <22194332.EfDdHjke4D@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <2024022254-tiptop-sublease-6357@gregkh>
References: <3469745.QJadu78ljV@steina-w> <8339216.T7Z3S40VBb@steina-w> <2024022254-tiptop-sublease-6357@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Donnerstag, 22. Februar 2024, 14:06:12 CET schrieb Greg Kroah-Hartman:
> On Thu, Feb 22, 2024 at 11:16:59AM +0100, Alexander Stein wrote:
> > Hi,
> >=20
> > CC'ing Sean as well.
> >=20
> > Am Donnerstag, 22. Februar 2024, 08:47:28 CET schrieb Greg Kroah-Hartma=
n:
> > > On Tue, Feb 20, 2024 at 04:29:04PM +0100, Alexander Stein wrote:
> > > > Hi Greg,
> > > >=20
> > > > on the usb-next tree [1] the patch 'usb: phy: generic: Get the vbus=
 supply
> > > > has been applied twice:
> > > > * 03e607cbb2931374db1825f371e9c7f28526d3f4
> > >=20
> > > This is from the 5.18 release, from this email series:
> > > 	https://lore.kernel.org/all/20220425171412.1188485-3-sean.anderson@s=
eco.com/
> > > from 2022.
> > >=20
> > > > * 75fd6485cccef269ac9eb3b71cf56753341195ef
> > >=20
> > > This is from a newer series:
> > > 	https://lore.kernel.org/all/20240123225111.1629405-3-sean.anderson@s=
eco.com/
> > > that I applied from there.
> > >=20
> > > So how did it apply cleanly twice?
> >=20
> > Apparently the series from 2024 is v3 from the older v2 one. For some r=
eason
> > only patch 2/4 from v2 got applied before. v3 seems to be a rebase wher=
e the
> > apply went unnoticed but the patch is again part of the series :(
> >=20
> > > > causing my board imx8mm-tqma8mqml-mba8mx.dts failing to probe USB p=
hy:
> > > > [   11.006720] usb_phy_generic usbphynop1: error -EPERM: could not =
get vbus regulator
> > > > [   11.017817] usb_phy_generic: probe of usbphynop1 failed with err=
or -1
> > > >=20
> > > > Reverting/removing the patch fix my problem.
> > >=20
> > > Which patch?  All of the ones in that last series?  If so, why did it
> > > apply at all?
> >=20
> > In my case I reverted 75fd6485cccef269ac9eb3b71cf56753341195ef from
> > usb-next, because that very change has been applied with
> > 03e607cbb2931374db1825f371e9c7f28526d3f4 already.
>=20
> Can you send a patch that resolves this all properly?

Which tree shall this patch apply to? usb-next?
Shall it revert 03e607cbb2931374db1825f371e9c7f28526d3f4 from v5.18
or 75fd6485cccef269ac9eb3b71cf56753341195ef from usb-next?

Thanks,
Alexander

> thanks,
>=20
> greg k-h
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



