Return-Path: <linux-usb+bounces-31629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE95CCEE74
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 09:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D362A306EF77
	for <lists+linux-usb@lfdr.de>; Fri, 19 Dec 2025 08:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893642E6116;
	Fri, 19 Dec 2025 08:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jkpKtc8N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18502E093B
	for <linux-usb@vger.kernel.org>; Fri, 19 Dec 2025 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766131813; cv=pass; b=BHZ/Ip2QMPqQf/J8uApgsvUO9JZfcQup7wI8X4YCAygo0x+DRMlAY6Rtk2Y4WKIxQemCXg+X/yVOMg2/W/wMU31geIY5U6KCyBEiKrbeEN5BPWg1wAs+MqVLh2FmRj48sBNAS+SmHpuDtUUnBTc7sc3roc/tmYeGtHftfTcQ68c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766131813; c=relaxed/simple;
	bh=SshNRPgIyfZhOL9g00Tx3x9NU8S7Oou4WRUj0p6RJMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkmR7IuejpJ6vngGxDazSncNeBA8vuhnVVFkpetdU+0JcbL39ZWPw77Wexokt/8zaxwcrTp6Sjljg37y1xz8/r3jndbdXzgndkwtspEWUzxCN77NM7wMZ0en7WZB4ixqIDiRxvEfrW7VJxiPjMWR/xGqPTJ+doYnMdUVGkeWkzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jkpKtc8N; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766131788;
 b=sbjaQ9mY875n0+heze8wVjMqfq9E79+eLQWqcmzbXY7Zi3HruTKcOKsFvk6c1wUsfgutJ8Ym
 c6tGWvTXW65b7B8oMdfpxFwUNdc+2yMowVmuXQkQZAXXDYjXmE3aBUXQVJH8gHWlctq+udxaWeS
 XdU/NcwVfPyGsvK/QkJuIwmwYTmTgJKIY76sgCLXE5Qo0+WM6PlM0xJNn171tkEf5vUDK5A+1es
 HRF2CzGtLsA49DgbMciO+M6puweJO27epd1Zr0KMcdaqN9eoEbbyFRVoQNhcawA5xA1gGSxjm/C
 O4g6EQNGIpA5tVNmoWIiZXHjuizPpNIVgBgNuikYysKHQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766131788;
 b=A/dML3fmhfPjeZYmT++vDXCKLrTq3tkWEB53Coij4Ci7LYZUHh5JOq0cIRPhMsH8Ajzl9YdE
 ePEEzpECTI0Tma8g2tKwGnDN+3cmx5H+I/SP3AVU69T490iURhPScHjGZlltjamqOK5yKK/FSHu
 B41hRbaka9FtITnAkkvk6XujV+qbzuIb1P2hzfrqKXACF2Qpsi8vxnDTxKtbSXqk0P1lRrysY+X
 1jqN8XOz8+YZ6llcDloTif658QlYuBxg4Ol7He7yBkrCzLSSH4A1z+byTmVXD9425BPafnbDoFI
 dvDYsVSVWCkscgBWV/Y+/+O7ZKXlh1m6A3gw5s/dsLCrA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 19 Dec 2025 09:09:47 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id AC51CCC0DAC;
	Fri, 19 Dec 2025 09:09:23 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject:
 Re: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Fri, 19 Dec 2025 09:09:23 +0100
Message-ID: <3357591.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To:
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
References:
 <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
 <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
 <CAMuHMdWEJ-eYwUTnotsTVEtKrujYVsEB4kFVjRYh3wXZvyjfGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXgDN6fwtz3yb91
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:5b88bc5d9b014baba218eed2fec8b5d2
X-cloud-security:scantime:2.167
DKIM-Signature: a=rsa-sha256;
 bh=9ZkmG5LDdBWcr5F9UYs40lXE33P3xPwDRyGsRHQ2ZJw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766131787; v=1;
 b=jkpKtc8NaQrRlJUJHjs+qSZrd2rOHQOOi2sH9d8qxrD0ox4YkRIvFSAPm60SXJRH8ZDt/Do6
 KSB00G8HZIEyXnFtVpR0L0shpEuvma99W9ALY0p69nniexbn+UPcSSWu+HLoKIqwrAXAUD5hYs0
 zAvLy4E2zSyTPn+GPV2JJDZ7evsd3yI0P4JSnLoUtGta7VzNcYo5F0ut0mk4hhTqPdMjQWk7aX9
 P7vJCkZ3+xTNz0S6KeOddfMFVuLZ9RqZpg5+Ur+C/zjCXHr5IBuE1CxlK493J6YRkCMnD6ffkaI
 N7+sltCTcYrLGaE/XhHQYJejxe7zkGZ9W4qXhucPJ5ZFw==

Am Donnerstag, 18. Dezember 2025, 16:26:10 CET schrieb Geert Uytterhoeven:
> Hi Alexander,
>=20
> On Thu, 18 Dec 2025 at 16:21, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> > Add "clock-output-names" which is a standard property for clock
> > providers.
>=20
> Why? Isn't that property sort of deprecated?

It is? Oh, I wasn't aware of that. Maybe the property should be
marked deprecated in dt schema then.

Thanks and best regards,
Alexander

>=20
> Will be replying to the cover letter next...
>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



