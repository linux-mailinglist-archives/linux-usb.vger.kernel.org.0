Return-Path: <linux-usb+bounces-13796-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04732959EFD
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 15:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B511F22E70
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 13:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9ED1AF4D6;
	Wed, 21 Aug 2024 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="qcwkPxun"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78CF18990A
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 13:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724247987; cv=none; b=JP0MdyMdv//fhu3sjSCjxd77H3MAE/KCiX6qdWyOXNwWz/ISg3JP9Tn1Y8tXK/bmdGUlHcBmaei76BQUSbC/aS/4DDs7uXKw1oTkSKhOUMPQxXXgOY4iQXTSqSYQ4kRHO6ntP+7RlqA8vY/30e4NRboWB18hAciZBIGRaxq3XG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724247987; c=relaxed/simple;
	bh=fNcoXQKcW58hQ90gTot4onIq/v+meyAJThU1QoTFyCM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=THlXNWJwUCWhPExPDC0Rs+vWGAEmjIOzNaw29+1RCmXojALSQObdCmrfaKMcAd+3j4HyD3WONSLCZMgEeCwx+35I4pdUIWoaau9yGg6r+1rQoGKsNa6k1V90GIwbMrN7teMlgkX1tW4RJuvwrAbpEVpNYWNfdbsFIH/oo0Giijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=qcwkPxun; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724247979; x=1724852779; i=mista.tapas@gmx.net;
	bh=fNcoXQKcW58hQ90gTot4onIq/v+meyAJThU1QoTFyCM=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qcwkPxun0hbr68uPf67gRoSfH/d2I/qFuNq493M4ACe6AigHXqgF2Sv554AM8628
	 WWOrZxnbOno8BBMKknH6YpqbHmUkdtyACj0KGYFn07v6RGDR8tD67oF/orOHwTUvJ
	 p2CzZviQ8k91OcfZDqDCpI8vflojbs4lEgO92k3FzG6Sc5pqI49CIvGYJ9l7E0jap
	 JqIpuhUWSGAor9c+FMKvPeb4qbzQvJ8I0MPSNbgxPtmT4YXBayXM3qKvb8nxWHbKS
	 FXT4w+Y4mEIKizfBsnw5H5RRtcadmmfmVoiE9idx5oL/e/67xL4JKMRhwdT+i820m
	 ne8IBWrkyVOPxIy2jQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([178.208.121.177]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MV63g-1sXJDY2Y3q-00RIvt; Wed, 21
 Aug 2024 15:46:18 +0200
Date: Wed, 21 Aug 2024 15:46:18 +0200
From: fps <mista.tapas@gmx.net>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
CC: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
User-Agent: K-9 Mail for Android
In-Reply-To: <20240821150233.4f8f66ef@foxbook>
References: <20240820130158.339b4d87@foxbook> <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net> <20240821150233.4f8f66ef@foxbook>
Message-ID: <C3CE5108-353F-46CF-AB22-74A01B4F3874@gmx.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jRW8stbNEGxMUB278ea8K3Laze6MQPbXK8f6rqTEAIDoTASPEBq
 iOIbcYR3J7vBXvew0mx/RW+qXOFKs4h7ROef16szmOvlwWfbP74jSdonkvg+PQMgz8H34ko
 XfFZwxk8BS/fCW3E032vRabAeFtZypDjZ6+JsAbim4U806xmM+MYgHmhSg9v0qpmwv2NDD9
 ZhsITeuIdBN5pc8vt1Jdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tuGW1DxMCtQ=;3MHbeGI2jMC/H2ZE22PMBxUcSWL
 ABSdoMNGHWFLnUYMa0N60i6wmjoJwYc2K2qrbphuNhfAEmERceNLgMxEQeWQn5DVuFDQ+NHHa
 0asI4u6k2fqe3yak8hivOuEo1ldcF6yBKbWij/Yjo/5hOf5MHgymUkn92N+7NC1ZX7RgJAy40
 kC8L/cg+3UIxDzYwFPaMj+ALUZesvqN96Q6WdIVjHIKD/ayn6eiQR3BWuObsI5XxkX33cOJCM
 dhgVOX4G8zYw5jx9umTPo8w1EV8sTAYeftn8gNERjT+cNaMrSyd1qCf7LZCzA1GFRWDDfXdAP
 8No7sLQCS2KsbTqsp/6j4V0X3oPDioZW1IACjIKaC2HrzupNcKulhNAPRzAB+xun0P2yKcTGZ
 JqXAYmXHZUGLqgRP/cbPoeQ55BKN944PsFyNs6w4s+yRImuqs47dMSU3WX2p0Jl4o6wT/CGPX
 PNdxcDZZ9NYu7CR7HJ7BLTc0j2Uh+ueSzAg5l/LK85QGaFKlib6spqdUuBF8brm4JSMikwDdm
 Guz5oP4JkU0bqejpvR/o8ihMp01jYZwakH2WG1sOqE3A3soiDLtLMOK5/qsGHnpurD+zqtSf7
 RoM7PmkMtQW1otmtynI67lgvSQ205kRuOZRXLJM7JnpmZn4bFfxwZfZc8ft7r1v+raFkj6LRD
 rQ+UcTVrcIE2jHmHIBxjVYwK9MMJVCV64XW+Ubv+TeGUBJI8uHgNv6ncBRIGTwflPmITEfXZ0
 Thqy1vO/Pyd+cl0xL2fOOYPepN0iv9KExm9LiNgwHPJf17Y2fDl7oluz3aAJ+WEC8Y7sLHsph
 0CRzUWsbmho32j2FYqQxDaLw==

Hi again!

Thanks for the patches! I will try and see if I get them applied to my ker=
nel and test them later tonight - I have a baby daughter at home, which mig=
ht cause me to miss my service deadline ;)

FPS

