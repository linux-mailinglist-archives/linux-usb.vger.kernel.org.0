Return-Path: <linux-usb+bounces-22298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A25A74BA3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 14:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85DD23A8FAC
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 13:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29F2188A0E;
	Fri, 28 Mar 2025 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gnc6CQMz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B9F13B2A4
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 13:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169048; cv=none; b=AIhi5imQUHMmudqr7dPcpLeTdR8me2nB9UEg2zNmcQEGQ7wBFtc/iJyiA8sjaOZ2VTZj6+VDnVfaLfUyfYG3qwslgPWZQHbc8ApxNfVkYbq5Bg8KKmR/JsxOxvBFTwG8CmWyL+Fjq0+FwM/D+Plsp9m0AiHZ7hi0+XCDxVEQt2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169048; c=relaxed/simple;
	bh=JbTBJRO6wNNcMyk7LUysmH5nCKUsjPBNp+4MPN5pAKU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=J/7qUA0+DUuaS4XtSfHSVaH2GSikVIpvUdlYiJisQmQQuJOFTi5h2eGFQ111WeYNqsOH2AWzKU83DipOJrg97sNBuPEHT9JlZQJ7kUlKhp2HqsH3M3fpFO6mmvCrpLm5WrBwKnMqUyxnYpET6Yp1CbdHuWTDXz6qBVHmnN2JW4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=gnc6CQMz; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1743169044; x=1743773844; i=wahrenst@gmx.net;
	bh=JbTBJRO6wNNcMyk7LUysmH5nCKUsjPBNp+4MPN5pAKU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gnc6CQMzwuxHrzAmebplHxpeyjNfeXRYFOq6QyyjOyh3qhU0b6WTEwodaG/QAAf8
	 vvrr3HHPQodjyDNGu205TjRae1i57qD9D+e57dmYieOMrK4IJUJWtrXLrz6ad65Zf
	 8WIt80kvaUtNb0yvnJ4w8vEC0fNyhoAzznQ4/n/GKXVIbJpx24e2CBtgbIs8bS0CI
	 dobtV0VXt73U587SfZ0n/KdlJcn1xEKUG7e/rfCWJG+Dwu/DI2SRLhcdd1rkywpBh
	 UFlpuNk6hSYq4w23mBfJOIVcLML4hZR4YIhjzx6FGgSrSte23vtaXXZIQzHCeWDoS
	 guJSN8OaFhBgQz1WHQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MplXp-1tLmso3yKD-00bOkb; Fri, 28
 Mar 2025 14:37:24 +0100
Message-ID: <bda32f68-fe51-4814-82ba-00fd742ac39b@gmx.net>
Date: Fri, 28 Mar 2025 14:37:23 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: szabo.zsolt@szabofrigocargo.hu
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
From: Stefan Wahren <wahrenst@gmx.net>
Subject: =?UTF-8?Q?Re=3A_Raspberry_Pi_Freezes_on_SIM7600_Reset_=E2=80=93_Inf?=
 =?UTF-8?Q?inite_qmi=5Fwwan_EPROTO_Errors?=
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gEORvf3IRLtKMFRnGPa/dXDPYy70ZEwBjgWi6xtgwJi/Wruo0GJ
 RWNMw00V6+QcJfc7iGR/ZlVkWHy0jgu0L3MnakG4Wey1wwP+RKxYQ5WWlOvrq/08d43h08k
 oej25Cew46OQXM7ARVhrxsBECmxd7bSuXv7gEa6BH980ZWg/qa8MkHNlmhQ8fIX6tNjLdEI
 eFhKKz9KUDB4ClaHIUEAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LXs1qHBu0sk=;VcNKsCNI48DFh0vOkvDtGxlmaGp
 YG1pYgj1uytlNcj8xGRBUUvJN7UM1bg144S3rbBkoCHw9dXD8luWTcEgjZnFpK5mXCji74U6V
 0JF2i8yuA41mbZXVsyFGXy1dLzSyG7i6qTTXHeAZhbcN7eRPEDnMOxTyGv3ky1T1TxtD3E93H
 ZUC9Uo8553rY+0Ch6i3gbb1Ianw1Hw7pbEWu5Hx97CRNTCb/onXmKwMfH+/78viZmFiLX7c72
 l9y9wYuxuM/upEtZvfclBAB5Ydx1m6vJjNjEGYO3oc9RnjL5XqCqLgfR1TJAPfWKBUpa8ejQl
 E9OEma4h2eLa6a56QTjED/kd6T1mzum4aepvb3o2TkyiokdYTTWUGOfD0ts0Z6uCGLdwmGCTB
 bYU3pz78M0L7W+SN5/6zOaldUvi0heYbsjRZ0Ovi4eRSfX7Caw8v0pdo5oFQKITHFpyNbMEgW
 E2UpqrSsEiyp8wCoclfwI/EQ6BtroKij/aoJiuJLpSbun3HZdgdswGEyNVv+c1uhQixl4FZzw
 DXUvn+qQB+YdX5hVROMszqjXOXU405x+QjRNpnBbJL98VrEi9zQWwtrgfkXsBFyyhJACRkMF4
 8bNEpRTwDipEjoXN2nEZBiGlQdvDonBJ5ILTFiTYLN9qdsx/JJ/tFw4ShpoqntUyXpX/7mjjD
 byF2ovUsvc2WJAs29BtBaKn6DovEkJNu7oIM0+Q8t27AsMrWL+zMePlikbHNEa5uH7s6M3ir4
 ITuy4r3z/2Suq5x2qFHCRP3aQCVzNOu/eQUxXFZNAqkOhMwmxldCzpXvgunsGVcdPM6LNxcSt
 /xjgTB856QZ4Nzu1A6v4quFIJaKPXO6I7SDQ+lqIjIR89K0kwYyRnU7+TUgogmkQa0/LG5Mam
 bY6fSg+7q/u6YmDcKYqZigz7UlRRFn0jhPSdzkYBkcwi9pNzylbgIuAXL/IdjNYEtd3YEavH9
 tMyN1DMAaPuKQbinat39Trnr+KeQHnPxd+FvaxesID9GHFxkCcYBSR3s0uPwqiYQ1GWK8HlMr
 Jyb6sxYK9WnY0yVUpziDi1A8ZJ2S8XtsNEP2mLgtA9KaLHBuyIVvscha+yGasELNHYEL64hn1
 kuR6nk+lGa31pqZPPRwUySwjne+xI1fr6COmIoTd+9v5xyOkoOfVH0Yd5S8wh023jLi633did
 megt5CgIrBnviVFZgdPp+IBN4BLjnn07eYpjndzUtN3mkPS1VZSFBC9LNkXyMnWhbG1w+Q9Yh
 JH9Xbzp8z00oIWX6HwmZ7Cm5AouOolzIm8HSbUPtexIrOVzmDnFSlMbNYUNV0COwBS3si0X9f
 lpGN/bbHHKEEYlInbUogCzX9x1cKhPIss05znTn8DfzlXGsOHrCNosjjBDbk6VDjuXO1Bbf4k
 SJGUsfCObVjcr/sLirTeQmGfYReThSaspTWydziRpZBwsu4Du8msnY7/fAUkyqfL60GzXXpju
 JKkUG8/g+KvUGMBtN5JcNs884/gw=

Hi Szabo,

thank for the report. Unfortunately i'm not able to answer to your
question, but i like to share some hints to increase the chances to get
a response.

1. Please don't send HTML mails. In case you want report kernel
messages, please include them as text.

2. linux-usb is a mailing list, about the mainline kernel. But
6.6.51+rpt-rpi-v7 based on the vendor kernel from Raspberry Pi. So
please try to reproduce the issue with a recent mainline kernel like
6.14. The vendor tree uses a different USB host driver, which is not
available in mainline.

Best regards

