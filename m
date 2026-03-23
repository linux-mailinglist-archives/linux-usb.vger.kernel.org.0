Return-Path: <linux-usb+bounces-35346-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNYeOFuawWlNUAQAu9opvQ
	(envelope-from <linux-usb+bounces-35346-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:54:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 840122FCAAE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7583305D1DE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB303CF05B;
	Mon, 23 Mar 2026 19:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SkRszr99"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDA3C9EC0
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 19:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294175; cv=none; b=Tyx8n7/bvYEghVHo10JO10+83ThETXv8NoQK6DDv/jlBGbc1c7b3zNIz/AiB9TJBESSKosWU9EkGwIDMmJ3ZWGiaaih0xO8Wcjf1B5yfjbTDz9EbrECPkZ3cfDVVvO86gpE0/vLMabxVw1bDg4vHC0z96y+7x5Rd5gKXoOxpfgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294175; c=relaxed/simple;
	bh=xMoxGibXuMUc6L0+HH5osTDZ0vid6ZFv3IzUlbot1eU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nWEyHaPr6cTNNzUlV+D+4q5L8yLefzn0sABxn7RzUT0d18vHbMZi/SMKazcGnRY31iygXkI9fpLN/z4DzGLKUgkqftfgKAs+3c+CblDpF6udZjN7/SBtt32ny0UN7SfSc+TFUfDuFl2HJ2cq7d+DTWMJgoMSpCSPBxNFWy4ih8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SkRszr99; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-417c34b0509so2857946fac.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774294171; x=1774898971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jasxQAhbU9CVd/7B3RbQtbVkKGwzkglfllHdmwH1F3s=;
        b=SkRszr99BqSq2icB32YMzcIlVdwIHSomAnSZ4c8wX8AdP23F5MSOI4qZtQplwh0NGA
         7pVAQ0RmrRotIJ5k6isShBWgJmBHCn/Tc8dNCPhmCf/D05umr6gFkE5Z/gXY+QG1gOkj
         kugH7/jxGuX/jrrOH443zpB/IFBYu5I1TYNr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774294171; x=1774898971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jasxQAhbU9CVd/7B3RbQtbVkKGwzkglfllHdmwH1F3s=;
        b=ea0nEz86znI3JAVLdNTot9srycp+5FK08fL5wWQlb0xTseKquPdpb5nj3qOWFc1FW6
         Rbx/pOyPgpJCGMsdrTyUlhJ4DrjRm01O4SHx+q9f7P/yPrahV5ygtRywmM4DgOVl2HVW
         lkg1jqUZFqUHSVTUU4W24VKzuLmO7f0OP/2dX3KuwimNmhH8Y8+1akTTgqFNl4bf4LLV
         kFuuuSBYXNdhyhvY/0/6SNxK8uZ9CuMzu+bDcT8c6V1KhFuvR77UllUb9Bj8cR8HCUf4
         nk9lXijh56SMFVDlr8zY200xV2dk9ZmGLeYflIp24IMydG/omLdeEcgiRIJ7abdZgTSj
         tyQw==
X-Forwarded-Encrypted: i=1; AJvYcCUB8O+gpZL3QxKbxECCA6gkqJlTwT7Dap2dLgNbe6Al4mIakHC0NphFWtWus8PiK/9+WkeqaYK4ycw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5qssRrvpG7geiPSIjWkbepgcv2b21owq9NWafXY/OKZYLMP3U
	Aroq0wRP2cMDAn1nTlhjh4vFddh6e6rCICzKF3veOnh/AF3/0MHWid7xX81KcXCvGaA=
X-Gm-Gg: ATEYQzwTZE4JVJ9nn83JYvqmPPtydUZ9dx1FpoXsH9+iB63Ou4UR9JxsLnStUMLEA35
	Q0yuG99AOXBlp+q+WhAknTotRfDPudKKR4hctg7McE+5rh9R8hG6ytKuVkE3Kq8DMGYVgAFTy30
	KYD+BaBraf7MSp38CoGlbvttKgMg+cJV0j6cRZhJY04/MvzW8saHRej/EI59epvFcrhMlLv/zTs
	SjvS8J9Yh48XZVDaLZLlCQtqR/yTl2oR7LuImfOLHmX96NfSrpWx/kEziM0cULdvitnM9vkUrEy
	JnJUgTJPgO2H2EFmTsNRTF2qu0EcI6l4vXdQ7LY7xASaxx/umA+bkVuBeGbH3SguDFZD55SJjQB
	Fvxsp+Zz7HV3saP5RWUWTh1kXQymOo2tBT+kus5YjNIeQCRSq3lHkSNvV6If3yNZlaYt2yvFKMP
	PSlKfRCIitv6KrhNY+0G6pa2H+ly5U8xkQsWw=
X-Received: by 2002:a05:6870:5b90:b0:409:95eb:9618 with SMTP id 586e51a60fabf-41c10f73acfmr7775679fac.17.1774294171127;
        Mon, 23 Mar 2026 12:29:31 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c14ddf9d4sm10442421fac.16.2026.03.23.12.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 12:29:30 -0700 (PDT)
Message-ID: <e9c152a8-66ed-4905-b37c-10a5903da2e4@linuxfoundation.org>
Date: Mon, 23 Mar 2026 13:29:29 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbip: drop redundant device reference
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bastien Nocera <hadess@hadess.net>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260305133851.2952-1-johan@kernel.org>
 <20260305133851.2952-3-johan@kernel.org>
 <9d727cd2-701e-4c5b-9646-82874f2d0a4a@linuxfoundation.org>
 <aa_X1qNsCGll04zj@hovoldconsulting.com>
 <55fcc500-afa5-4ee7-bde8-c5eec6932764@linuxfoundation.org>
 <abEhg-n_mpucbUbg@hovoldconsulting.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <abEhg-n_mpucbUbg@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,hadess.net,gmail.com,kernel.org,zenithal.me,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-35346-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Queue-Id: 840122FCAAE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/11/26 02:02, Johan Hovold wrote:
> On Tue, Mar 10, 2026 at 03:51:41PM -0600, Shuah Khan wrote:
>> On 3/10/26 02:35, Johan Hovold wrote:
>>> On Mon, Mar 09, 2026 at 02:26:03PM -0600, Shuah Khan wrote:
>>>> On 3/5/26 06:38, Johan Hovold wrote:
>>>>> Driver core holds a reference to the USB device while it is bound to a
>>>>> driver and there is no need to take additional references unless the
>>>>> structure is needed after disconnect.
>>>>
>>>> In this case it is necessary for stub driver to hang on to the reference
>>>> to maintain exported device status.
>>>
>>> But the driver does not hold on to the reference taken at probe after
>>> disconnect returns. The stub device itself is even freed at disconnect
>>> and cannot be used to release the reference.
>>>
>>> Which exported device status are you referring to here?
>>
>> I am referring to the device status that usbip host exports to
>> the client side. The interaction between host and client is
>> handled from stub rx, tx, and also event handler.
>>
>> Having the reference to the device helps so the device sticks
>> around until the stub driver no longer needs it so we don't see
>> use after free type issues.
> 
> But the driver drops the reference that it takes during probe at
> disconnect, which makes that reference completely redundant as driver
> core guarantees that the device won't go away while a driver is bound.
> 
> So that particular reference doesn't help with anything.

I am concerned about stub_rx and stub_tx running to handle any
packets that come in after while stub driver is in the middle of
disconnect.

Currently it has the reference while it handles reset events coming
from event handler in usbip_in_eh() and until shutdown_busid(busid_priv)
is complete.

We can make this change and run it through some tests.

thanks,
-- Shuah

