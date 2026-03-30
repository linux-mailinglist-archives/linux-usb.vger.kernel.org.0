Return-Path: <linux-usb+bounces-35664-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPUwLB1rymnG8gUAu9opvQ
	(envelope-from <linux-usb+bounces-35664-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:22:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8335AF60
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 14:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6C02B302C379
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 12:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899463C3BFF;
	Mon, 30 Mar 2026 12:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DdlaxDAY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451930594F
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873052; cv=none; b=kcEl9qMj7Osyz9t8Bjb922vErtvF3zY+Hw0xvaKtJJoNC5vM0FKelVukvsigWYAsVjzqO7tHAYgUX8qfc/z/HaC4on+5md/7VOcRZ2+PI0YM/v6AIFBbn+WA5ch207Ks24srx777JidzNjzSrC8yAmuIhD7nMFRhg9xkyUTi9Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873052; c=relaxed/simple;
	bh=huX5GU4mg7XTQNFDIs5ax+BpCrAFvc65U/YSZJ6Cj/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=sSlhMhnHVtLxbP39LANCMGJvUsHnzKO0iUVbTov9jOFq39KhkjhCxP4zkZeHg4ItTrwHetcjTnKTd3qf244IzivBwixMMl5ic+rQFsxrA2Q3vv5OvA4ZOBqNJWqMX8y3W7lJpMjzXnhyBGIfuq95BFFfvQ6lIyc4waBe3RgFK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DdlaxDAY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso35832865e9.3
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774873049; x=1775477849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VdAbQpF9Yri5l/JqAp8LREGFHdLjibhdiCY00f8L7JU=;
        b=DdlaxDAYesErtFVhyHKGHq2QthoudSMRVfifYvt38u64Dr23ZXVSMPZCXn2XC7wUHI
         T6eTMosFI2frlv+W9XeBKIaYPR2dPbjOBX2TNyR58J5vgxldVOYyWH7a3RfpmcQ5eKa+
         wPTruDVPngc7hohxwcvb+3nKlSzXx15Ae7ZM5SHVtzPCUmEsZy/9yEG/yt7Gz8yp5AWt
         pHJd2xDUd6tXuKBWgcwheeTBGI5FYU4P56JAuQ8hG/DNG3Z2mqTMDZwMeYDka5cZkA21
         vJjnzM5h09hIJ6K4N/m7wiX1btUagcI652R/sJGogVQMWrbVjIX71+jIChZo9tGHpna9
         zAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873049; x=1775477849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdAbQpF9Yri5l/JqAp8LREGFHdLjibhdiCY00f8L7JU=;
        b=dWvWykeZEyWRztXJMB735zuV896adlKyA+ur6WFHrg3GJX8Okv6NvJ2adFzXdrVnL6
         q6lBb3YhXiKAmgC6lcDmPub9AqL47DBuFpSi9QFx04P1AKkReDV92mAJSqGd9DPywemk
         Wn2U9EMbMGNsgV1l+HSL2e7J4pZXdW90Y9o5HYRdOiY9LxZIO6vcLxwDuYGOUXtmcJbR
         le8xWphRehRfO5ip/TrG6G4JwEiEOs3bbX36mEOqnFlgQG3v+xNQD6AJR1/v1iWxd3Mr
         Spgy6MsY7ZkN7jJ0kpBi0xGpFRRZ0RB1leDEp7HOEoHnrO2RoopVRb6SXakHD+Ppm3lx
         gLRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2nYIclaMagtzaqz5pZ75LyLJsvtWUq3AxKR+HTrq3F9LB5UyDti9IBEXoMZ1JMF6zFlHgzzW/CV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ92i9xx/1pJtafA5OYFIBHS3y4oQI9I+Xj+RCMU2I1x/s08Y2
	zunb6PIjxqIhIZSnjjouJbex0wb/e/OiuqZaKldemH+PrsAAeFuhThOdTrt90TuHsCwx9DJ7LTT
	s5qMt
X-Gm-Gg: ATEYQzx6pJ8Ed2o/hP7VsfvkU+gkTkmwp3lp2YHtlBX+kXdl0q5cwy+8tJXcA9dHzK8
	nP2SfgrxRoXCpBouyHZevjfx+Tbzex2BiEvO3mxURCDZ7HiSfsMPpkNoFB30h//O1rJ8MwZW/E4
	fTS08/LIZl+XvXVKDWH3qzGs3sMk1j2FniF1QA/fosUZuDgnoUNuzLx1ca6TAWqhoEVZUqlieWU
	2d01MfUfOZzUDGM6u0AZzMyuOohLE1dmcuLoAMTbOTzYYOhL4PjYcgc85VicxtyalT3vDTORa+z
	Qm/y/cJiL060Rjgapm2Q2vKj6QL9+DKyiIR21zCo3NxdifquiyIilc/iafCPV3cxX7i22u3w6oh
	idMb4zAP4D9NXHjfW06xSncmEE8dFguU7xb2PvjwtbiXOAy1mVkAVm19RdQnvw5IR0wBWpqAhlQ
	NXXcUQChRjynL/eZngBfCFEahLj5PmMbmHMJfuquaLAHeiCOOfLLQBxBtEFnIvZOo25Q==
X-Received: by 2002:a05:600c:3592:b0:485:3949:e5c6 with SMTP id 5b1f17b1804b1-48727d5943dmr224717805e9.3.1774873049105;
        Mon, 30 Mar 2026 05:17:29 -0700 (PDT)
Received: from ?IPV6:2001:a61:1373:4b01:cc61:7bc9:bea5:a415? ([2001:a61:1373:4b01:cc61:7bc9:bea5:a415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257b72dsm19142291f8f.34.2026.03.30.05.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:17:28 -0700 (PDT)
Message-ID: <5717b2f7-1f8c-441e-b905-f6fc8aa00eb1@suse.com>
Date: Mon, 30 Mar 2026 14:17:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UAS peripheral with unrecognized TRIM support
To: Johan Gill <johan.gill@bahnhof.se>, linux-usb@vger.kernel.org
References: <1717beab-848b-4927-8fa5-26fb5ae05495@bahnhof.se>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1717beab-848b-4927-8fa5-26fb5ae05495@bahnhof.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35664-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 38F8335AF60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 28.03.26 17:23, Johan Gill wrote:

> It would be nice to have the adapter recognized as more capable out of the box. Should I aim at patching drivers/usb/storage/unusual_uas.h?

No,

because

1) we cannot be sure why the VPD is wrong. Worst case is that it works
on some devices, but not others and the vendor is conservative
2) this is a SCSI issue, not a USB issue. Storage and UAS devices
can be real converters to a SCSI bus or device enclosures for
arbitrary disks, whose capabilities depend on the concrete disk used
in them

Hence this issue cannot be solved at the level of UAS. You need
to get a quirk on the SCSI level and discuss this with the SCSI
list.

	HTH
		Oliver



