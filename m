Return-Path: <linux-usb+bounces-36738-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFCyF1oI82lswwEAu9opvQ
	(envelope-from <linux-usb+bounces-36738-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:44:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8049EC8D
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 09:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6776A300A653
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2026 07:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B923DD507;
	Thu, 30 Apr 2026 07:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bFb8c50c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9BB3BAD9A
	for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 07:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535052; cv=none; b=qCTmcM9/+JwDq0WTWFIHXqppgSgNDI+npHkuw6J0p5mIbZL9AowsREE+AKSsN3J/o2SNeNLZ0vg5yc5/u/qpTtwfdgUzE69AJSvrqHTukCXCwdXqZXfqP09jE/qeq7s8roXzVUL1WO8PyGp1vka80elyoKGMCCq8qijTCBFxKJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535052; c=relaxed/simple;
	bh=xQAiWiKRZknMt4OiF6xRbP6A9xpo4UcsDr6nkkq1v3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXK+CEBLhalXU1hfXX7VAnRNDf3XiJqS2+yS/7Jn9KTLNbHl7RFzg8y1Ik0xYCgtiRrk2OXvLnxKjgFn+aR8iPQHsRNVI/Yc5xUpwBAAq62pIjwG6B7XFXt34m83TqvdVjRFDh93S6J2zmI795tO+6cyfVQtu9Jk7bfHvGTqFGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bFb8c50c; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe62837baso318548f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 00:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777535049; x=1778139849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xjr3lQ9N85a7v4wbfT9HJYQv0tAfWVt69OdXRIx5aeQ=;
        b=bFb8c50c50RLq/L6Hp4X+Dth1+9LEo8KPouDqKcw7hc7Zmg2I9MptGukJnHL2UaIly
         HD4aLwJHDl2u1lKZS3rWxYr2Evdu9D/Tmj2/xyktSJX+zACz83lAAxgmaleQK4feSVEz
         kUSCJvP0qkpcugfe2wNFildvbehSg6ONQ2TbDrT28NBbYfGKX3s7P14vw8UUy59aPItG
         vYrItOZtAJzlz6pJPfNtkbNHKMM1ci8zQCrYQQ4+JlhCf/BitBMdmf4UfzSQBMLu7+ye
         Pu+M8m215PqdOxmYrWr8gTzg/Y7sq6GuVefmNEfivraTkWxNKJyGkoURQDCcvUhQLsat
         ABMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535049; x=1778139849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xjr3lQ9N85a7v4wbfT9HJYQv0tAfWVt69OdXRIx5aeQ=;
        b=PiqW9oTho5VdsG8B5RqBsDyQpraUfq7tCHfXJTG2mweZZSYo0MeSNV/1UF4wOY27qi
         sDVjYqa9Q+HQn2qC0FCZxHAoSFxneoCdjgiQamm4mBwbYTh2KGAvoLVo2MjYFGqnUZQ2
         0unq5o48WliQOM5vtpQm3cZZY74phHt50PAyrzJNcYq8YlmcpmxXqKEiQ1SVpLUxEy2o
         11XBX+2pc3AaHYQECpe6hijoYctpMNjZveX88CdFhiuI/eA7qG6fUCGV58Q7FCGGvz05
         ISg92m673Lbeksfu3m8bSbE34LIqY0tjd9ZhfJXCh4aD/xci7+C71kaZCZbFeq583/6d
         H2bg==
X-Forwarded-Encrypted: i=1; AFNElJ8yxnfJ69VX3VCu4eQYp9VhPm1ojF5FBLuZnFS3Rzl+ScKa5BwTGqQnSsdKU57FmFhCzMhftfQ2Ulc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTwATqOJAO5b+tzB+ETGwz7NGGRbBdJ5rGa1bF/3TNYTiGENKD
	LwcsRXjS2w7KMnZRj7kRSGVejH16fKqZhJl4Eb7bz7kOmud/tDeEypgyKDm7Iluhxd4=
X-Gm-Gg: AeBDievcgdU1iWONwwgFV0zpPjw2Wk+JMjlt6KVPsTqGRa8cH31Tx+1VnICYCoB/ftc
	LAbcJc0/Mz8cxHKG1J0eBxw4c0l3Kdew0a2bI0PPfnrIdq9FkYAtiIVIYRMi+qReFEaov60PUjm
	E0gJJ+bUJNsN/FytbA4h1dI2CXYHhVq0TtWNLoK5/8yoDbJe80Gh41ZYmCcvz9HIsg0oQZ0VgOb
	tmUXpEpgHqKvx/TH8teYGXY9RLdGkVrkvyft/EiJoZ/c/SdcKot6fose2yTo+S4mUPMGRlEDPL+
	YXX6db7MCeFNr914ayNlHamaDsZh1FOoiJA4U17CckfmdgfTQILaOh1RzI3MBjN6uL2yNPqvvRZ
	Uct4tXigBqcZL71+gN1HCirIwK25H/lfIPj6ikL/FBQj4jm/7M9YyuKlnatcdP1IxZ15yfWxt1o
	TZTHI4wj0BFpc6+vXtx1xZ+LX2SQYdnW8shq5BpGIGmL0b3xsuQyU/d077thiEyIL2Ivg5cxXPb
	uioMzXH2u5OQm4u
X-Received: by 2002:a05:6000:2389:b0:43d:14ae:1340 with SMTP id ffacd0b85a97d-4493f812569mr2534686f8f.23.1777535048727;
        Thu, 30 Apr 2026 00:44:08 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b3:7c01:f1f9:97ca:8fa3:c597? ([2001:a61:13b3:7c01:f1f9:97ca:8fa3:c597])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b72176fesm10563356f8f.17.2026.04.30.00.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:44:08 -0700 (PDT)
Message-ID: <8591a0ab-2d53-4223-99e6-fdc15851f737@suse.com>
Date: Thu, 30 Apr 2026 09:44:07 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] USB/PM: should USB interface drivers distinguish
 hibernation THAW from RESTORE?
To: Haowen Tu <tuhaowen@uniontech.com>, stern@rowland.harvard.edu
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, rafael@kernel.org,
 linux-usb@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hansg@kernel.org, mchehab@kernel.org,
 pavel@kernel.org, lenb@kernel.org, kernel@uniontech.com
References: <37c9bf07-7b21-403c-b4fe-d54ff6f811db@rowland.harvard.edu>
 <20260430021433.2083281-1-tuhaowen@uniontech.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260430021433.2083281-1-tuhaowen@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4FE8049EC8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36738-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On 30.04.26 04:14, Haowen Tu wrote:
Hi,

  
> But after your replies, I agree that this is not really a USB-specific
> problem. The more fundamental question seems to be whether, in the
> current S4 flow, resuming the full device set at that point is the
> intended model, or whether there is any room for resuming only the
> subset of devices needed for image writeout and whatever else must
> remain functional during that phase.

In principle you could do so. Your problem would be
a) computing the subset of devices that need not be thawed
b) error handling

>    1. a full THAW of the suspended system, as it is today, or
>    2. potentially a narrower resume of only the devices needed for
>       writeout, followed by broader recovery only if writeout fails.

Well, that is a question of motivation. Why do you want to avoid
thawing devices? What advantage justifies deviating from the simple
model?

If you really wanted to do this, the implementation would be rather
straight forward. The difficult question is deciding whether you
want to do it at all. Do you have systems in which going STD is
critical in terms of performance?

	Regards
		Oliver


