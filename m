Return-Path: <linux-usb+bounces-33640-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AK/SKJ99nWk1QQQAu9opvQ
	(envelope-from <linux-usb+bounces-33640-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:29:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A29818556F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 11:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50936304D949
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 10:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F48D3783C6;
	Tue, 24 Feb 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cUbN/s0c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BEE266565
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928986; cv=none; b=QqREIgbAXid04WQv1hu3aQaeaK8rER2WYRNzoFkr4GMh9abvskzQqF0biws1oG0GQSuN6PGeJVaGsenbdqnT5HU4SWwcu2m5aLJV5qAmhncSgsDfjoPFLDvZYmF3K4B3aGWXZ6kOMMLuILbSqUjap4xa5BwkMUqDRL3p3cqNoQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928986; c=relaxed/simple;
	bh=AOulfQ/Wb7Bo/RxLkgOirkJHvmYLGoCxc9s8VHoB7Jk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RibwL22Ed1VMu9JESc8fEWMeePr8EeR0lB2OsUISnDvWD6iEySBCo7aFgVK2v0nzWSzYkJbZsFPH055uVzhThzuvQ6pig+x8Bln9ZPI5EqUQvcVPznv28Ld5WXwafa7LjWfL6RNMWPOYvSE059gw+l3hxEL9e7/JN6yj8Q5NKvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cUbN/s0c; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so31163235e9.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 02:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771928983; x=1772533783; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H656YFNirw+JJVQihExYxkcXGNge9jhss8yEn5Hpoc=;
        b=cUbN/s0clPlKseB8CJWqE1bX8xXj2I1wfvvd/u/qjXzZbURd8MWdjsJjpU6DfdD4Hx
         aD6g4NhvCbUu/LJhn2zd830eFRFDlvRHfgCmOwegfasQWqLSq36zXW+00retNATqHNJk
         trSbZqfacXDViqmMDPEAfTTeTK6rdoXFG9uobQhtcCM9rb28lWRmEZes7N7xP3RKLxuO
         yoxzEoiSpavkdfOXWrGdR1wj69invLPvqyIQsyhIXB0QL/uRkqzFqYBUxIWNm0vZzYFw
         9ohRjJaqRjvG22e7/gre8mA7UpfnAHHvbQqwJYZkMmjrQjhce3HrzxOvnOQzsTIHUGPu
         ZGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928983; x=1772533783;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3H656YFNirw+JJVQihExYxkcXGNge9jhss8yEn5Hpoc=;
        b=rOTvPOXDTYDw5pBAlGRud+tF/LZkjNrBPkBT7udpdoAmLMItB4NtTY1btU9kLJKYsI
         aMMYzSv5aAHF19O1unBhx8NOCUXwP0xU3IZhmNjnpyrP0gbSSGIcTVbGx23zVhQTWruy
         J+axvBwF+7YSAaAABMuQEyFMCI/UaugChK5ZunCocMIinF4O8eA7WZ4dicoJiWl3pYpu
         pP9n4GyV/7qE0L0qRNwCZDUp8dwjyzyk5mtZT1qfErEVDNyNhTBTmJC4SBveWNR355Y4
         GubcMWRjFUMWbSIQtX+lsqCanFNQE1V71EkmJY8SIrj5DqOFMOBAk89KxgxeH/RaIjid
         lXbA==
X-Gm-Message-State: AOJu0Yy2C1NnnPsiJtZvlagOJdLOsjax2vA4BLYFPG6t6kzEdLVrkFuN
	F0riQaCT4hFpu2UBg9o3SG1M4KcdWFhec1UFvZrkgpIUwOebmmGSDjos9xHS2k8Kshja/VxylA6
	bHqq5
X-Gm-Gg: AZuq6aKly6TZZxMWPHIedCorVT6PaZI6nkbTwgnFeXMdKcV8AY4oG8sMYE2BTUx6WUv
	C9YBZSqIJI16VtDvL2ky9slhl24ORO3LK/J8EFrtYZQ0Y7DBKYbBZ4bVBoPBFWwrVHVAZbp5ukD
	okdigfxcpofBAh/kARb9IKxSadyzmdUFnX1TSV7dyfcwQl6JcCIkmOE0ESaO2Ku9crn0rbtBEsk
	MZbzqc05FMupymtI+0/BtmRxisX/V/nXJUIppCJ8wBOYSl2Ytp2PxhhayWvSA7uHdz2etzSc/Rt
	6Ytchq1Ucusif8FpqN0rnwlqmClx7dmnqN7q5P6e7HGt/akjbeHKO0+y21/nDNJQSkxnY38mS9t
	IFqox9Cptxjia8IbdiIrMFZv60VxekQ1evNwEcifoACsje3OxxxLyosct7HVU6UzySV/zakg51p
	RHz7oGR/S4c4ftmvM9FlLwE6ktAx+Y/5HuE16lNGPH8JKgF9sm6WkZsDFptHaH6nhh80DZsxZdt
	UcqiA==
X-Received: by 2002:a05:600c:8b2c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-483a95e24ebmr230330795e9.16.1771928983461;
        Tue, 24 Feb 2026 02:29:43 -0800 (PST)
Received: from ?IPV6:2001:a61:130a:c601:11aa:e71a:5113:31ca? ([2001:a61:130a:c601:11aa:e71a:5113:31ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm28670828f8f.28.2026.02.24.02.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 02:29:43 -0800 (PST)
Message-ID: <00b407f7-9adf-4666-bfc3-3c4fbbf7dce7@suse.com>
Date: Tue, 24 Feb 2026 11:29:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: USB list <linux-usb@vger.kernel.org>
From: Oliver Neukum <oneukum@suse.com>
Subject: further issues in uss720 disconnect()
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33640-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 0A29818556F
X-Rspamd-Action: no action

Hi,

looking at this driver

                 parport_remove_port(pp);
                 parport_put_port(pp);
                 kill_all_async_requests_priv(priv);
                 kref_put(&priv->ref_count, destroy_priv);

Now looking at kill_all_async_requests_priv()


         spin_lock_irqsave(&priv->asynclock, flags);
         list_for_each_entry(rq, &priv->asynclist, asynclist) {
                 usb_unlink_urb(rq->urb);
                 ret++;
         }
         spin_unlock_irqrestore(&priv->asynclock, flags);
         return ret;

we see that the driver is using usb_unlink_urb(), not usb_kill_urb()
In other words, once we return from this function, the completion
handlers can still be running.
After that we do destroy_priv(), which will happily free the descriptor

         usb_put_dev(priv->usbdev);
         priv->usbdev = NULL;
         kfree(priv);

Assuming that completion handler runs after this
         struct parport_uss720_private *priv;
         int status = urb->status;

         rq = urb->context;
         priv = rq->priv;
         pp = priv->pp;

we see that it will happily access kfreed memory.

I think the driver needs a wait queue for asynchronous requests.
Or should I look for a way to use usb_kill_urb()?
What do you think?

	Regards
		Oliver


