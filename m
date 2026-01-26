Return-Path: <linux-usb+bounces-32720-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAsvKQNWd2nMeAEAu9opvQ
	(envelope-from <linux-usb+bounces-32720-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 12:54:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4742987DF1
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 12:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5585305B965
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 11:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7A033372B;
	Mon, 26 Jan 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g8OvjCRp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DDE332EBE
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 11:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428179; cv=none; b=sBnnwUpuTHLxyrap0EpnkTiN4nMa9JYvgRpj27LweeiiA/qzHRPzQKyyPbMX0NzHcdCHhJJhM2ZreOt6W+1uJfD3yfC3ot+z6V7TeuAfchbXPG1DKX4p4ZKU1GRxwH7ncp07cLRG1HcacytPuRBP8AeOLTsAjQPzAKKPWGFzqr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428179; c=relaxed/simple;
	bh=9yn2gy4stahnnhoif2MbmULokXbFyhugTFcvVCHDtZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqvB6QEjVRRZjMVAMHMoOyFSbDT6a+nTxKnRMXC7tqsYblqC/DeRv3FKWkdZhMMjlz4zR1g10Ypt8VeUjOUave4SSctJyGABPbiu9iNi7PcEFfs0N9ojAMOEDV185bWSVYYL4fGeWWIHf/4EEOOHyn4IyrY+uRacfdSAMz8wzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g8OvjCRp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so36136165e9.3
        for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 03:49:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769428177; x=1770032977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOhLAj2giVSLA0OsJBFJXkMMrU18g2uT51Qc0Cqc3Y8=;
        b=g8OvjCRpuDAdCP1praM4sVBUmhqpw5qU5Zsf1mQNurHrTNHm33j6SeoO9IE/wEGbqr
         Bnsox7ue47l6/PK1Vbhjwi0KCZUyGqxsLyi4ea+93NKwydwOuq6yb4/k9G2ho/EyVTqe
         obBR7NPTVMqIHdfvNnqhcE6/EOKlH6F9JtDuiA2NYRb+n/ryWm4qbzMqy3c1EYOe4DPP
         NIsurtCqHdv7VYMMbf+zgC+79ZC98R6VuRtypnKKAaa2EBtl/kQUcEzlsJfNNyJDABPM
         RNQ0W3R0KQf8eLOf1aPIWsneQpwjyDXxgCSI7iPXUyFUNd8vsW9x+Iqkzzfz81T0Bxu3
         HtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428177; x=1770032977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOhLAj2giVSLA0OsJBFJXkMMrU18g2uT51Qc0Cqc3Y8=;
        b=HfV3EtGrBHa4jdCpWmEDowr+xIHlavco6dXJ1A7b5p6JyQ+oSECCXcUSjsY3NWeRO2
         7HLQkVEstrxxcNzbX49JwFmKK75vcXGz5JAp2ZbEpmWHcl0pAa1RhopD5F7RaEtqWfIu
         Fy2KqEu3FlJxEJUye0s4FRROyj3MWjVOL6oo/q/nhWRKZnXUB1V0eZJ42lvi8g6k1Tcs
         NBgw20h8tEYnSj1PEbm2s7G6saNZrSxUnPMHxlVueMQdMoHN2+w5lydt+Otia+zRRhz/
         Wl7A//LpXxtl0Uo19YsVFdKV3OWyhUl61xxkX+s9jw+Oc+qmEhoj+iSUx2Dq7PKZn+gi
         Kwvg==
X-Forwarded-Encrypted: i=1; AJvYcCVqGqCRFM3NMugfPnRrj03KFP73M3aj9wRcwMwOCUHSRVG8fDAlpNrK6lRBcA2+007+VtREcEAvVuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXT/bgSxNRKzeLVdKhMaTm/1MIZOUiw5OV6sGiTF64MmibMuJ/
	/m9xBdUEiEnJFgI0frjSXKssk/nJBEXsPLfnJZ2Z9hTJms8Wuqp6zKxJXjM3KUOZy44=
X-Gm-Gg: AZuq6aKZV18ZrLad2+j+KdJoKG4veIEDWQTmi7cvoY1ltE+IOy5+ubQ+IlwDObzZD+5
	Fo0NxFA0ND1n/aLKBTMMmzulW+Ud00IUd2thy99QxhyHJDk3tb0yUYc3iCtJUfHa1Ixu2F24fs/
	EOwE3L9hb94o0j2J7NXe68i9grScTuztjLS+ZQsNAkDKHHlN8jx4dBy6Rh9JPNzyDqoRWAr51mk
	9mPfZWvrWwFyWSkKfWSXiNYaTVkRSfggzAz7tcdEpVXCNlPrTwg6LWdRSAwKfsmjDR5n4B011ie
	YzWMKKjLFJUoS1+261RH/KwKC5gij636qN4McISLFwOswmeFxzejycx350kOQcczsrErWPNvEBh
	mUiiyI/M9zKZveDaI4ot8IuQlVmJB0m5aYbIWPXZTxzOkb39m58in+cYZIGYZgr7Rtu2cSWT+sI
	86HSAyQROKLq9E8Ty1/tZl2QjqOO26E5gr2Rds9vhOXzUudfYlggnwoURMLTr2fsU=
X-Received: by 2002:a05:600c:34c7:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-4805cf5eb16mr69099575e9.17.1769428176854;
        Mon, 26 Jan 2026 03:49:36 -0800 (PST)
Received: from ?IPV6:2001:a61:1306:1a01:7fb:321b:3b69:f667? ([2001:a61:1306:1a01:7fb:321b:3b69:f667])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470c1dc6sm318920465e9.10.2026.01.26.03.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 03:49:36 -0800 (PST)
Message-ID: <9239ddef-c197-4fbd-8e88-691766bda3e2@suse.com>
Date: Mon, 26 Jan 2026 12:49:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: usb: kaweth: remove eth_addr_t typedef
 and bcast_addr definition
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20260125083501.34513-1-enelsonmoore@gmail.com>
 <20260125083501.34513-4-enelsonmoore@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260125083501.34513-4-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-32720-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 4742987DF1
X-Rspamd-Action: no action

Hi,

unfortunately I must NACK this patch. Let me explain:

On 25.01.26 09:34, Ethan Nelson-Moore wrote:

>   /****************************************************************
>    *     usb_eth_dev
>    ****************************************************************/
> @@ -185,7 +183,7 @@ struct kaweth_ethernet_configuration
>   	__u8 size;
>   	__u8 reserved1;
>   	__u8 reserved2;
> -	eth_addr_t hw_addr;
> +	u8 hw_addr[ETH_ALEN];

You may note that this data structure is declared __packed
and the member hw_addr is preceded by three members of type __u8.
That means that it is located on a _three_ byte alignment.

>   	__u32 statistics_mask;
>   	__le16 segment_size;
>   	__u16 max_multicast_filters;
> @@ -882,7 +880,6 @@ static int kaweth_probe(

[..]
   
> @@ -991,9 +988,7 @@ static int kaweth_probe(
>   	dev_info(dev, "MTU: %d\n", le16_to_cpu(kaweth->configuration.segment_size));
>   	dev_info(dev, "Read MAC address %pM\n", kaweth->configuration.hw_addr);
>   
> -	if(!memcmp(&kaweth->configuration.hw_addr,
> -                   &bcast_addr,
> -		   sizeof(bcast_addr))) {
> +	if (is_broadcast_ether_addr((const u8 *)&kaweth->configuration.hw_addr)) {

Here you are using is_broadcast_ether_addr(). Let me quote
from the documentation on this helper:

/**
  * is_broadcast_ether_addr - Determine if the Ethernet address is broadcast
  * @addr: Pointer to a six-byte array containing the Ethernet address
  *
  * Return: true if the address is the broadcast address.
  *
  * Please note: addr must be aligned to u16.
  */

That requirement is not met. This code will bomb on ARM for example.

	HTH
		Oliver

NACKED-BY: Oliver Neukum <oneukum@suse.com>


