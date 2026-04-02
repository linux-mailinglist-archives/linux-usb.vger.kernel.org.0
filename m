Return-Path: <linux-usb+bounces-35863-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGB5OiNhzmnvnAYAu9opvQ
	(envelope-from <linux-usb+bounces-35863-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 14:29:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C48389136
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 14:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E60E9306174C
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 12:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3F13D891E;
	Thu,  2 Apr 2026 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b="VVCVS/tK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51F3AC0FD
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132837; cv=none; b=Z3B9bN/nJQbHPKuEKpTNWbLtVFbDbZgeOawwymiUzFMfpCuKkc8/Gu+LxIYxas3vTWjEudFcqKRMXjlr4V8HCzEWukqaIxKJHF3zjjTKhwF6y4gAfnuQlWFdrgR+IDUTmtHNiRqAuRqrbRGk1wy9UbOgDbb64vn8eBgPG/fhTGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132837; c=relaxed/simple;
	bh=Jw8h22nZSK45QqdDq5S1v12wKMwQS9xRWAWWJxnLi4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jPp/0JxLWycsIrOpz1iMLmOA2Zo6T0mlrKjnm+UJON7WzUUU1RPdpVnI49aFKpBo2EJJ2DxSPwvwqsS6w+WZSjJljyHPkBeBxBaOc2KWtU2Hq6pmAbtFymYMoGmmKmC6WYArv4IXomR/MgueNn7ieNK+/9bfB5MpSmXpXMYfyJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name; spf=pass smtp.mailfrom=scala.name; dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b=VVCVS/tK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scala.name
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43ba1f3fa7eso784899f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=scala.name; s=google; t=1775132834; x=1775737634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6z3Bhw6t/iQgoU/Crlde5eBCPcg01wREdjggoCzd0z4=;
        b=VVCVS/tKTW/LyWb7IL3dmcUUDFVzILAhkFB5+k9IDhYw4kGNyrQnEPzO9JQXYS4osO
         OI2CAOSogjLh/ULqLBwjWFP4elm/jx4Su/zLx6bNK1AoGED453seQl1d71+hRNG+N9Q9
         EbZF1/USEZhrURtwRxlYTeJyETsdCKghGGRaOYnsJvmfSqXNWCYVYL0iiB414IV5QTlP
         ucr9zNxatPJljdY/K3WqFDc4KdVZsL3nk/AOtYdh1C01Krr7CYyhAWU6W0zDSDQlhRUE
         g4mssjVTPEK5O/DpF5qGbPOje4ShvOr0ToAe0OZZ5i8uk6G8+hKYTS13BD0cG3T2MGCY
         4oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132834; x=1775737634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6z3Bhw6t/iQgoU/Crlde5eBCPcg01wREdjggoCzd0z4=;
        b=MRcwevlf0zUUrw8GA0w5jK19CliPWu/Yq+T5Avs1Qg5Qms3uE/T1G28ixUmSLdTLso
         muvCDv3eANUHqFfRngjpC8MlhjHZ8rK//ibvXdZDno6eT4j1B9RgL2z8YTMNzdTqrYvi
         WVqPcA4eVGrvTfj0a2P8Z2qc2ps3FeEiDESIOryGkkzHceXZA1WGf+8VD7Z4FCDJusct
         0jMvkfjbU3nQPehGKEqVS0+uzmgtG+BePwP6iNyuAER9LAeoPFgw7SNU2vKKZcUmUkM1
         ouW46/Bh9abVBsSlstF9EZCXXfJ+5KjQcDVhvg63XBBUguZOBDIDQACrgMJhjcuFTdIv
         avIQ==
X-Gm-Message-State: AOJu0YyW3hD3nIlrHir0/wNHhxVS1PVQ2J5z8obtY7uqbaJ3q3AE+iYC
	pW35JT3L06ciY03reLSH9P0kPOpaBPoOhGi9B+zjZOdQi+3qpVa+ReTC0z5uNGuzOPerhClFblY
	Ih+B3
X-Gm-Gg: AeBDieuh/bWGLcGWYtLO8bARKENYuGQo+11FnBTTvRjHSW9OwQelchFpvl+SppVUeBI
	tmfgkh+GKBhDcjZkWq0ty4RQFKE/W4JZk0lsnRqMzp3ECLLrwY0qkCxEuX2zIqi9F8935D99v5w
	pj4ApkXbCry9ghTC5SOp6UTbaU55+3Svkrqi0B0Y+Ez9yAGnByBCykwYwqJt8bv4ozW/SfotOZY
	mcdoNwhuwDiU0QG15a9jyW19vbxeo2AXJjUwF0do83fvbbAZQjLsa1RC2IIOIKaLprzDGHwRo/9
	feELQhDDnmYh1b5DS2BSya4SrXdvvZrL5p+MzmErnxT9g+5tm+eEizaNjziIpLRg3oIp42bcozS
	f4RF/mq5+jMvBmq72AQcN+NYhs+N5gfgStL5ZgDb4QJ+NyLMhkMpcfSMWNWd0B4DajAfE0P4z0z
	hU9E4QL3wBTL/48E7kQ1M9k+cB8kuJj8nyXDl1OmAoumFzEtTpDDPcRq+FbPE4L7+b4SiONCkiY
	w==
X-Received: by 2002:a05:6000:4201:b0:43d:50c:6f33 with SMTP id ffacd0b85a97d-43d150bd2b1mr14313182f8f.26.1775132833978;
        Thu, 02 Apr 2026 05:27:13 -0700 (PDT)
Received: from ?IPV6:2a02:169:ee00:0:98f1:7a2a:1483:7cf1? ([2a02:169:ee00:0:98f1:7a2a:1483:7cf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c50a7sm8227012f8f.15.2026.04.02.05.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 05:27:13 -0700 (PDT)
Message-ID: <4502b982-277f-4b96-85f6-55e6d5f4417a@scala.name>
Date: Thu, 2 Apr 2026 14:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20260402120433.22967-1-francois@scala.name>
 <2026040254-exposure-stubbly-7239@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Fran=C3=A7ois_Scala?= <francois@scala.name>
In-Reply-To: <2026040254-exposure-stubbly-7239@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[scala.name:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[scala.name:+];
	TAGGED_FROM(0.00)[bounces-35863-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[scala.name];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois@scala.name,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,scala.name:dkim,scala.name:mid]
X-Rspamd-Queue-Id: 41C48389136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 02/04/2026 14.18, Greg KH wrote:
> And what commit id does this fix?

The altmode struct was added in commit 
8a37d87d72f0c69f837229c04d2fcd7117ea57e7





