Return-Path: <linux-usb+bounces-7584-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4FF872ED7
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 07:24:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E0C0B22504
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 06:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787F41CA8C;
	Wed,  6 Mar 2024 06:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicklyemailsend77.com header.i=@quicklyemailsend77.com header.b="Zm0w5N4W"
X-Original-To: linux-usb@vger.kernel.org
Received: from quicklyemailsend77.com (quicklyemailsend77.com [57.128.172.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E1C1BF3B
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 06:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.128.172.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709706246; cv=none; b=N9OXno7NWaZGir6vwf8lgK9VJM/pM7OVuPKBxn0qfCaVGRZVc2IfEmuQwfXMd8DvPLy+zBPu4bnS6bd7E+yqkrHvH1P+GBoUuZSxqTPMehgEUpJWEIufsi0GWkgM7h4XzX/Pb+YVOAJWbBHyRYGFqpFu1ScZg07gAJN3GhcgbkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709706246; c=relaxed/simple;
	bh=UkCnC3hxyWUR811IY5T5PlAQFaHotSY7xhHSl4hh88I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sMEvbw8/uSmVnuEr5lmGRjV0AtqJo8y80oYWKtNIitYoqFaResYdvMpU0V7FG9GtopG0KHPalSHJtObHmu0CDSPYxvUVaGChMi5r/TE3sUh5pxb7awKo818m335Yr3ySbC66BqFbQj80z9NoUpw8e+oJxOPUy68uZZAqR2zxRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicklyemailsend77.com; spf=pass smtp.mailfrom=quicklyemailsend77.com; dkim=pass (2048-bit key) header.d=quicklyemailsend77.com header.i=@quicklyemailsend77.com header.b=Zm0w5N4W; arc=none smtp.client-ip=57.128.172.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicklyemailsend77.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicklyemailsend77.com
Received: from quicklyemailsend77.com (unknown [185.255.114.95])
	by quicklyemailsend77.com (Postfix) with ESMTPA id 77B7C3977AA
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 03:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 quicklyemailsend77.com 77B7C3977AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=quicklyemailsend77.com; s=default; t=1709697108;
	bh=eefLZdwY5mr6nwq86b3d+rtsxGUHJntuGmXl+R35AcQ=;
	h=Reply-To:From:To:Subject:Date:From;
	b=Zm0w5N4WtuQAPoGeFDa5pN0qgtgeah2XfKYFAU2JEZP5fPMxCwgoyOqvvyd/V7nUe
	 a6lxZgZWb5HORVkVY02vIaFIUsuDEyKOcWdLaw3DIIwxhOeJKtZxhUrH4aMlbXfjmj
	 8+c4QXk3XTRRf/ATdzCXr/z/+HShwNsm9cGxWvqPPQgvvuVfm2p9OwAcGv3Kn9w9F3
	 QrrDqL2sRNftMizdLLrjiH1TloNxAf4vp0A7yLgotYb5HjG5hkjAiyzYTOqz5Zm2nW
	 y49FnZxxx0O/xpgNJZ7dbeXiUI0T9jRcjdjO1xVqeW8uoaVf+SAndQrJoJ+kQl4blA
	 Tegld/1cHKngg==
Reply-To: joakimlarson@skendiaelevator.com
From: info@quicklyemailsend77.com
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?7YyQ66ekIOusuOydmCAyMDI0?=
Date: 05 Mar 2024 19:51:48 -0800
Message-ID: <20240305195148.D964D8F8DEB62905@quicklyemailsend77.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable


=EC=95=88=EB=85=95=ED=95=98=EC=84=B8=EC=9A=94
=20
=EC=8A=A4=EC=9B=A8=EB=8D=B4 =EC=8A=A4=EC=B9=B8=EB=94=94=EC=95=84 =EC=97=98=
=EB=A0=88=EB=B0=94=ED=86=A0(Skandia Elevato)=EC=97=90=EC=84=9C =EC=98=A8 =
=EC=9A=94=EC=95=84=ED=82=B4 =EB=9D=BC=EB=A5=B4=EC=86=90(JOAKIM LARSSON) .
=20
=EC=9A=B0=EB=A6=AC=EB=8A=94 =EA=B8=B4=EA=B8=89=ED=95=98=EA=B2=8C =EA=B7=80=
=ED=95=98=EC=9D=98 =EC=A0=9C=ED=92=88=EC=9D=84 =ED=95=84=EC=9A=94=EB=A1=9C =
=ED=95=98=EB=A9=B0 =EA=B0=80=EB=8A=A5=ED=95=9C =ED=95=9C =EB=B9=A8=EB=A6=AC=
 =EC=8B=9C=ED=97=98 =EC=A3=BC=EB=AC=B8=EC=9D=84 =ED=95=98=EA=B3=A0 =EC=8B=
=B6=EC=8A=B5=EB=8B=88=EB=8B=A4. 
=20
=EC=98=A8=EB=9D=BC=EC=9D=B8=EC=9C=BC=EB=A1=9C =EC=A0=9C=ED=92=88=EC=97=90 =
=EB=8C=80=ED=95=9C =EC=A0=95=EB=B3=B4=EB=A5=BC =EC=88=98=EC=A7=91=ED=95=98=
=EA=B3=A0 =EC=9E=88=EC=8A=B5=EB=8B=88=EB=8B=A4. 
=20
=EA=B7=B8=EB=A6=AC=EA=B3=A0 =EB=82=B4 =EB=AA=A8=EC=9E=84=EC=97=90=EC=84=9C =
=EB=82=98=EB=8A=94 =EC=9A=B0=EB=A6=AC=EA=B0=80 =EB=8B=B9=EC=8B=A0=EC=9D=98 =
=EC=A0=9C=ED=92=88=EC=9D=84 =EC=A3=BC=EB=AC=B8=ED=95=A0 =EA=B2=83=EC=9D=B4=
=EB=9D=BC=EA=B3=A0 =EC=83=9D=EA=B0=81=ED=95=A9=EB=8B=88=EB=8B=A4.
=20
1. =EC=B5=9C=EC=8B=A0 Catalouge=EB=A5=BC =EB=B3=B4=EB=82=BC =EC=88=98 =EC=
=9E=88=EC=8A=B5=EB=8B=88=EA=B9=8C?
=20
2. =EC=9A=B0=EB=A6=AC=EA=B0=80 =EC=A3=BC=EB=AC=B8=ED=95=A0 =EC=88=98 =EC=9E=
=88=EB=8A=94 =EC=B5=9C=EC=86=8C=ED=95=9C=EC=9D=80 =EB=AC=B4=EC=97=87=EC=9D=
=B4=EA=B3=A0 =EB=98=90=ED=95=9C =EA=B8=B0=EA=B0=84=EC=9D=84 =EB=B3=B4=EB=82=
=B4=EC=8B=AD=EC=8B=9C=EC=98=A4=20
=EB=B0=8F =EC=A1=B0=EA=B1=B4.
3. =EC=9A=B0=EB=A6=AC=EA=B0=80 =EC=A3=BC=EB=AC=B8=ED=95=98=EB=8A=94 =EA=B2=
=BD=EC=9A=B0 =EC=A7=80=EB=B6=88=EC=9D=84 =EC=96=B4=EB=96=BB=EA=B2=8C =ED=95=
=B4=EA=B2=B0=ED=95=98=EA=B8=B0=EB=A5=BC =EC=9B=90=ED=95=98=EC=8B=AD=EB=8B=
=88=EA=B9=8C?
=20
=EA=B7=80=ED=95=98=EC=9D=98 =ED=9A=8C=EC=8B=A0 =EB=8C=80=EA=B8=B0 =EC=A4=91=


Mr Joakim larssonv(=EB=B6=80=EC=82=AC=EC=9E=A5/=EC=98=81=EC=97=85 =EA=B4=80=
=EB=A6=AC=EC=9E=90)

=EB=B0=A9=EB=AC=B8=EC=9E=90 =EC=A3=BC=EC=86=8C: Kedumsv=C3=A4gen 14, SE-534=
 94 Vara, Sweden

=EB=B0=B0=EC=86=A1 =EC=A3=BC=EC=86=8C: Industriv=C3=A4gen, SE-534 94 Vara, =
Sweden

joakimlarson@skendiaelevator.com
https://skandiaelevator.com


