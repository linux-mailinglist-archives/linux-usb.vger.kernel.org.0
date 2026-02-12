Return-Path: <linux-usb+bounces-33306-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN37LZRXjWkf1QAAu9opvQ
	(envelope-from <linux-usb+bounces-33306-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 05:31:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCE712A508
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 05:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75562313FBFB
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 04:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9E3224AE8;
	Thu, 12 Feb 2026 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="01P6gwoj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB670818
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770870664; cv=none; b=TgSe3Kds2PBb93EG647AqmoXvknce1gRp+/Ch5IJzWvgT3BSAulDJPCrWTtkLzPEBGO1vVs2EHVmjrLd+8sfgQc75nOttUbiBdvu0oDSYmT2O+j1Djgcp0SJPJ02ZnDC6qgDfwhr4Uv+V77zRYQ/6Ugg0GcIGdsinT+F70ZHkRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770870664; c=relaxed/simple;
	bh=A5HJcCKxAsHpNeprXQQ2Ms4Osb6cPf2AX08DAxbWxU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiYbrMdBrW+sw/OmFFDFEuiWqKA0Sm+uzQYGPciF0P5W7Mm6/zqe06iv1M/KCgKWd/YKrf6SBFdrOsfmM5jVju3ur/X2LhwzDabqFv6A9Zq+GgfNpNWrramoxYvvm2oe8k4SrT0cYdHw1YDB97cWbgnf/hYtXYX+y4r3jNX7C3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=01P6gwoj; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d18d0e6d71so3993006a34.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 20:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770870661; x=1771475461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4Ihvw6EZ0tT6LZ8X2ohWxs32TnyPwD3MnzBsPDVJ/4=;
        b=01P6gwoj8blw88pIPqLENTUr3HWPT0Lg+9CB2nZDEQ8eRra06eIpF8/On7qFxGGvY2
         S2V8pieYbTE+BVKX6njClmn/gEvSUmNVnLqMIrFM+1aKH+0IFzszIh0bjLikcYvSNPDq
         SLJR/1OG9tk1Qv1jumA8G9lWBvxxIajct0Q7zVf3o97JUi2cFpfBkFaRZy1pxd5EF7UL
         r21mm63M59pZO3CUvDe9OkL6CA9zvXtb69qymWIlM+bc9UMdL2svs/HyD4aXc5Rn4EU9
         2Kc3/B1oA/terNhNJXYcnE0GBK+H5rRo5jMalDqsApiBNazTXdXDuDhJxa9yacjGPfKf
         M61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770870661; x=1771475461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4Ihvw6EZ0tT6LZ8X2ohWxs32TnyPwD3MnzBsPDVJ/4=;
        b=TxuYXdyxj/kqEIxCz5E66ckEzSutivaiGcid1Y77TZMfJNhqRQ/prXSnZ4gfT+NYF1
         ah0MIpQg0Pu724CLXh4mkbsGTKtnNuJIPymj99B+6F34PzZK2LSoya46u6sBSOa9g4ke
         nuQkCjAH1tm5fDDJGwX9/ksmiVUTJvYXQszjnHF9/+GjMemSRUYHYwSNkTw1f2PiknXs
         vcsK9MNOcpsSKgC7oyohHOKivnVzMCBj/odm+S8rR6wYRD9aHPL4ddl9jBwjSdGk65WU
         UC8s2E368pRturloSsOU8/9AEXntEDAn7pLuek+/xqD56yrsEfvlLnQ/gWTMQ6R9SB+0
         hKnw==
X-Forwarded-Encrypted: i=1; AJvYcCWexlGS46Bu8QZUNaIys1NQCs25qkrLuzAaiVX2OesJDGBQhZlpXTDbTVSXX0u8iaq9SmSecBg8350=@vger.kernel.org
X-Gm-Message-State: AOJu0YziZL6QXfgnG67ooGKGnY6Y6o74dTr/mBY1x79zJIjOIV0cNhU+
	/QX0t1ZojvJW0DkZzuvm2TWSAQDpWnxt5TeM9P0lJqAjX83U7n9bNpBY42QNO8ejVw==
X-Gm-Gg: AZuq6aJsa99z+5WP6cmi4yiHug5EAaP3fjWFgYUQQfvhJuHTl/isq9TfgLf0AT3+ANy
	CpQe3IHg0AVvJETbfd1GJR6gRMFzKeQ971r03obQISZMUwUbu901iMIX6IXH2TXPOavxiUQOZDR
	XzeLOhAAU7bpMBEs2KEMKbSMV0hrB/2eZMjEBoGB4YyhAm+1x4S0rwfyMQf2GNuxZaymQBbsSXj
	YxPwP7KJ0bQdeaxrFsZv1TH/XkaC4E/KHUwJBwx75WvNSBqsqBTeLG4WITLxHIAEw39oNcCFY+E
	qmqTEiysnmwILVd/eSHg3QBn+WEtgA/WkieFJU/GrXwuJTDIK5vjlIoAIr3impBgsuJAu2SjNoY
	+yYgiBP3z0g4yWUrPsFuXQDafoMXntFnNvCkKW/6R5z70RbjULdk7CalNMzkpsysKo0G4v5HjaX
	PfpcOQECm5qxg03xzpeIjgpQhoozTcfnnxS1DUwikXzw3G6gWEb1Ry34nygV0SaJr7xZ6cnCo=
X-Received: by 2002:a05:6830:631c:b0:7cf:e57f:def6 with SMTP id 46e09a7af769-7d4b298b8a8mr955597a34.6.1770870661018;
        Wed, 11 Feb 2026 20:31:01 -0800 (PST)
Received: from ?IPV6:2600:1700:4570:89a0:76c9:5d3e:a5ad:fa9e? ([2600:1700:4570:89a0:76c9:5d3e:a5ad:fa9e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a7530d08sm2833057a34.2.2026.02.11.20.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 20:31:00 -0800 (PST)
Message-ID: <d6a67899-b82b-4738-9ad5-27cbd735ff2f@google.com>
Date: Wed, 11 Feb 2026 20:30:56 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended
 msg response
To: kernel test robot <lkp@intel.com>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>
References: <20260211-skedb-v1-2-616340426cdc@google.com>
 <202602120453.BOyqL3t6-lkp@intel.com>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <202602120453.BOyqL3t6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33306-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amitsd@google.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,amitsd.google.com,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,01.org:url,intel.com:email]
X-Rspamd-Queue-Id: 1BCE712A508
X-Rspamd-Action: no action


On 2/11/26 7:56 PM, kernel test robot wrote:
> Hi Amit,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 8dfce8991b95d8625d0a1d2896e42f93b9d7f68d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-connector-Add-sink-properties-to-comply-with-PD-3-1-spec/20260212-072745
> base:   8dfce8991b95d8625d0a1d2896e42f93b9d7f68d
> patch link:    https://lore.kernel.org/r/20260211-skedb-v1-2-616340426cdc%40google.com
> patch subject: [PATCH 2/2] usb: typec: tcpm: add support for Sink Cap Extended msg response
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260212/202602120453.BOyqL3t6-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120453.BOyqL3t6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602120453.BOyqL3t6-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Warning: drivers/usb/typec/tcpm/tcpm.c:351 cannot understand function prototype: 'struct pd_identifier'
>>> Warning: drivers/usb/typec/tcpm/tcpm.c:368 cannot understand function prototype: 'struct sink_caps_ext_data'

This is because of the incorrect formatting of the documentation
comments for these structs. I will fix it in the next revision.


Regards,

Amit


