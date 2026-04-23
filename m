Return-Path: <linux-usb+bounces-36437-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NIzEVft6Wm2nAIAu9opvQ
	(envelope-from <linux-usb+bounces-36437-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:58:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ABA45021D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 11:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E1FE336229D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 09:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2A63E6DC6;
	Thu, 23 Apr 2026 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sb+rCSvY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599C53E6DCB
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 09:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776937752; cv=none; b=PyUWxO/O1EjBndyozTJ6F/waB88ErFCzxq/7XZQAs68I8j8h3I6Kvd3PJ1LM5hZg2ADXrofCaM5U4RchssmMdmkZQs97Xs5VL5KBvCkoWDLLBQeCbLdiHR53SQV6vN98R/3ShF4j5YXjMIHhOVUqqECkNJDMHVFFnLoKm+LRTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776937752; c=relaxed/simple;
	bh=Y4PousOcVaaqckhVFMiOi8uTDkYPT7iGtB2HQBYZueY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSsQq96Heom37Kjq+Fb6Ws1J9p9Qk6RmijygZBAvPaZIDNF5TG8SMciWKfMPUUOTqXQ8Qv9m9/1R9pnxPXINFdP5Ocr4gGMK9O0cH1Chk+9/eEtklDcGJJXNs9A0NI92YLUPkD/4xQk5kFHuaoWJtzkTqbVVT5G4K94x/CjVmyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sb+rCSvY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so56990525e9.0
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 02:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776937749; x=1777542549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6CuFxsCV1eHyvW4GhPycszzfiSTsoYnKx4YlTr3Mnw=;
        b=Sb+rCSvYROZ71ajnKOBAfVpACSpObz+x8ovCArUeEm7zPzAFExhK1bd7SajpOCSeOT
         s8eseXTeU5rmk8g6LzhxXX9GIMqgoyRtWdoWIyx0YQLjxYDfUQIRT1VImJP0QnvVnq8x
         1g4eSCzXIIzxZfrUZSjYEl5Xv5Hu/fHgWfYrSd/sdyh+WC1RYeXVeFCuOlJfBqOhHgil
         5PCxnPj919iLeb6I6giCqqoCWPNxLlKL7KA5V4duFHm8/OmKVRBRrAhMTnYJpblQ/z48
         xG5kCso6VQWq1F985gUOKyCV50ZX/Grihc/FlF8NyVAiEaArE6VqE7e/TvrKjQ7XCfpV
         Plbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776937749; x=1777542549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W6CuFxsCV1eHyvW4GhPycszzfiSTsoYnKx4YlTr3Mnw=;
        b=kXe7ACUjhWgGGzCvfchHCN+Bbbrq73+raDW4rxwDD8p6ZFJBNSPS44AU9Gjz9CKZky
         zLP8Ncc+Irw1VLwkg91KXgmym59zooes+iy+rH+rdy4vLk0sNTtleq165F+KY1mEz+Kj
         wVMPtfw2woatOyw8Dpzieb5UoxpbJCCjF4KtDigv0U6Fr+XLNQgUwOc6rMJhfEzlNL2F
         ykW4BKKrdOmXJESN0U9PNckF66rwMidSQtno9qCex0KXtzUWEBvQRNGQx8mBT0cBx7WU
         oiaAA0wJgnv6ATKsGwhdTq9FgrubnI6Ix0xu2DGFlqY3LwxtE5kZC9I6CzImeDF+a6Ms
         K5dA==
X-Forwarded-Encrypted: i=1; AFNElJ8HHOD3gX0xJGuDc71DKrTxUM7l3qllW3bfvNjUJCyM0GnD0ENY6kzfRDX2yb6O0Pu6bl/qhp9iGLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCaFWsxCePu52n+0wR/j6gpmO0QVPusHdo03lA154MBR6MVpI+
	zIs2xZ3cHeRSUE0Evs8bJqoBnUZybDGOFuIZ6mpiSoPE40aUkJDVtPwzrvlOyJdK35E=
X-Gm-Gg: AeBDieu84Ficikr7KZVic0k7oidvDXD5yszhb4oXpdrVTzCTYB2vi4epn7OX6Vs9av9
	T7B6oR1EWzYTniuNc6yGxxP+B2rhxy3WqYOPdGUBOyPqi43g765zdOGb4FFZpdGVciRv0rnbBzA
	+udQ2SKv9WdI7tS555A+/MsieWbOn6UEZickjH5njFJsEh19ZFTsXZQWorD1yv3MraSkxbiUoQk
	U2Di9uSmPsv615hhMG6c+uZWygDtQJXVIaDUlLxVV2jmzHulKSSgFlvha6ekfiwUte+oxLAtL3M
	KJBrg+kEZg8HN8tk8UIk/EyIIPwNYUORyyUnPCwUKCVs9mXwofibNhdIb5QgO12sJfPTr8wEru+
	85IdqpBSaDkG+quzSHFmJc2IanIxMjjZ4vDRKuVS+gqFvBUhLV8vMjE7bzeVGnWLBejGBAI+U2H
	9wzB60Cg6aP4HRQ2wjzRMZyA5u2gZxc8W0PVLnLfA5W0hEv1+O8Rkvv7bRxzqNm7ei+HJgbirYF
	S5DIg==
X-Received: by 2002:a05:600c:45d3:b0:48a:5821:5ffc with SMTP id 5b1f17b1804b1-48a58216a4bmr135595135e9.2.1776937748707;
        Thu, 23 Apr 2026 02:49:08 -0700 (PDT)
Received: from ?IPV6:2001:a61:1368:5101:a8e1:51e6:2ebb:a0e2? ([2001:a61:1368:5101:a8e1:51e6:2ebb:a0e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm207617095e9.12.2026.04.23.02.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:49:08 -0700 (PDT)
Message-ID: <7312e4df-9eab-4678-bd40-ae7187a53827@suse.com>
Date: Thu, 23 Apr 2026 11:49:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: usbhid: sanitize hid->uniq against non-printable
 bytes
To: Greg KH <greg@kroah.com>, Eric Naim <dnaim@cachyos.org>
Cc: Taylor Hewetson <taylor@exponent.digital>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260418025823.21767-1-taylor@exponent.digital>
 <2026041845-approve-pelvis-9845@gregkh>
 <81ef5ca0-b070-4afc-bda7-3e5a49677115@cachyos.org>
 <2026042330-underarm-reusable-effa@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026042330-underarm-reusable-effa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36437-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5ABA45021D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 23.04.26 11:29, Greg KH wrote:
> On Thu, Apr 23, 2026 at 05:55:00AM +0000, Eric Naim wrote:
>> On 4/18/26 3:14 PM, Greg KH wrote:

>> [1] https://github.com/systemd/systemd/issues/41339#issuecomment-4266429563
> 
> It's either up to the kernel, or every single userspace program that
> reads the strings from a device.  Might as well do it in one place,
> right?

No, because that puts the assumption that user space is not interested
in what the device actually returns and uses these strings just
for printing.
Eg. you can no longer use this in a udev rule.

	Regards
		Oliver


