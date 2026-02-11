Return-Path: <linux-usb+bounces-33298-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCRTIYbDjGkmswAAu9opvQ
	(envelope-from <linux-usb+bounces-33298-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 18:59:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D64126C22
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 18:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 006E43006021
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DBC34EF06;
	Wed, 11 Feb 2026 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ef8v+wiZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C35464D
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 17:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770832766; cv=none; b=JPFuShhNTZ+njhexPLbowpqsUnDp3+V8fXAcjoWjOpvtLzbKPpPZ8+yHJEML1/K3GXFDBtdBF5Rod4/pbNQcIQq5G/6v09MlVwV478AW6XFWHXUm8EWsvjxB0WE5HiPzPL+szbAwpv1h/yQglw9FABshGzoBgtzarhAl0e8YP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770832766; c=relaxed/simple;
	bh=HYgq2ZW2QKWjJqnsqwQg3y/9qtNCJ67IhuyPeMYCR2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdTfVl/aZsF5A8C1LgVzQkcqknyUQXuzz0bCtZ3baY7LwUb3eug+SFLbmILd1pICT6JZR8+o9fS+APrAnJOe647lL+cFlB89tYlWRH1Nw2pAD2b2sYBc7y4pdEV8XobQuQgW4uj0x6QIZV/HKrLiPrN3NdWLfxztnzQoXL1wfzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ef8v+wiZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4376acce52eso1631149f8f.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 09:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770832764; x=1771437564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zC5m7SmEnfgHdMDECSf6G+/8TdAu7Ib2s25FFK11BPA=;
        b=ef8v+wiZxUDqwBri+CmXqmvmPtobybkLkonfX5lHkqBsrcqEoBDQwGYi0XD5K5oqZx
         xmFxV5prxHePA9xLZ9DmqBJRfoQMq1R+3IaC2t3ER6FoZ8GTIxMW/RQLxO3kIJSQC1rA
         6SsRKISV1wqTlgEn8lvbUwCdwI9ChueR0WElOIJaqiAGRyZXHZ+0JbAxr5Abiohn1NnH
         zUn/S0MnDThyiqE05VXqg/NAWgxKxnoeiuLBCq4mgYlqWPnullRqkJ9F82sm9NGThSYd
         01k8DtUPvAwBkZK9aG0De0I/WFLWlmOlT9QbUVghVVMaw6sFgUi7XMTkdOgCh9BS1GEj
         3PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770832764; x=1771437564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zC5m7SmEnfgHdMDECSf6G+/8TdAu7Ib2s25FFK11BPA=;
        b=M/rLOksHle2KYAk3+XTw0oQ0sc+75eMVmriLoyUQPsb/BjcNnk3f0QwkQdcuK+oKeh
         H1a2sC8HnHrsiJnLyNdsaqmIBhCalkj3KjYs7pzmkES6rlkv7nLMgPWgHSYFY+StJiUi
         Ay9FngaJ55V+kiFj15mkY3DpDQ+4l1P79t+jjAEjUGLyjObk0+HutFv1qoDLays7Pjai
         HpedmtUWL4LYM0FhBlC7TUOnBoO28XWCVF12ppBhHW3qF9N4eDGcrLT7XyKVBNgCVE7Q
         WxpgML8o3D4jxwhoqLkuUB1Yv1rR3RjeIfvOlQf7JaMb3fFWjJAuN6Dan7x7sT0lAZsr
         hrZw==
X-Forwarded-Encrypted: i=1; AJvYcCUlg2POfXti208YpyAtk6cgOPrtV7eRwTtfcsEYNedoT1fMWG72spXHRy/7DpUH7SYw2y+XWwrPy2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK7FmH6ipwKMJ1VJ/k6uiTE0Rxah3SEMe7PhJXaqpt4/9T969+
	3Qg3S2aSWDEDwzSL2OnVVaC07frFuyVLE+o+pMpjlJaWLLwR8H56ZQD86ft3BDtnTncat0FyvrP
	eJBuC
X-Gm-Gg: AZuq6aIv9xT2CRgxgrHxihChuJxoEkUJGI2L8Tdi2BRNUf4axbT/DYxkid4GZv+o+TO
	DM+x1ijqzD9knbMh9vnS/fGrhNUQuZZcEik2oi7UkUiv4sAaYGMLfh+ZSs9vxBkbvffdJNfpr5b
	70U1YOK2j7HQFpGooAnkIT15zjoB8lA2qy/Y3Pkc6QCe00PE1y29AkAvRv4ePMIIxucau4fk93p
	Ggbz5mBPVEFKsAERoVZ4FepVuEXGzP2mPxoO56B/tjz/2ZoyvSmXUuEZ+SdCaWaAjG/5MOGb5kd
	Ja5cB8k6fd9kWQhfqQuSrgt9fSnwVU1qxnAbwNv9OMHFR+a8ZkhqgbZjh22AtJpRZrWBDLJE0aU
	N4yjHXibNkBmP33q5O6ncOrZnvPzuQOwFjQMmqXQNWdH+DU/smMtc61Ur9SgYA8dPZWihyf2z3X
	usStLLc5/IYFVv7yynDpNMAOWWHJy2tND9ZTsjrbAez+to/HbxnOy2Ir+r/jHQfQ==
X-Received: by 2002:a5d:5f49:0:b0:436:1d80:b663 with SMTP id ffacd0b85a97d-4378adb8d89mr387071f8f.58.1770832763757;
        Wed, 11 Feb 2026 09:59:23 -0800 (PST)
Received: from ?IPV6:2001:a61:138e:301:e4a1:47e:3f5f:5d09? ([2001:a61:138e:301:e4a1:47e:3f5f:5d09])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e0196bsm6335318f8f.23.2026.02.11.09.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 09:59:23 -0800 (PST)
Message-ID: <efbd1b4e-13c4-4531-bc11-4a9c541a7813@suse.com>
Date: Wed, 11 Feb 2026 18:59:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 USB mailing list <linux-usb@vger.kernel.org>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
 <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
 <c6802a96-33d4-453a-b1b6-e74b4911555b@rowland.harvard.edu>
 <79868062-41e5-414b-a0b7-7aa162dbf4d6@suse.com>
 <313e86fd-0870-4b6b-b4ee-1ba3eb9d9d0b@rowland.harvard.edu>
 <83f20400-fc25-43d9-87ad-da51fa029c64@suse.com>
 <7403a3e8-764b-476d-ac45-f2de9e6b67ab@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <7403a3e8-764b-476d-ac45-f2de9e6b67ab@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33298-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: A0D64126C22
X-Rspamd-Action: no action

On 11.02.26 17:18, Alan Stern wrote:

> Under what circumstances would the transfer be killed?  And how would
> the user be able to do this?  Would you temporarily block all signals
> except for a few like SIGINT, SIGTERM, SIGQUIT, and SIGKILL?  How would
> you choose which ones, exactly?

In abstract that is a good question, but it is for user space to solve.
TASK_KILLABLE does the job for us. In fact I'd suggest that you use
wait_event_killable() which should delegate the issue fully.
  
> It all depends on what you want to accomplish.  In this case we don't
> really know what those calls in the usbtmc driver are meant to do.  At
> least, I don't.

I share that problem. In that case, as little as we can get away with
and still solve the issue. "Little" being defined with as little
impact.

	Regards
		Oliver


