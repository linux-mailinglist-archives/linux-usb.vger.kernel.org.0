Return-Path: <linux-usb+bounces-33665-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELXEDLrMnWnfSAQAu9opvQ
	(envelope-from <linux-usb+bounces-33665-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 17:07:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2251898AB
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 17:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F98130BB739
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 16:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B923A783D;
	Tue, 24 Feb 2026 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XjtUVRc2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526D423817E
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949222; cv=none; b=eVXLxWLK8M6fCmtgWjtT7Sk1wF0Pzznq+3XnG9S7ZfowAudsRSQ+b2zTyotvcdrYebS9D+YYmQx9yIJcKZsyX4kduUFzR+Jgvxm0YCsxCitaeyqGiRfU+uQUJnHhXM8l/oYDxXKoq2TgEJ6kzgEiqjriup8UKfNdBs8Zj5NBo6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949222; c=relaxed/simple;
	bh=Rz/RdM3yxntj40tHMVbCBz56NDvGJst9qX9LJs3G5UE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iEnh1G9vmAgwvs2jMQIwpvYpjjWaThXpEPo6wrXwLDs9LzTKSmtVYQfgzyLJlHRDJuKTEqpzdp1EifEQL+vPl89bHJNJq7hbSqk07//6ioF6qfyBOeu7eTVBBbm7sa37uloWo5znl6JL6xVJOipVigD583hLc9xrnTT1F2QQCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XjtUVRc2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4398dd671daso85370f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771949220; x=1772554020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGxEaLJuq5uhdbi4NUhV/UisDc0PwlBvhv5G70i3X38=;
        b=XjtUVRc2mIgZyV6xY+H+xVP05SNicT0GcXeDkzNDOocnB1KH8fi5+ekThwecfmICpX
         gC4yad+iQ86yDn9kJ97QX7nGBZzMgWp1Z6Lctthd6sHVPmivOHlaNyG6A2uB2woeBfFo
         JcHP/J0YjAfgcFEisNbVS3m7sB/i2h9oaITgMsUMpW4nOsm2Bs9q8NAgpZU3irJfEBLn
         hwWUcN5ZADdEHHhSco7v6t+S3rg5Fg92k9P1yTT1QcVMb2SOvP4gBhgomuH74dJcey76
         fhqMXc5xEUsSLXp1JrG/hm5EM+eK4f7iSsi0Mqjewb4T3ftV9VixO7vLB4/hQBU/RXoq
         QU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949220; x=1772554020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGxEaLJuq5uhdbi4NUhV/UisDc0PwlBvhv5G70i3X38=;
        b=BwS3LSQK/iF0jniaM0dyhQg8BuwOkzFjUAVs3msofwhLUcobEP1jpXwhLlXmYsqnbW
         4tW3Ihgrab8DIfAfX/qw5IW9PzKeQVPbplh8wBMFtCaujXuwDw10512Kl8SnkKD0HdyF
         uLYjO5EP3p4wIaRkn8Zv4IrjrYvPpPriakN52W0d777RseOnx2K0XfY5n6e7/9iQiEJr
         pvn2ncgh9fZIYQqm47nu+wwomY/FSLKblPst5/kD/Tk1KiscH8Gn7KTuqpm7d4fvAKgy
         289E67GGwY/lwlbHP7wPDHL7L3ADewygCClrt9KPIPIa+4cnelZ9WdPVcRBbKqEOAz1E
         /9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVkMStmBWPM0xKG7tVIO6Brv4dv0b9KEY664an01/3fa//SoaVqoyS7nawZe03cHuUBiNA44/8nYhA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTQ6Q6Ou7+RrTjK31bRlJ1ZuKfGENmedfBF1hhCMQySNp4kbtA
	VTE1icc6y+z/Mf8DkpXwEve38skDFdgWb5UDP7hT2G04Rody8qyZ/jDCyxzsgQTv9AE=
X-Gm-Gg: ATEYQzxHwcQTDKUcsZ5LOxQ3QhXIBHXZWQyuDDCb+HePHYhq9VfrlUeYcngcR9Kna15
	DUeZvkf/j0asg/JwLCQdjhLfJ5WY6nlk5iSqTIdsgUFQJiwsHxSMACuj9r4qYIso1C6zcyjLjll
	pxv9Nv3JUIIas7LXtpGJCgOAo4rVCbbyI5hOAkdUz8YmT716jzZHgQGsAPDTDfefxK3zYxV08U6
	T/zaV7eOrVlQt9lZtP7vIPxK4EZvG4ygtEXhML7wmd1jLgqU0bBecOTCI8zftMLAbp4cCglnlMA
	Co7kasrTyxAG2dVS83sOLAJJJM506ptc6gr7+BHSKk1P2+5X3TJ427fgfNTjmUHUIizuaZBDEzz
	94BWSpKjoFOZeWhrdluEbwGxur3Lfauy3W0/gBEoJV0WkBayFEtWKwExrgDMNbfSXVRE9Ynob/j
	ygjwKzeHIoIXzdUn2c5xLKUIAaf70X4GYoCnwrq8IZrWwTx5n0MOuM89/emVxmES5Buug=
X-Received: by 2002:a05:6000:3109:b0:436:d9b:cd02 with SMTP id ffacd0b85a97d-4396f113220mr22844467f8f.0.1771949219601;
        Tue, 24 Feb 2026 08:06:59 -0800 (PST)
Received: from ?IPV6:2001:a61:130a:c601:11aa:e71a:5113:31ca? ([2001:a61:130a:c601:11aa:e71a:5113:31ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm26324323f8f.3.2026.02.24.08.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 08:06:59 -0800 (PST)
Message-ID: <3ebbf02b-8c55-41ae-90f0-49247aa14f3c@suse.com>
Date: Tue, 24 Feb 2026 17:06:58 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: further issues in uss720 disconnect()
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>
References: <00b407f7-9adf-4666-bfc3-3c4fbbf7dce7@suse.com>
 <33708317-1a17-4d44-8dbd-423902db335c@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <33708317-1a17-4d44-8dbd-423902db335c@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33665-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9F2251898AB
X-Rspamd-Action: no action

On 24.02.26 16:55, Alan Stern wrote:
> On Tue, Feb 24, 2026 at 11:29:42AM +0100, Oliver Neukum wrote:

>> we see that it will happily access kfreed memory.
>>
>> I think the driver needs a wait queue for asynchronous requests.
>> Or should I look for a way to use usb_kill_urb()?
>> What do you think?
> 
> Another possible solution: Keep track of the number of outstanding async
> requests.  Then take a reference to priv->usbdev whenever the number
> goes above 0 and release the reference whenever the number drops to 0.

This seems a bit complicated. Why not just get a kref in every case?

	Regards
		Oliver


