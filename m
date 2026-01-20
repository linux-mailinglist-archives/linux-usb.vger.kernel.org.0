Return-Path: <linux-usb+bounces-32559-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A0cJ6oRcGlyUwAAu9opvQ
	(envelope-from <linux-usb+bounces-32559-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 00:37:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE14DEBC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 00:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7AEBD68EE39
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 23:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FB541C2F6;
	Tue, 20 Jan 2026 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHJFxfZM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A340B6D9
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 23:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952001; cv=none; b=Ewof3jPQPUNim9gTt080Iov99U7kg5//sokyAMGXhrFuuJREgYxQQ/YP98GnEAlD4EiczRSSuBcTdYpPPNm56vYXoBSZSpVL5fS/uItaU4iqOKS3y+WxgbkFSt+S3D2cJpaNz7kqu7c29/MUxNuiORVD+oBbMnZNz46N8KdcL/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952001; c=relaxed/simple;
	bh=MS20NIRZOERiDEJ7KPipQgvZk9TBL9AmMULAiTDWYfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoh/1fe17voqQVMLo/aenQh7WRLbDgoOlGN7TQlxC+ym1hXJYcj0asNTyPMG4bVquaFgo6+LfRDMwmnCy4Rlx8iZKNDQ7tYDReF+DYhSheud7UMt/4qdtNyw+pG4PTRxCZLcYPxBaAVs0AEI5HPGLc7OT5QpS+RNSnk2lPZRLXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHJFxfZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EE1C16AAE;
	Tue, 20 Jan 2026 23:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768952000;
	bh=MS20NIRZOERiDEJ7KPipQgvZk9TBL9AmMULAiTDWYfA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UHJFxfZMTSgVsdrGPoaBbOIWqMz9gxgjqn3uLsq46vvTbYucLAr9RpX92xsRhnVkZ
	 btG8dAOFpIXZkNx5FDpyeAwmTORkYTtxd1mEKKsrPUUSrt5WWFa+PG2MHAPsQ5ofrG
	 dTOyxujdwnJIWoo6u1JPfa2IFWcwbG1oUVcSf6GpgbJvmHTxdSm8Zpu4TMBqrsnW5e
	 KrJuLFMSQrft5OFEsjzSiitYgfwLWX4egPgyMys1sMxhXNdbN/sgXx0h7rE2wvfNOH
	 zNJKH7TwCtU+1hYK9yZAh1YnI8iC8pNoyJFlzCW0hqASzylQhbgM6l4weUP5qSdcao
	 dQVMu+o0fQCwA==
Message-ID: <a56209d4-13d5-40cb-b759-f9c7870fb842@kernel.org>
Date: Tue, 20 Jan 2026 16:33:02 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
To: =?UTF-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me,
 Shuah <shuah@kernel.org>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
 <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
 <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
 <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
 <63f2d81c-79ce-4568-99fa-c47da98afd78@kernel.org>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <63f2d81c-79ce-4568-99fa-c47da98afd78@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32559-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,zenithal.me,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuah@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,oraculo:email]
X-Rspamd-Queue-Id: 4FAE14DEBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/15/26 15:38, Shuah wrote:
> On 1/15/26 12:41, Ignacio Hernández-Ros wrote:
>> Hi, find below the answers to your questions:
>>
>>> You are able to attach the devices from "nut" - the problem starts
>>> after attaching?
>>
>> The problem starts after attaching the second device. Not after attaching the first device.
>>
>>> What does "nut" run - what are kernel versions on usbip host and clients?
>>>
>>
>> “nut” runs a service that monitors the UPS devices. But the issue shall not be related with how “nut” uses the device as no issues are present when it is only working with one of the two UPS devices attached.
>>
>> root@nut:~# uname -a
>> Linux nut 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.57-1 (2025-11-05) x86_64 GNU/Linux
>>
>> root@oraculo:~# uname -a
>> Linux oraculo 6.12.47+rpt-rpi-v8 #1 SMP PREEMPT Debian 1:6.12.47-1+rpt1 (2025-09-16) aarch64 GNU/Linux
>>
>> root@z2mqtt:~# uname -a
>> Linux z2mqtt 6.12.57+deb13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.12.57-1 (2025-11-05) x86_64 GNU/Linux
>>
>> note, z2mqtt is using the Zigbee dongle. but that device is not raising issues.
>>
>>> Can you detach these devices cleanly?
>>
>>
>> Yes, while on “nut” I can do:
>>
>> root@nut:~# usbip port
>> Imported USB devices
>> ====================
>> Port 00: <Port in Use> at Full Speed(12Mbps)
>>         MGE UPS Systems : UPS (0463:ffff)
>>         9-1 -> usbip://oraculo:3240/1-1.4
>>             -> remote bus/dev 001/005
>> Port 01: <Port in Use> at Full Speed(12Mbps)
>>         MGE UPS Systems : UPS (0463:ffff)
>>         9-2 -> usbip://oraculo:3240/1-1.2
>>             -> remote bus/dev 001/003
>> root@nut:~# usbip detach -p 00
>> usbip: info: Port 0 is now detached!
>>
>> root@nut:~# usbip list -r oraculo
>> Exportable USB devices
>> ======================
>>   - oraculo
>>        1-1.4: MGE UPS Systems : UPS (0463:ffff)
>>             : /sys/devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4
>>             : (Defined at Interface level) (00/00/00)
>>             :  0 - Human Interface Device / No Subclass / None (03/00/00)
>>
>> root@nut:~# usbip attach -r oraculo -b 1-1.4
>> root@nut:~# usbip port
>> Imported USB devices
>> ====================
>> Port 00: <Port in Use> at Full Speed(12Mbps)
>>         MGE UPS Systems : UPS (0463:ffff)
>>         9-1 -> usbip://oraculo:3240/1-1.4
>>             -> remote bus/dev 001/005
>> Port 01: <Port in Use> at Full Speed(12Mbps)
>>         MGE UPS Systems : UPS (0463:ffff)
>>         9-2 -> usbip://oraculo:3240/1-1.2
>>             -> remote bus/dev 001/003
>> root@nut:~#
>>
>> All clean and without issues.
>>
>> The only one issue is dmesg continuous messages:
>>
>> [45519.289798] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
>> [45521.204620] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
>> [45521.291393] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
>> [45523.205811] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
>> [45523.292681] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
>> [45525.207094] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
>> [45525.293907] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
>> [45527.208240] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
>> [45527.295310] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
>>
> 
> Okay the only problem is these messages - these messages are
> informational and there aren't reporting errors. These should
> have been debug only - I will submit a fix to change the level
> of these messages similar to how stub_rx and vhci_tx/rx handle
> this condition.

Is there a way you can enable usbip debug and send me the dmesg?
On one hand the message itself isn't error, however it will be
good to understand why so many urbs are being unlinked.

thanks,
-- Shuah



