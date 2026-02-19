Return-Path: <linux-usb+bounces-33476-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y8ChLynFlmkGmwIAu9opvQ
	(envelope-from <linux-usb+bounces-33476-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 09:09:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2929A15CEBF
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 09:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D10E4301303E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 08:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4F3E3346AD;
	Thu, 19 Feb 2026 08:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="X97xdriM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DD32222B2
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771488550; cv=none; b=D2V7fwruqS0VjgeAdUJaswV/ok/ZPGKPdaxkt5CPoyBkdQ+lZV+bU+hgcAnOGfH8wAOJA0q/+luB31w9WkzLEGxh9XFi2AVNXqfPEhSyyj/Qr4w53x+kSw2EaIg2dX2AcBPb0+trEfn1XundBkxRS5vJkjZnznFGoPdk9Q8Nb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771488550; c=relaxed/simple;
	bh=/Q4AmlP+4lJPGGPF3wETm57Xx4uatixq0+Q6oWZSS7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tkySgBXMxfM+Vn9ltBgPe+GVtpeV0cHSl0Agm/RhR5dnjpdcWPfqyeHQSWzMixIIBhMt3nAdtV/vA9M23hEwsHGkpGjvLvEmzATh9vfennQ0jxmk+3D/e6LruSMseOdFoXOmj5JD0updy5o0/3gGzvseo9OpIHF2xk5tMoXoJ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=X97xdriM; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4376de3f128so404961f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 00:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771488547; x=1772093347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqizv7wuQKBTah/B5F09fRjT5PNlXqSdnUyt/x8aryA=;
        b=X97xdriMWY3xbflJhqeO6B0qFUbmlkiKyYHceGNDNk2uJqo25HdiB/3eDP9ZoicfSG
         waXqQfqYOMv24oowCv232u1JGYBqmIDHMVshUndpK9DzY3sXIfC4q++2Br/LnWm85q+y
         JKljgG94PvoRL0ajwD571CDDyrMa/BY5uJ7HD1DdvB9BP+X6cISF+uxgt1wNY/JtRPvW
         6kahokiExaLoCLaB3WsM57K6TOa+aEWkw60YwGTUHqVlAgVif2eDXLwaqLpCDSMDw6qA
         Pyqjb+y3IuVJJ2LEEZ6DJawcb21aWvFx3+velRAF5+Ud75NSIwmKVRlYewDD+n/Os7HP
         aTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771488547; x=1772093347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqizv7wuQKBTah/B5F09fRjT5PNlXqSdnUyt/x8aryA=;
        b=SfpjDB/dfS8qJfvuFTcQBmJWxSHegh+NPInSEFjLgmKB644X/WcFkp7yaHHbScicma
         MY7D1A0njLXB0ZJaFTvoel0rJQEEtipqI8haNYZQTxm9zPR5DA/JsmpzbVr5UI66Bm1M
         k+LabObeV3g0SPm49JD720XZ7d3uIEtBhjzx2v3cLz4jDBkEr6HgOhyh1EwsHC5pb+Ug
         eY+uBTy/iGZzPpwEksspY//fepf0SYD0gqcAE75GN99JxeROF/28WM5Yu56rivpovYw3
         K0OGT9svQZdZRPKGSjzzwjsOfR5b08/IjN6+0bckDaf/JuBY64zZU0dPxKMw4JlhAsE/
         dIFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVVponxSF28Hslu18atIDYQGDi2KYfXhUbClcay7wC+ng3eHU3LxS74nomK0tH9u7KGOdJlUbhgN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA15l4GjOoO2nqMfC57w56oYSFcN6IIx6H59xChwnSVqyubtBl
	ut9i9MWLWgomWr/Sul9rEWukAjMA4l4593esk75mjj2L2kdouvOlj8p/c1VNLCaAuWo=
X-Gm-Gg: AZuq6aJVZ+xFrf3X3ARrtxqD1CIkYPcyXv5MBPNsvA1S5IyYqiocZxWrFm8uRAoLTel
	NmCNX1u8m5j4Gkj+yvA/J6j/h+00pnF/1RrueZm27udhPU+1b65c3HTa+BFea19mI3X+8ybmLRk
	d2sG8cod9rAJWI3hKs5m/PtEwwCAutd3RavGub1OBzepWzvVbdvMaXqbvxWkveNC59DdwYF93uM
	hLxu9qwrppsK+pNnyUrblijwkNwWLfjujQN08lmUfer7LBTte6UrHQmiMzGa7IimPHz0Iq+RfVK
	oJ/JWOcuif5uvMGcZppS4m0yfju8Dqceo7F0CKZO+Xh0Zh3BNI67G5N09rB16o5+Wtuw93oAN/m
	HRsVqZKVKG/o16CEgfcQhypJdqr/aH+t+5REpZ5HvL+ExKphUvzToTR8Pc8AULn6Vny6wreYSQU
	XgReEoVg5nzVj/CrVGyV86VAJ1CqdYGuL/V20BLdrlxJj6VfNgv61Ga3fscRlwC5YMuKb+oi8Mx
	E0Yww==
X-Received: by 2002:a5d:5d05:0:b0:437:771b:26b with SMTP id ffacd0b85a97d-4379db71b34mr33231060f8f.26.1771488547076;
        Thu, 19 Feb 2026 00:09:07 -0800 (PST)
Received: from ?IPV6:2001:a61:13da:3801:6d37:5b4f:1853:c2db? ([2001:a61:13da:3801:6d37:5b4f:1853:c2db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad009bsm46029799f8f.39.2026.02.19.00.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 00:09:06 -0800 (PST)
Message-ID: <d6d185e9-137e-4220-af96-891e88518c39@suse.com>
Date: Thu, 19 Feb 2026 09:09:01 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] USB: usbcore: Introduce usb_bulk_msg_killable()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 USB mailing list <linux-usb@vger.kernel.org>
References: <32a96517-104c-423a-b1b1-8dd139192900@rowland.harvard.edu>
 <7cbb32ef-944d-4d03-9209-5249bd7ae1d0@suse.com>
 <9bc181a5-25e7-4f9d-a6b4-23c716e75269@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9bc181a5-25e7-4f9d-a6b4-23c716e75269@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33476-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 2929A15CEBF
X-Rspamd-Action: no action



On 18.02.26 16:02, Alan Stern wrote:
> On Wed, Feb 18, 2026 at 01:54:31PM +0100, Oliver Neukum wrote:

>> This still leaves the quesion why a timeout can be negative.
> 
> My best guess is that the original API was written carelessly.  In any
> case, I don't want to change it now -- it's a separate issue.

Fair enough. It is an explanation. It should be addressed separately.
I shall send a series of patches for such issues.

	Regards
		Oliver


