Return-Path: <linux-usb+bounces-14066-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD24895E553
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 22:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 890E7283D87
	for <lists+linux-usb@lfdr.de>; Sun, 25 Aug 2024 20:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E134154BFC;
	Sun, 25 Aug 2024 20:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b="jX2/Mxkj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920055898
	for <linux-usb@vger.kernel.org>; Sun, 25 Aug 2024 20:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724618328; cv=none; b=mnGIe8zVBExv1HxRg1j8rncvoxmmxJQA8kqFf8A8lmGyVETJcNM3qdO3axVQNeSsfGyB8HJf+mZ9M/qnDBHZ0AnU/RSVYP7VUa7t/D2dbCkjWzwO4M0juncdBMNe1U2pLXZ0Kn/k8uDV7QSZRW0ySOReU1QnSzqnBLeycXAJTgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724618328; c=relaxed/simple;
	bh=s/cRX82mBucJFy4Oi90fUcOAHj7/Q8lW3HS6n9HMrEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPgx54a44cXmgsr3DH49cfe0ZqKJ9Ycm1pNSLx9sCQ627pUD9ug28UskM4kNoOTEFUa5DbznlMG4I2IfgFjJXvqbOizQFYWFJrKcbO8hzMeDrpeWOtgbTGlFAY+UxgLtAjdSLmHq6WZDGDY+JblCgFSg4P0SRXIGk5hSvO2VCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=mista.tapas@gmx.net header.b=jX2/Mxkj; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1724618318; x=1725223118; i=mista.tapas@gmx.net;
	bh=s/cRX82mBucJFy4Oi90fUcOAHj7/Q8lW3HS6n9HMrEY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jX2/Mxkjf5LdL6cBZwm8snOkzz4BI0ffs9RG5Dx63PNN8lDVMVcNvaJjjjhFeAm3
	 LSUEi5hZYYAwz9FJw4EXcUB0++ypH+oYFKZhqrTuMN+kt5XbepOQMbwMUG5hgDyhO
	 0a1x8sWGpGgTNdDPkS2BiWx9WjCWa1jsZNtOui2+qxk8Uh/Wk13/xyBYMYTL18zPq
	 Lw0gaRw3E/850RSzpND4xeoIFqpvGAEECpuMhZ9lAhAWRl14Z9fM2MSE5GPxpnMR1
	 uiVkgnDodsEX46Ti812EWIfeI2wrrcaI5Itvfqdmjo6HGlOLMk3U+3Q7ah9/VXVAi
	 P2wdu6YDtUVAIQViGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.178.77] ([149.50.51.250]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mlw7f-1sGzkL1NDf-00kvg6; Sun, 25
 Aug 2024 22:38:38 +0200
Message-ID: <f3a44056-7a0c-4ca9-8049-f50ab303c95f@gmx.net>
Date: Sun, 25 Aug 2024 22:38:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Misbehaving Alder Lake-N PCH USB 3.2 xHCI Host Controller
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
References: <20240820130158.339b4d87@foxbook>
 <bb565e29-10e9-4211-a854-fdd9771149b4@gmx.net>
 <20240821150233.4f8f66ef@foxbook>
 <e6879e07-3548-41c1-b18a-55c40d041b86@linux.intel.com>
 <2b81ac60-32f5-4b71-98de-d336b7282cfb@gmx.net>
 <ffb0be5f-11f9-4f94-b292-f47885cfa26a@gmx.net>
 <20240825065831.0eaba5b2@foxbook>
 <67D20520-0374-4461-B626-5142F1D7B743@gmx.net>
 <20240825171537.33e49293@foxbook>
Content-Language: en-US
From: FPS <mista.tapas@gmx.net>
In-Reply-To: <20240825171537.33e49293@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fZg2a3NaUy1yZzwvGsp2BYC8/Z4M901la/6GTZ1jxQI0dkCl2jT
 eVBcAep+LEMWXVEZcTRQDka2PEsmS7l4ZLbPlUKl/lvnOX/hBEr6PBamFkVr1s29vQWWIkm
 NZvNxfdfF1ObmQVEZHZgAqf+14POpe/baMZOpjGmBUudcCvxFjMinDXpzjr2TV6wTK5NvnB
 UAZ4IQA9ILkCIE0I3vowg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XG2CyPjs7Ig=;cZyhkcCDkOIX/7ekq6KJyQVJDkM
 /VJudbEacEE6hKK8NwAf8fNABsDPxoVLdVkOBdbqYawB2qqvqAcuF2R3K0BqLguJ5QlX+P9Gb
 ybXONxFgGqW7X3mmwPf6+n9e0fLv3zvMBKZValfjGSK2YevnGqE6iFXrX17Hcy+q2gEicc6Mx
 wePyIdLLegOrjE/tEb8yWkZZSM942Zm4VbQGGto6UL9JV3iMXR/aXMyLOEVv99dU3YoIQFgtt
 51hyCpP9E4wqon94Kl+11q71mE7K4btqK9biTmw0PxFDnaQMaFDJYewNR2t/uaCMLuly/6zK7
 YjVG6Ef91i/KePFknr9XJVTf7JAZQKEGOZZ7HuVtKyzJR6CrbCz+rF7fcI2TupK9df2y4+Frr
 T7U9M5/Y3zybBHX1ZozJxoyKK5FR9o5cKiJjYuFjClqXHlbjBZjjZgNIGTJUDr1dZGdZk9kh8
 XLb13w3We6uz81nyjVq3FbeqatKPJYCxIMtDzGNycWYr9zq1cocoVpKJrZfiJOpqK10AXp4Vg
 X9cNcBHa9ksH15Du8916iR2L156IzgHt4OQJj8Gm6wptkG2wI//0TRpQkHG3zJosyZ50FrMW8
 f/sPrgAa12SLo8kZ9Bt+EpBPpvSywJuNR9mNtXSZ7dJ20Mfvjzw8LjgrH85mC0ELlKwI2K2X+
 VHSxnlnG6O1YYMxsDLIpk3azfNWswyFhAUcVU0lDYJdNG2cwPvaXyWuubJB7U1Lx7G35orkBJ
 1DFr18aZKdL3Mz0zRRWr0ARIe+h86SpMgXAvv/yl3lA+J3X2T/IPd86CIkzHPlUlf30kquhMc
 c9flY5jy6B6N43UqnGlVoE0w==

On 8/25/24 5:15 PM, Micha=C5=82 Pecio wrote:
> What is the last digit of your HCSPARAMS2 register?
> Here's my three hosts, guess which is the one with problems.
>
> grep HCSPARAMS2 /sys/kernel/debug/usb/xhci/*/reg-cap
> /sys/kernel/debug/usb/xhci/0000:02:00.0/reg-cap:HCSPARAMS2 =3D 0xfc0000f=
a
> /sys/kernel/debug/usb/xhci/0000:03:00.0/reg-cap:HCSPARAMS2 =3D 0xfc00003=
1
> /sys/kernel/debug/usb/xhci/0000:04:00.0/reg-cap:HCSPARAMS2 =3D 0x0000001=
1

Well, the only one with IST[3] set is 0000:02:00.0 and not only that,
but 0x0A & 0x07 =3D=3D 2 so it wants the TRBs at least 2 _frames_ =3D=3D 2=
 ms
ahead of time. Or did I completely miss something here? :)

> See xHCI section 5.3.4. If IST is high, you are probably out of luck.

In my case (on the N97 system) it's a little different though:

# grep HCSPARAMS2 /sys/kernel/debug/usb/xhci/0000\:00\:14.0/reg-cap
HCSPARAMS2 =3D 0x14200054

=3D=3D b00010 1 00001 0000000000000 0101 0100

IST[3] is low, and IST[2:0] =3D=3D 4, so I would expect that (taking
paragraph 2 of xHCI section 4.14.2.1.4 into account) 1 ms would be
enough: 4 + 1 microframes =3D=3D 675 us.

On my N100 system, the working Renesas controller has:

/sys/kernel/debug/usb/xhci/0000:01:00.0/reg-cap:HCSPARAMS2 =3D 0x24000011

1 (+1) microframes - not too shabby. And the Intel one:

/sys/kernel/debug/usb/xhci/0000:00:14.0/reg-cap:HCSPARAMS2 =3D 0x14200054

again the same as on my N97 system.

BTW: Should I still try your 2 patches from the earlier email?

Kind regards,
FPS

