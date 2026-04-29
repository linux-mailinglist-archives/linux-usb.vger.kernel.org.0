Return-Path: <linux-usb+bounces-36688-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODZEEafy8WmElwEAu9opvQ
	(envelope-from <linux-usb+bounces-36688-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 13:59:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA9493CE7
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 13:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24033305C94E
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 11:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B593C4567;
	Wed, 29 Apr 2026 11:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGVqKw6O"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4A6340283
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463920; cv=none; b=LldwNe1U6Aed07RfQXYv7rOLbUIAePNjA6lqfenaoiWY8O2PooNC+Ayb7ZnpBY5rop86Y8EuFtywGrIGqyk6e5xCseeVQH6BQIFUsJ4IqcTXyWgsWDKSrTjWQ6d5hZ//Ix+o7dslGwdsefqxDXPdF4RD71aPyPyfNCOfcoLqatM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463920; c=relaxed/simple;
	bh=c90d4PqmVoDUH0kv5idJi2WRZJV8iBOWwfAWYe8XA7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRqbEKxJT8fur+4uCJDAjmVEDFI4yXcpgOcTbi65Kz3jMMNYmMlcG5WiNZlO6nE0OejXCUkkmnrG4UZ5uvZYENH9xAk1rq6wnkvH2OXSwmj7mmd/y2NFs65cL589NJCmjHr/6FR/lL1aKvrk+8svZ6HXgltRlTgkml0E8Myu7iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGVqKw6O; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e91b06006so105419661fa.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 04:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777463917; x=1778068717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nNvUqAy4XXRGUA6+1vN7MRogr+QCaiHQrcqNazZRbU=;
        b=aGVqKw6OC8wImfVOZh+4BFbNR35GunDU6tUoRizb0bkMfCOeCZO3mab04/dmPKZpMW
         LhC7gDHZSes/0a7Oi6SjdMZTNqMElpBpFNbWpGW8OVsq72nbEQLqBmmQKFkWYz6I2zkq
         gS1Z3StpXqAKMX7H4ZxXqI4VtmpCXlx9I6LW78A82fwm/n/c7O0ilhbruSbWykYoYXfO
         Ik5L9AXB3x4LeYIXALxJFwgGB0EksGmSYTAQUi73js2Uj2WHdzZrkD9GhQ5drdUM/RVx
         Bvmt57Us96UCCB7q4I6qy4ZErm6eCWr/bTmX0pyNzQDkh0WC5nvbj/2YiKwMcgUHQ2ea
         XPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463917; x=1778068717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+nNvUqAy4XXRGUA6+1vN7MRogr+QCaiHQrcqNazZRbU=;
        b=Wimej4LYWk4FyTiEa36kXx16cpoXzsvIwOXBpTuWMHocncACb/X3veZP7kIAA0BcJH
         7mLjKZRxoSOIZRXRWaCa2KfpfLd+3sbo1NJUx0OvjLnFeyqFTmU9WeUENWxC4UbikTk0
         yR4AN16nbzNMmvSZ4hg4hDh2v5eRl5iVXh8PeuEgLzi9oOHwxYOn4YOecIlCwHUP4TOm
         3dd9upXz0L9ZWTGb73dfnvvthylJSIYxDBkzttC9L47nzEFJAHQvjy0qj6EIBDRwHkL2
         sV9I7TJGdtaHvLFJeLZRSpVYgRGtFQoP4OtKe9Q5R/Nl9DeqOtELbldWq6+x2PSZQmpR
         sOrA==
X-Forwarded-Encrypted: i=1; AFNElJ+exbDgfr0gbe4V9jeNIiBdKfvWUcOkc6j2BmNHEWBucy1K+C9RKyA9OKI+mRCP7rXFDgcb/Lcrf+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeXjTXA6eL7RXXiY0drcn09fNWVCGTzuCcesnhb3T5Xb3Sve3a
	3foOZj7xNjgbUNNaJf8lYX//IZLbFDv8qIY9585bWwGx6wtYOb2gfbXvY53Dng==
X-Gm-Gg: AeBDievMC/GrT5liCwKa8t2FEVP4/hws73EGRT5QMZMrYPgaHM/y1A4JaN0VhcU0wVX
	2nWoOsO2NuG6fo3WEXY0J2/8VQQz2aUGDz6zFd47d+v1CFbrPlWckJUs8Cb7FQk+ialerooYYBt
	Aqg+Oz6azq+1QkI3xBVgM+COj8L4kycNN2bbyRSLAikEwzN1qGoyQ5lGrjZwuYt72ixfTjgVg9H
	Wd8g72ercaFaKEyq/zwW2fjjpACYiogLMAlQzVMfi9Xj02T7lS3Idn0alJodaUYLvBB67u2JO1L
	xSnDevT46P39SDO6iFggKzoVlFOhqbG2LTdyTkP2aKmsF17d9A7ZPmmGEjngWg7h+m6sTsCseU8
	1luixhAJsBjsNLWBFcbQNV6ijr6AAGeKnShrZI7qk7pEINI6LCdxG/qJaZ40ayVJJvZHbpowRFw
	qzKgd9bcSVDlInHyST5IFEASToTdIv7MNZazyZuMF1JvgO4wZM/6LskQ==
X-Received: by 2002:a05:651c:513:b0:38e:58c7:cd0 with SMTP id 38308e7fff4ca-39240ccfba3mr25555411fa.10.1777463916843;
        Wed, 29 Apr 2026 04:58:36 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924f9484f1sm4728281fa.8.2026.04.29.04.58.35
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 29 Apr 2026 04:58:36 -0700 (PDT)
Date: Wed, 29 Apr 2026 13:58:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Brent Page <brentfpage@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; accommodate 1023-byte full-speed
 =?UTF-8?B?aXNvY2hyb25vdXPigJNpbg==?= endpoints
Message-ID: <20260429135828.3e7f0675.michal.pecio@gmail.com>
In-Reply-To: <20260429113604.2204b646.michal.pecio@gmail.com>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
	<32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
	<20260429113604.2204b646.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ADAA9493CE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36688-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, 29 Apr 2026 11:36:04 +0200, Michal Pecio wrote:
> The host must schedule SSPLITs assuming no bit-stuffing to prevent TT
> buffer underrun on long OUT packets. Assuming minimum/no packet headers
> further minimizes downstream idle. TTs are required to buffer this.
> 
> (BTW, periodic transfers should occur before async. Could the TT run
> out of periodic, do async, then get an unexpected periodic transaction
> in the next uframe? What happens?)
> 
> Including packet headers for SSPLIT scheduling seems harmless unless
> overestimated, but apparently it's not required. TTs must cope.

Or maybe not, because 11.18.2 states that "budgeting" includes packet
overhead and think time. And TT must handle gaps in periodic schedule
due to short transfers and deal with not knowing whether there will be
periodic transfers in the next uframe till the last moment.

