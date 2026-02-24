Return-Path: <linux-usb+bounces-33664-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKjrIBnMnWnfSAQAu9opvQ
	(envelope-from <linux-usb+bounces-33664-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 17:04:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A10C189857
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 17:04:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA5823076548
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 16:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E592D3A7834;
	Tue, 24 Feb 2026 16:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gcFZ+n/e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117723A4F42
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949078; cv=none; b=pI4XUtcYW3a4mEPR+EKC00f7MLvhCYs8HCI9Qczx1dBPS4xelbTuTVF0SyVVuhg3wLKU5rWRdWc59cdkxM6TbdQ4GY74sZPMK/StEBvuBSpNDj+t+yiMm7JZv5cPyxQn/OxhFFDjrx0vPoq7TMvVNzA2bZqF2EuaHpK3I6jZMD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949078; c=relaxed/simple;
	bh=Ce0cyfR1TjnatrHP+FvcTui73Px5GZDUo2JpOSVIpGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJd+aGJSQT7ml4nmF0TGj2eEnnHMYKhwXpk1OCxDbzgQkyswoOsukeNOTqWP+eI9Qx6jT8Kf2RNsBaIby1lsgBNcUIr/A5P4/R9J7tj1nwscXeQxPG00oGdOHdB8VAQIq4i+AQW+ZKD+ifyIJDxyqdWQ8dYrs3/JhYTIFeD+iVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gcFZ+n/e; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43989bd056bso609176f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771949075; x=1772553875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oZf43BBcuqUv1lA5xZ8oDauoycbmfONvfhKvGJPnsL8=;
        b=gcFZ+n/eKg8egsh6ORUY2xNdl+ypgjpNlzhVcAGAituzBXVTiZlAq1ku4StEg0MK3v
         NiOE6c4uLo4OYWrL3gB4WyF1xRp65Kf2xxey4Vnnsp3zMj8hunLK4mDnY9Jj2YK8LaVU
         HCZrbgT2jb/fOKAQ9dG6IsqfcS99EfLqZcxiC/snqkq/yEaJaK3vl/bnRH1TFSsQj3Na
         lWCCcr5Dpp0NdEu4wh2Tf6hduBIBfXZwjGeqjvSzT4qZG9cewsT2sEVf1hwIDXfLDXB3
         y4Nkm+0mB92EO8lVJlGsevY2Gr4Xet+OFNmH4rEAOBY0nkyEpNgP9rbayiQVNIPvlYdz
         SmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949075; x=1772553875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZf43BBcuqUv1lA5xZ8oDauoycbmfONvfhKvGJPnsL8=;
        b=O2AZ+qwrwxdhglxGdpcPOcmJ6DWS3ZzSwZXXPsogp+MWdIzjXk60+R04tmNCx0RXE3
         ezJjv92JKD2HnTU2wW+VOY33Baii34iUJ04IgP1i+A+EF+tgl8mr7SYnBENnRxE7YMdV
         dUzB8Ju1tNK8dYeulFgo2syDpm99Gsk8Hmw52wcUUE18mMMNnfryHIYnZ3oR281yUJ5C
         a0+Y+l67GNR/g5zJ/qGNsDb4/3TY1Ygy9n4ET6A6z9FArnRg57rnd3ERwbmXe4YXDZoc
         p54jHX4X3I4+94J9QYFUT42FdOh3WpS9dLF9/tOGxJr3INChsNeR5xegt+WHY6xrv2Ex
         DWug==
X-Forwarded-Encrypted: i=1; AJvYcCWo2FnLRLo3HTKX4GpLoTzYqhzBjXMsCMQyEXdVljzMu6QbFKQ0nf3KJ4tPQqe+DUf+xsS5FkpOO0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN35OvhGJcgyyODDdbgWMLH2PBt3ubz+k4VuWPnSS94neEv8ZL
	jUbclLikpMLYgsVabGnbVbDJuBUbsN6rvfChqvByfCp8zQzOZWd9vaP4dRlhJkXZUCU=
X-Gm-Gg: ATEYQzxUi4Uf9e3BmE8ZE4BJE3s+N5Kx+PGqL3bAndY0Zf6lMIs5qdgO1RIYyaViB6G
	kG6rNlIMQgJUrJe3c3oXneWm2SADZc9lq7PaGIaOnqQJfP3/VF0m4dzaKdyN7wMK5Xsj7ZThjOG
	q8Oca/Z5gaY2EzVxHJOU+krDhcXGOGCz91j3kk54cdnXv9qieiqX3VKCbIJIwNKgnVB83fzA8Pk
	zfdIk//ZvuBBHKLsxejcx5Dr2J/RUIiOqVeCwaZc9ecTt2nNfLYI5BbMAc7kz9VftAF6JJWIT46
	4toauQ8351cmNkjcqTIEmCXanAVkay59ZeQjPZ+29s7zCjijqc6I0vlfHr2uy2PKPrCdEo2h84d
	Tb+FhAryDCCop5cWX7geDwBxPVbhfuoETuUG6ioQq+toBU8avPFEd1rGr5nc1IIxyw70W6dfeKG
	XJeQzclXfm/7xCO138qWFszm4ZjsDvFl66pSOJQs1xwZDi35Hgl6FdHKBO+jvQGCSWaGE=
X-Received: by 2002:a05:6000:428a:b0:437:7300:eb1c with SMTP id ffacd0b85a97d-4398d965037mr649596f8f.26.1771949075310;
        Tue, 24 Feb 2026 08:04:35 -0800 (PST)
Received: from ?IPV6:2001:a61:130a:c601:11aa:e71a:5113:31ca? ([2001:a61:130a:c601:11aa:e71a:5113:31ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4398bb96b90sm2991810f8f.9.2026.02.24.08.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 08:04:33 -0800 (PST)
Message-ID: <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
Date: Tue, 24 Feb 2026 17:04:28 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Nicholas Carlini
 <npc@anthropic.com>, linux-usb@vger.kernel.org
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33664-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 0A10C189857
X-Rspamd-Action: no action



On 24.02.26 16:52, Alan Stern wrote:
> On Tue, Feb 24, 2026 at 09:44:35AM +0100, Oliver Neukum wrote:

>> What is the logic behind that? If we can trust that a device
>> is what it claims to be and operates like it is supposed to
>> be, why do we verify?
> 
> Greg said that we trust the hardware once a driver is bound to the
> device.  However, the endpoint-verification tests occur before the
> binding is complete.  At this point we do not yet fully trust the
> hardware.

Why? If we do not trust the hardware, we cannot depend on it
telling the truth about itself, can we?

> While it's always possible that some real device somewhere will fail
> these tests, a much more likely reason for a failure is because the
> driver is being fuzzed.  We do know that these fuzzing tests occur in
> real life and that they will crash the kernel being tested if the tests
> aren't present.

Now, if we are looking at regular hardware, we need to ask ourselves:
Is it likelier that some devices are different from all others,
or may they have a race condition with a small window that leads
to faulty data packages rarely being generated?

	Regards
		Oliver


