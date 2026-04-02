Return-Path: <linux-usb+bounces-35900-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uL/WAYaHzmnfoAYAu9opvQ
	(envelope-from <linux-usb+bounces-35900-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 17:13:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604138B1BB
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 17:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28FE7311C097
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 15:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DD43EF661;
	Thu,  2 Apr 2026 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGWtT/mI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249D3EF0DD
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775142224; cv=none; b=La2n2cmF/4BsUEQuOuAg/sUL0LS9gooIpKWcWcL+6uvWzPa4Qp3wVvHGgFHo8iOv0qr2MyHSboXuSYudYPf+fe6GA/B90l/kJWhriHSkgOtApRXJ+ki3RQxkMKRZCiAXjGcoXlYScw1vaG86rRPRD7sZXgSS3qYbDSPWjs9eojE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775142224; c=relaxed/simple;
	bh=1q9c0DnQVSCwY8s7nBS9X20Q78v2UzLBDIDUree35FI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOU40AGpj/8t/KoDNByzhL3dd89cPoerFbK2zm1uc8O+nGjPAYv4OvBTrddlVMhosdyyYmDJY2lGSkgQdAFbN4nnFvLLp//ytkj+YZPEwq3TiJf80D5DAx98ReUP7kHMhaE+STl/kA31OefNFwWP+Yf+FW9BA16aQhu/R1z+oPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGWtT/mI; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488971db0fdso269225e9.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 08:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775142222; x=1775747022; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QYvxsFCHNM/NzhesY47Kqmtdaoiiwb7k8vH9OcU4jo=;
        b=XGWtT/mI/QAu0jN0gwTSj69Y13YiNUet7aGxnK5xT18jHn8mg/GWU/csOYq2JhYVZp
         jYfGagpAuBjC+VMeu5praLea/5iTal6XX1JN+52QIgEEoF9uwKxJYrIGwdTlYzPCYQD7
         aJN+nqw0aa1CrcecTSM9Wlb68H+6qzpvwrN6fsZR9rp4UAIoiJ2hQoqN/ezbNG355jmc
         AsXwBpqOBmpkEOPFZyUWGy78noSMhEpfjaM0Tt7DpQFyxxdDjMwyjMjc/Oj8W0Q210oI
         dycU/wCSnQHgumkrK/qus6AohIjJ4Cd34wK0y2jMLGvfURX43ZN0HHNgbNZCWKAHWVwB
         9m1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775142222; x=1775747022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QYvxsFCHNM/NzhesY47Kqmtdaoiiwb7k8vH9OcU4jo=;
        b=UwEu2QwrSs6x7z63zgbPQv7YudUiL4AfCwcA/zm0c6+jnwsaIPhMPlZNT1eLHYHj6x
         WQWY88opcxcmtOfW29AUthre5RmZfKuqeF89Uw25/6dtbo0OcUTMM5EtbPDGqE+y61rJ
         JFfLzVYO6BMPvSWeKMXrEH38QU7gU6AAB+0Jzz4OexhXZrwc140zvnElXwaMYlTEc9/p
         ++joMEqrkLKTT7CDdDhbU6oudr2khpLzgNKEoruScotB0j3E3eA1IzAxiOXDX69YC/ZI
         0FpX4P2jBJNMz3BUOg+/rjDzKlHyz4w7hWnpxDBpFKL3H6cvJxVftBd/Q7GV8os7E28d
         6JJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4GRh+UpPs2GsW0Sb6a1NJqJK9Gydg3YKuOuCWRgZQpDOwmvjJ9OnVqPOrMggH67zC4uSZp46DDeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7jzJNuczIJ/NHG84A98MI2N2B4B1jAWkLSVIEhMVhbriWi/i7
	G+yrvpyLbyx1ik0eYXryGpDCwdF6cHMD8s4kWq1owxaRxc2RaLYwbY7gN5CrVQ==
X-Gm-Gg: ATEYQzya9N3OnLYMbNLL+9DcjZrR3z+dMy03FAbbwrzPAdbXEEHl5C5RHsWDdkJBI1b
	L9XFS9iiL1iZSBbTb92DQUWf6+GNxTIwp0ghiTW3YcwVK3qq4ejxV4t3y8uKsZOZpr1CJKikILw
	N1J+FaUKJlbGeJRCIap7J/AA9Uxu8LGyCbXoo/FGDgQPGEOnVfh2Q6PycAXj0KAzgaBlG4eQ7UL
	XxgRJL5GzcK17174I12Lg9zUBuXCO2D6k8SiQ318rJlkaKq7u6stfv5byGjga68/H/h8bu4NS2r
	HwnkcZ1wf9GAl9ROC1+MKBeYyU8nLYQ5/wYOuULs9iRUyEjlUl7lrr8eUaPUh+sGD/Wj59k25vy
	W07O5KxFF6VAlSO88qwibWhokRjp1GRnXs5KsrhgA0Gdny/NYqQFWIlnLbg+G+QNQpmRCrku8wT
	OIcRrJ6JV6WAV5PTfS74Tgg1qVdSphrQD7
X-Received: by 2002:a05:600c:6211:b0:488:7ca1:1a18 with SMTP id 5b1f17b1804b1-48883562e0dmr139545115e9.8.1775142221695;
        Thu, 02 Apr 2026 08:03:41 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f52easm8966524f8f.36.2026.04.02.08.03.40
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 02 Apr 2026 08:03:41 -0700 (PDT)
Date: Thu, 2 Apr 2026 17:03:36 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, "Xuetao (kirin)"
 <xuetao09@huawei.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, caiyadong@huawei.com, stable@kernel.org
Subject: Re: [PATCH] usb: core: Fix bandwidth for devices with invalid
 wBytesPerInterval
Message-ID: <20260402170336.7c95ac19.michal.pecio@gmail.com>
In-Reply-To: <2026040221-reclusive-garland-6281@gregkh>
References: <20260402021400.28853-1-xuetao09@huawei.com>
	<2026040241-purveyor-bakery-a9f1@gregkh>
	<c463f9ed-22ed-4ee6-b4fa-2933770e9c4c@huawei.com>
	<74f1bb0d-24c3-44be-9583-0585863cdae3@rowland.harvard.edu>
	<2026040221-reclusive-garland-6281@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35900-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9604138B1BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 2 Apr 2026 16:09:51 +0200, Greg KH wrote:
> I didn't realize this was on "real" devices, sorry.  I thought this
> was only a fuzzing thing.  So yes, fix up the broken descriptor after
> warning about it is the correct thing to do.

Such descriptors are not illegal per USB3 spec and they are seen in the
wild, at least on isochronous endpoints, and they were correct so far.

What's broken is that some particular device specifies less than its
driver actually submits (and presumably needs to submit for it to work).

Regards,
Michal

