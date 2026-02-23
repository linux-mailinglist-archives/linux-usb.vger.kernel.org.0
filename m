Return-Path: <linux-usb+bounces-33555-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAX2G5hDnGk7CgQAu9opvQ
	(envelope-from <linux-usb+bounces-33555-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:10:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 078D2175EAC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:09:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9570430BBE85
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E70334A765;
	Mon, 23 Feb 2026 12:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="EB4qaD7U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DF9364EB7
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771848314; cv=pass; b=GOIOeHGhGnsw7Fw+MdO13m8CoUrK8k4lB2+9lZ8EWE5tmFoRFHo7cCYS9YP+yARH5nBNCN7KfC4F9QGjt8VsD1R6AOZY2luqzY8GRwBxHwDb9+GjfzVj0Znjg/9ON74YkyZ/8zWZRzROdlkZ1ayYMnjF1MN0ZykJIV7RdkMzY0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771848314; c=relaxed/simple;
	bh=i7XcdVJsjCl2l1ptPdxBvnBqAy36rdQFH89kgs/EtKk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ppH6XQisajIUkmXRSUNZDBTdJ6dCK8fP/nqn8J0pMn84SuIO8sXOAg/LMfg9SYvE1ci0GwhoOUte6H9r8tSt/UI0H0L2tYcUhpSqFS/vJbCLnHgtGaPcJwKNcJabphfSC9aihRyrwMyR2uuVJ7ZzO8CfVeJgN4FsHj5vXnpNmt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=EB4qaD7U; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65bebcbffe8so8012436a12.1
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 04:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771848310; cv=none;
        d=google.com; s=arc-20240605;
        b=WPsKTetihqOr7tJ3tIGltBLbQlk1ncLMgyRURKG7jHlVd4hj8vQIMCvVPUBog4IU4z
         Z0BHPdxpR/cfWl7Ww6gp90vJiPLxg+eR9qp5fBirsmp9DiMN2ml7SrWRspuyKqfQtB5G
         hepM4Anrz2qhhqQ9HVY1woX4dWlTqkRllq6t4hEMvy3cUUVKopLE2dqLP6Rn+ev93oxL
         Hxbm8ygvtrWzrOAILnZKZ+G26Lhzh6AYeO4ZhXsG+bbehpmR90wmrB3mePzkcvfEY40H
         11b2xBMCXIGRL3HkoTsCDd2cGQpwtropdRRMF48+irqGRgKMdDjDDxG4ziUxCdge0faK
         NCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=i7XcdVJsjCl2l1ptPdxBvnBqAy36rdQFH89kgs/EtKk=;
        fh=r6+zCQo3hW6DkfUSYYMtnc8Dl82hGyV0oDfnoWmTBW8=;
        b=l0PKQTkpgFjpFV6pBZQUGyJj6qkbI1kAX9z9ZbpGDBuDalA+ixC/DRJGu574RS1oSx
         PIO6IX1WnrGvFnSmvBpZi8vKLfnjidi/fCwMl4UjEiyotbHRnsqiQUzGs0dwX5pBL2qn
         WovFGf08fr0iG8uWgZTKVERekqQO69cU6Zyc/jVV8SreIWH4ERGZhT5ynGVLf4qcZdrC
         qMOSs4q3i0B/FqQLshTvgtRulJsPa3j4z4DuEr9JYkYaKz8f8F6d3IZVwQh8nGNxg5iw
         Xw1xJDTV9c7LPleqjU6DTGgm653jCgI295iLTINKv0waGyfbcGXWBDuZLRDGCLYUXsd4
         62lA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1771848310; x=1772453110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7XcdVJsjCl2l1ptPdxBvnBqAy36rdQFH89kgs/EtKk=;
        b=EB4qaD7UfHoTSm7Yx9+ddO5MR8u/x9/adHQrc1mn7FyCX4WNJ40h7/739yZ8JHiGlZ
         gZolSGKc917i8Q8msogC9p64Mp8wdt73tWOYpIrZHAYyqKnGvEzcJ+SPNK36dbGJ0+rm
         ltjocauHGatFHoKC2r8e7KZqFjnueqODNnkGiazqmq8ly2EJEbOofX41V0PLx2zvwn/G
         Q9bnw40vR7lyQYLp2L+PwUzAKUogC5MJw7M8MSXk/yz0Tzw7EFT4/+HhjpzUc7jT9TJe
         rtb1yf8P+L74tAgJwLdXu193jBbYHv6KsQiKqTWG4bySAcrtXwVQ+u5B2y3D/LXDXiZq
         Czyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771848310; x=1772453110;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7XcdVJsjCl2l1ptPdxBvnBqAy36rdQFH89kgs/EtKk=;
        b=nERU+aKVdq8yTaT2DjMOIYqwUKIEX4kbOn5kmectBQRvDE+ssi5wWzLZaLCxolP8NT
         96CloIZwCL2Nek3T9o/HgMaCSWjoacK+mi3mOsRTOpCg0zKZIJNB+5FC1h70BjjE9xuc
         sARGQV82u7LRUDF7o8oO1HmCi8Q/37OxBZXmxS3MvJ/uX22yyUeuMqNE8BcJTNYWc1JK
         q5BW6TNHC8LkfM2wr3p9jAfiI/J59TC4iiw8WNTG8tl7LyCeUICczK6FOSB2Ang8HEwF
         0yMuE+WogMw50NaY5HW9RB0EXmZPM0a6/+rLT9bw3hGgY+3ct60j539IRdN9QsQPuCvG
         Uwgw==
X-Forwarded-Encrypted: i=1; AJvYcCWH4wAkPT96Sh10ypV9g3maL5GKGnnjxCny+TjfpH3AoVMCHam+ie/SqxojPx48vgirrQg3iLG97Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpbWD0mDjM6IiSyI8idV1JyW8YHauMJops0F/SoxeWmBUIoMa
	Qf0V4ayuKaedkhrPI1wmaRnbXKWRZXKAKSF+Kbla24TXRxtPjZ+jwnEla0VA4UhRXPYwRef/LrE
	Z7EoXxds3oT+rBpnb5pb/eNBl/yZexkuV1vCJfLiPAQ==
X-Gm-Gg: ATEYQzyZsHEtlAcfCzQn67hshumQrcXFle3r78ZxaIOsJzTPU9i8BbrzBe7SnGotojm
	eCcdvx3PQx8vi2waTcuPn/7ExIyY47mknSr+NoP/G90w4yiUROd1meXH7zdSypEv0IG37yGmDuY
	co4wxeG8yZpxfQ8WLD1LLSuVLSDnB53mrtzBFslfkKr246c/Uh4XhdZn1KAWUWdz8NOOgsWKjCZ
	lvHx4JH+vV8K3mmOJuwxlHbfPtp78r4NRL/v98YOf4tmM4uAE61bxB/mFWtkgm59/o97+FnG+t6
	E0jPF3lGDpZuiD+97Sf0N7k=
X-Received: by 2002:a05:6402:354b:b0:65a:cdfb:58a7 with SMTP id
 4fb4d7f45d1cf-65ea4ed0c0fmr4607110a12.9.1771848309707; Mon, 23 Feb 2026
 04:05:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
Date: Mon, 23 Feb 2026 13:04:58 +0100
X-Gm-Features: AaiRm53zToqsx-zcDAcAHBPZanTLxK-IdyrpisVR804xGPajSGNbIsfetSDKgOo
Message-ID: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
Subject: commit 662dc80a5e86 breaks rmnet over usb
To: lvivier@redhat.com
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, 
	Eric Dumazet <edumazet@google.com>, kuba@kernel.org, pabeni@redhat.com, 
	netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[citymesh.com,reject];
	R_DKIM_ALLOW(-0.20)[citymesh.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33555-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citymesh.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[koen.vandeputte@citymesh.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citymesh.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 078D2175EAC
X-Rspamd-Action: no action

Hi Laurent,

I'm testing the latest openwrt state and found an issue probably
caused by your usb mtu limit patch :-)

I'm talking about this one:
662dc80a5e86 ("usbnet: limit max_mtu based on device's hard_mtu")

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.12.74&id=662dc80a5e86b35bbf339e0b87b7cc3f07c09de1


When using wwan0 iface normally, this makes sense, but the problem is
when using QMI modems combined with the rmnet driver and aggregated
frames.

- The modem is configured to frame sizes of 16383 or 32767 using QMI
- wwan0 (using qmi_wwan) is configured to match this frame size by
setting it's MTU to the same value
- Frames of this size are sent over to qmi_wwan driver (containing
multiple data packets)
- Frames are then forwarded to the rmnet driver
- Frames get de-aggregated here and sent to the network stack for processing.

The reason here is to reduce USB transfers heavily.


As you see, it's perfectly possible here to use very large MTU sizes
as the aggregation feature by rmnet relies on this.
Also the modem can be perfectly configured to send very large aggregated frames.

After your patch, wwan0 is limited to 1500 bytes it seems, effectively
breaking aggregation.

On my tests, download speeds are reduced from >300Mbps to ~.8Mbps

I also made a build reverting this patch and all works well again.


Is there any other solution to fix this?
I guess it should be reverted otherwise :-)

Thanks a lot!

Koen

