Return-Path: <linux-usb+bounces-29456-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACFCBF0885
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 12:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63F41891AF4
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 10:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A252F6588;
	Mon, 20 Oct 2025 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IMHcVSVk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FDE2F5313
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760956071; cv=none; b=CMAMISySSvRRe/eB1eq2kg/e3ess0JVsTy6WJYRx5lA90wYdkZGOxWs+tNzjU1U1GuHpGVQreQu1VROF7DVDhrYNVg5XncGPDlW9L0uTJFsPU6j222hrxpDcCTk/hsAxtKn/TiHx/orw5XUV77sfi4/k3w7VQKIaJSpBs0OV7Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760956071; c=relaxed/simple;
	bh=YdJQT23MmkSBi0ZaNdhCdqOffP2+xSjXp9ntW1Fk190=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2ccaiY4sUw+DmdZqshJZaP7mB9WfChLZvmCfI185vBi4hQxVR6ZvP6x4pLgO6Iv2yxn6LyYq5n1KM7PFd4/GNTlU68y/azu/91ZO8q/Jv5riTZLd1m22iDz08o46fai9h8Ik7qi1NSA92hypeSxwLEcXvv2jCAmN/Ks1GuZLcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IMHcVSVk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e542196c7so33356685e9.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760956068; x=1761560868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3dvtYsvwys6UCmfh+4mUwt2dao0xzogPu4+lUcRk6l4=;
        b=IMHcVSVkfBD/+AZS0X1KRxJODyFg+227YpSjHD8cOia4U7Zt1OraRcqyjTDyAdeJ3G
         Dqqj+kvuuAhuFo0G3IhIaej7b4CsUbvJPem9+qHDxAa6Ax1GQDWIt2n8hClm16HqvGwV
         p7hgTsH7xKhRb7Jlt88lCkeQFPwREodmEpB2Eq01YVii02SqlW8ontAya5c+kgYZsjRb
         BYBsm5/bVWLqz1g/Yfbdo3F2N0vFevsXtE/DluQZsZCfPGuCrAzSFsj9ij1B++/VOQZT
         /mdpzuCFb76kUu1L1lO7KBqWUh7SN0sVQnUt08QKEqfAwd/qEFi2ozLJcq++1X13v/QO
         xHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760956068; x=1761560868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3dvtYsvwys6UCmfh+4mUwt2dao0xzogPu4+lUcRk6l4=;
        b=Qd26k9mT2LJF3jxYTHdboCJ5YQCyME0TxgXOFLKkZFDsm/GnENdUQr5mO7pLHJoDZU
         Fl8wbH99VUoAj3IhShAC/1lVhpX7DrQoJVxx5rY8FHeW/AeNAXDp7djHZT1wtiuOBrUZ
         2n0zTcJw9BEPwiOJn2TE50n4kbBNHQUBM7mQVnl9DnkSi+xzWki3/0zBWW5hYMKzm/6X
         FpZwKS4agV9dLl/kX1WUufAe0cuewO/dFBI60dEG5RvDFs1T4QEJhYlyS+DDVgbIVrYb
         B3u1ePMtxMsf+67lR1j5Vn5axAjVaNaFbsllX90TYOtBl6BZmqT8xB6eu9GpjHahwVPH
         NTEw==
X-Forwarded-Encrypted: i=1; AJvYcCX0EcsAODckr1SDPkHCpM510+29Bxpq3Lqe2ftYlJ55EK50HmJUHkB3yfbLlSxS4JF7euh1arwmpp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYB3LMAm4HikxV/XpfizovaprdiBcDUKH7RnagqNsi+htPHZg
	hSgbS/CczQOH2PQhoy1oZqAEc+VPBtfRtkpgxhL9Owy1fIt+HRzTcD2dn/L5cbrB0f0=
X-Gm-Gg: ASbGnctYRyaDSbL/5THTOcIgOSsX8soy6NgZa6ELjR+XyN63Z0quqQz7pRlHPUa8Yzc
	fjkPuIKoOwDeSt+Ry+c6iPcrqkdE5kUk8RxUrRYu58ArecR7b2B4/+bJFeEcdyN6vcX0nUpv4Ma
	op+nLDe153+T6CswLwBlrPZ7+BV3KOu1uBmHTN9YB9KaQNaI+SQNWEzqXks9k4z1C8mIB2Z5uUf
	uvjVfTeHku+1aU+w7x7n9GUZ2yEAMnHvpNa4j9B9+fZ4r3nXaDf+sGI/ZzTP2UuJ/DvMVN7Xgev
	WmmsfEKLHeP72mMLGBGdzeSog2rBDTdNNwZFu6JG4Yj4VtpYVYTIsEXZKeIegFzmg4VeJmPWvGk
	+KVZuuw1a5pQodoJaoixqJ1u1mtPAINdRuE0aGGX4QfEXMGDqODrPu752VDRk6JrEZArZg5zu7s
	4gLKiaIHxpTwIr7pte8zc65mvEPuKLXvSw/4BMszG3bTL4OCtUykQq7A==
X-Google-Smtp-Source: AGHT+IFjlH+J8EM55S3REFmZyZsIciSPk/zzo+ozqFlEcxZKYkS0tz+EKjw+SI9tTxE3OLx1rl1AVA==
X-Received: by 2002:a05:6000:4b08:b0:427:55e:9a50 with SMTP id ffacd0b85a97d-427055e9a5fmr11181093f8f.22.1760956067678;
        Mon, 20 Oct 2025 03:27:47 -0700 (PDT)
Received: from ?IPV6:2001:a61:135e:6601:24e0:f40b:1a23:7445? ([2001:a61:135e:6601:24e0:f40b:1a23:7445])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a0f7dsm14383873f8f.4.2025.10.20.03.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:27:47 -0700 (PDT)
Message-ID: <c522fde0-97ab-4285-aa78-40c5ca39b5b2@suse.com>
Date: Mon, 20 Oct 2025 12:27:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
To: Michal Pecio <michal.pecio@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
 <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
 <20251017191511.6dd841e9.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20251017191511.6dd841e9.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.10.25 19:15, Michal Pecio wrote:

> A less complicated improvement could be moving the common part of all
> cfgselectors into usbnet. Not sure if it's worth it yet for only two?

Please leave usbnet out of this. The selection of a configuration
belongs into core code.

	Regards
		Oliver


