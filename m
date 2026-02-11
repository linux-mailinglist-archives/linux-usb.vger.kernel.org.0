Return-Path: <linux-usb+bounces-33295-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPkzO4WnjGnVrwAAu9opvQ
	(envelope-from <linux-usb+bounces-33295-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:00:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EAB125E8A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 17:00:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CE89301DB89
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 15:59:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D5E327C18;
	Wed, 11 Feb 2026 15:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="K9e5pRui"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403BA321F48
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770825590; cv=none; b=CRoxSS0RLJo0nwocb8Ookw9UVQO2bETrFiMHEiulO0KmsMbbndM6YAfHCLBBTYNlJOEXo316Ee8JBrnJ2nh/jwiWcdCHfJJ/Ngg9OS7QMci+1cnAWCRTEZrJQ/OeZU4HkNmCAh3ry+LnqkVyxiK6FLXFxjw2Rn/pLjdj2IdOutw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770825590; c=relaxed/simple;
	bh=gGGU9PKgwWG6voqEsmNvhJsxCLtlCuykzY6HDbQj4os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HX96ac3AupQ1AnHwBv/lo2n3Q7dizn7pLAMSaq4RbEDLsQd+oJeUNrKKu4Yuo8ZXIGkhbkngL7emE4He7bWiy6glbYltHoRRzW2TF7nHJIxg2lEmgRZjaXu1spEOXoMZN5bH2jwNx4OWM217/Qp6CMrojsNY+xZkPKGCGLI7XHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=K9e5pRui; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso14170685e9.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 07:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770825587; x=1771430387; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oqsqCf7stiKpH3A2uErTBs6+BSq/1+PQ0NRXlR6pLSQ=;
        b=K9e5pRuiOkjYKsM/PYMdgA10ssxbDRR0oHF+D3Wgc0gdpj4DHP/tR/S9fUbsvS14oj
         vIhXUWz7CMjJ4GJbBPvKuFqnAXLJE3ucrEjpAdjnRT1NWkUXatT/K7wl2yCMcCrR6o3d
         Z/XHfHpkweY3z53hsix8faL5yRM5MozvMfRlwrh3zXoX9I7Cj99XCAr1jKwsjnIIfSYl
         dc2sw3/An+/j2yC0hZnUB8YBR4ewHsK3jJwOMy2/pR3P/uOS+0x/FUmP0k1kghZ8qZlC
         PTbDKQEZCHP8jE2/3BJ3oSiWH7jvqjshaxxI1qZoVTZ0jtNd57vHh1+DpkFpuH+rdsCM
         oVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770825587; x=1771430387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqsqCf7stiKpH3A2uErTBs6+BSq/1+PQ0NRXlR6pLSQ=;
        b=BRouQnFL8tsEh52d7v8t+iLN+ktASIBXLPsXaMDXmbtp3x5djgzN9GBSNqaHxGrXDa
         1e7A3KeFeGXc/tB1C4Jkaue1+zMagoi83LtRZWXg0PxBxfiUEg6TlvundPVsHwMX3SoU
         uqUM6vdYnMeLVjKg6b+KLd0Y6V90JxS95ynyMnRi8DguaEm/MwA/2OZT467hsvABMCJl
         aqtydW4aWkCQJvcO/VKlKl4xyS8jR4MHEcNlpyx8jitSoogWeJrMgzbbPpqVq/iUcntI
         00eOSMuCkce0qzOFjqtJpK2NtnbbkverYSgU+rhe+vSd45C7/GbCMgf2RUWzycgHHJlN
         Qxfg==
X-Forwarded-Encrypted: i=1; AJvYcCUnRDVbani+QL+lsjH3Zpigjg4qMsJvK2avwwa8lsEEhEJZ8nNXsHeS6xsG/4HNsnN60okdmH7jzfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMqqTiMDic9n1iljPYuEtOGPHBYmzW6DfYrbziJZRLJeS6d+00
	r9m3Pi/Jcbd1gcr5S/gVMnb+Lyp6T+eIi+nSZ9h7SDpw8l9o5ZNzU7jwSYqliVMGCEE=
X-Gm-Gg: AZuq6aKwS5m4VYVVKwGafPWFbuNY9Dxdw8akkj3hDdHo9j/Ru3d42XLPF5KsOyUxLGC
	D39WsAzxueNRxfg/y2L2CGs+7NdTc2ZJcNndkSinHjUrt/sxERVB21BgTN56TYjd0Scu6cGBN4p
	KMeGt8AJzXmwOiQrZ5yYkgbTVSqWIwGmvM+R2yNh5M0jfoZYVZfbCTiJtedeijeL7MKw3jnoesR
	cYMNVFiQ4l1INTT7eniU+NkIiRkey8wOu739iKpfmENoBT3OeM+sFCBObrjzKpeIRDSr42rxXtw
	McXwUTqUEy/mjwZeO8LV6IqYKH3t4qOScPcsQxFrH2QNVs63Mzpjh5oSc5B9jRfZOiqnQXzgGBi
	dkMmLu5rlhnWt4g53E23EyMNfzepWTLIrSEWo2J4I5R+fuK1vj7zbdT6p4cYwSq6PgwQxH7Sc5D
	Yzt53MzvFuu9MwLelaighkI0fvGjJz0gp7n3n+/rooZS7++0RqLACDiFBawt3BfQ==
X-Received: by 2002:a05:600c:3b85:b0:47e:e970:b4e4 with SMTP id 5b1f17b1804b1-4832021eac2mr276532375e9.29.1770825587525;
        Wed, 11 Feb 2026 07:59:47 -0800 (PST)
Received: from ?IPV6:2001:a61:138e:301:e4a1:47e:3f5f:5d09? ([2001:a61:138e:301:e4a1:47e:3f5f:5d09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd20519sm86713405e9.15.2026.02.11.07.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 07:59:47 -0800 (PST)
Message-ID: <83f20400-fc25-43d9-87ad-da51fa029c64@suse.com>
Date: Wed, 11 Feb 2026 16:59:40 +0100
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
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <313e86fd-0870-4b6b-b4ee-1ba3eb9d9d0b@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-33295-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:mid,suse.com:dkim]
X-Rspamd-Queue-Id: 65EAB125E8A
X-Rspamd-Action: no action



On 11.02.26 16:31, Alan Stern wrote:

> First, the change to usbcore.  Rather than giving an error if the
> requested timeout is too large, I suggest decreasing it to
> USB_MAX_UNINTERRUPTIBLE_TIMEOUT and continuing.  Does that seem
> reasonable for the synchronous usbfs ioctls?  (Note that the
> USBDEVFS_SUBMITURB ioctl is not subject to this problem, since it is
> asynchronous.)

Yes, this seems entirely reasonable.
   
> Which leads me to ask: Which consideration do you think is more
> important for usbtmc: Having a timeout that is possibly too short, or
> being subject to interruptions by unimportant signals?  I can't think of
> any way to avoid both.

May I suggest a third alternative?
Implement usb_bulk_msg_killable()
  > My opinion is that if usbtmc would really be worried about limiting
> timeouts to 60 seconds for its usb_bulk_msg() calls then it shouldn't
> have used usb_bulk_msg() in the first place.  That API was never
> intended for any transfer that might delay more than 10 seconds or so.
> For this reason I favor the first approach: Do nothing.

Well, what conclusion does that support? Not using usb_bulk_msg()?

	Regards
		Oliver



