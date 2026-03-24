Return-Path: <linux-usb+bounces-35371-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBpJHOxbwmlKcAQAu9opvQ
	(envelope-from <linux-usb+bounces-35371-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:39:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D60305BFE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64E75305115A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 09:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A54C3290D8;
	Tue, 24 Mar 2026 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aCGJzXah"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9356E3DB62B
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 09:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344495; cv=none; b=octQpEqaZulSwnC3L6J+JOOR9fCstVBdpA8AA+W5nnZi1RiT/pWUSronxR1qQxgzBLz/mAYuSNT1/agledO/wU6iL2ER4znvmVg5dsc6KTZ/T2wHCWF7Z2n0F5SsgM1J+fEm4EOCIWHfVWcCEE3/BlnchdnIZI5lDgbt1EyWnUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344495; c=relaxed/simple;
	bh=f2X4PmGvz1w6x2E6U7pcl7fz6GrkLBwvW1uql5aW0U4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOsuGq6LEu0KNHe5jO+ZPy14kBd4uFUZnchpkwN0208or7k1qfP9mWqtMR2ruF7cyYeTct534GxZfU31PWRqDW/+Rx1KeWQ6978zV6Xc49SdGXtjF8yhSLKQWp51xZb3EsjQKl3FjaCYkEx65mPZOpTtaveb/3pGnLgsciG4pgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aCGJzXah; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so36314365e9.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 02:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774344484; x=1774949284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PFxIqtbqvbTpQVutxQGCTHKwY8ACAbaiPzWH8XF9rbY=;
        b=aCGJzXahDQq9HAp8bLbnZaLo8DruRoISD7EBJ0tSaTD67qjbYZmswIOUylmK5kn4AK
         IZc2hQYLDYJ5MvvhbvunuNIU0p/sgLEK+WTwZo5ka8gmm0VbWi68X9TnTFmFAC4OUL63
         lYQK4CGNVJgfdASUzakKUZ4TvTSlVwQ5Dx047IcWK+wJplQfKhONoSUwevYyWbhwatiD
         2QKO5821k5yKG8iaZnR6Xqp42twV5Qyyci1NhlrpQYCIKDmN/RB/LeFAr9wUJ1vDg1uc
         EeUdBJLaYdB9ePq8DknVKsgR5yUjTTZzH2I4AQHSL8wC3jdkga2To8tq9QbhbyHRhJKW
         NKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344484; x=1774949284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFxIqtbqvbTpQVutxQGCTHKwY8ACAbaiPzWH8XF9rbY=;
        b=n7u48CplZbpGM8x6ng+9Wkr8qMLzpUI/2T/S5Ly4zS435p5a0bZ1mMVdpgaGd1qO0C
         WMo2/6w4/W7/F1BwXRoJ7i5QLM3Jcd0KjLzE9Y7HvwxGqttpo8172vKoD9aI7VMunLtv
         DzxMqt6uOEO93U1wAovmra2gkogvs58Nuy+4o57CzgTsxc4g1aOKLLAj+XSRg9wTw0+y
         UapnwyEPr/kvvhqz/8pmKAZXAo6YEDFnaeSQeJwteYH+eu44+3YcBnYHrN+kQO74mvMf
         gg4tJAVAK9CAiKWjGDLNVRFcWKjVkzWrJWM8mjRYnXBv1l+104qMw3/Nm5DWG+3TJ8JE
         IkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiVS0WL3AQVaNHsEiOJH8zsScbzUe/C2743cJP1XNG+sBIrKMJ1BlMqiHv3GFpr62UJh5tYPkPmQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoG/PN6mSxN11z0rIByvk8dB/N8niWdjmwr21XWNeFN+RRPES5
	PHCTnzLvUuz0O6v/a96zWeE4GrtG6RmOiaoVOc5hy4QSLqJDE9PE/irpey3Oxm7dalc=
X-Gm-Gg: ATEYQzwcJBLT04StucNOZfw26hYH2uil3ug1b1MktSLrYJXdgYXrgobBF3j/0jAmdhl
	3oUGcltvXoAfLWpZWVKzp0n6jTcSmDjQ967ybHLNm8ybXZ201xqgiQGIXUqF6BXHViLfAUBeYps
	23OEQ+67cKFV5nziuWFJxxo2+MvLSh6HfREx6BE2mu/vyk+Ikl/4YyS+9x8rVZn6XftP8BdY+//
	i0mtcM3HvoYkX+3+AeE7P8XsQWHaZ8dpuIZJQ93fBBpfCjsOXxmcaqPRRfQfzk1y7tXG+3z5ESb
	vjC6nfxnVQa6M1v+RrN0pdHGWZIfF9qzgulTW5GFKvA+KmT7Xy8ZDRSjUKbJNYZEKCoVU/NGaay
	ZnRLTRmCXd5guhLdrTHurwmrDPH64ZnilK3AhlXhf23CwkRRuYCFgceWEZnv15LHvSjtnDrOQOe
	f8Vp+jdXtw8nB320zcIYGz10cVSD81CpL3Xhy2RGA+g47yTJM5U4ifdmSnXwNrPe/5kAXKr0fVW
	tQ=
X-Received: by 2002:a05:600c:a418:b0:485:3423:727d with SMTP id 5b1f17b1804b1-486ff03f502mr171008755e9.26.1774344484101;
        Tue, 24 Mar 2026 02:28:04 -0700 (PDT)
Received: from ?IPV6:2001:a61:1332:2a01:88e9:6e6:b5b2:fd40? ([2001:a61:1332:2a01:88e9:6e6:b5b2:fd40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm35740014f8f.37.2026.03.24.02.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:28:03 -0700 (PDT)
Message-ID: <44ce5041-7286-4f59-837a-995c4e1307ab@suse.com>
Date: Tue, 24 Mar 2026 10:28:01 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
References: <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
 <20260321021439.7pmcdrpb5oxbivct@synopsys.com>
 <5b378006-666f-4a72-902b-bb5f466f7895@suse.com>
 <20260324010523.3ufngdffak7ldchg@synopsys.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260324010523.3ufngdffak7ldchg@synopsys.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[rowland.harvard.edu,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35371-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C5D60305BFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 24.03.26 02:06, Thinh Nguyen wrote:


> I attached a couple of usb traffic sniffing traces. Review comments
> below.

Thank you a whole lot. These are extremely educational. I am not sure
to which extent this discussion is on topic. Though it makes me wonder
how we'd deal with an error in the last phase of the command. We'd
be unsure whether it has been completed.

> Yes it must. I was responding to Alan's comment that noting that it can
> be done prior or after unlinking the URBs. But as Michal noted, that may
> not be possible because we ring the doorbell right after giving back an
> URB.

Very well. That raises a fundamental issue. Are we planning around the limits
of the existing API or according to capabilities of the hardware. I see
two specific issues

1) What do we do to URBs after the URB suffering a failure? We cannot just execute
them.
2) Do we need a second callback for an "undead" URB, which decides on how errors
are to be handled?

	Regards
		Oliver


