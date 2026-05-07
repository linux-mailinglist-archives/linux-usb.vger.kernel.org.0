Return-Path: <linux-usb+bounces-37075-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE4nAPpi/GkqPgAAu9opvQ
	(envelope-from <linux-usb+bounces-37075-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:01:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C074E6675
	for <lists+linux-usb@lfdr.de>; Thu, 07 May 2026 12:01:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CA053028E84
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2026 10:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B803CCFAE;
	Thu,  7 May 2026 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b="GgMM2Co7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579E638A710
	for <linux-usb@vger.kernel.org>; Thu,  7 May 2026 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148013; cv=pass; b=BpuIK8z8SAUFRoxsQMOxMk1D+GWRmElhA2W7UEYBfKuy8osQvdX9Yn6wOywKDDQ7oxbsVywBxixkfIQ2e91upM3M4o1574nk0BhWokKDcYKjHF4YCydJnJAnfUIby9K8PJdkRNUR3Gs5joxd6eRjaFpfscqkWw+LH9TT1IoSd08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148013; c=relaxed/simple;
	bh=QlDGxLjDsOZ5EjolZWe2BKkRSyRSSY8lNuJdeBbXvxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FDFnBfOKRKDM2LfxMBAhpCK7MJgfmZtm+Qq64rAfTGS/8cOQ9WqvwIhqxibJP8Yr5FNRVlge1e7uyd0jv+DmtaEKffyxyT+yXpYOxdFKiq1Imp0yANe8ysZNLOcmJ+BZ+s2taVZr3/WHMo1Zv9OJN+Z8nDYD29f1dCMKJL+pX1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com; spf=pass smtp.mailfrom=motu.com; dkim=pass (1024-bit key) header.d=motu.com header.i=@motu.com header.b=GgMM2Co7; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=motu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=motu.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bc2a455fd55so92177066b.2
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2026 03:00:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778148008; cv=none;
        d=google.com; s=arc-20240605;
        b=gnmuyR/1F7YsggL8lrVHlTRRNRvUz79tZqaHPage17WDZlhTzAFfQAxC6q5GkDfLDA
         4UKHxlfLESNJ8G/tviVqsqvZfDpkHf8DuzdOMHoqc2w8NkjJarWtB1w2zsEOl7QxwZOQ
         tiJjE/cDyiB7g64A5rJnJ1RjaJFvOfwJ+LdCfsM0Sngl/5J4GsE/rIduWrly2L3qlQsu
         xsGKK328MW2G3vTQOTHV1rirrIb0RA6G/fg/awrV29BOqvCcLVpwNn/1U1aNGJCKOEtu
         EjkomnQDCSuud1ACdRvGt5cF/iky9cMDLaPWhvM7BtBeI2NYi8OL822obGNtA9orlSHq
         4GKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mb8RPidwc6UDZFBFH3sV/P+FGD4EdvEXfnRyM3jK0Ok=;
        fh=ZoSQSHDa6pCwhu6IWEL6dgMruIuRG3DvapuyFqPJO6w=;
        b=S4D7QyHPO11CZCztjJymT22l9/mCshBUemMaDEr6uDuFYItGpITaNeG8ghVqJ70oAj
         lBHXm4pC3rKNAsIczEug7yf0U8iboUrpx38A5C3iQGArRLFjTw2U+uijJPhukfHhNDAi
         oWTJdBtjOq9MqKTiZcgaHZhfA9blEzJZEcvCOv3Lw1x4gau6GVSvhtAdVRT8awV1iisP
         GSFp/XdoBQ8B0QWtF1YkopeHMSrIRF4L1jo665dUoPkdSD3yBI5acn5OEGypm0VM3czk
         tvH6pZ9PMYeBwhba53qkVaflq0bJZZ7v6C1zJxWTEUTwIujiiJx4WrRWIBMqblkReb+X
         zQhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=motu.com; s=google; t=1778148008; x=1778752808; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mb8RPidwc6UDZFBFH3sV/P+FGD4EdvEXfnRyM3jK0Ok=;
        b=GgMM2Co7gXoaWmBHj0HnvI+ClGRmaa5qCBvBH1s1foBHIbIdvPb5cf71vPm0/N9VIa
         CAk3++HAcJkl+jgU+3OKusSXVEM9aczqcCOunLxiD8IUpep414hC76hgeW5f9gm5AGzQ
         PREVfwSnnJp4SY3XBbY/FAdpuB/b+nOjSKJr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148008; x=1778752808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mb8RPidwc6UDZFBFH3sV/P+FGD4EdvEXfnRyM3jK0Ok=;
        b=lR7HpQDcjoYrLEF06nceUfe9JKzMgZCwgT8BY5eCrXYcRAvEDkD+ue5K8X6MXLRYBR
         4zXCKMthufatcBa7ZcS1OYLT5gV2ZPd0dWeHNPkq9hzbT5hITCsPTzda8cWBVZgp7/rg
         ASEkolhNnuijaXlpMjOx6U3rcSxffNmSsSPahfc1bdZO4ik2t1bUtv/xI+iynq4OpBCP
         nTaZJk2hjkKolX2H+MB8JwFav6KaMXgHXfZlZ+P2rLdG2lTDymWLWpomFaJpjBUByDB6
         R6+bZa34DRISF6VHBqVldgLedtCes+t47hJj8MDWH/uIZ9s+mDgAMIF7V4plbeqHp+Vv
         uYyw==
X-Forwarded-Encrypted: i=1; AFNElJ+woLQ4FMuKb6Zn/lYqgPLB35UtLt/TRWNLuSiT0GGZ9OVJVc/B2KGA9nWt6Eluzb6lyWcbaqM6WXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7HP4+uYj9dFlu+AIQs4DEPzZLHn3ZdCWRju2xn7cPjyCtfjOQ
	xXDeQiA+1hxc7ts2m9746sANjxhcvlYaW/OXNANICZmbRYrfgO7TduGoYAdh+7hKcaV9LNB+hIE
	TP/NHxwfEU8mpEWO5Ylni4FHLguNc1xQLIl3efYBPKA==
X-Gm-Gg: AeBDievNrRQNK2YB6l8P5Ovj0dHWrmhoVCqxAlRNokxnIATdbEdF0mFYl6MjAX83JwA
	1H6k71vgrnyspXjbHEbxP2DHkb55XhAV9fv6hdyzDH97YhV+Gw8ClL8t+JYJmLsJgs1X4EHyBsJ
	izDEKjG6WByzMAvNvnLQHYSrSeGMKMm60x9Yex6lh+yRgI8r56bptL/IPBAXoscivMk6XwnT3C7
	H3nsMgk8Tpzjepp2Ek3BDVsBeahvSV5SiGohN6tNHSNderyO/kqNQkLXILi5T8+LC354yy9j0gY
	2XSn8nH2fSUseDJLHMzJj3OIlZjj
X-Received: by 2002:a17:907:7ba6:b0:bc3:d996:684f with SMTP id
 a640c23a62f3a-bc56dd129famr426813566b.42.1778148006963; Thu, 07 May 2026
 03:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Df+jdFEGGZyceFH_5LRSQjwGa1WCtd79DK1Lywvdw+pkX6fw@mail.gmail.com>
 <3ea05812-e63a-4562-9ec3-159244b571b4@rowland.harvard.edu>
In-Reply-To: <3ea05812-e63a-4562-9ec3-159244b571b4@rowland.harvard.edu>
From: Dylan Robinson <dylan_robinson@motu.com>
Date: Thu, 7 May 2026 05:59:55 -0400
X-Gm-Features: AVHnY4IvJDQ46X5rcH5cAgIw02PfRpoSjSKfCUBcR_OjIesl6We8nQmQy6L4P7Q
Message-ID: <CA+Df+jdRxpOSNZbgUvVuOnvfCDvD5EhVPoVSCAbV87sKvnyCcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] usb: xhci: fix isoc silent reschedule creating stream
 gap on CFC controllers
To: Alan Stern <stern@rowland.harvard.edu>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mathias.nyman@intel.com, Michal Pecio <michal.pecio@gmail.com>, 
	nick83ola <nick83ola@gmail.com>, niklas.neronin@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 29C074E6675
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[motu.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[motu.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,vger.kernel.org,intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-37075-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dylan_robinson@motu.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[motu.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 10:25=E2=80=AFPM Alan Stern wrote:
> How can this happen?  The only way for an URB to describe less than a
> microframe's worth of transactions is if it describes no transactions at
> all.
>
> Did you mean less than a frame's worth?

Sorry for the confusion. Yes, less than a frame=E2=80=99s worth.

