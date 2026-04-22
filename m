Return-Path: <linux-usb+bounces-36418-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBMdI7bF6GmYQAIAu9opvQ
	(envelope-from <linux-usb+bounces-36418-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 14:57:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E4446507
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 14:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4056F3036C0C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2026 12:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2123E9F82;
	Wed, 22 Apr 2026 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="xAoMSe1t"
X-Original-To: linux-usb@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B3C3E95BC;
	Wed, 22 Apr 2026 12:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862550; cv=none; b=OGFl5IdxPLOwELi+jQroP5hRBWAA55XOahh92ASrgUvSs0EEE/MaJnVrsQpvwdO36I/YhNHq3qtASXA1l1HxgTZWqa0BH6es9915B2Svx1kIRO6+elpxwAQQkHZZfzjbwaNW1HzBETng9P6HopFqfUSLAYJRBUkoRQMQbHhuPm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862550; c=relaxed/simple;
	bh=nBUjkqzbsW9h+giptbytXPunGV8VSmqDApV+jbaJ0t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Isti7sdq+WQAZd90ORjkKRoc5+WPGhIubaVxn1+IzDGc1bE6LCrUQPMbC8ZrEasW59Ch3dnFSVobvrNoZt7j5PYkvtk9hG23nly5RjOg0YoyIW8+5sONZ49CincgndV3dVDLDzmIqPS3WicGbPf9d1n7IvNfIb6TXmCQotzlnh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=xAoMSe1t; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.0.200] (unknown [10.88.125.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id EF1965340EE8;
	Wed, 22 Apr 2026 14:55:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1776862537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ojAsEz/PoKdOZTVN4oyKv/PPli0YBdhtuXDaezDgRv8=;
	b=xAoMSe1tzLS7DaQbIWbjsFaTCqDdym43eHBRISfZlTg07z8iJ5JKv5es7M5rBJf1B3Ck3g
	zv2D73NW9Oz15INGuKhnQ5FkY+mPUY/Lrm0UeUo35pKddnRBOrgdnpLkb6YtHdJnr2AqPx
	zdnkl5/jOXXXfj6ib/z/B/1rUgW9UMU=
Message-ID: <f7aedad7-cece-463b-a6f4-9303a552f5f0@ixit.cz>
Date: Wed, 22 Apr 2026 14:55:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Corentin Labbe <clabbe@baylibre.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <aINXS813fmWNJh3A@hovoldconsulting.com>
 <CAFBinCBMTOM-FMgENS-mrnV17HbKzhtPUd44_dDiwnD=+HVMWQ@mail.gmail.com>
 <aIiXyEuPmWU00hFf@hovoldconsulting.com>
 <CAFBinCBZhjs7DGEgxhz54Dg8aW3NX9_LdnoZeUZpm5ohaT_-oQ@mail.gmail.com>
 <aJCoRFe-RFW1MuDk@hovoldconsulting.com>
 <CAFBinCCYsWHsNwi99kFqvLv+xOYtp9u3omhrPdV-hdH+5Cfyew@mail.gmail.com>
 <aK7Y9rRIsGBKRFAO@hovoldconsulting.com>
 <CAFBinCD19CVc0kX-aqa8pw71O2F3Nwy9ght+2TCn9B4PbOCBfw@mail.gmail.com>
 <aS2hxeBR-tptevYd@hovoldconsulting.com>
 <CAFBinCAt1DevnggWJdzBzh3X1Yfb0ScZXYsgkrA1cGrUmfXVwg@mail.gmail.com>
 <aWZlYuFXYd5eAZTT@hovoldconsulting.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <aWZlYuFXYd5eAZTT@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36418-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[googlemail.com,baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A7E4446507
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

kind ping, I'm still hoping one day we get the driver without need of manual 
building aside.

Thank you for your the efforts you put all into it
David

01/2026 16:31, Johan Hovold wrote:
> On Mon, Dec 15, 2025 at 03:10:29AM +0100, Martin Blumenstingl wrote:
>> On Mon, Dec 1, 2025 at 3:10 PM Johan Hovold <johan@kernel.org> wrote:
> 
>>>> Unfortunately I don't know how to read the HW flow control state from
>>>> the hardware.
>>>> Do you have any suggestions, how I can test HW flow control (after
>>>> manually enabling it for a port)?
>>>
>>> You can try disabling reading from the device (e.g. never submit the
>>> read urbs) and see if the RTS is deasserted when the buffer fills up.
> 
>> Doing so results in:
>> - lots of UART_LSR_OE
>> - RTS stays LOW (pulled to GND)
>>
>> UART_LSR_OE increasing seems correct as far as I understand this.
>> RTS being LOW is wrong and I cannot manage to get ch348 to pull it to HIGH.
>>
>> I did some more research and found that ch348 implements UART_IIR_MSI
>> and provides a fully standard compatible UART_MSR.
>> This is either triggered by a status change on the pins (UART_MSR
>> delta bits and the actual status bits), or by requesting an update
>> using the VEN_R command (UART_MSR status bits only, no delta bits).
>>
>> In a very simple test-case I've used jumper cables on port #0 of ch348:
>> - RX and TX connected together
>> - CTS and RTS connected together
>>
>> If I remove the jumper between CTS and RTS I get:
>>    ch348 ttyUSB0: got MSR = 0x01 // jumper removed
>>    ch348 ttyUSB0: got MSR = 0x11 // jumper connected again
>>    ch348 ttyUSB0: got MSR = 0x01 // jumper removed again
>>
>> So the hardware does register the change.
>>
>> Earlier I thought I found a fix: I had the values for
>> R_C4_HW_FLOW_CONTROL_OFF and R_C4_HW_FLOW_CONTROL_ON swapped.
>> That however didn't fix it.
>>
>> My current work can be found here: [0]
>> If you also don't have any further ideas then I'll drop the whole
>> RTS/CTS code for now so the ch348 driver can finally make it into
>> Linux 6.20
> 
> Or you can include it and just document the known issue with RTS control
> for port 1. It seems you have everything else working, right?
> 
>>> And in the other direction, verify that writes are buffered after you
>>> deassert RTS manually on the other end. That should be easier.
> 
>> This seems to work: if I pull CTS up then ch348 stops sending data
> 
> So that means hardware flow control (CRTSCTS) is enabled, which could
> prevent manual control of RTS. Which port did you test this on? Or is it
> the same behaviour on all ports (0-3)?
> 
> Going back to archives, it seems like you can control RTS on ports 0, 2
> and 3. (And DTR/RTS is not available for ports 4-7).
> 
> Hardware flow being enabled on just port 1 may explain the difference
> even if you would expect the device to also deassert RTS in the overflow
> test (unless there are separate bits for controlling auto-rts and
> auto-cts).
> 
>>>> In case I can't easily figure it out: would you also accept a driver
>>>> that doesn't support RTS/CTS for its initial version?
>>>
>>> It's good to at least be able to control DTR/RST at open/close (i.e.
>>> implement dtr_rts()) so that you can communicate when the other end
>>> has hw flow enabled. Sound like you're really close to doing so.
> 
>> In the meantime I found out why I had trouble with the DTR signal on port 1.
>> It was a user(space) error. I've been using [1] for some of my tests
>> and it has a bug where it would clear c_cflag HUPCL [2], which
>> prevents the kernel from turning DTR off on port close.
> 
> Ah, good that you found that.
> 
> Johan

-- 
David Heidelberg


