Return-Path: <linux-usb+bounces-32595-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMRBDTYgcWmodQAAu9opvQ
	(envelope-from <linux-usb+bounces-32595-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:51:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4145B8AB
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 19:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 988BB78DD54
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 16:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5A83A8FE2;
	Wed, 21 Jan 2026 15:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+4JUsgA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE926B2D3
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 15:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011132; cv=none; b=ju1K5HaTY4xC//sLmKyRZJ1+AC60rDuxk3UWbdc14BdUFhhbu2fE2GR1DU3Ue5p9o50tWc3rl3mvzMt0OqrlB0VOFJcJYZLjUEs+HWZCrf/Btab7GVvnjhjo/ja5t2xeMVtau6eL0UHf9L5GPKk3O7hjLmGp2NyeIIzxyDkomt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011132; c=relaxed/simple;
	bh=GPpHqtuCbsrZ+F7FphCcI+5qH2iL+hbup4qgwIosztw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2xVoXjt0p61YmSOM9We7YfqnM0u3qFiSVMFeLnChOr7EQKZngr24AhRVf22tp1dGdDYOnWLi4v9oFwt3xxvhlK5QfhC1zwhdngvRzuMpeyOBjOJ3/7MFHShd7Lo0Z7Z5DasLjpRO3Sv/dWnBloprl+N6s2uAn8TcSD0o3Hju0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+4JUsgA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8379FC116D0;
	Wed, 21 Jan 2026 15:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011131;
	bh=GPpHqtuCbsrZ+F7FphCcI+5qH2iL+hbup4qgwIosztw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L+4JUsgAUDWuknn0E7OjHo30bH51yjkt4qHtztPazjZA4y2rus3nmqrh7RbcIWv/6
	 +AwOXRL0hh80MSPavDddwwI0pXRV9DOfeb8p7jGCkzofwg3pqg+VppfF+PsHc3m7TS
	 zKCqp1zU4cOJMB8yC5+V6zelY8nzCHGvJyt2Re6LKXZlF16lDLc436zMgr5CHKm0DC
	 GeB+dXcCC4SLMxG4Esfq/bw0wecr6tdshw4ZRx2L06/5Y3DzK4fSqSoQ7DxuirjrUw
	 YT/5kVGXwRPvLTAD8SCwKfZQq6jsw/5ffNu1t76vk9wMgX8jlgtMG9mWnN1QgqEFGm
	 fBV28yKWCQ35g==
Message-ID: <7f22aca9-baa4-4438-b568-2b197f971739@kernel.org>
Date: Wed, 21 Jan 2026 08:58:33 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
To: =?UTF-8?Q?Ignacio_Hern=C3=A1ndez-Ros?= <ignacio@hernandez-ros.com>,
 Shuah <shuah@kernel.org>
Cc: valentina.manea.m@gmail.com, linux-usb@vger.kernel.org, i@zenithal.me,
 shuah <shuah@kernel.org>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
 <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
 <0101019b97e8a815-bb84ea95-adbb-493e-b94a-dfe4afb55f60-000000@us-west-2.amazonses.com>
 <1b1ed320-eb7b-4b93-a1f1-84ae651abd17@kernel.org>
 <0101019ba7838344-f64c50aa-ea38-498a-9196-1467688fe7d7-000000@us-west-2.amazonses.com>
 <d9d2c4e6-43ae-48d7-88ee-4288e6f16907@kernel.org>
 <0101019bc32d3017-88891fcf-4b22-45d8-b8e4-c18a30dbbe15-000000@us-west-2.amazonses.com>
 <63f2d81c-79ce-4568-99fa-c47da98afd78@kernel.org>
 <a56209d4-13d5-40cb-b759-f9c7870fb842@kernel.org>
 <0101019bdf6ca137-60344502-51d2-4767-a34b-6a7cf1bfdf4a-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Shuah <shuah@kernel.org>
In-Reply-To: <0101019bdf6ca137-60344502-51d2-4767-a34b-6a7cf1bfdf4a-000000@us-west-2.amazonses.com>
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
	TAGGED_FROM(0.00)[bounces-32595-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,zenithal.me,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shuah@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: CF4145B8AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 00:19, Ignacio Hernández-Ros wrote:
> 
>> Is there a way you can enable usbip debug and send me the dmesg?
> 
> ¿How can I add debug information for usbip-host kernel module?
> 
> All I can find on the internet is this page:
> https://www.kernel.org/doc/readme/tools-usb-usbip-README

Enabling CONFIG_USBIP_DEBUG in your kernel config will give
us the debug information. Let me know if you are unable to
do this in your setup as this would require reloading the
driver.

While you are figuring that out, I will send the patch to
make the CONNRESET debug instead of info message which
is needed anyway. Please test that if you are able to.
  
> 
> That points to: http://usbip.wiki.sourceforge.net/how-to-debug-usbip which is not found.

When usbip was originally added to kernel staging, this page must have
been active. This README needs updates to remove this.

thanks,
-- Shuah

