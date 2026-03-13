Return-Path: <linux-usb+bounces-34736-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGtrBeXts2m4dQAAu9opvQ
	(envelope-from <linux-usb+bounces-34736-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:58:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B726281D66
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:58:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8162231DAFCD
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 10:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6634838F657;
	Fri, 13 Mar 2026 10:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="WsAJB4c7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0843358BF
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399286; cv=none; b=h1TNORLZNuwHXVD1NYjXabmudhpkRC3hVmqs7G1Xf3SMGwylc/MDkLYBGL6osh5anpFvEuxdR/MvPtWrOZGqlypBZ4QnXLTfK3T4eFyCbBoMlGAkbkfN5CFqj4e9GEkKzyhMX2kOS+N4pcyMPT0krYWBhvf4XP5dBW7Pb9BXUr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399286; c=relaxed/simple;
	bh=w3zxUJSjuu2ZTxg+olsZhOhgZVG2CW5eudoaxy9c3g8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=El3Z1k1VTZWb8epKRz0gK0aOsvJ7i0SnI4unTUVhr8pGciCF9V+7PjiCXCyPZlOAHqf1SpGpW77Tjit7EWvmW6Fgeki1WdxdN1sXtYh8wcJspuGEc3iPrBU/AjUIMEZdI8o2QZvd+rInpzBOImQNg/EuwjCEDgfwn6wdFgjxrTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=WsAJB4c7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so11889675e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773399281; x=1774004081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz+lAQTHg1ZrCDfzAJVJz3UjVKFh4n4P3F1q/hGkrl0=;
        b=WsAJB4c7LexSbPtMe8CFtyvMnh0BENY9Ncy4eZYZlz6GDoJTjLtiWX9eZZ8grHcxTg
         sYw+xItb6vP5stA3W2kPER0E4GGLr/jxQsyUKUTGsiRiP8Hs4zP2oBcpRMolbLLdpCEj
         jfqM0rK2jZu5Zn+9bmCdHs/YAn4Fc+XBOaUDgb14ojl4eCc36pMQ2UlMG/pF2N5v6J6p
         fPQAetMuGyQb8qzPDrfTszwhvhTEYfzwnN//a9qSr5Eqphf7Ju5tkAiCS1I6HIyaZ7kZ
         +b/T9vvjo8GOND9pO88mDsE8y24Ry38ckcqWjCyE38TCXocD9O3RxDM7FzPJLFHkKJgp
         B+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399281; x=1774004081;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz+lAQTHg1ZrCDfzAJVJz3UjVKFh4n4P3F1q/hGkrl0=;
        b=N6I/RENE5mZXevoba9IMvpNqG9DwH90p7mtr39GihHgs7PvFWE/XeJwtFZDi6HVv9Q
         paJmOEoSxZ3tqfksnJa7nXgd1b9CYo2ODArefmZ8/SksF6w574j9FPuxcx8YSbPGs1mj
         QE1X9heB/6MRUSjIX4RjLj/o+uxk7i0B08O8eJEIAI8so9xjuzJSDb005bYAxaoXkcUZ
         R/5GQGNME7dHJ6UZy9m+qORr2BQFBym5jmjwQuhf8Y3fhp5zU7NGXg61wpYAaz5V7xRS
         XD+C+rAzPNH4C7P/LC7w6K3hhkQEjbzadk7aXhAPu+4SJ03YBQEzCExXbFzKY87qVZby
         dlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0NQkUuu0TLhGx5O9w1cv8Ii5vtJm4hDolG62JE7fWA0cO6SMOHaiD/2fmWxUEewuVgIcYWazDdDc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9VUOMVrxU0fT6pUfWjDPmrrxD78yCzoovQ3LLenXiw2wOb+1L
	HF2EqlRXiIx81fyyfPDk8vySiLxZFZlvxHTack+UmlunpFcCmMEpaoGBf6SsINSeSI/kQ+jFwVP
	fLmevcToVMwoGEijXW6ghIhbpb9AMK5gj3uduegvgto3QJi5WkVb1vuw=
X-Gm-Gg: ATEYQzx1oto3caey5ypYa3YC12g87mYUB45AnTSo8YOOhaz0Fuui2IFm4uL3wDEOlCT
	8AJW3KVuP7e0ZCqizThM6Th965n63LI68v5ro5iEcycyLuK0/0s78qUcQNoZZ+pTA3Mw6Z4TXi5
	VPSuf2KPp6OmKR53lFltOiQSqOT2exOP+/l62gGbkDkYDjeVqRmLeKwRHm3mtwzjYNM53o4a0eM
	t1EdF610Nq2ssKTaqps2x/OKxe2A4c9yhCbMz0wrhNRmJAuwyzNN34q6c+tznwbgBiZYgC/xs7A
	vfGggTBkjFRJdIiX1CaPYvKqTTJYODA6DUa0URc2JM9X2M3No7Y763D58pNZi56pq6w7VOQcA8S
	d10+0yziL0UEwDTQzAPJTbfbj9IyDK+gJBEDABLDgJHBQ4MHulOTi8+P83LiYe+o/QEi/yjp8jl
	gbVJIqjDU9TijggaPqCiJ2dKOUsJpqdWWQ4CZgn0idYVcMP5GrAMdmKzMG3kahjA==
X-Received: by 2002:a05:600c:4e08:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-485566ca967mr41162595e9.3.1773399281346;
        Fri, 13 Mar 2026 03:54:41 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:5172:7646:5893:2ac6? ([2001:67c:2fbc:1:5172:7646:5893:2ac6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1b22e7sm16933971f8f.16.2026.03.13.03.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 03:54:40 -0700 (PDT)
Message-ID: <bb8b3433-f8be-4f0a-903a-1c179552658b@openvpn.net>
Date: Fri, 13 Mar 2026 11:54:38 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10 net-next v2] drivers: net: drop ipv6_stub usage and
 use direct function calls
To: Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org
Cc: rbm@suse.com, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Zhu Yanjun <zyjzyj2000@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Mark Bloch <mbloch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Boris Pismenny <borisp@nvidia.com>, Ido Schimmel <idosch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, Simon Horman <horms@kernel.org>,
 Edward Cree <ecree.xilinx@gmail.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Harald Welte <laforge@gnumonks.org>,
 Sabrina Dubroca <sd@queasysnail.net>, Oliver Neukum <oliver@neukum.org>,
 David Ahern <dsahern@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Nikolay Aleksandrov <razor@blackwall.org>, Parav Pandit <parav@nvidia.com>,
 Edward Srouji <edwards@nvidia.com>, Vlad Dumitrescu
 <vdumitrescu@nvidia.com>, Kees Cook <kees@kernel.org>,
 Jianbo Liu <jianbol@nvidia.com>, Gal Pressman <gal@nvidia.com>,
 Guillaume Nault <gnault@redhat.com>, Cosmin Ratiu <cratiu@nvidia.com>,
 Carolina Jubran <cjubran@nvidia.com>, Alexandre Cassen
 <acassen@corp.free.fr>, Stanislav Fomichev <sdf@fomichev.me>,
 "open list:INFINIBAND SUBSYSTEM" <linux-rdma@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:NETRONOME ETHERNET DRIVERS" <oss-drivers@corigine.com>,
 "open list:SFC NETWORK DRIVER" <linux-net-drivers@amd.com>,
 "open list:GTP (GPRS Tunneling Protocol)"
 <osmocom-net-gprs@lists.osmocom.org>,
 "open list:USB CDC ETHERNET DRIVER" <linux-usb@vger.kernel.org>,
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>,
 "open list:INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWOR..."
 <linux-wireless@vger.kernel.org>,
 "open list:ETHERNET BRIDGE" <bridge@lists.linux.dev>
References: <20260310153506.5181-1-fmancera@suse.de>
 <20260310153506.5181-6-fmancera@suse.de>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20260310153506.5181-6-fmancera@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[openvpn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[openvpn.net:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[47];
	FREEMAIL_CC(0.00)[suse.com,ziepe.ca,kernel.org,gmail.com,nvidia.com,lunn.ch,davemloft.net,google.com,redhat.com,netfilter.org,gnumonks.org,queasysnail.net,neukum.org,zx2c4.com,blackwall.org,corp.free.fr,fomichev.me,vger.kernel.org,corigine.com,amd.com,lists.osmocom.org,lists.zx2c4.com,lists.linux.dev];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34736-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[openvpn.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonio@openvpn.net,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,openvpn.net:dkim,openvpn.net:email,openvpn.net:mid]
X-Rspamd-Queue-Id: 9B726281D66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/03/2026 16:34, Fernando Fernandez Mancera wrote:
> diff --git a/drivers/net/ovpn/peer.c b/drivers/net/ovpn/peer.c
> index 3716a1d82801..6dd11c71204b 100644
> --- a/drivers/net/ovpn/peer.c
> +++ b/drivers/net/ovpn/peer.c
> @@ -821,8 +821,7 @@ static struct in6_addr ovpn_nexthop_from_rt6(struct ovpn_priv *ovpn,
>   		.daddr = dest,
>   	};
>   
> -	entry = ipv6_stub->ipv6_dst_lookup_flow(dev_net(ovpn->dev), NULL, &fl,
> -						NULL);
> +	entry = ip6_dst_lookup_flow(dev_net(ovpn->dev), NULL, &fl, NULL);
>   	if (IS_ERR(entry)) {
>   		net_dbg_ratelimited("%s: no route to host %pI6c\n",
>   				    netdev_name(ovpn->dev), &dest);
> diff --git a/drivers/net/ovpn/udp.c b/drivers/net/ovpn/udp.c
> index 272b535ecaad..059e896b4a2f 100644
> --- a/drivers/net/ovpn/udp.c
> +++ b/drivers/net/ovpn/udp.c
> @@ -14,7 +14,6 @@
>   #include <net/addrconf.h>
>   #include <net/dst_cache.h>
>   #include <net/route.h>
> -#include <net/ipv6_stubs.h>
>   #include <net/transp_v6.h>
>   #include <net/udp.h>
>   #include <net/udp_tunnel.h>
> @@ -251,7 +250,7 @@ static int ovpn_udp6_output(struct ovpn_peer *peer, struct ovpn_bind *bind,
>   		dst_cache_reset(cache);
>   	}
>   
> -	dst = ipv6_stub->ipv6_dst_lookup_flow(sock_net(sk), sk, &fl, NULL);
> +	dst = ip6_dst_lookup_flow(sock_net(sk), sk, &fl, NULL);
>   	if (IS_ERR(dst)) {
>   		ret = PTR_ERR(dst);
>   		net_dbg_ratelimited("%s: no route to host %pISpc: %d\n",

For ovpn:

Reviewed-by: Antonio Quartulli <antonio@openvpn.net>

Regards,

-- 
Antonio Quartulli
OpenVPN Inc.


