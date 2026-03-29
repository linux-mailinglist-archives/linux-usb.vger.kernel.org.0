Return-Path: <linux-usb+bounces-35633-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNWMD0mFyWndygUAu9opvQ
	(envelope-from <linux-usb+bounces-35633-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 22:02:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE4353E75
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 22:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA1E53006F0D
	for <lists+linux-usb@lfdr.de>; Sun, 29 Mar 2026 20:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8F338735E;
	Sun, 29 Mar 2026 20:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JekhqfT7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3152C15BB
	for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774814522; cv=none; b=fIB+YRBzv5XQXtqxlDBYwnYZYwP2mCSsqQlH96Agml/VO26Z40av0JnpQp5Lzn86hUWMXrH0zw0R1YBaITBGfRueq0T/Xt3C0aiTaUR0+LPbRCaVCf2LbJ3jrQ3cq8GVLhRpCFQq3CfX1tgrGb/GWEDIlhyJNQM3rpr+q2N1yc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774814522; c=relaxed/simple;
	bh=6KesuHunNm5vzupfH6dWeNmGrojSoSm6OoZ7E509dxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJc1f+3mdvyLLOAeFQY5632VlP9Bbly8HsGZm0Olzf+FOahn+/eJ1gYpSCc8yVF2CIH155y8rFtZeNTmq7ajdZJbw7pDWYVHgQWaJiuIocnusPNOYo+/N56nWU4Q9MHoD4wKE68HGJMbDIKQPKVXeUdGAtRTfI+b6edkwh0TE0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JekhqfT7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66ad907833dso6634087a12.3
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 13:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774814519; x=1775419319; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=W2LBsWL0RCR7A1/NBeRjO1DmOoAWjMff84GLac5q8D4=;
        b=JekhqfT7S/8S3fOXygO+G3tv8ClmY6WZ+pFZWo0tdyj79q1llTout79e8bAAs3XR7u
         IP+xpWflJfhHHuQcJjyKb9BribdvSyh2GGym47VzrFgnFWVWzeC1lRCQHEGpakTrGMni
         Mb41H650xJ9KzGdOLMp83IfqpESMGZEFjULwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774814519; x=1775419319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2LBsWL0RCR7A1/NBeRjO1DmOoAWjMff84GLac5q8D4=;
        b=BLa/6Fkt55dBcvVIWpUz+JLQAC/Ttz7Dxhh9vZhXV6GLExt+l0mPW1tcqMUjJFlv+5
         RdcP163Fzd8df8ocvj9bz5k4PdLUcH9BDC5wYNaaogohhLUzAy8o3HOGcYRoQKSHT5j2
         EYLbWzMw7lI/R4ufCyhxXrQJacX/EkGUSO2HtlPua2i+oV6N0H4zr0YUEjG4lJJDhUVQ
         HHixd1KSugga8Eouxs4aVAuVs38Gkp1+9XnL1SHe6XFJJCyunKJKtRQf+MtziwoJloRZ
         Ux1f+LQ59eLJDaSj174gM8UU33HuPmyVhS/D9jlcJ/dL0MMpyKdQ4TnRqNv4q+6b950j
         VVOg==
X-Forwarded-Encrypted: i=1; AJvYcCXGeQXJEVTIHJUiW0XjcdokeboOJ5ZIYGlHUU/8XHjeaSOLhEG6T6W0O9hJj6i9PhO4tWvCDHjadHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyIVgxrba7yRCqDvNuPLre2BJ0EKBic6elwq5A3Q3qZkGM9zCr
	j2mtwA6xtWWMmUKQx3DAu7yKgkuASakaGMqSVYSP+38nP9d4ok8htK3piNrK0AK8wDKlI3ChEpB
	NCtRXYj8=
X-Gm-Gg: ATEYQzzfmrmeh7z86MXWRX+ukbLzbA3NpnZBxbAJEuQfGURbA48HsyLqKdZoyXJAiF6
	fIri5eDnOrAYWwgfgQinSKBpQLr6PViMglPt6sFmp5XePdk9mRCkh2xrjh5l/Kc0so7IsgsGwj9
	dqgzg+ER7jqj1fbKQ6F/lx9B8PGtpHghmEJZZjh9MgXB0s3xbO4f0BuxKqWhBUyQZ1TwWz3Tvpn
	ue0Xb99yaMSRGHiaznTLvgou6xjO7VPh62CZTvmHjafG4GZE9vur2PsySBnz9oBnD7W0cWzjD/+
	mbr9VK5d8onse5kiTNsa4U5lbSgFwAhyF43YJ4gHZiDDDyHVPdx6q3tsOsYmekWga7ZiZG7siXX
	yAWyXnJS+YIsx0L2Z/qBVr7f8YZrKF3H9Q1m38/Bdv4Xai7FLbjmeYYnNJ/oQxQGM8eWPm+Imt0
	ASLNdI7v3vWqdyah1wievQMeGrAvuFVmJn0QKU3qa8hF/PJkagxDpPB5rE9pFe5APkKHRDyr4b
X-Received: by 2002:a17:907:c714:b0:b98:2df5:9bf0 with SMTP id a640c23a62f3a-b9b5034d3d9mr608780566b.22.1774814518873;
        Sun, 29 Mar 2026 13:01:58 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23d4fsm194176766b.10.2026.03.29.13.01.57
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 13:01:57 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66132b22182so5411155a12.2
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 13:01:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUE3Fc36YhHesN4JJArCKnxCohb4VtAKvNSEP16jtXEdM7WWpfgmxbsuJ9/DZPqBWAkUcHG2loG4U=@vger.kernel.org
X-Received: by 2002:a05:6402:370f:b0:665:638d:75c1 with SMTP id
 4fb4d7f45d1cf-66b2836522dmr5313873a12.3.1774814517026; Sun, 29 Mar 2026
 13:01:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326131838.634095-1-dhowells@redhat.com> <20260326131838.634095-5-dhowells@redhat.com>
 <20260329121208.6092419d@kernel.org>
In-Reply-To: <20260329121208.6092419d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 29 Mar 2026 13:01:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
X-Gm-Features: AQROBzCLNnOtMDq7_zEYzn905-QyT8tE9Dg3ZE8enKPKMkcfb1CkLbH9Xycl1-E
Message-ID: <CAHk-=wiJ6gEELLviexdmSHnyjVoG7MFo8Qwhd1zxs_tCnL-=gQ@mail.gmail.com>
Subject: Re: [PATCH net v3 04/11] list: Move on_list_rcu() to list.h and add
 on_list() also
To: Jakub Kicinski <kuba@kernel.org>
Cc: David Howells <dhowells@redhat.com>, netdev@vger.kernel.org, 
	Marc Dionne <marc.dionne@auristor.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-afs@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	John Johansen <john.johansen@canonical.com>, Minas Harutyunyan <hminas@synopsys.com>, 
	Simon Horman <horms@kernel.org>, apparmor@lists.ubuntu.com, linux-usb@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35633-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E1AE4353E75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 at 12:12, Jakub Kicinski <kuba@kernel.org> wrote:
>
> Could someone with sufficient weight to their name ack this?

I don't particularly like it. I think the name is too generic, and
it's all wrong anyway. Whether something is on a list or not ends up
being much too specific to the use-case, and I do *not* see a huge
advantage to a helper function that just wraps "list_empty()" with
another name that is actually *less* descriptive.

So no. NAK.

As you mention, the RCU version at least does something else, but
honestly, it looks pretty damn questionable too. And no, it does not
work for non-RCU lists in any kind of generic sense, since iut's
perfectly valid to remove list entries without poisoning them.,

For example, some places that want a simple "am I on a list" will use
__list_del_clearprev(), which does *not* poison the prev pointer, but
just clears it instead. And then the "am I on a list" is just checking
prev for NULL or not.

In other words: all of this is wrong. Whether you are on a list or not
is simply not a generic operation. It depends on the user.

The name is also *MUCH* too generic anyway.

               Linus

