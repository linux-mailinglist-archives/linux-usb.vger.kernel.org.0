Return-Path: <linux-usb+bounces-35323-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ck/LAsWwWn5QQQAu9opvQ
	(envelope-from <linux-usb+bounces-35323-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:29:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D1E2F00DE
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 11:29:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87B5C3031EBC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE8D38B7B4;
	Mon, 23 Mar 2026 10:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Dv1YkSTi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6218F361DCB
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 10:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261619; cv=none; b=n+pWnZajmU7exyGEwfZhDMiRMQQF+80NUVD8VXiDYtMJTpGxtUmlhFtiH+sH5znTeBf+yeoMsGCkucq8I1JGbSf4yJkxGX0dxNT3HCpns7qXQ4iPbq4uPFE2PV+4pyIzjKIXusdcLVkWDGEmvDxBxVYqAEeirrSr/FK0Gb6iRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261619; c=relaxed/simple;
	bh=/T5ZIQ8bAKyxwq4gqUhTZba580Yk+WCWV3iFolCu3Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eCXJyC8h7RMH2ywvYTs49u+PB2EgNtoyAKH1tcWZ7ge8fkR1hanKfgI3YEf2QigU88ICBYofGzFTfykjXEyi5JPcuwOxzCOIJjIJzzhtegcdnWesH05iM24wm/eDZm9qHixWmh9dPtx50GoMqkTt6sLCt8aAVYMr5vSN/1coMYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Dv1YkSTi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b4121c40aso2855896f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774261617; x=1774866417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xpXuPxperhKQcpuQyrxdVFbkdfG/1zZnp7plEwH/x6E=;
        b=Dv1YkSTi6+vapCc0qz8gYfBNr4gMS4sWmKrV2tKTArA+k5+Q0+59lQDlhX4nTbm3WX
         dP1nW12DKZRORSwqXxhpA6JtuJZUWNlIGqrIXbyLQRnAAxLgnjuZT9C1asqE9PfvuKlo
         N+eOUDUSbUy3L/pkBtqanPDECC6PYa1EhavhyUYwHHFGHQRDKrhiQcWN5k55qy0CORlI
         olS0S7cprlsaz1janAmbsU+U8TC6aqzolffjLQPTB5xW1HQ+3BwL71sS9X4FbHnPb49a
         kGNWljRuRT6l9m2eziy6ElonL7QrdZ23nVjk3aAUPVXlbp2TIN7AE/ElxhxhKTu9zxKH
         ZyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261617; x=1774866417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpXuPxperhKQcpuQyrxdVFbkdfG/1zZnp7plEwH/x6E=;
        b=lp8OrA1JIzWU8G1JRezEozHJOA9yIPo7BuPyY4VCyjyOyG2Z22SiXfzN4G4njgjpur
         MdY5vsvob7lNP1tgPtAEgFCWFmor5ac8FIPoK11DrokFL7BvE6jEFTnTcNuBij+wS64R
         h41ncmV2M7z9MYm6G8Sg2D2Rl2pVHSMQ3vUbRHVEFgRQBHQg2P5hpRXib8GihvS0ubsK
         3ewedwjRqb4y61C3H7oT5E1v9Dtj+U9YOmIIx57pqmbAbhLbzunkY1ytA0hSZ5sYw+Di
         IKOLza0aTZmEoyfRvv8RmpKx/bZGoyq88ER3xHFFl/+PT8Gm2d02L7udlMDqEi6uku1l
         VYvw==
X-Forwarded-Encrypted: i=1; AJvYcCUJtNflblLvcKH2+aZOAIte+ERRMChuU2GOlzpDxkHZOTC0jk0ZYRaS43GaMJ5vg1M4yp1iLhLgixA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7AhoplrLr8xDSnx3k4IYBi5skUr0iK7RDa/UqgiPsXlOeX/16
	csMyr9tXmYAQsHfsA/+lzJo7Ief1LF0ooE2VfowmK5G27C8WuWyw/6BLfPPf5QM4AIVKSlMa/oY
	uFOr9
X-Gm-Gg: ATEYQzyMACobp7sdBnkkkgi1+c6nzzy7pJk/fWUvbfOnU3UZBT95wD85slmX/3lWqik
	nsslIojt14gDMCWbO7rldRpUjgBBBNhKhWmSZsyaK5jcnyaCPjf/mIAHZHTqwN0oinfBjDesWU4
	AdSIW2sQ5N3hpzhw5bj+kdjLoPMfVEep24+bfIyWYQTU03kxmsLM6iPunF+U/dC9VvFPkgwGmcw
	2vUVgx4jhqjm4x8ltLPcOV7C2vYagB7IjoKRWOeJGzrWtOMHlDRXOjbVSU5zvREoGlMmQ+L5zcH
	7zAKiSLu0FeEue4hfo5Olcv2UPY5fIqAGkPdmSdJ5+Hh9AtfeIEKDCBOUX01at/5QHn1G41pTjD
	VkumgwAz9MzPoxLu9GU74M7EghxkQSqnNdiVBGq6pIt+cZgCYrzjyvByITYJyNarGv6ieZfnGrT
	4zu4+901b5azwAtFZ2Zn5ZEvbdBqmdBCac6mP+m5oLDfsD7Mde39iRX/QrvDi3plMVnGU=
X-Received: by 2002:a05:600c:468b:b0:485:5812:bb9e with SMTP id 5b1f17b1804b1-486feb5a4d0mr170855345e9.0.1774261616627;
        Mon, 23 Mar 2026 03:26:56 -0700 (PDT)
Received: from ?IPV6:2001:a61:1328:7301:e1c1:e50d:a52b:75e0? ([2001:a61:1328:7301:e1c1:e50d:a52b:75e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7ea44bsm271231615e9.8.2026.03.23.03.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:26:56 -0700 (PDT)
Message-ID: <5b378006-666f-4a72-902b-bb5f466f7895@suse.com>
Date: Mon, 23 Mar 2026 11:26:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 USB list <linux-usb@vger.kernel.org>
References: <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35323-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 10D1E2F00DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 21.03.26 03:14, Thinh Nguyen wrote:
> On Fri, Mar 20, 2026, Alan Stern wrote:
>> On Thu, Mar 19, 2026 at 11:16:22PM +0000, Thinh Nguyen wrote:
>>> On Wed, Mar 18, 2026, Alan Stern wrote:

>> Naturally, UAS may be a totally different situation.
> 
> Windows has a clever way to handle this for UAS. It sends a command/task
> with the same tag as the failing transfer on the command endpoint,
> triggering an overlap tag response and causing the device side to cancel
> the command along with the pending data transfer. This puts the host and
> device in sync again.
> 
> All compliant UAS devices must support overlap tag detection.
> 
> (We can go into more detail should we want to pursue this)

_yes_

Do you have a trace?

>>> Currently we _have_ to do a port reset because the bulk sequence can be
>>> out of sync and the xhci doesn't synchronize against the device for the
>>> storage driver to retry the command directly.
>>
>> The same is true for EHCI.
>>
>>> What I'd like to see is that the endpoint can be put in a state where
>>> the class driver can submit a new URB without unbind/reset/power cycle.
>>> With the current implementation of the xhci driver, we cannot do that
>>> for bulk endpoints with -EPROTO error.
>>
>> Which means unlinking queued URBs (either automatically by the core or
>> else by hand in the class driver), waiting for them to complete, and
>> issuing a clear-halt.  Once that is done, submission of new URBs should
> 
> The clear-halt doesn't have to be done after the unlinking of URBs. The
> xhci endpoint is in stopped state after a reset ep command. As
> long as the class driver doesn't submit a new URB to trigger a doorbell
> ring, the xhci driver can send a clear-halt after a reset ep command and
> no transfer will start.

How do we tell drivers about that? If we give back the URB it must
be unlinked.

	Regards
		Oliver



