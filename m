Return-Path: <linux-usb+bounces-33564-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMZeIH9fnGkUFQQAu9opvQ
	(envelope-from <linux-usb+bounces-33564-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:09:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB67177C57
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 15:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECBEF3043030
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 14:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9777280CD2;
	Mon, 23 Feb 2026 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YKOe/msJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PTLKT1UM"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D91214A8B
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 14:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771855729; cv=none; b=tEwdTtFoUB81HXAEi1fJ7huaCVIN36K9rXEQfC2tbRuAcKDLsqoSu+x7ujuLnuxtLDjktz4qXnXEiYVaEbQxyiTmF5dpujgBUftLYeOkTZE4QplN16Bp8j6DmSv8E84ORsHNpXAJWqgUQ/RRtdlzZtB+fj60p67wNunGoCWbtak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771855729; c=relaxed/simple;
	bh=q1NuHyXnGML+DtFIDHXbPoElaVkyIKbJYHpjQCis4LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NhAjSomM4Kk0JkoJa8SKOesmDzqLpuWI1Lg5FaN2aB5SDozzgS/BmSrV5KJX1TN/21zw+ohh0S8L/h0YM3FH5z8I4QpPjmJMuPmRZr3X+G+30AGStj0+Ob3bjXoKb26NuO2Iwi3fIVtPbB7N0h1aHIDpWGsEOWMiE4qNnFKhvoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YKOe/msJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PTLKT1UM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771855727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qHI1uAL447LlWjA1WnS4zCgin5A7EAWLoz4Tm49wEPw=;
	b=YKOe/msJh5XFjoLIcS0YRAsZ1U296X82ggzgoPrphmX9x1pnphHx8+9YWB3td/4vZjKemG
	V+4KqHhUXiOHY+/iQmGDls5kMEZOgSsfW4iAWwMeGI7ITjPuZCOmb7Xx9y7WzfW7tdsMYF
	hTEzLJxGTLqFGAUuKvG3nJinzIuXmKY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-N527WRIQODyRe1YJ02WLzw-1; Mon, 23 Feb 2026 09:08:45 -0500
X-MC-Unique: N527WRIQODyRe1YJ02WLzw-1
X-Mimecast-MFC-AGG-ID: N527WRIQODyRe1YJ02WLzw_1771855724
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4837b9913c9so45024975e9.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 06:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771855724; x=1772460524; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qHI1uAL447LlWjA1WnS4zCgin5A7EAWLoz4Tm49wEPw=;
        b=PTLKT1UMS9ByDGppc2UgwaKYY9ZZ1MYIFj032Gm1XTwuvvosjJMmwIUd7N48U8G3iI
         72y3lPTH7yjg+lbUuIorLpAFH/IM7EL+kCBcsuLVB2xFbofAglyksY4WhPNSaIQorFrE
         4kjRv9iNJI2dzommLigujZxevTHJ9JEgNlLPp3JkkjHCO6n6iIeXX+dTA/HnNS7d+8dN
         yG09M2SfnW14XDLgw5buxmIOUAL2/HNWAXYkId2cvbILsB4VGqE3G+df4MPIp7aBJRTt
         1zDsMI+6CFQXc6EB2klXs1g/vz1E8lhCHkLTftDnfHHD8uXiyuLTSFsBbMPNYEbIBbvd
         yOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771855724; x=1772460524;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHI1uAL447LlWjA1WnS4zCgin5A7EAWLoz4Tm49wEPw=;
        b=ZTS3/9z2ImKrEiMsPNz701s3Yq4GgVLt2zwa/qv9k5781JSdFAilYG+OzR4VZnDa30
         yhMpjTVFpgX9x9HEdmvvE4G2miCMKUjyjSiIMJQ0YxQm3KoQldde7YdV9dk2T8d2Npf7
         5zOBBmfKUt2Yc+O9RhOyarfQVnrkRZWhSduQICpr4ZdAtqK39L5eFd45Ew4lfJSrMsQ6
         vp5cAb3CAtXmk6rKQCRmnsA+5qtWkOEoV7kwdSmeW4BlsYznr9CgO9HsPcoOJUrBBX9r
         ujya2O3RVcG+0HTyIxCh23+d+ZMp7crTpTUQLmZSHrUnuhb/5gGJPBiBaNfsXVzQRZBq
         m1Vg==
X-Forwarded-Encrypted: i=1; AJvYcCW5xnMVX92AICmobHT2sztoz7NyQ+SxcRq2eE2Zk8Re7QVNsAluu6j6pO0v/hgeEDUMvt8Q2E5IBTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuGpOun5/TUY3dlq/f5+nrHaQyru+hjiZBrSC6xUZXHbwOMyEc
	IyiSeRe1GdD346IOtMbm91H1JgOJ8XdootnXWOQ5xicJRt87YnerBnvgYWRx6ylUuDIiSQGf5B9
	Gr6EsOIVoOEiaMf5cyiz4JRfXFfsAJ6e54wZSbDAv0yhg9QgoROtrHRCmXZP8cA==
X-Gm-Gg: AZuq6aIflRlU674cD3aYDdnbA8E7AqJ7VIwjdjoaSoM0qq7UeiJxPWuHk3KhtGDk69C
	vSQh/BSaIuvW+otoAXLk+IiXmNS/IQ5irZtxY/4JatNheIHETZmjfUdz77epch8GT9VJy+Ihy38
	lCjqFoxSMViRPy+r2ifQngfmbNU0keYVZILZqp/up6N0mMy/QsyQEt/KlVqCgMeE6pF3Tt4xiMX
	h5nCoXhto026xjxRjUAbsMFCPaLXP61S2f0bzWr1xSHk/AwuzrvlBk4gOl84453jZavYLA62pes
	Dt33jX93RcwxlC+2rn3qExlGkz3qB3jNKFlFGl4nUnCiFM5SpLKIbXyTkY44QxnQHtjW3JlFWxc
	PnkxZFQAvGAa2Xotn1igVrnU6nBEZTBjhT7PDvMdKK8nKLh1iJodd0VkkKRI2OTaT1nPXOhjqaA
	D5HJLM35fx3ctjCcwXhhT1cAqwrZLCTj8W63+1xYX2FtSH5uY/B2txkUgK
X-Received: by 2002:a05:600d:644d:20b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483a9605b19mr97653725e9.34.1771855724349;
        Mon, 23 Feb 2026 06:08:44 -0800 (PST)
X-Received: by 2002:a05:600d:644d:20b0:47e:e7e5:ff32 with SMTP id 5b1f17b1804b1-483a9605b19mr97653365e9.34.1771855723811;
        Mon, 23 Feb 2026 06:08:43 -0800 (PST)
Received: from ?IPV6:2a01:cb00:8ef9:5300:877b:aaab:2ea7:8695? (2a01cb008ef95300877baaab2ea78695.ipv6.abo.wanadoo.fr. [2a01:cb00:8ef9:5300:877b:aaab:2ea7:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42eb7ccsm87067275e9.14.2026.02.23.06.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 06:08:43 -0800 (PST)
Message-ID: <95ccf5a6-975b-4543-80a3-595f1ee20543@redhat.com>
Date: Mon, 23 Feb 2026 15:08:41 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: commit 662dc80a5e86 breaks rmnet over usb
To: Koen Vandeputte <koen.vandeputte@citymesh.com>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch,
 Eric Dumazet <edumazet@google.com>, kuba@kernel.org, pabeni@redhat.com,
 netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
Content-Language: en-US
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
 dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
 SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
 6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
 YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
 jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
 gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
 uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
 2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
 KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
 qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
 7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
 460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
 efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
 asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
 VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
 C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
 Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
 brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
 z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
 jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
 AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
 WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
 AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
 OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
 P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
 U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
 R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
 oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
 FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
 kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
In-Reply-To: <CAPh3n803k8JcBPV5qEzUB-oKzWkAs-D5CU7z=Vd_nLRCr5ZqQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33564-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lvivier@redhat.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDB67177C57
X-Rspamd-Action: no action

On 2/23/26 13:04, Koen Vandeputte wrote:
> Hi Laurent,

Hi Koen,

> I'm testing the latest openwrt state and found an issue probably
> caused by your usb mtu limit patch :-)
> 
> I'm talking about this one:
> 662dc80a5e86 ("usbnet: limit max_mtu based on device's hard_mtu")
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.12.74&id=662dc80a5e86b35bbf339e0b87b7cc3f07c09de1
> 
> 
> When using wwan0 iface normally, this makes sense, but the problem is
> when using QMI modems combined with the rmnet driver and aggregated
> frames.
> 
> - The modem is configured to frame sizes of 16383 or 32767 using QMI
> - wwan0 (using qmi_wwan) is configured to match this frame size by
> setting it's MTU to the same value
> - Frames of this size are sent over to qmi_wwan driver (containing
> multiple data packets)
> - Frames are then forwarded to the rmnet driver
> - Frames get de-aggregated here and sent to the network stack for processing.
> 
> The reason here is to reduce USB transfers heavily.
> 
> 
> As you see, it's perfectly possible here to use very large MTU sizes
> as the aggregation feature by rmnet relies on this.
> Also the modem can be perfectly configured to send very large aggregated frames.
> 
> After your patch, wwan0 is limited to 1500 bytes it seems, effectively
> breaking aggregation.
> 
> On my tests, download speeds are reduced from >300Mbps to ~.8Mbps
> 
> I also made a build reverting this patch and all works well again.
> 
> 
> Is there any other solution to fix this?
> I guess it should be reverted otherwise :-)

It's weird to be able to set an MTU that is not supported by the hardware.

To restore performance I think the rx_usb_size should be decoupled from MTU max in qmi_wwan.

Could you try something like:

diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
index 3a4985b582cb..6b4796fac692 100644
--- a/drivers/net/usb/qmi_wwan.c
+++ b/drivers/net/usb/qmi_wwan.c
@@ -788,6 +788,8 @@ static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
                 usbnet_get_ethernet_addr(dev, cdc_ether->iMACAddress);
         }

+       dev->rx_urb_size = 32768;
+
         /* claim data interface and set it up */
         if (info->control != info->data) {
                 status = usb_driver_claim_interface(driver, info->data, dev);

Thanks,
Laurent


