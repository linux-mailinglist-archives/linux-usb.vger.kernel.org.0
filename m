Return-Path: <linux-usb+bounces-23638-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972E3AA6C98
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 10:36:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0472D4A3260
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 08:36:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF9822A819;
	Fri,  2 May 2025 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="OKfC+EFs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFDA8828
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746174976; cv=none; b=d+IX2hq1XMdZ7xwwjKeuH8xDV/euxJnoWtkmagXXStGTdD3m9JrLqZ7ZaRLy2glnihhH8HxsYkkzStfFHK+uX7la4AMHseX2SkZ1la0OxJEC6P1tR7Hyo8Ebtupvj55k9tE2Qmv4kvbklVwYQRkRBKeUlhzRqPswXAgx+42zDeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746174976; c=relaxed/simple;
	bh=5A9Az7mveTcN/pRWecXhcMMNcg2YzTc3csqabayBRlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P7E0RWnhYbCfxH/JLwDsgKuFCmQp5n3gq8wY5w7K/tEO1wD4UnAxaRfLRM2QfzLi9RFvqwqlBEwl25OF11Q5VWyE3WsmuxLUzBvt4Y1yGQheUKdnuMw9HZkZJfl+x60gH+gcsOw+hP9jBueD10+nPt+rrUN+gT0NDpY26UlCrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=OKfC+EFs; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1746174952; x=1746779752; i=wahrenst@gmx.net;
	bh=tmVg51H/Yx90+RAu75wKXY77CC6WojNhJpztbe5mbg0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=OKfC+EFsfLBzXikqvevrFI/5BZT2NcoCX8NsXcQQo1IL/ZLSejulEwnbNDFr6ouo
	 LOABjU1I0QROAPM9Zxc3CExob1PxZADZ6QRbhngGbb7xCk3k7U5Ms+Hk0CMxybnKa
	 tnDKl2Mr6lvn28xoBQgBN3kunSAlazrJV1gPWnK9RlzWPVqgpiXKxVcZDrSyJI+7c
	 A0cdJ1Bs+ubbu0vr94N3XP5b9BEMrF0zGGzOy4ymdxy70ASCHvQjrC0zbs0gmSdNG
	 z+bGkuLKpGjvklx6jEM6yN752N9iUZhktkimv5Fz0CniUaSYE/b4N87OFmLr0VC15
	 aUVp8mYIKgxHvcHwrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.101] ([91.41.209.218]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeCtZ-1ujYat1jip-00cVId; Fri, 02
 May 2025 10:35:52 +0200
Message-ID: <dafb48d3-2649-4a86-a889-f2d2750a5e70@gmx.net>
Date: Fri, 2 May 2025 10:35:51 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Fix NPD of usbmisc_data
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, stable@kernel.org
References: <20250422185601.80199-1-wahrenst@gmx.net>
 <2025050100-getting-curler-88aa@gregkh>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <2025050100-getting-curler-88aa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LsyS8aSCwkrSLe7pRcJgNJp8ebWNRWG3oos8dN7lkBf3GcOAqfX
 NZSfFaY7exw4BwB8v5EgzuschXTWS/2QRMV05YkJbTJfgL//vxgsimPxm418uPAEtcbR6IE
 3lmDvD674e8vq3JUVE851jwoBSiSSrOC1S32gwZjzRNOLAFzy+l7/KJbBOPIaggmWPTNuoQ
 Gm5qfDBeB4rzIduIjzDUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O+wwewcszP4=;W0nund+Bs/xQsV8U4wS4AoJ3lOV
 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
 XOHntyHZ1gpiDtFHx9ZzIekZK5Fdayw=

Am 01.05.25 um 17:38 schrieb Greg Kroah-Hartman:
> On Tue, Apr 22, 2025 at 08:56:01PM +0200, Stefan Wahren wrote:
>> The commit 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device'=
s
>> refcount in .remove() and in the error path of .probe()") introduced
>> a NULL pointer dereference on platforms which have no usbmisc_data
>> (e.g. i.MX28). So add the missing checks in .probe() and .remove().
>>
>> Fixes: 74adad500346 ("usb: chipidea: ci_hdrc_imx: decrement device's re=
fcount in .remove() and in the error path of .probe()")
>> Cc: <stable@kernel.org>
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/usb/chipidea/ci_hdrc_imx.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
> Does not apply to 6.15-rc4 at all, can you rebase and resubmit?
Sorry, i didn't noticed that Fedor Pchelkin already send "usb: chipidea:=
=20
ci_hdrc_imx: fix usbmisc handling" in March to fix this.

Regards
>
> thanks,
>
> greg k-h


