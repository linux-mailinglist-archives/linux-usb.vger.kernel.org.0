Return-Path: <linux-usb+bounces-35356-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GbMBhH6wWlSYgQAu9opvQ
	(envelope-from <linux-usb+bounces-35356-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:42:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89A301457
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 03:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B4C5300FECE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 02:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4135386C38;
	Tue, 24 Mar 2026 02:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbA8KnZV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4C1F30AD
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 02:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774319917; cv=none; b=pWqvtYMNxIhlDyzKDu6jYvvl7WXVvzENb6HBeoU16FtdEjo3s9YqhKXhn+VnPNef1awsrL4f4jOxxZqcUVb3yQQM0aMd3O6ywrudSRobeastk87GntHEKmnJ4MmykdtdSDhgOIYPBCL4glYit3b0JW9Mrx66IKwdToDKZV+WpVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774319917; c=relaxed/simple;
	bh=wtuCSFP1+FdCP/Ko/Dz3BZlfpBIvDLYkst4lyMZcr88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DS8LQHrmtfXmsuH8ZfqpbGh6wuews54ByXkqVy26OSV9FyoLjxFuqurHcVdM58YfpVLaOOKFs10wXLc/7byL66ZU4y7/Kn/rz9ud89Nc+NmS2dOSrwjI+BmOb50GTil5N6j0LW58dmsfhgdIM458HHYpLKi63lpl89dtkEGwq6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbA8KnZV; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35b982990aeso629397a91.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 19:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774319915; x=1774924715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+OHN9SidwM4mOMyIea3fSL57NYFeZ5w74p9KZ3JEjoQ=;
        b=qbA8KnZVjdN7E6K88C5xOa5VAYHHhw+E9q2xenbO26vqsddosOdritNjQEwMpZPCHs
         zBzK8LdCrQQ5ZtWY/vpHB20FwYUQxEPamwPFCwjH8mKVpwWpw/gDYJrYbuQT1cdUmUKi
         EsWpsRK5S5H40TE13DYQdRf5SsaI7qpX6BfHUU5UZJj8wg1c2T/vXABjz4n/nj8nby/4
         NuLtKf7o9dzKJsLqroS1pOz6qOzB0pollcCVY3d97KbdlIHcARZMwjB2QhL4K8mIR/DR
         8CCftn8lYT3F5i3m0VoU8nCkblJljolbpQDPfL42XYNiZz6Z9+SqPCnqU193oFtYchgk
         VQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774319915; x=1774924715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OHN9SidwM4mOMyIea3fSL57NYFeZ5w74p9KZ3JEjoQ=;
        b=X8RNqOOG2mmO+3ho5L3+nP+ljfO7PNZrLISWcdBoErI6jiXnk1ELY8kXl2RIATyVvv
         1iohIbKYxmr1xWrLo/fO/jMbY43SozVxuaCWLcu0WttBfQY+uvQuoMN7tTjNg5zXdHE7
         4xphMWaNDWAtj+nOSi5cm4hu0x1NrCH2sQPkS8vPlEMM84/hb6n7iqmncgUxhgJbIQGJ
         shr+NgR+Vq9EthgPIMjC/sYKRH3jrvfbimVS+IOA9W0TkboL2ktZffxgyW5k00LrNsb8
         JkQw7VvTkJKb4fgYgRhOHC1crUumSDL1+osb5bujZkIQxCEKEyxt7rajSPaRI709W5Wm
         XXyQ==
X-Gm-Message-State: AOJu0Yy3t1jrvaZ0/fUC1yEfgPEB86Ch570iMLBdvRc4WTjfXL8esn/q
	yVOaOVgP7oUywv9CDRp1NOJMNr7s91yxup9LZ+3Qx2RYEY/0b1sZtJcRedpArg==
X-Gm-Gg: ATEYQzziU/H8jNIQqgnYuB1jB39Tnl9In63tyIQObb1ak0riNQtTJs5grOJiYxHymRZ
	Z8urMFMlZ+JCRXHPeYinTPjS9mUkHH7LNxpZ21OcZLJqz32otpXTI01GYpwCeDp/OWp3gK032ki
	6SokNma+mz50SRrPRpHOw15F+6CLtX1FSCVz9/9PQQdYXYWF7333Fbwr6cBSE64AYZTmX/bNjsV
	0qHarhutTebVauNPsMaB300M0d/UAYQ2SrNesiO0pI+l2Fea23Pj4x1QlU6uqY34gggmviKv4Nt
	knlhXVNeF4ROBSHGk1ymNtWF0m7Z5u53MP+qUhZjKJkw1mf2yEWLaZakBJ42WNsXbAMHwBQ55Bw
	Ksw1RwDITRs8xKWPe8ePD7fKwNDHHsvEaTT67ggV7dJFtgY+nJ+5Oc5n20aejyw0qKk44/DYV8O
	nxiuzYbqQO/xIx7aKjlfuD38Ms+SS/esp3cGaWBtFJ18Y=
X-Received: by 2002:a17:90b:2684:b0:35b:ed51:afac with SMTP id 98e67ed59e1d1-35bed51b526mr3860146a91.6.1774319915497;
        Mon, 23 Mar 2026 19:38:35 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.167.11])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-35c03149db2sm503511a91.9.2026.03.23.19.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 19:38:35 -0700 (PDT)
Message-ID: <f547c497-8da1-4993-8d52-579f42810aba@gmail.com>
Date: Tue, 24 Mar 2026 09:38:30 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: Add MeiG Smart SRT853
To: Ernestas Kulik <ernestas.k@iconn-networks.com>, johan@kernel.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323143753.686561-1-ernestas.k@iconn-networks.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260323143753.686561-1-ernestas.k@iconn-networks.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35356-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F89A301457
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-23 21:37, Ernestas Kulik wrote:
> This commit adds support for the MeiG Smart SRT853 5G CPE modem.
> 
> If#= 0: RNDIS
> If#= 1: RNDIS
> If#= 2: Diag
> If#= 3: AT
> If#= 4: AT
> If#= 5: NMEA
> 
> T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#= 19 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2dee ProdID=4d38 Rev= 5.04
> S:  Manufacturer=MEIG
> S:  Product=LTE-A Module
> S:  SerialNumber=da47a175
> C:* #Ifs= 6 Cfg#= 1 Atr=80 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=03
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=e0(wlcon) Sub=01 Prot=03 Driver=rndis_host
> E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Ernestas Kulik <ernestas.k@iconn-networks.com>
> ---
>   drivers/usb/serial/option.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index e349ed66d2ac..328f14a99953 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2439,10 +2439,13 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0x10, 0x02) },	/* MeiG Smart SLM828 */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0x10, 0x03) },	/* MeiG Smart SLM828 */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM815 and SRM825L */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x40) },	/* MeiG Smart SRM825L */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d22, 0xff, 0xff, 0x60) },	/* MeiG Smart SRM825L */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x30) },	/* MeiG Smart SRT853 (Diag) */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x40) },	/* MeiG Smart SRT853 (AT) */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d38, 0xff, 0xff, 0x60) },	/* MeiG Smart SRT853 (NMEA) */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1406, 0xff) },			/* GosunCn GM500 ECM/NCM */
>   	{ USB_DEVICE(0x33f8, 0x0104),						/* Rolling RW101-GL (laptop RMNET) */

Hi Ernestas,
the SRT835 is the name of a CPE that is available in more than one 
configuration depending on the installed 5G card.
You can not use the CPE name when adding linux driver support, please
find out the type of Meig 5G card (SRMxxx) it is you want to add support 
for.
You may have to open up the SRT835 in order to find the name of the 
installed 5G card/5G module.

thanks
Lars

