Return-Path: <linux-usb+bounces-33462-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id p7+fJOFrlmlofAIAu9opvQ
	(envelope-from <linux-usb+bounces-33462-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:48:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC19915B6F1
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 02:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48C8E3033FA9
	for <lists+linux-usb@lfdr.de>; Thu, 19 Feb 2026 01:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFD3243968;
	Thu, 19 Feb 2026 01:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX3EZaHK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB3A1DF736
	for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 01:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771465687; cv=none; b=Xi7M+r+cAoPf8xRqX9CVwKwxTRxPq53tdFOQ7A97ubWXzN05QvHKpDkDbQ1V3UsZ84jIdE0F/69nonqkOJ8jqM2vSH3SDiO3mEDpeA/juaztrbHps36bP3vDVjqs44Yq90cFGH9e5fv3JplofAkTYenyjgp57PPNrxKcRCzoZdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771465687; c=relaxed/simple;
	bh=nj7llv0SLj8JbUewm5eoLBkK4iyw9xhnNYbkQAre1Vc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fbY/YY2zh2EWLfsIOcP4H6sBRqZeriWsSx86c1ZL2d6H0gSyt5yWeNJsLbEq0fJyvq+pDedu/OFcH8K6MViOaa5TsqrQAA2Y5m2emIaNs/t4I0TIqhyoQkbwP2KA6PaT0RHmeOI1YunnL7SpGYv539IEreRobwXPNJx6Tq2dlSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX3EZaHK; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d4be94eeacso436192a34.2
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 17:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771465685; x=1772070485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaJh0fRvDfzQ3zRfXH5p2HojoBn3ZRqWgoRPT9D8ObM=;
        b=EX3EZaHKdut0/Y7EuGVjWnw8L49BUPoZvob8rwUTls/hl+zep2OszGUyachrMF5dMQ
         aiWfYoXsc34JNRyGK45mYWShDeKRE2u7BUpBYZmxVjgei/FuxaVl1EGF6sZpkIZ1XRy2
         dz7uvEDjAxXUvdz4m9YuggSawlLctWjNcxmWgKpW8CrLn9IKWkEfiFhtVzml9XF/XvoG
         QFmirXvJbfVH/54yh90YuIauNyi1vRtJHzlHZue94m/QGCZX2fZof1iOtNsEz7NMjpyI
         oElwEq7BKEJES59WLUW0KbYg/g6yWVqCJqYpTxGNz41pENeLs3uIiZ2z//anW9BWS1GF
         Ehjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771465685; x=1772070485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uaJh0fRvDfzQ3zRfXH5p2HojoBn3ZRqWgoRPT9D8ObM=;
        b=jZaNXpupM3Ct9ldxDHEs48txgayLyTaB4h0bCydt2u+AWjJKmMy2dWzxzozYkLLxDx
         vDwFwQ9tV3Vf4SQmfILeZPKNQyvVIl1P7odd+QiGf8Sarb/NvkTpoH4OM5XvJn3nYZgq
         V3rOoWUs+8fBTLoA8amb6tZTelj3TWYtyoyvhBGzsZkKt0NVQdTLRh61txtv+cJ+Wi/d
         scx87ZzSAmVSaFMuTi6ems0AkYIzlJF7QU1RK08cVxEqp/9yUvXCulXzIpXTT72FT7P+
         SjFe8F+c8COAx+N51FAZm2wxy9xk06A9NMB7O3S4yDUspFRoPuCempEYbiZELBMYGpXj
         5vuw==
X-Forwarded-Encrypted: i=1; AJvYcCXJuIPpI8+NnGpXQdXo3giwuWyTcuIEEWuevd1+pPl1sXS7rwlKp5W3XbgVsnul1oOjX4ibWvsUUoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RSH3emm80vIz5IYi9YNs+WQ776jWsxOGYr1dT5toc3o9qN70
	Czj96upM4YbnOzmtNfmNJfUfkPEueIpaSNxscVGhACSToo/DcRRN3yb+
X-Gm-Gg: AZuq6aIPUpEtPDSHIwwabscAHoSVothnBTC599Jt9hmdlBp0taSM0bvlFs8xTS+3L6w
	sBaQQUEwPS/DL4tHP1b1qds8VUw55EwT/ce9d4s2xkXiMxUx/xXBg7zEO7EIWMDoK28YnJdU19W
	UONk7oI985zFgqHslANyf/GxQWe3hn+G6oh7vCL30oawJ9tYjO9W2D7CvvUv4xsVWL3T6ZQQiQy
	NTN6e7BX4QhckZ89oaTVFsThOIpJ9ae8eKsZXbsdIFP2gCvN69xWahcQGPbarnR5DGgnBtVPQPy
	ZEDs3xVLNf3yXbkwkfOdkD6sGYsXyedutNgKyUIt2VW0HRSeXFg2ENebwgiOdzS360PhmyeMUJt
	jacfU5HnY5sEZYFUw1YMJkaCqR+qtU0EMV9YB4rRjW7RGUQRtKH84Qut+JNR4iz463xDkr8eSiw
	l+SFkzuxQu3rd7MXZ+0CVGIko0KSiIcKIZIoanQ0FTkfl+
X-Received: by 2002:a05:6830:6ab5:b0:7cf:d119:8d93 with SMTP id 46e09a7af769-7d505ce8c89mr2549804a34.0.1771465685298;
        Wed, 18 Feb 2026 17:48:05 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a76f9483sm20591727a34.20.2026.02.18.17.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 17:48:04 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: thinh.nguyen@synopsys.com
Cc: andrzej.p@samsung.com,
	bigeasy@linutronix.de,
	chenyufeng@iie.ac.cn,
	gregkh@linuxfoundation.org,
	jiashengjiangcool@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	nab@linux-iscsi.org
Subject: Re: [PATCH] usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling
Date: Thu, 19 Feb 2026 01:48:04 +0000
Message-Id: <20260219014804.14705-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
References: <20260219012929.u6btnnmqvbyujz5f@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33462-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[samsung.com,linutronix.de,iie.ac.cn,linuxfoundation.org,gmail.com,vger.kernel.org,linux-iscsi.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiashengjiangcool@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC19915B6F1
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 01:30:16 +0000, Thinh Nguyen wrote:
> On Wed, Feb 18, 2026, Sebastian Andrzej Siewior wrote:
>> On 2026-02-18 05:22:21 [+0000], Thinh Nguyen wrote:
>> > > Fixes: 08a1cb0f65fd ("usb: gadget: tcm: factor out f_tcm")
>> > > Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
>> …
>> > While the patch itself is fine, we should prevent this situation from
>> > occurring in the first place. That is, we should enforce the config
>> > dependency and prevent the users from removing the nexus if the gadget
>> > driver is bound. Likewise, we should prevent the gadget driver from
>> > binding if no nexus is established.
>> 
>> Is this an actual problem or just something that looks like it could
>> happen? My memory is that the tcm holds a reference on it and the
>> referenced commit just split/moved  the code. So if it is a problem then
>> it should have been there longer than that.
>> 
> 
> Looks like we only hold the reference to the session cmds, and we track
> the tpg_port_count if there's an established link. But we don't guard or
> deactivate the f_tcm usb function when we unregister the tcm and remove
> the nexus. As far as the host can tell, the device is still connected
> and the function is still active.
> 
> This exists since the beginning. The Fixes tag should have pointed to
> c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
> 
> We can guard against unlinking the port while the gadget_driver is bound
> or we can just deactivate the usb function when that happens. The latter
> is probably a better option.
> 
> BR,
> Thinh

Thanks for the clarification.

I understand your point about "The latter" option: we should deactivate
the USB function when the nexus is dropped to stop new traffic from the
host.

However, even if we implement the deactivation logic in
tcm_usbg_drop_nexus, there could still be a race condition where pending
work items (e.g., bot_cmd_work) are already scheduled but haven't executed
yet.

Therefore, I believe the if (!tv_nexus) checks in this patch are still
necessary as a safeguard to drain pending requests safely without
crashing.

My Proposal:
Can we proceed with this patch (adding the NULL checks and fixing the
Fixes tag) to close the immediate panic? The architectural change to
deactivate the function could then be handled in a separate follow-up
patch, as it might require more extensive testing.

Does that sound reasonable to you?

Best regards,
Jiasheng

