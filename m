Return-Path: <linux-usb+bounces-35259-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOqfCKuIvWnQ+gIAu9opvQ
	(envelope-from <linux-usb+bounces-35259-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 18:49:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A52DEEAD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 18:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A3BC30034AD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 17:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3A53A9624;
	Fri, 20 Mar 2026 17:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TvZjdt9Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B913C1404
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028964; cv=none; b=ODn3yP08Q9iWX8+AmkRAKNkkH+KyAyHxTw6QlAqXcw9L5FAI3W3m3ggxPs8xAhkVSlADbs2a3rTeZG5Zkh2XlXZW6j7YsxP0O24le7GmA5PRWSU41jXEjdzGwyoxuy9rgLjCgz5by/sXb12UTjdvIyjygNBpSWoyXy51sPIyut4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028964; c=relaxed/simple;
	bh=jqHJA9X/FIKBYBZcvT+PTfOy/xCvmu1mQXRZyqY/UD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9jCD+p5eN+tfHQODQBWWoyp8roTJG5516SKJD+/I+8inB8BsO9sQlofB7ACH0K7ANQ5UwCW+EH9XyvDuT1bsAMh6fnW2LowK3p9gqIKn1jaWNwJw1jPYg50sVtLhCNj4304meueJHR8lgDL6aQy5n4IsDJmgHDqckvlPjnv5SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TvZjdt9Y; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48541edecf9so23022495e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 10:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774028959; x=1774633759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qE1O09pFM4Bhsbkl14ca8cBszSHY1aPe45MV5BpTG7o=;
        b=TvZjdt9Yl9/qD6mkGemjuwbDigq43n0sCiTYAaoNH5wgcz3FUjF/riXHFL/wYG/v+c
         awsHNnat3XvLJ2iEozsjB7Gma5pI78eSVrxyTq9vNTj3YOWseNIIam6+30TWCId1+SQN
         u8TOLYA9XgL2rrkUgOOmH09JMR9MlwdI3RuNEycX1JKXFeSB4We2GwAr4xRGZrNcObeZ
         PLF1o7zKSzMIE2TUZlm3GsZEe3s4QDystKK+MjTMNsnfjLjQOZcbXWrQ7WV2t9tAetDV
         R0o1K+s1pknlvsREoiQxHQMITnhTMTpVRaDQKh8RgoIzfeoltmwwqUTAj281DMNm8Al6
         z4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028959; x=1774633759;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qE1O09pFM4Bhsbkl14ca8cBszSHY1aPe45MV5BpTG7o=;
        b=fPKf1h5SXP2SzU8dE+6kf7rrN7Dgh7b9PQzoxga3Vcs+p9NDSZdPjHlwfR+bO5Mo9x
         DflATW/NOHrjDv5CI49Y1EWVAAJ5rReZpK0hFg2P5LZNjdEJiY4xq40Oy080BWhYfLb7
         tezhFJS7cCp+fT+50T6v2BCi1EuWVq0LCcZdFQVI1mkd0N2jwNzFPuwL+3TkPj7ErSec
         wdUTgK6JedkuHPkDy2dWewYWidib/qioQfGuHsr7657QJR24dztMlNZE7nzu9N+j8t/m
         BCGP1k0BcNIVSQp/5cGBYDPHFs13m84lYL3Je5XzNVRflAt19WNxnjgR/Q9leP1NkuJp
         4uTA==
X-Forwarded-Encrypted: i=1; AJvYcCWl6i1eEEwN7EvdPrK7r8Ta71IJ/EAWONmyE8lFXZrri70kOLcW7WcJwNKSmxbE2NoOsmCjgNLgc0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT5dbR2J6NV7bO0vNhQXIV93hZGLluVBVTT6MpuIA3rb0SPTqw
	ONBOSFfEAJxFROIQrrrM1CX5wQAG7DANfvqxTvMx8PagaavIN2Hc6t6wCl9y2wv/jWk=
X-Gm-Gg: ATEYQzxO4bNboaiN0k03aX+Vog5RyTcZiUHOkEgKJhiTd0/sIHyJVS1dNgFcDZ/SHHm
	E/01QS7VyQ6kuRN2eoA/B2/OIG/KmaEFz0W/FgSmX1rhiI1T2iIx9gpvi/L47M2VQadi2HGgYqv
	+bxUHdCxInE4iwATlzDqReqAt6LVesNPqry2hKbIqZytQy8bF0MHeKV3TEmCI/vl0TM/lotJmaV
	yoRijVtAFePwaAr1Hr/oYAB+0wXx/oD08Y3R34E5sVB0k/qluIKhIIME7jRicvMC48vVuiS+sMu
	oPUsW5vNBvV2LfbePZN5xjqkpBLzPuwmiddTORxOdOapFs9tRWSW0WZzSiVgySA2J8SQIiPG+79
	iy+7Uz9tp4bXw0oC5NAMIC33WeCIpWJfzgGVSn2NnYe020Iy6vQKXAi6wyuAbzEJLeqUPXz97cl
	vnD4fIg6C6hShbgSeEGvBBDlls1yWRzKPlBVb+vYcB47MNU2S1iDO4UGcVvEYEdTOfMYk=
X-Received: by 2002:a05:600c:3b07:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-486fedab4bdmr59425915e9.7.1774028959425;
        Fri, 20 Mar 2026 10:49:19 -0700 (PDT)
Received: from ?IPV6:2001:a61:130a:cb01:28bf:ed4f:6d61:d273? ([2001:a61:130a:cb01:28bf:ed4f:6d61:d273])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7d6c54sm188296285e9.4.2026.03.20.10.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:49:19 -0700 (PDT)
Message-ID: <cde4d2d9-7b7f-4948-a28c-00eb935a9267@suse.com>
Date: Fri, 20 Mar 2026 18:49:08 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Alan Stern <stern@rowland.harvard.edu>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, Oliver Neukum <oneukum@suse.com>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 USB list <linux-usb@vger.kernel.org>
References: <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
 <87a692e2-559a-4765-8321-a422751d3589@suse.com>
 <4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
 <8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
 <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
 <20260318223851.1f6d07d7.michal.pecio@gmail.com>
 <20260318235920.ioek26hdr25rkksp@synopsys.com>
 <1eaf4cf3-4278-4d04-87aa-8b6069d544e1@rowland.harvard.edu>
 <20260319231620.3ukqxsrwqikp5zbd@synopsys.com>
 <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2929d47c-fc02-49d2-873e-758f24c43071@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-35259-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 1E3A52DEEAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.03.26 17:20, Alan Stern wrote:
  
> In fact, the error recovery sequence used by usb-storage is as similar
> to what Windows does -- or did, since this goes back quite a few years
> -- as I could make it.
> 
> Naturally, UAS may be a totally different situation.

Sadly, no. In theory you could use all the TMF features.
In practice that does not work. Plus even if it did, we'd
be forced to reserve a tag for management.
I have an old patch set for UAS implementing the stuff, if
you want to play around with it. In practice you
only time out on TMF until you need to reset anyway.

	Regards
		Oliver


