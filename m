Return-Path: <linux-usb+bounces-33691-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CSmI1epnmntWgQAu9opvQ
	(envelope-from <linux-usb+bounces-33691-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 08:48:39 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49C193B40
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 08:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 63FBD3011511
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 07:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B301E5B7B;
	Wed, 25 Feb 2026 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R9/SL0pF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WapxTVIp"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7621A85C4A
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005696; cv=none; b=GusaxeYAr2ZN55A0wWAqJSTCYCfKFGKZMiwI4yrV7rAvigmLi9OtCjSiOLaLGqlEivy/pfF5nP6eKWECBoOsuvI//mjG1UNgr46L+E+Y0L1keMiH6qZ4In9+YTv8OUBd16sOw84S9jnXhQi+mKBzlKNP0zer370joT+L33wfIQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005696; c=relaxed/simple;
	bh=/tb7tVFuMJRtrPQxEwJyjr8HCiYG0DRMyfsOFaObgR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sdryz49WGwtsTIVx+VaDKFzfHJTRJwQAM0kghrhg5X1wiTjaOMTyK+M0Hr/kw7Kc+ZzlbRHbcBe64n88q2B7Tob+dg50SeOKNuvtw2kjId8NGzNqeK1Y7RCFBFAxDvycoNqb8BSikOmAB6bb4zZtMCyIHSNr5wz6EEocdW5M7jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R9/SL0pF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WapxTVIp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772005693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KIFbR9N1epYqMk+/ts+pAMZXD1gwVSceo470CquD4QE=;
	b=R9/SL0pFNQWicLMOYkLjfo/o7giyg5KxJdqae+/5sfJg4zrJFXyXquadDvrgIG90H2yJrz
	0QIt60UAr+EUmmH053C9x4ciRLhzJG6qDXPiR5A5Ds+WeAtTZvb80WY4T6LTcJ0CgUjGJ3
	71j+ofK9xv+jxBdVkcfIk7d0TrjUTpk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-zx5MteiBOMe8x1Cbzi_S-g-1; Wed, 25 Feb 2026 02:48:12 -0500
X-MC-Unique: zx5MteiBOMe8x1Cbzi_S-g-1
X-Mimecast-MFC-AGG-ID: zx5MteiBOMe8x1Cbzi_S-g_1772005691
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4376ec2b1cfso2438778f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 23:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772005690; x=1772610490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KIFbR9N1epYqMk+/ts+pAMZXD1gwVSceo470CquD4QE=;
        b=WapxTVIpys6lrco3z+GsF1r7Y4iZ7Zo3M2mGBLEnGeQNmQHkJH90H9PKxbIqZjuDqq
         GTHCJlRkJl61bAHDeEbCZRoe6yCBEUIpwKLgMVbYZyOpX6tC8CfQ+wwvWH94R0yznJrs
         z5CZmVHp3LD/Zy3tj8aBbEnMpftTRLRPIrJpHiXJ43+YVyLtnniCNgiakagEOp9rDSO0
         FW8IQ7JF96y7j74MYiVaHuBt6irWvQrAYVF2ExKOy0qLUKKV97Bm4KZ5VUR3MSPkJVem
         xW2SI/psgvSgu/PwsXYyCfHl6BXYHAL4tqsZam/AJx/Ljzdr1ot8mpK9M980hIOU5cXP
         9Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005690; x=1772610490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIFbR9N1epYqMk+/ts+pAMZXD1gwVSceo470CquD4QE=;
        b=iK6R6DIqPUWmWmBQCbHMleWBwovGxvElmXK0OgrMOawji/N3pYr+NV7q1YKIX6Ku88
         eM9K/dT6dMjbbIeYSjdqxNAm2x754XSlCxLDH/hmcbGYC1LXacxqfhwIBTOmIKqRCeL2
         7P8+R8NM4/sguC72gxfN/A+159X8gbxAkaPzcW87MKITtCuB4dUKKNEMKU9rgDzMjz1V
         D4NKw7hYKZ/ps6WSy0PSbOjursuel0Pi5uNjUlpAk/N39HG7iqb/gQiNY6QnERYKW2Sv
         DYTRZ6N3/5O6Z4mneyD3+j+rF01NG5sR/KrOueXz9Qs6k9yk6BU7q1XTkpU199rbJKcl
         KKHw==
X-Forwarded-Encrypted: i=1; AJvYcCWjP0ylXTBEYviy7rUdNjNSBimVrYssx62gMBSsXFtvBbMJX0wd7hWrrewvwnF2B7cGWQIFl3tnY0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIoDJdy2Ayl0H3F6/Gimu+2fGrzLYV4pSWUyiPbyBcAr1GPUZO
	NA3ouiCbmZZta0kEJ2kzyiohIiEpxMhSyI/K+zexk35ba8GWcVNLEVTEa6+zDm63gcdRQeZ4UXf
	jW44sjTDlHFM09up69G8haM4d2Bgc+cgjyB/sS9g3O2gNTz6pba18JE/UKMUWfqKtGgjH2A==
X-Gm-Gg: ATEYQzyzh7Ey55XDhqfVM56PCJWYSvSBRFvaUu3jXZUxDuuKfdDF03svfrMjxToJCsh
	5dwXeJY+11+nmtOn6o75DJknb/EzGbWEkKvGUn+m0SJB2pNXGaX9UIPBxO0V0Jm4M+GFd7bBG0J
	LsqTOnhoVVDp9scHtyPEcRZQBZJURQEcCDzQKwEaPZAUKdzSq10g89rNg/CRzY8mkAakzNn8GYQ
	5zvxDVlqYpAZvHSal4DhyU3Oc4lx0J9bmTzfjdpxUeB1zIy2/iYKdlTu5uzRCNjzciZaQZJhj1N
	5p97ztka5wUv+ZdPAMrQmwuPr0wdtEIhytNCAyAj4DcGo3JS51WOwameslgjTFEUm5gmY51vKQu
	zZoY2TqGmYta9dAow66B7tyfTbUlI8YyGVwva0n6nhE9rHn7j7PvvLpX4d8kqPLenfRWte7AB9g
	40Yo65J4dTyb0LnqpO7rZgPY5bOu9nzEUgj+TVSMdAxjUrD0s9KvrwCLxR
X-Received: by 2002:a05:6000:2912:b0:439:881a:6578 with SMTP id ffacd0b85a97d-4398fa91363mr2248201f8f.21.1772005690455;
        Tue, 24 Feb 2026 23:48:10 -0800 (PST)
X-Received: by 2002:a05:6000:2912:b0:439:881a:6578 with SMTP id ffacd0b85a97d-4398fa91363mr2248161f8f.21.1772005689924;
        Tue, 24 Feb 2026 23:48:09 -0800 (PST)
Received: from ?IPV6:2a01:cb00:8ef9:5300:877b:aaab:2ea7:8695? (2a01cb008ef95300877baaab2ea78695.ipv6.abo.wanadoo.fr. [2a01:cb00:8ef9:5300:877b:aaab:2ea7:8695])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa015sm32337470f8f.8.2026.02.24.23.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 23:48:09 -0800 (PST)
Message-ID: <28cd2d03-6491-490d-89e2-19f81e9bad69@redhat.com>
Date: Wed, 25 Feb 2026 08:48:08 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: commit 662dc80a5e86 breaks rmnet over usb
To: Daniele Palmas <dnlplm@gmail.com>
Cc: Koen Vandeputte <koen.vandeputte@citymesh.com>, oneukum@suse.com,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>, kuba@kernel.org,
 pabeni@redhat.com, netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
 <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com>
 <CAGRyCJE85fLOahUR3PAUnS_jH4+qpBq37qpged=nvObbg1m+Qw@mail.gmail.com>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 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
In-Reply-To: <CAGRyCJE85fLOahUR3PAUnS_jH4+qpBq37qpged=nvObbg1m+Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-33691-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lvivier@redhat.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BF49C193B40
X-Rspamd-Action: no action

On 2/25/26 08:19, Daniele Palmas wrote:
> Hello,

Hello Daniele,

> 
> Il giorno lun 23 feb 2026 alle ore 15:08 Laurent Vivier
> <lvivier@redhat.com> ha scritto:
>>
>> On 2/23/26 13:04, Koen Vandeputte wrote:
>>> Hi Laurent,
>>
>> Hi Koen,
>>
>>> I'm testing the latest openwrt state and found an issue probably
>>> caused by your usb mtu limit patch :-)
>>>
>>> I'm talking about this one:
>>> 662dc80a5e86 ("usbnet: limit max_mtu based on device's hard_mtu")
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.12.74&id=662dc80a5e86b35bbf339e0b87b7cc3f07c09de1
>>>
>>>
>>> When using wwan0 iface normally, this makes sense, but the problem is
>>> when using QMI modems combined with the rmnet driver and aggregated
>>> frames.
>>>
>>> - The modem is configured to frame sizes of 16383 or 32767 using QMI
>>> - wwan0 (using qmi_wwan) is configured to match this frame size by
>>> setting it's MTU to the same value
>>> - Frames of this size are sent over to qmi_wwan driver (containing
>>> multiple data packets)
>>> - Frames are then forwarded to the rmnet driver
>>> - Frames get de-aggregated here and sent to the network stack for processing.
>>>
>>> The reason here is to reduce USB transfers heavily.
>>>
>>>
>>> As you see, it's perfectly possible here to use very large MTU sizes
>>> as the aggregation feature by rmnet relies on this.
>>> Also the modem can be perfectly configured to send very large aggregated frames.
>>>
>>> After your patch, wwan0 is limited to 1500 bytes it seems, effectively
>>> breaking aggregation.
>>>
>>> On my tests, download speeds are reduced from >300Mbps to ~.8Mbps
>>>
>>> I also made a build reverting this patch and all works well again.
>>>
>>>
>>> Is there any other solution to fix this?
>>> I guess it should be reverted otherwise :-)
>>
>> It's weird to be able to set an MTU that is not supported by the hardware.
>>
>> To restore performance I think the rx_usb_size should be decoupled from MTU max in qmi_wwan.
>>
>> Could you try something like:
>>
>> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
>> index 3a4985b582cb..6b4796fac692 100644
>> --- a/drivers/net/usb/qmi_wwan.c
>> +++ b/drivers/net/usb/qmi_wwan.c
>> @@ -788,6 +788,8 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
>>                   usbnet_get_ethernet_addr(dev, cdc_ether->iMACAddress);
>>           }
>>
>> +       dev->rx_urb_size = 32768;
>> +
> 
> So far userspace tools (e.g. also the most important one which is
> ModemManager) rely on changing the rx_urb_size by changing the MTU: I
> know this is ugly, but it is a behavior that has been there since a
> lot of time, not sure how many tools based on this assumption could
> break.
> 
> There's also the chance that there are modems which require a higher
> rx_urb_size, so having this fixed could not work well.
> 
> Unfortunately usbnet serves many drivers, I agree with Koen that a
> revert is the safest option.

And there is no intermediate driver (qmi_wwan or rmnet) that can define a max_mtu higher 
than that defined by usbnet?

Thanks,
Laurent


