Return-Path: <linux-usb+bounces-33009-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBT+DG7HgGl3AgMAu9opvQ
	(envelope-from <linux-usb+bounces-33009-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 16:49:02 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D593CE6BA
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 16:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 787CA3010B8A
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 15:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5C741754;
	Mon,  2 Feb 2026 15:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R7r5PWag"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791741DDC28
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 15:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047338; cv=none; b=j/UWEu59ttVksoUZpj0UbiB3YEiiAvD1eKz7iVlfgbQD47npayo/Nc59lhkt+SxMccdH7qPhruuZs69FBcY7XG/nuDcmjdkjFe+Jr7jFCiGl2+9EWNX0ZY9zjhJuGpJioZ0RamCMfQt1fg5ZIX9tgSMR/UzxXQtefSKH9Ee4ueQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047338; c=relaxed/simple;
	bh=OAbXJdhCDBHhq7qKk57tzyoxjIGL5E1A/S3oMEGUmmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jQ6uwU4S9eV7mQ3PK+5+/INDpTyacitgzcP50mopKorXXQnq5NnCO/TMih+r2NxGJvag5RkgfblENJePbdK+RP1a1beECI19M7t2TXCLaCXpy+tjzbUkmsz+kj/8EiY6fPsKJHiXK9ypHcMOEaYJpqGSP24f+xr2fjoOAqx1RK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R7r5PWag; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so3830682f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 07:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770047336; x=1770652136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TT0/khnC8UevM+sztHZVeOrmJNAebfgO8MLsm9xz5uM=;
        b=R7r5PWagO3pEE/Dm/M+jZ9C9Xnmzvi8pVMnqSOjWHhUkdPqKQnkGsu/KZgaeS70Wwa
         VPFTiQS/HMvdxpx5oyN+5IKLfrGrkLoYZtXe/mNGGl88eje4wUoUI5FB4cIVT0it5JTn
         PdNtfkeFnMPXTymmurC4i2mYQn9vEwns2DTToFiT0Yy3KAvixwVUWNrQJe+JD3Vvd5XA
         neVfx7pz2gUZNHXZ86Odf7CpDgseEVk1fmp96xrn8W7oDtudYP3T+Z8Dlj21a7L0cllm
         qRduEKg3PL+6MdyKakyPfQaAQFWdfRF2Z6uu/ePr+T0vMU+19hKo3fLn6H6yZEl80jwa
         tOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770047336; x=1770652136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TT0/khnC8UevM+sztHZVeOrmJNAebfgO8MLsm9xz5uM=;
        b=BtW+QZqdsmaL5UOJtTntNVr5vNsU7TcUK0d8jOmeC47w7js3dX88kky4UrIGI97aDy
         Y4HF9zIZG28LMMGWzCbmVWWb9mQUozg9NEw7r0YYQyoHGbEY9m0HYhXWDEHtxQZNzdSf
         tI+fBAbSNvpAyMtoz997HNo/SvFL2xWiUJTpCAFYhzKsrUCFKEEFKLIbjt4JSuNJGR0I
         TQFdDBnWRXSmvWXiJt6faKkuTDLg1yqgEbNNHv7763x1YVKvhMUEUe6FequHwiK/UmUI
         11nxA+e9vSd2SW3RaC9JJuO4Vcmv0BCVsZQd1ZY3JgRMWAV7U3ipU26mcCN9RTpARvEE
         g80A==
X-Forwarded-Encrypted: i=1; AJvYcCVqxOBfQQD+hX6QedztSe/gSG687lBk3uoZHhKaLbJ/bXzhgtxjZFlPlCafj5Y6ccxQ9Ow0/tylJBE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzod6ovleC/EE2Pb2HcaZvEFwImzgPi5Edxn2gfy6Fuqi/3qbfo
	DmHQOUwBgbgorfAyZNrPDW96pWr74L9N0ls207P1olm1nwiUHXZHn6+ozOS0vM0F5O4=
X-Gm-Gg: AZuq6aK7WOV0AvOqOV5bdvEUpDcwmeHQLLUtJcBM9sKcrHqS1C0H0wjV+nMaiKRRsMB
	msKM77Mk//zA0mR8xBcslogeuFduGlquVZEXjax0/Iw6C/qdjMmIEf3Mos3amJ83I08ZsDmZPAQ
	BGHRx0Lzpjg/Sv8rYBQ+OkoEf3CL3ekY2jqUO9paNI+4vUYvXQ+SSFqvPVDKRThrbHA1n+PuJCX
	+eg0w8ddlKwjwY16aYsEFW7AcWq1JBad2oFbtH4CeO25IuJdqdtyiWm0Vfm+YiyBs/WeEcH2XYd
	LB9Ro8wfMoYEgc4oFAXB/WmLHBwXoasp2sfzz7OjLeMw8rs5VdE8MOIAVgtA4VTWkiHDQsIo5zd
	KrcPkQGXYKfEj2u9GDePVIsCBc+o6cxxa6eoIFLf1pKwg/yfJeFwVDqWFJVhM7RaGfHDKVV/K3p
	sbO2ZoxOlX85GTZ1gRhEnz9sVhIIzGhMTG3fcwJfeZK+Fz4Yz66gCQ5NL6/XokLdqvHA==
X-Received: by 2002:a05:6000:26c6:b0:430:fcda:452d with SMTP id ffacd0b85a97d-435f3a72b46mr16660252f8f.22.1770047335878;
        Mon, 02 Feb 2026 07:48:55 -0800 (PST)
Received: from ?IPV6:2001:a61:133f:5501:1fa6:d8e8:bd82:1a4c? ([2001:a61:133f:5501:1fa6:d8e8:bd82:1a4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edfccsm43041412f8f.17.2026.02.02.07.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 07:48:55 -0800 (PST)
Message-ID: <1c317994-2932-4e2e-8e80-1c90606e63c9@suse.com>
Date: Mon, 2 Feb 2026 16:48:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: usbhid: Intermittent EPROTO errors trigger USB reset and
 interrupt user input
To: Alan Stern <stern@rowland.harvard.edu>,
 Liam Mitchell <mitchell.liam@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com>
 <1ebf9d19-7293-4902-857b-164fd4d21f25@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1ebf9d19-7293-4902-857b-164fd4d21f25@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-33009-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[rowland.harvard.edu,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 9D593CE6BA
X-Rspamd-Action: no action



On 01.02.26 21:40, Alan Stern wrote:
> On Sun, Feb 01, 2026 at 06:57:06PM +0100, Liam Mitchell wrote:
>> Hi,
>>
>> I'm trying to understand and fix intermittent keyboard/trackpad issues
>> on my 2013 MacBook Pro running Linux v6.18.4:
>> - missed/repeated/sticky keys while typing (this thread)

Alan,

this raises a question. What happens to KEY_UP events generated in
between the last EPROTO and the reset? It seems to me like we need
to assume that a reset implies that all keys have been released.

	Regards
		Oliver


