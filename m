Return-Path: <linux-usb+bounces-35769-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMcUCpHnzGk/XwYAu9opvQ
	(envelope-from <linux-usb+bounces-35769-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 11:38:25 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DD55D377C9F
	for <lists+linux-usb@lfdr.de>; Wed, 01 Apr 2026 11:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C57D430B528D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2026 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2FC39F160;
	Wed,  1 Apr 2026 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq+kcwou"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8723364EB6
	for <linux-usb@vger.kernel.org>; Wed,  1 Apr 2026 09:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775035900; cv=none; b=eTlEzHr2i6fprH4ijusYcfMgvioCWVwr+arWM9fuJT2p/8RwN9YdfpRTfFY4wgQfzMMmtpFZv2qbHQrApwtrAKz1H+mcbL0UjCFfzcIlTYgfdGcoDsQpMXn5Ftsx/JDFzmfEg3ZHkLdnOLsTUxNtGuAlezSe9IBSQaxuDWFvShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775035900; c=relaxed/simple;
	bh=4CmxsQop5Jtat9Ht5MKK+YjrukNVt5/IdgNFjhv3ZYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g67m15mmDVTUWjvSTJ1HVM6FzT5Ke/PzwgxTL3A31038siTS6DTFhy0XTlXj+Tx6rKl0MVkGpcGxI2agizh7xkIRQE/EP2qeJCc1N8I1/fQL0gEcKWJPqLjcLjV/Y5CB2ZJvitRlYTXJ17mVY8ulQs+pUzt+68rFdb4ewpuJUGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iq+kcwou; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486ff201041so65491125e9.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2026 02:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775035897; x=1775640697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MKFsI3eo76KX2S18LEHJMinFZAHnHZEfnvlNr9wwfyE=;
        b=iq+kcwouwTzKfBB68Cp2/UPeFBHsGydH/k0+APjfzY+6ZIHKT8VesJCzMiBvBKmLfZ
         4VuM4nosnA4UMB76pqZ4KmzN9d5Izsv6kBYd0slr2QDphavto3o+QhOioOcNRKcQ+cC5
         kDFlYlFqArT5Ph04yWEkCX0nSeSj2G2cX96G1RBeZEDj89a6JkHH6B/EKfUSjDkbjOhB
         Pq9eVCKmhqiOtr2M16sBT2Ud6RqldvyYq6LobdhyJPqFwBPNv1O3brojD1ksXxq2Rzry
         Dmp66mhz7ltUUuCQrmxdzxXDFHg2agoMaNaLRbYdlpdJxZaVDSXGwbIvjcqcbVk3RRZa
         TPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775035897; x=1775640697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MKFsI3eo76KX2S18LEHJMinFZAHnHZEfnvlNr9wwfyE=;
        b=hJganfVxL6LtnElFYVVS1n5kau6C22uWuV4IGUAdgIQ0e9AKK5JciZHIOjUFZNKmU6
         +HjkKSvAlPk1j/9MkG07A4uCOxQXEktdZURR4ZP+MD8ZxKb7B05Kk6/bEIpbIRbS7OBH
         Su3SF4xZxgJwK8aFtwHADBaqNC3H+8boVtaUnzRFLARtfwKI0x0h4g0U/ChAp1wGv/vQ
         Sok9tNwI8bjkib/vSSNTcBKoc2nHzRPxzVKlgCP4rgKcigUWxaIROtFKLZqIKgMf/You
         43ZzNm4/vVFvVJqdmj/mNHu2Y41lRkzymOZCNHCjgnIGhAIMlD0I06dKYEc1nzYdBytW
         CfCA==
X-Forwarded-Encrypted: i=1; AJvYcCXXulBSJUT2gTT37M18t/kyTeqbTZVjFi3w6py+XdZqb9fsPV3ZHlt65+M3JI2PZk84bsf+9IUesQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsX1RlSysEYLM3pFroGsJc3L9X4aiyMvUw8v1z2Ry75FgCS3eW
	O05gjgdB5dXFPtXp0xF8YRMXw5ocdmyFrJK/m+fwcrdhhqFIsir7Vyw6
X-Gm-Gg: ATEYQzwtu1jmXfwlGr2NprybwxsKzgEEGzhICG+nYsNfzy5DiR/s4xpESyt49y2U3/0
	UZFNGrcOVs6MqIV+5M6appuvPscq4wqYGLXvfrxRoW8TP0oRcUQD33OVYdWFNhJBYHJ1BI/ZpKa
	4/fB1HuoxGrhNVFIAXI/SlZoSBos55zV+Y+0kReVI4f0u1oO10A+VWlqNFlayt/BMd/W3LikhBQ
	VU4qZGAgMqvf3Ch3RZ+U+ZLYktxbRG9CQA2+WrGVuqRlk98ILEesGvQ3kyfx9OVXivTCyBe1XjF
	J69ZL5Ran8N0CYRgKbot4Colu9bRzDwytQywssft301iLF8oOHZZNhq6cbz22VGR/RaSnh04Ito
	e6csZpPMFyiM+LM/Ja5Vq64PU0Dm3eimQ1XeYwMq5vqAtClqimr/zCh/8LkVz1zSpm58avqwnTc
	CMNDNzkXHNr4/gZ1sE2/LiLtEqpaj7VD80xouqcsfPNL0=
X-Received: by 2002:a05:600c:45d0:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-4888355ec51mr44654775e9.6.1775035897027;
        Wed, 01 Apr 2026 02:31:37 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e9630ddsm95823295e9.13.2026.04.01.02.31.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 01 Apr 2026 02:31:36 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:31:32 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
 raoxu@uniontech.com
Subject: Re: [PATCH 5/9] usb: xhci: move ring initialization
Message-ID: <20260401113132.2dc880c7.michal.pecio@gmail.com>
In-Reply-To: <33373f50-7e86-4854-a651-577662d54811@linux.intel.com>
References: <20260327123441.806564-1-niklas.neronin@linux.intel.com>
	<20260327123441.806564-6-niklas.neronin@linux.intel.com>
	<20260330104207.40c7500e.michal.pecio@gmail.com>
	<33373f50-7e86-4854-a651-577662d54811@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35769-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DD55D377C9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 30 Mar 2026 11:53:31 +0300, Neronin, Niklas wrote:
> xhci_clear_command_ring() clears the command ring specifically.
> 
> The idea is to have (naming not set in stone):
> ring_alloc() <- allocate necessary ring memory
> ring_free()  <- free all ring memory
> ring_init()  <- initialize necessary ring memory
> ring_reset() <- resets the ring

Not sure what reset() means, simply clear()? Would it include init()?

What I'm saying is that alloc() and init() almost always need to happen
together and the verbosity of this patch demonstrates widespread demand
for one function which can do both things.

Is this patch even correct? To know, I would need to find all callers
of ring_alloc() and verify that ring_init() has been added. OTOH, a
rename of ring_alloc() to ring_create() wouldn't compile if the patch
frogot to update some callers.

Similarly, separation of setting up links (ring_init) from clearing the
rest adds complexity and bug opportunities. Usually (always?) callers
will need to do both of those things for correct outcome.

I think it would be safer not to have rings in an invalid state, unless
it's some exceptional case like a very short-lived ring allocated for
expansion. And  even then I'm not sure why expansion allocates a new
ring and splices it into the old one, instead of just adding segments.

Regards,
Michal

