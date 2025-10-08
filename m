Return-Path: <linux-usb+bounces-29000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31416BC3610
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 07:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDAF53C5146
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 05:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6F72D9496;
	Wed,  8 Oct 2025 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="vQiI2Yn/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9780D2D9482
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 05:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759901077; cv=none; b=XgOTW+KiPEcpYLgUYeqbpJrqo7+W2j98NlO8XG3/in3KjN012MNXpfMoVp0cUq21rw+6U156LxPjPxZ7YD5doac5TKeVyq8OF6OXAut0ORva/MRoK62+XfsUkyW18Fm2pSQord4PzxJdSNRTKuapMKNuc80Qg4KE8ypl1VBLjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759901077; c=relaxed/simple;
	bh=37OZMA1ahP4rR/1YHGb7OtZAePrK+tQ5/lS20oXfdJg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=QHdwfleqoTBBdY6legivxhEFrc6p74d+LityIMQpLEfPZ9/fs52PvV9rgkhWz1rSUFyZj4uA/cMG5e9ZrnTPkXTT5uoa7eOq1y5rVPXwXBHCNPHyODWsZmjYZaIE+AUyY6thJtTPjLdAoBYDBBaa3qSGe3kCCbCp1XUS4W9CLmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=vQiI2Yn/; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20251008052428epoutp03ae19bebb57c660fecd98c4c7ec6c7f3a~sbLKIbc5_0536205362epoutp03f
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 05:24:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20251008052428epoutp03ae19bebb57c660fecd98c4c7ec6c7f3a~sbLKIbc5_0536205362epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1759901068;
	bh=37OZMA1ahP4rR/1YHGb7OtZAePrK+tQ5/lS20oXfdJg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=vQiI2Yn/60l2SHMdACjGSrGhyE7wcDZB3oN06BLfqUKEGEinboJMoHavj/lYI3eyC
	 dQHrvUIy0AA0nWrueMt9KahLR+Zk/lTVrkUNXGKySeOt7Q0FUsOsLurk0G+6tN8iX8
	 XBfDBc+HE+ia0LQwiLdY7dCxAc+5d0eU8zSP97Xo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20251008052427epcas5p1bba76aa459c3fee2a5529d499812f82b~sbLJduMLZ1701517015epcas5p1L;
	Wed,  8 Oct 2025 05:24:27 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4chLzG5Htyz6B9m5; Wed,  8 Oct
	2025 05:24:26 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20251008052426epcas5p2e216f47cb17e3b4c8fafc458a60eeac5~sbLIF68Xl1998519985epcas5p27;
	Wed,  8 Oct 2025 05:24:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20251008052422epsmtip1b0c0404216e801ee646f92e8a0bfcfc1~sbLE5pAWN1322713227epsmtip1H;
	Wed,  8 Oct 2025 05:24:22 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: =?utf-8?Q?'Andr=C3=A9_Draszik'?= <andre.draszik@linaro.org>, "'Greg
 Kroah-Hartman'" <gregkh@linuxfoundation.org>, "'Rob Herring'"
	<robh@kernel.org>, "'Krzysztof Kozlowski'" <krzk+dt@kernel.org>, "'Conor
 Dooley'" <conor+dt@kernel.org>
Cc: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Tudor Ambarus'"
	<tudor.ambarus@linaro.org>, "'Will McVicker'" <willmcvicker@google.com>,
	<kernel-team@android.com>, "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>
Subject: RE: [PATCH] dt-bindings: usb: samsung,exynos-dwc3: add
 power-domains
Date: Wed, 8 Oct 2025 10:54:20 +0530
Message-ID: <000001dc3813$d00ae020$7020a060$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKVekh1tGGcjz0jubEbe89UqPOX0gImOeLnszQBBMA=
Content-Language: en-us
X-CMS-MailID: 20251008052426epcas5p2e216f47cb17e3b4c8fafc458a60eeac5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251007155511epcas5p3a6f9e083226f902027828e97ed49af76
References: <CGME20251007155511epcas5p3a6f9e083226f902027828e97ed49af76@epcas5p3.samsung.com>
	<20251007-power-domains-dt-bindings-usb-samsung-exynos-dwc3-v1-1-b63bacad2b42@linaro.org>



> -----Original Message-----
> From: Andr=C3=A9=20Draszik=20<andre.draszik=40linaro.org>=0D=0A>=20Sent:=
=20Tuesday,=20October=207,=202025=209:25=20PM=0D=0A>=20To:=20Greg=20Kroah-H=
artman=20<gregkh=40linuxfoundation.org>;=20Rob=20Herring=0D=0A>=20<robh=40k=
ernel.org>;=20Krzysztof=20Kozlowski=20<krzk+dt=40kernel.org>;=20Conor=0D=0A=
>=20Dooley=20<conor+dt=40kernel.org>;=20Alim=20Akhtar=20<alim.akhtar=40sams=
ung.com>=0D=0A>=20Cc:=20Peter=20Griffin=20<peter.griffin=40linaro.org>;=20T=
udor=20Ambarus=0D=0A>=20<tudor.ambarus=40linaro.org>;=20Will=20McVicker=20<=
willmcvicker=40google.com>;=0D=0A>=20kernel-team=40android.com;=20Krzysztof=
=20Kozlowski=20<krzk=40kernel.org>;=20linux-=0D=0A>=20usb=40vger.kernel.org=
;=20devicetree=40vger.kernel.org;=20linux-arm-=0D=0A>=20kernel=40lists.infr=
adead.org;=20linux-samsung-soc=40vger.kernel.org;=20linux-=0D=0A>=20kernel=
=40vger.kernel.org;=20Andr=C3=A9=20Draszik=20<andre.draszik=40linaro.org>=
=0D=0A>=20Subject:=20=5BPATCH=5D=20dt-bindings:=20usb:=20samsung,exynos-dwc=
3:=20add=20power-=0D=0A>=20domains=0D=0A>=20=0D=0A>=20The=20DWC3=20can=20be=
=20part=20of=20a=20power=20domain,=20so=20we=20need=20to=20allow=20the=20re=
levant=0D=0A>=20property=20'power-domains'.=0D=0A>=20=0D=0A>=20Signed-off-b=
y:=20Andr=C3=A9=20Draszik=20<andre.draszik=40linaro.org>=0D=0A>=20---=0D=0A=
Thanks=21=0D=0AReviewed-by:=20Alim=20Akhtar=20<alim.akhtar=40samsung.com>=
=0D=0A=0D=0A

