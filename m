Return-Path: <linux-usb+bounces-24320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E34AC48F8
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 09:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52B9116A2B1
	for <lists+linux-usb@lfdr.de>; Tue, 27 May 2025 07:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD98D1F473C;
	Tue, 27 May 2025 07:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JqPpYETw"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6A522A
	for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 07:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329359; cv=none; b=UY+NBchQgvdkc9UPzKfZDdLrjrs5A8nypHp1AswUyyAdDdKkZj9aOcvGNQ73DHc28Q2xwEXDrfFG9uLwXHB86wog5Ql+KDNfmioIX9cJQ6gdM9hwhBZzAuNHGo/g5m5OBHpCj/ITDFBfOePjty0wG2Rn+h52uoJgH+i3Qcey82A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329359; c=relaxed/simple;
	bh=uerM567QcQCVqLcNbyZwn68Uozgpe9FXmx2lyhpHDvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3Um1/Sj8eWAxnGOmXWVXW81ER0Xc6nIRJACbhfba7TCj8rfPdJ142wLfhNe7Pe6dCvl8Sgto9+pKISFRC1JNl1fgz2Aey68AVV+5iFIN/sOmDB+CT9c0QqRkJ/61ko8CQYoFwHn5byT+PrmnyyZDzxxaTzbPVhne6DBnsGGZy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JqPpYETw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748329356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPj65lDKBn8X+w6dITxUNDiVhmFCDqyup7L8wrKjKWs=;
	b=JqPpYETwDR9apyi4F98zawnyfJY15s11vKJifcLqjXQED0w3msmaVvrHe80yO0yfX0dI3v
	ofRVKNRVpLJ6hF32w4Lps8Q+ovtgMbDpgJcDVFAIEpgHEM4Q4bQCIiEbcaRX0ksY6zP6mm
	zGoMtxTsxb2mCKRF6pyCYEhO+LU1Iq0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-v9NFVhsKNtyupcSqkb70ZQ-1; Tue, 27 May 2025 03:02:34 -0400
X-MC-Unique: v9NFVhsKNtyupcSqkb70ZQ-1
X-Mimecast-MFC-AGG-ID: v9NFVhsKNtyupcSqkb70ZQ_1748329354
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a3561206b3so1238243f8f.2
        for <linux-usb@vger.kernel.org>; Tue, 27 May 2025 00:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329353; x=1748934153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lPj65lDKBn8X+w6dITxUNDiVhmFCDqyup7L8wrKjKWs=;
        b=l18Bj/7M8DSkHjWOIyPyWIZoDH5UdfoMTiFYuzmzaxgZioVy1A2joSY60HutttDU3P
         LE+wl7R42WoZvsXki0Nz1Q7vBdjl+88LeViovgDRvcnXvXUFXD/KlsQUpv/zxdJCXsSu
         3nfeI73BDlaSzo/BVmbckheZ3IX4vjO9AvJ+qHOtC7Nb2J/MUuK/cMkp/ksBtuRaDDg3
         YvtVOSBeIy86EsuooOFnY8UkbwC5LbGogFTJ7T+pXJzqdY1yVaD2TjVIn8Rp0WEolwem
         yyT2vzlKxjCx9TAGvWGKC8VPN1CP2L/5ngLt+PelFUK5tUjufk+R3M9LlJ6YJU6JhR7p
         59XA==
X-Forwarded-Encrypted: i=1; AJvYcCWbYom57Uln0uaU9yeC+IjWRUHOkKX1/SjW8KtxuKVUYcP8Uj7ot4EQBa5Lld40igN77f0ukbZok2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyySF0YtmT3L1AiXfr3/EmlFfMdcxDQxaK+QE2hwAyJrGFI7Y0W
	lBEoxhcY/3zB7doX69Qe5+/OwwKNpLCPSci8cOohQDl63sbySKNHiXzsWgAs2NNYclWABBu3TQp
	+DY+8aUFpJDKK7D5us01TDyizpOzSjbT7PldJMQlQRUrHbYy2tfux77pIceuziA==
X-Gm-Gg: ASbGncu8j70OV8RVopi3X0Sd59BZcVCLhXJ6HmS9PI/ayKqmxKY16mZWX+jiFRq6YXk
	OEU0CvpdoHpiJPqOtkB/S8gucpOAatUbHtDeN1kxXew2jcZkNxLX4ECoCPR3Iar3uz+Z83YO4Lj
	/QbTlA5bKxxhEoyKPDIq9ytlYJD7bgtP5lxKV211K7snK/jYjql15R3QK9o3+uoIXpvB4owtbjt
	D2R81E0SWz/eM4V9ur7oeu7B5np5ToA0zOLpTTyuuogdy7n2rTtthcmgpjv2dHX6zdb9VQl8Xbj
	9M0ujT6R1udj1zNUUc6v55SWi6K4dAu/XGcWIYy1MoXLvUGZ1lryxZDD7Ek=
X-Received: by 2002:a5d:5543:0:b0:3a4:cf66:efbb with SMTP id ffacd0b85a97d-3a4cf66f1f6mr7608634f8f.57.1748329353541;
        Tue, 27 May 2025 00:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGex5mHhM/OYaq2gRKUAD/HxHUJY3MptMrHBU8jm/eQhY8uxpjEvS25/QUCzUXZRuezIVGAwQ==
X-Received: by 2002:a5d:5543:0:b0:3a4:cf66:efbb with SMTP id ffacd0b85a97d-3a4cf66f1f6mr7608571f8f.57.1748329353087;
        Tue, 27 May 2025 00:02:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4cc52ab88sm9930473f8f.11.2025.05.27.00.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 00:02:32 -0700 (PDT)
Message-ID: <e1429351-3c9b-40e0-b50d-de6527d0a05b@redhat.com>
Date: Tue, 27 May 2025 09:02:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 8/8] net: core: Convert
 dev_set_mac_address_user() to use struct sockaddr_storage
To: Kees Cook <kees@kernel.org>, Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Cosmin Ratiu <cratiu@nvidia.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Maxim Georgiev
 <glipus@gmail.com>, netdev@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Mike Christie <michael.christie@oracle.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Maurizio Lombardi
 <mlombard@redhat.com>, Dmitry Bogdanov <d.bogdanov@yadro.com>,
 Mingzhe Zou <mingzhe.zou@easystack.cn>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Lei Yang
 <leiyang@redhat.com>, Ido Schimmel <idosch@nvidia.com>,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Paul Fertser <fercerpav@gmail.com>, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Hayes Wang
 <hayeswang@realtek.com>, Douglas Anderson <dianders@chromium.org>,
 Grant Grundler <grundler@chromium.org>, Jay Vosburgh <jv@jvosburgh.net>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Jiri Pirko <jiri@resnulli.us>,
 Aleksander Jan Bajkowski <olek2@wp.pl>, Philipp Hahn <phahn-oss@avm.de>,
 Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Ahmed Zaki <ahmed.zaki@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Xiao Liang <shaw.leon@gmail.com>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, linux-wpan@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250521204310.it.500-kees@kernel.org>
 <20250521204619.2301870-8-kees@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250521204619.2301870-8-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/21/25 10:46 PM, Kees Cook wrote:
> diff --git a/net/core/dev_ioctl.c b/net/core/dev_ioctl.c
> index fff13a8b48f1..616479e71466 100644
> --- a/net/core/dev_ioctl.c
> +++ b/net/core/dev_ioctl.c
> @@ -572,9 +572,11 @@ static int dev_ifsioc(struct net *net, struct ifreq *ifr, void __user *data,
>  		return dev_set_mtu(dev, ifr->ifr_mtu);
>  
>  	case SIOCSIFHWADDR:
> -		if (dev->addr_len > sizeof(struct sockaddr))
> +		if (dev->addr_len > sizeof(ifr->ifr_hwaddr))
>  			return -EINVAL;
> -		return dev_set_mac_address_user(dev, &ifr->ifr_hwaddr, NULL);
> +		return dev_set_mac_address_user(dev,
> +						(struct sockaddr_storage *)&ifr->ifr_hwaddr,
> +						NULL);

Side note for a possible follow-up: the above pattern is repeated a
couple of times: IMHO consolidating it into an helper would be nice.
Also such helper could/should explicitly convert ifr->ifr_hwaddr to
sockaddr_storage and avoid the cast.

/P


