Return-Path: <linux-usb+bounces-25836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09834B05927
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 13:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D26DF1899909
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jul 2025 11:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B70362DAFBD;
	Tue, 15 Jul 2025 11:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CPN0oTWo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D183275863
	for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580151; cv=none; b=ZpYHkaYao4EsVT+qby+gsWmrIRnt7dciqw6RAegKh9BiSVVgECN0c1aVppHmpGIou/C/Tzmx7paN/818aQiInEl5JCOzNNWMvE3HGlhqCqEpYSDBAwVCCtk0QYJnmAMWYY6cBQB1TvIaPt6AjGQHefO5dYL3MhSfaXkot3CVeWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580151; c=relaxed/simple;
	bh=H65xc5R0MlyO0nD0fYmQfSB1vnTb//tbsmGqm0vbgPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQVBa0S2UyAWvXlAkZdxMxeZZtJgU6WpuR8hoA9VmPf34gSuGnW0K4Md+97bVffteo1ReaMbSK+NOWdz9L1nWkld0Hr/izAKOu6NfMnmTrNDK1WPX0K4KU4zUSnUSUVJS+CThKA4Cwzh5AE02bdplqmkxOuZiRB6hqwC/DlLjrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CPN0oTWo; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso8387070a12.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Jul 2025 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752580148; x=1753184948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oYFAX28B73ZWV81uVTn+uVGouCQNziKk/Cb++ZONJv0=;
        b=CPN0oTWok489uuh/Ul0GxV71e8yodVgNEnbtawWwqo+8q4/TmYy/LEtF0wKOv+2kIz
         40VdXQLTJBnJ0ipt8SXlIk2bkkSFvutUMq0iI1ZN2bO2PX94O66qcWHHsjzIxjKrAOCx
         JcBJxDKjNWtPMzwq2m7utfVrrM3CW1zWHx4pf1A9bcAh+XkFJQ6CyUL3dU4NqfZxHOeB
         e7XCDagxk2k2hQ9akBZvvhZoUEq0Vt3fi8EjW6iBfYm+mJ4QRi+S6reMy+D4KDg/5uJx
         JKe2ywOCQQqyiysPap4IT0zMeACSUj+GVNWezEi6chw8q6ce06JFcRLw/fPSXkm6FOWY
         G7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752580148; x=1753184948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYFAX28B73ZWV81uVTn+uVGouCQNziKk/Cb++ZONJv0=;
        b=Ve3WCO8BPDOJtQYXxTp/E5Ldrc1BQFRgPpP69gW6l2Aq3dg9sfLvqWpuUfWC4pE7yA
         wYNTAw5SlEikWuoWANBgdRQaKIQ6wCZzghGwHVobkgtYi2edKd7YE6j4aY9yyZ2M+j/g
         dv0e8nTZ0V8gB6UwNqJpOVxBFgdE2Z3EDwxRr2Y9HplxvUetk9AbszjEwgazpzmJFxsy
         pGM5x7v433dSjMHgSMBw/OyHu/QUw396n4OJwTILoZHT3En1n6b7oxgKAOtxz6mJrfYY
         GLaYbxUYidPPAaVGaxhmbjFPBN9/jNhEto8oPGyNEWzd1Y1lw4BkLB1xsoB++Wt8PeMq
         YiOw==
X-Forwarded-Encrypted: i=1; AJvYcCVzRq/JiKl7zr5ImpIID5FZpM2bvz+rdaDs3fl0DMRthjadqsYKlUtcf+j/+a5oB5fPedHB3qISNi0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7R8+y5GQcSmkfeUjepjTbYjAFBYVFJtccx/XjOJUV9OWioxIB
	WvGCFPiYuO9ed8xnG4kgBlgGbta8xL2idM9zUm7pDUwOD7k3qYAevTbEtZwafbencjE=
X-Gm-Gg: ASbGncu957+MspeILCLz6WouwKFGIxT/VQKTEp4HZxdblHzSFQYSVFaC7cuk3LS6+kd
	6S7VccEcZY2rq7uaCmuRvXsIrCpm8SxISfY0HOqxu+5xsM6Ksko5d+YU9NKlNnsk0Vho8D3CM8C
	l3CefoS2WTvuVusg/sWzxohvNCCXuand03WnIU8NXbSySuxwsWGBdD0vMw1AC3L3hNT5uchW3E/
	KjG2R+Cuoin/Y5gU5uSvUl9+M7QaqnFEpTf+yX4SQKQ62S+GA8xnzH5KD/NfKFk2Tt5vcw6Ey59
	9VUYrGMK9Oe3tBhQAS3SXYaKhBLP9S8m6nwX8sl5UlgyGYwhcsQ/MEU/aWn62kJCX5OIlpkkLIa
	I9mWsaVds4BLXAF5JsuW09tkidHkAIchMrRHts8rid7g4HhthaLVyzAHyzEc+dH8giQ==
X-Google-Smtp-Source: AGHT+IGpZJAcfXHpIV6qXP8Zk9PSOKUee3mFWI6sjN8MP30hMErhwYj770Upg2/rLyzH0ZZRMVTPig==
X-Received: by 2002:a17:906:f5aa:b0:ae3:5e70:32fb with SMTP id a640c23a62f3a-ae9b9488e4cmr232066866b.4.1752580147476;
        Tue, 15 Jul 2025 04:49:07 -0700 (PDT)
Received: from ?IPV6:2001:a61:1337:8001:1c60:c024:2a6e:24da? ([2001:a61:1337:8001:1c60:c024:2a6e:24da])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d05sm984882066b.3.2025.07.15.04.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:49:07 -0700 (PDT)
Message-ID: <22e2c652-7861-48d2-b769-79b2ef4ea878@suse.com>
Date: Tue, 15 Jul 2025 13:49:06 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usbnet: Avoid potential RCU stall on LINK_CHANGE
 event
To: John Ernberg <john.ernberg@actia.se>, Oliver Neukum <oneukum@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Ming Lei <ming.lei@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20250710085028.1070922-1-john.ernberg@actia.se>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250710085028.1070922-1-john.ernberg@actia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10.07.25 10:50, John Ernberg wrote:
> Having a Gemalto Cinterion PLS83-W modem attached to USB and activating the
> cellular data link would sometimes yield the following RCU stall, leading
> to a system freeze:

[..]
   
>   	if (!netif_carrier_ok(dev->net)) {
>   		/* kill URBs for reading packets to save bus bandwidth */
> +		usbnet_pause_rx(dev);
>   		unlink_urbs(dev, &dev->rxq);
> +		usbnet_resume_rx(dev);

This will schedule work.
Do you really want that?

	Regards
		Oliver


