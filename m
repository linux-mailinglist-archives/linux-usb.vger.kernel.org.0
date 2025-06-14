Return-Path: <linux-usb+bounces-24744-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B12AD9A37
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 07:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8B1189E85B
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 05:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1234D1DED70;
	Sat, 14 Jun 2025 05:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="QkrhhmNr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20AD1DE4D8
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 05:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749878739; cv=none; b=BcOpvU4P51ZWhk8FXhUMappKygrkaXDhA89mxKe+VL0KHHECr+PAnQjfX+/8O/rASUBovW/YUBbjp1E9XUs/cg/szHjekqhTSRR78s+lZikoUkwDronjfwm8dd86jn+nCakMFaKNAzL+eOCijT7Shw9CI8qblVLg9odwVjaHOyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749878739; c=relaxed/simple;
	bh=aUQediynNeIt4Zd4O4po1UWxvrAAcfZz8SYP3eM6f1A=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=ML0v+hD9Y4zpxT2P7OBdA/Tj1IrHS6I/t6E/Eotm57q+89czFO4MdJcVJ7LACyoT6ZsZJ/35cIlRYk/8Zhf0VfUkcR2dGVxmOgsp7hsxLuFTxil0m0Bskxd5UJ5+KMj724llDxtIk1QXip+yNgrmFMDyCYRdfXBdzuoEv4bhuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b=QkrhhmNr; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1749878735; x=1750483535; i=quwenruo.btrfs@gmx.com;
	bh=nz6Hk9xulxE8Wq0JdWBds+O/fcCRO8fx0Ye//AaTpqQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QkrhhmNrrgkMNPjne4dp2PknHTyZfE1SMLsYkX0IL9nObLqPwDGDppB1IgZ+WjNY
	 kRT7PkzwBgOztQ9bz9KNyGFUI4hPWh4YXBDlHrQYNlDK2UANlqOkFVbYnMFxXwlCs
	 MRU4O9UsNtOqe9I336nE2lJmLFZYv0Iwv04hQU6J1gTOE/IBO+9ku/Vit777Vr7e6
	 Ty3oTqNnybzrVTcD9Wd8BlC9yCvmUfFldrLtoccTidZQRjXYogU2CF9EO6afvBvy2
	 DTU4w/f0gbovrvRfEE+3zVcFM44GaoYFSTxPgyko7/Zf668mn4s3Mql+BC9n2wNqY
	 UlBsOnYBKNTFfoxY8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MaJ3t-1uKeUN1Doj-00Q7e7 for
 <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 07:25:34 +0200
Message-ID: <36908687-b1b9-4cbe-aa89-e9035001070e@gmx.com>
Date: Sat, 14 Jun 2025 14:55:31 +0930
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: How to check the highest speed and supported alt-mode for a usb-host?
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r1bdeEG+PQx1cg5g1+tj8YseRKP5CNO9tCosDYZjpgHF3P1UaF3
 h5wFsCEdlCtekxIB0fWyDdo4haV0p0FM3lYXvtLEMZ1rKlmpTT1q7c/B0DoEYrt0L0Ozz7i
 o0iXtmIq1kUyEpzMfKKtyyf86BkUjsD/KOAG+O0MWgKjB7YaE4xuXFA4VPQHU0ZVF9UZ32C
 6Whs/YUEdIlmD+w40YXrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ELQsX6poeec=;EyMYTAbeuJFXs64FU1M1hBg5ns4
 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

Hi,

With more and more usb-c hosts (and their alt-modes) found in=20
laptops/pcs, I'm wondering what's the most accurate way inside linux to=20
check the highest speed and hopefully alt modes.

There is `lsusb -tv`, but the speed only shows upto 10Gbps, meanwhile my=
=20
usb host supports USB4, thus I think it should be much higher:

/:  Bus 006.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1p,=20
10000M <<<
     ID 1d6b:0003 Linux Foundation 3.0 root hub
     |__ Port 001: Dev 002, If 0, Class=3DImaging, Driver=3D[none], 5000M
         ID 18d1:4ee1 Google Inc. Nexus/Pixel Device (MTP)



Another thing is related to alt-mode, which I understand is very hard to=
=20
check because the controller may support alt-mode but has no DP input=20
connected etc.

But if there is some interface reporting the supported alt-modes of a=20
host controller, it will be very helpful.

Thanks,
Qu

