Return-Path: <linux-usb+bounces-35383-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFPdNCNwwmmncwQAu9opvQ
	(envelope-from <linux-usb+bounces-35383-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 12:06:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4B306FDE
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 12:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEC3130D637F
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C0A3E5EFA;
	Tue, 24 Mar 2026 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HfO5Un81";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RpS/O6Dt"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AF43E1CEA
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774349904; cv=none; b=NrSL/HrBLTuh3WF0nSKORLkEn5vaqcft8m0BEayr/kP5Gs3NjSGNeguHmSLbOYJ3Qyh+O1EKYJCjMYWb7K3C+DLNuY3bRZikP/Z0JU4QVoehxRyvSZxl23q6OSFOQRt+T1QAda23gUk+A6tQ1ZZDI1RjpxueUigg8HTaB6sYH3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774349904; c=relaxed/simple;
	bh=RvBBHM/r8JqLlusKXxze+0dkWwneeCrBFwruBfiQ4Ck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xba5tOd8UGpKfl7uKVk6xfjAjOFFFdXl0DE0qOGYvAD/YdxENQIRjYkym7uIO2I83E5kiKdnq5rYlTnLQnMBRn0UsFKJf23JlQlI2qs3aLsaafRD90GwawkyANJVnWFzkRoR29+VnwpwRb1e3rbCkyOox9Vi3yYvEyG8MfU/FTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HfO5Un81; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RpS/O6Dt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774349902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7fxYhNz9mypo+6RSdtGXJrr8xN/V7RBlg3/DS40iuY=;
	b=HfO5Un814ITQ2W13h4iEH6kgx7Uc+0mXoy0azqKR19pFa9CJ0xeIJxP+JEtnpuoMPwWhja
	NQm82ojxr1PrwicLKpiMhBXhnvYT9D9+QxSrYaD6jZtYbMlrsidPbGmNyCu9SriPQt85ud
	97qYZoKR8rA9gEVVnHyUrBebSKUKvZs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-W9ah2m8APSqY-OI5ylVUYQ-1; Tue, 24 Mar 2026 06:58:21 -0400
X-MC-Unique: W9ah2m8APSqY-OI5ylVUYQ-1
X-Mimecast-MFC-AGG-ID: W9ah2m8APSqY-OI5ylVUYQ_1774349900
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-487018c8244so20115645e9.3
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 03:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774349900; x=1774954700; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z7fxYhNz9mypo+6RSdtGXJrr8xN/V7RBlg3/DS40iuY=;
        b=RpS/O6DtKd3NJ3yjJK5Q1e3JfvUuspcqYRSEhws1bY7KD23jnSV/bUzYKuvVfIogU5
         eXQdL+nn/EOITP6IMdHpTnx7eBZrf33lbAnZm0NO4hvkBTH+FBh+i2ROKlPj500SqTqy
         WIzbWiypUhjNEoV/rjGU7DHrqXrgkHAm7tULRuMznsvUYuKXfD77rBcS4qxTkIG0EAXT
         SRDSbr9tdKlP026AH9NkY69EpzNiRoNBPjLF4133TiF1bC0Ps+2HK5lKqNS/Ji3BDiWX
         19EsqnfK+/p5j65R0/zj2e0y4XP0uiQe+X3wEkOu6Q91gJusL0+V15nm2vjpHmQi78ZS
         eSQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774349900; x=1774954700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7fxYhNz9mypo+6RSdtGXJrr8xN/V7RBlg3/DS40iuY=;
        b=fbO1+2O4VXC/ppmBN/HRi+qt2pFtVOS8GjNR5fZh/GNoSdIcu4QT+qtXDEHhy/ZpVR
         kPBnsi1F5HrUKl7Ugs8W1jwvnhFW1OZrRWR9PjN0rXmdEYhxUGvlw0qp3sRraNuJx/tQ
         c7rw97i8MWaGO0m/DsCvCbUT36VwNEQNq4Altdh7O8QQ8S5UwBAGP+jVB4YBflUVfTTz
         JwpKKrYS/lz4EtYym6/byq6VumCuISxnuQG2XjDIpZJ942qCSi0h/YMEghr4434jE6DX
         jYozyiXtKNhteRJQf2g6/4TjmodGLHJOcU3M1e2ftmQJ57x1YKiRboLGXVdHf+LDxoE/
         wQmA==
X-Gm-Message-State: AOJu0Yw5qFlr0sncrwLjbj3CHhp2XZtd+cCbXoqo3olItbRILeLt6RfV
	5jqhlCSYVUonRd9H/1xRSOh6ofzoValgL5k74bg9+XP655xJM9p/0CDKqHdCqdJrGkxWAPrj9Yw
	JrAxYtaFuGy6rRwJ/WZ6LeYlIh9PkzdHTwxIf7HXvXMNsXnvyqxwEfpy5eAOiWH06ufu/fA==
X-Gm-Gg: ATEYQzzS275AJ3Zm0eGA9RAPkJHea2ylNiMYXmPIMiHd8lt1zlmh5e2DN1i9ht5Gzb2
	ascqG8vhIEQqPcakdEdqfn95Gdt2EFBDHgya6HZW0BkC0+QsTQHyuom6eJ5GDxz6mc4M+fai0RR
	Yc5EXdWEw6UOXhSo2VDlu1wBo33Hohxcj65o47Br50aaxXYg16XivpW9uWFwqm8gVsDwUd6rnz6
	j/J42bktLgpRCX6g5v1RuQUG7kBsawxGda6lcJbvBTI2gFJQIlmfqDkLaPQJSz64VCPcD7ThNIh
	9pD66ZEO/TwGII040oVfIqT6rDWo8yUGo6E5p9Z1jEAsXLFCnBnVvnTR0SGuafRwUurLVKAO3Cy
	iHvppfI6Psf3h07k+E3/2gU+7l+2pYrzXLfujb8w8zImoPb2jd1CQ3PjG
X-Received: by 2002:a05:600c:45c5:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-486febb5f45mr213729425e9.6.1774349899757;
        Tue, 24 Mar 2026 03:58:19 -0700 (PDT)
X-Received: by 2002:a05:600c:45c5:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-486febb5f45mr213729085e9.6.1774349899327;
        Tue, 24 Mar 2026 03:58:19 -0700 (PDT)
Received: from [192.168.88.32] ([212.105.153.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116d82e4sm78734655e9.12.2026.03.24.03.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:58:18 -0700 (PDT)
Message-ID: <5ff51617-deb6-48b0-b9e2-2d7066fa2562@redhat.com>
Date: Tue, 24 Mar 2026 11:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] r8152: Add support for the RTL8157
 hardware
To: Birger Koblitz <mail@birger-koblitz.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260320-rtl8157_next-v3-0-1aefeca7fda7@birger-koblitz.de>
 <20260320-rtl8157_next-v3-2-1aefeca7fda7@birger-koblitz.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260320-rtl8157_next-v3-2-1aefeca7fda7@birger-koblitz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-35383-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8CB4B306FDE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 12:14 PM, Birger Koblitz wrote:
> @@ -2022,14 +2277,14 @@ static void intr_callback(struct urb *urb)
>  	}
>  }
>  
> -static inline void *rx_agg_align(void *data)
> +static inline void *rx_agg_align(struct r8152 *tp, void *data)
>  {
> -	return (void *)ALIGN((uintptr_t)data, RX_ALIGN);
> +	return (void *)ALIGN((uintptr_t)data, tp->rx_desc.align);
>  }
>  
> -static inline void *tx_agg_align(void *data)
> +static inline void *tx_agg_align(struct r8152 *tp, void *data)

Since you are touching this functions, in the next revision please
additionally drop the 'inline' keyword; the compiler should be good
enough to get them inlined anyway.

/P


