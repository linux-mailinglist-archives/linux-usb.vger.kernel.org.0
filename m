Return-Path: <linux-usb+bounces-31525-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E4716CC5940
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 01:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EF573002D31
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 00:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618651A256B;
	Wed, 17 Dec 2025 00:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=natalieee.net header.i=@natalieee.net header.b="oYg424Hj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.sakamoto.pl (mail.sakamoto.pl [185.236.240.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37CF17A2FA
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.236.240.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765930820; cv=none; b=lljexhRuuffEgfvMCxXGuZyq4zf8eKyGceORh+xPkTt/4ysj11f4pUIWvXvBO2dsqH8xp3Zy9KF0+r1SvQlqXd31nt4cH/nBpgyxyphgxy3qd2PMl8yX/FB+jAnl7NdTnbqWdK9e27ogiHQq4ZWFYMgo2Zyrfs3+3kqN0HinEL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765930820; c=relaxed/simple;
	bh=kS8ESbsKp51luQLKna32Yyd6ljyTzl/ZABIwy5ifsY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KaKKF5Ah6Gjadnb8PsCuIB5Sh/UFMsEAmBqq5ccxbp0MD6Ush81lBmIhep/1ClQITuBB1qRuTfwX4cj5F8Y3hCcbm9lutd/1a7YTzcuCWjlva1VbeVIEo20zzezyo5W2yRY1C1o6YfP33BMjEaAUZZEtT1rCl5aMtB4TPOXsraQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=natalieee.net; spf=pass smtp.mailfrom=natalieee.net; dkim=pass (2048-bit key) header.d=natalieee.net header.i=@natalieee.net header.b=oYg424Hj; arc=none smtp.client-ip=185.236.240.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=natalieee.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=natalieee.net
Authentication-Results: mail.sakamoto.pl;
	auth=pass (plain)
Message-ID: <d28d2b86-f016-431a-baa1-57cddc07ac94@natalieee.net>
Date: Tue, 16 Dec 2025 16:18:38 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trouble with drivers for Epson Moverio BT-40
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
References: <9c4491aa-88d3-4c9a-843c-2f0d471263e0@natalieee.net>
 <ade89a9d-6034-43e6-ba74-778db2f8837c@suse.com>
 <ce3a8714-bce5-4cac-ba80-f3c64e6ff5e9@natalieee.net>
 <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
Content-Language: en-US
From: natalie roentgen connolly <natalie@natalieee.net>
Autocrypt: addr=natalie@natalieee.net; keydata=
 xjMEZyF+dhYJKwYBBAHaRw8BAQdAuh3EVhqODqs4DQasm/jUILG+4cNj0Q3Gb8SITEhqNNvN
 PW5hdGFsaWUgcm9lbnRnZW4gY29ubm9sbHkgKGJlZXAgYm9vcCkgPG5hdGFsaWVAbmF0YWxp
 ZWVlLm5ldD7CmQQTFgoAQRYhBJo0/NsX3ToM9ZBiC6HD1we8+QjlBQJnIX52AhsDBQkDwmcA
 BQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEKHD1we8+Qjl0VYBAKrJtKM2bJj6hsU+
 kTt8HXxDNdCY37eSL6GxzQ4fGBqJAP9NuysVDyyFVL7HOkUa3XbNFkxgSNNfDSXnyXG1/JnZ
 Ds44BGchfnYSCisGAQQBl1UBBQEBB0CebBBPcowxbCbOIAM9aJAe2kHbNZ4bIxZT7klRjf0+
 WgMBCAfCfgQYFgoAJhYhBJo0/NsX3ToM9ZBiC6HD1we8+QjlBQJnIX52AhsMBQkDwmcAAAoJ
 EKHD1we8+QjldDoBAIj3f2uA6AWu08lWSBkEDKrzKMduShD/Pv8jvDyznHvHAP0VskOMQSFg
 9MBrwZ+7azZzgnCs2FSiZvHJW7HTo4v9Bw==
In-Reply-To: <b0899011-78bb-4fdd-9e49-3dad6b11a9e6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Haraka-GeoIP: US
X-Haraka-GeoIP-Received: 2601:1c2:880:14b0::6234:US
Received: from localhost (Unknown [127.0.0.1])
	by mail.sakamoto.pl (Haraka/3.0.3) with ESMTPSA id 9025DF36-1D6E-40CD-9E07-0D3D41478683.1
	envelope-from <natalie@natalieee.net>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Wed, 17 Dec 2025 01:19:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalieee.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 To: Subject: MIME-Version: Date: Message-ID; q=dns/txt; s=s20250406155;
 t=1765930798; bh=gFZ1C1H93fpJ9iqkZA5saLXtd3etTFHml34oHpuaIcA=;
 b=oYg424HjU59M95gkgwSmUXS11+5Wh+b6elITTYDmvOoHXbGph7ZjVggSXTOTUc+T85QbJ8fBL
 AbqG/XoqBtrPs/rrL7Cj+roCYgexa+GLfGAs7/uhhRh6bLSjix3SADgmI6UDRI3WKPwI852tU4N
 uFEw2QUEVtF49hcqNSLDgMRsDt0OpRBvUoHUzowu+JcAcd7Ku1Wg47FYvzqmz1KKK0HaoXqTlEj
 iiKKGHKDBg4u8IgdPAPn1JlOwKm/CpCxsp5+4U7uotX7RJLfxlXsoC+v1v4GMLVsnYjLENeqx3Z
 NSzKAFpHvLCaAtdRDihMNOcUdoVyjrKLOdEjOzS8JMEQ==

That patch seems to work perfectly. No errors were emitted from cdc-acm, 
and the following was printed to the kernel log as expected:
cdc_acm 7-1.2:1.1: ttyACM0: USB ACM device

The device correctly appears in /dev, as per the above log message.

Thanks,
Natalie

