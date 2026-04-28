Return-Path: <linux-usb+bounces-36621-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJOXAiaf8GkRWQEAu9opvQ
	(envelope-from <linux-usb+bounces-36621-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 13:51:02 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CC64843C7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 13:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B9EC31DC59A
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 11:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B463AF656;
	Tue, 28 Apr 2026 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/MBVi/y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nTBoLXJt"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983973ACA6A
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777375942; cv=none; b=KNm56lYhd36qEfjGhsjjADHB4u4hc3Ls6Y3s13zN9dVRaVulKzieUXI9iRHMx88Nrr5aFvpdod+j9AHSdgs92hgMf0u+PN1CXMaeLl1YJarmDf+oeg9VZVhiJ+cCZXF/s0C1YfpVHEhjWTz1abY5xSN+Y4EZb10RDIC4YtTvdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777375942; c=relaxed/simple;
	bh=Xse++0WKOGWzNQ0Un0Vrv/SV8r+mXu51xVq8Pp5x+Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYdaczxKeAgLVcNQJKnLaz5uE9DO8L/Eux7t61f9ZMVQ0bFy1vTO6cyoOkivD9h72/8+1JQHWlLBwgWwSOSXtb1GI/Hh9cjRLvgh7hhjqD3ChULQAZAqCrqZrFeoQBP6lvEP+h9RXrf0ZEmoTctqOyS2/7cDYj83wDbgSN86q7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/MBVi/y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nTBoLXJt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777375939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJ1bmtlTWfKzrgrTM5W7n4oGO4POSVvJD8HcAKOOifw=;
	b=E/MBVi/yUOAal1BoGLC5BMFrWBDJNwNJBoqSYvr9tefcwWY+4IBik/m2gvslf9OMaKxftl
	XHdM5Hk85lN7YVDwkmMnaENUgfqHt3Y0mnpV/d3b7NHhW1z7lqwsKEDEESaU2XI4p9BBHC
	qMo8hqBQic8nb42YnSJZBHxC7oZNnx0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-IuY5RTpAMQmqYfGyDgVuvw-1; Tue, 28 Apr 2026 07:32:17 -0400
X-MC-Unique: IuY5RTpAMQmqYfGyDgVuvw-1
X-Mimecast-MFC-AGG-ID: IuY5RTpAMQmqYfGyDgVuvw_1777375937
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ebc7ea2402so1779258085a.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777375937; x=1777980737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJ1bmtlTWfKzrgrTM5W7n4oGO4POSVvJD8HcAKOOifw=;
        b=nTBoLXJtnY4wV2F1wf6BphPGvUJOSEibddCUUcnv89I3mtqfhUYEkUppwVslYqB1kU
         m6+ePP2sIwpbxBE2GM43tDl8pVPKIiw82+EV32SCFZ3pXErlQspaWyr+z3/TrJvm1oOa
         N2UFGcEzqduyyeyxMc0lnJETpFtSu0/RTZCtSgx36hzguhDRIaXpQdNDG2d+Kui8+kEx
         8awIqyaT5xErvtTPEg031SLSb5JwrJV/PQDta7tTlxPY7Yd45I+WZU1Z72N1epUhGf+t
         Pc+YSa45xFSzbV88eYtRjgHzOpWznvmwaKVEUiI34+gNLlhd/o8TKKmv2bZLqk32fH4b
         S1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375937; x=1777980737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ1bmtlTWfKzrgrTM5W7n4oGO4POSVvJD8HcAKOOifw=;
        b=f5jgshYaW8ict9WOHPxuVPngibgBrWu5DBX3VpQYMqATJiIBVWb0f/3Xax2tg3NleI
         PkivLQpZJtI5oLJJa7wRlvMeXbmNTtmV/qWBwRXsXMAeoaL/3fmwsMj98xArDxGUy24T
         NzUQk+fqmdUUQRSaZzBUidG+LbUMGGXsKYPgmcvPuX6kAzkJX2UnSIXFHDjdqEvWltSD
         KBQhP04y+ytqih3DtiAmzpDjIlnPpvcQVBLwzJgQdoYt7W0aB8cMaUNjTk0ZlYN2SPG+
         aU8fRfkn69AD836hxd2p7n7/eddBFZWzw7t8ewKGmwEKOm2z7lKwkpYsiGEk5NjgAMy6
         8jeg==
X-Forwarded-Encrypted: i=1; AFNElJ85DvsffVGccw+p3Eb5YnJ0l+zjj2R2ZZgPEdkiNcTuvT4KTcj6ViS73w4cz+viMByAUKugWm+upWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaFg7Qm0ONLVb1WTcZYJtWpRoFxRgOJ0+fvtg3YrOZrnU82pLI
	RwCAbeOqh5k+lK+l+iFmLOjHUlDH+pi1uPUBR1fRdOXbhKxM5and3sefSEX9KXAIw7ZqJ86oVi+
	nsBTH/BoE3FtGJ0I0ySm+bXjdo8CFCAxzR31l6ATg6/d4NZ2RO8R86vSS5Kb40g==
X-Gm-Gg: AeBDietDSDqtS5k2XoLm/NA+cKSZEI9YNkiQgBWrT53IaYZaLxNpqgfZpztqeLsBBl/
	wsHWktDgqBsrVT2UCXvpOXdb7b4HKwWfm+gNQF1+/UWztFaL2OPGIrY7VNVZ+4gAggRkKEEeLOQ
	ktvALVuacgwj0sBqjmbRo+OY3DQWuPrk0RXPwPLJKlrHQr5+V9S0PJb3ZUy6nCE1K+3lo90GNvw
	MLlcl1l+QDZ/lkXgjvMg8VaQ1Ej8Kcrm2fsb94GDYRhCl40EAvzgllDaE1AZ9sGdlLP6ZfzZGHY
	Hua19t8uUuLzByooKMmWsP296zX5TTMmLefvGtTARqtUtz6n82bA0Yacvx3svAWzG2Rf4d3tfUc
	A755Y87Y5yXmkzwCQ6btxv3N+HELZP3/gFlSHEEFzdGhBvzlNbQg=
X-Received: by 2002:a05:620a:7106:b0:8eb:610d:a56d with SMTP id af79cd13be357-8f7d7d17fbcmr325927885a.27.1777375936738;
        Tue, 28 Apr 2026 04:32:16 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:8eb:610d:a56d with SMTP id af79cd13be357-8f7d7d17fbcmr325920385a.27.1777375936033;
        Tue, 28 Apr 2026 04:32:16 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.9.114])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c19ae61bsm171070385a.0.2026.04.28.04.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:32:15 -0700 (PDT)
Message-ID: <f52c81bd-aae3-4d23-ae55-a0b3dd075f4d@redhat.com>
Date: Tue, 28 Apr 2026 13:32:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: usb: rtl8150: free skb on usb_submit_urb()
 failure in xmit
To: Morduan Zang <zhangdandan@uniontech.com>, Jakub Kicinski
 <kuba@kernel.org>, Petko Manolov <petkan@nucleusys.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <678BC10BB9E39322+20260421111025.15833-1-zhangdandan@uniontech.com>
 <E7D3E1C013C5A859+20260424015517.9574-1-zhangdandan@uniontech.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <E7D3E1C013C5A859+20260424015517.9574-1-zhangdandan@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 57CC64843C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36621-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:email,uniontech.com:email]

On 4/24/26 3:55 AM, Morduan Zang wrote:
> When rtl8150_start_xmit() fails to submit the tx URB, the URB is never
> handed to the USB core and write_bulk_callback() will not run.  The
> driver returns NETDEV_TX_OK, which tells the networking stack that the
> skb has been consumed, but nothing actually frees the skb on this
> error path:
> 
>   dev->tx_skb = skb;
>   ...
>   if ((res = usb_submit_urb(dev->tx_urb, GFP_ATOMIC))) {
>           ...
>           /* no kfree_skb here */
>   }
>   return NETDEV_TX_OK;
> 
> This leaks the skb on every submit failure and also leaves dev->tx_skb
> pointing at memory that the driver itself may later free, which is
> fragile.
> 
> Free the skb with dev_kfree_skb_any() in the error path and clear
> dev->tx_skb so no stale pointer is left behind.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>

Applied (by Jakub, AFAICS the bot did not send out the notification for
some reason), thanks!

/P


