Return-Path: <linux-usb+bounces-35906-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DscKI2yzml+pQYAu9opvQ
	(envelope-from <linux-usb+bounces-35906-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:16:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E738CFA0
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 20:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39478301FF9B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D703750A2;
	Thu,  2 Apr 2026 18:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b="jtJUrySA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A663B372EEF
	for <linux-usb@vger.kernel.org>; Thu,  2 Apr 2026 18:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775153415; cv=none; b=QimIwiWyqCCxhypNCLN9ct5L3X4x5AMxoDBujX9kE1KFczqAMFPhoyvBuNguyL9c70ofEZ9XnSwzOlefk9ckTEpRYwJG1iI7mJn+5wZJRVwQa8Wqu/RGJmwO1pLNUdULUWw/hpQRGopSJ0CIdd9mItHW6NmJf6mSTWKnCiX26vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775153415; c=relaxed/simple;
	bh=li3acwxqbb9VQNST74J+DjsJ3B+4NziXxB2PqoD3c38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S5cllPMSxRrMsL9ZKj0BVq71hy2LY6176xJUcloZn4vlS2LUv4wgGPUZ828L4HZH8DeHkgC7P7koUD/uwmatiYlFIiqysGpr8O8iYWwgf+N7n+6SrgKTPgiNGiEtosQQ4C+4Rr7i5HZVF2EQegxdFGQOlIQ/7Il/ApvuwUbXz3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name; spf=pass smtp.mailfrom=scala.name; dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b=jtJUrySA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scala.name
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-487012ce896so6485765e9.0
        for <linux-usb@vger.kernel.org>; Thu, 02 Apr 2026 11:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=scala.name; s=google; t=1775153411; x=1775758211; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zfTbalLF2DOQ7KkU3Yvkrm4nEjw6kVKlkvgHGq/Gq0c=;
        b=jtJUrySAIfYITCuhiextf1AmGjJ3FrKeX13r8ZbvbT5H1mX8xM8Y6C3i9aKUCtg5zs
         0moXYvmhHIyhxZUZ6Vm2I0FJ0eyM7wZiStf0mEYv2cwj+nwUwso5r6eQug+bAXLdJXn0
         14/Srwa911xL+vxgkqsP4epF0L078DjQ7F5Wshs6lhrEskHIGVjv1qJQHVEWN0jSc5tP
         GaxmDH87ouQnIUWDdxSetLpZI0H5e8xCZ8A7vufK8xWMhN4nM/sCOMqfV6wWXZGpaJHm
         wo/p22t6SIgqqCxxNhC5tg2xpD49v5wWY+qt4ZtHhvQtOKV5H3yyVJnCfvGB5Q9UxFoE
         nP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775153411; x=1775758211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfTbalLF2DOQ7KkU3Yvkrm4nEjw6kVKlkvgHGq/Gq0c=;
        b=PW3zw5t8mYVibTMeQdgLS/ZMrk7APSrSPZ/gF5Bj3QabbUiLnOVep/A6dROxwNQvWX
         sA5eL9LOpxEw5xId24xI5ShJAqbhXsw/OrJfIb2BhzrI+8mqzxhqSNi1XrXj11vKnGkw
         YOJAxMJMyhBcUO8IspBNVAYhbmZbnJgpUzMnVGBZhU6+7l2r+dxi7jGimcqoL3qHASbr
         uSbZVJTN8ft2nzPohExFBUtRdUR4AqV7w4W/s+Rowm1IpRFYbjuj3f7FIEy6bPTlp7Mu
         bw1T3DINRUhBYd72nCaYVIvgv8PO77FDegcru+JW7GOXqqogr+VCMyxA+X+cJL5hiLgR
         mvXg==
X-Gm-Message-State: AOJu0Yzig5SiUEBMGok50kyU2ArtHVSdWYKtI9Cd7QwRt0eS/aivsBCv
	ZKCj5PED3KvBu+MYJb5oLlB5YKHvo/FeaK1W2fOpCxfEP42UQp5h9gywoRSfPu/Ivtc=
X-Gm-Gg: ATEYQzyKraa0HsbDiIjVdoRrGBj82IvuSWXcwumAlunApGHd0dMPv83BFFEG46J+YTn
	zG9ZaP9t78PcFbTfUdOXV6YIFzFJ6sDnOaPMNks8dUJBHpZotZ8p476S3cgmwavE7I939Cie/y7
	Rls+Njrrr2vuXenhtbuuEqpR/5YKcmpjwoyffCtLWsXDSFiBuHh/ZDEUwUoFmgTixgNUZmVNhwh
	G8b9Rvfv+dUTNz9B3d+TDhrqwJ7xBxsqUTGhSbXDj4/+DnKpqZlMSVtTikQNebMbQVpzodpg4IE
	kBZrUqXC/CKW09JrJlTg87rTYSdp/LZ1pNk22Zat5d3Zqs7U4SRXJ7xvcTH+DaEUpYpU9+zopHc
	cTSAj6eLNSqcnoIp8LNlRhuaNZsDS03neknEW3yEo1VK1eAFuPMLaO0cTgsRHn0tO9d1mF7Go00
	rf+Pm1YgZ1V4GojZQS1izrklRiXME3AAI9Zf85ZSiBSw8SYc8uZ5iZYk7YNfsp0uY=
X-Received: by 2002:a05:600c:858e:b0:487:467:4276 with SMTP id 5b1f17b1804b1-488835cd391mr114425615e9.30.1775153410610;
        Thu, 02 Apr 2026 11:10:10 -0700 (PDT)
Received: from ?IPV6:2a02:169:ee00:0:98f1:7a2a:1483:7cf1? ([2a02:169:ee00:0:98f1:7a2a:1483:7cf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm237512085e9.4.2026.04.02.11.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 11:10:10 -0700 (PDT)
Message-ID: <8cef8b26-71ce-4fdf-a514-111d9760634c@scala.name>
Date: Thu, 2 Apr 2026 20:10:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <20260402120433.22967-1-francois@scala.name>
 <ac5uh_3N3q61efIb@kuha>
Content-Language: en-US
From: =?UTF-8?Q?Fran=C3=A7ois_Scala?= <francois@scala.name>
In-Reply-To: <ac5uh_3N3q61efIb@kuha>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[scala.name:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35906-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DMARC_NA(0.00)[scala.name];
	DKIM_TRACE(0.00)[scala.name:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois@scala.name,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,scala.name:dkim,scala.name:mid]
X-Rspamd-Queue-Id: EC8E738CFA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 02/04/2026 15.26, Heikki Krogerus wrote:
> No. You can not have more than a single partner per mode. Let's figure
> out the root issue. Please check the svids of the partner altmodes:
>
>          grep . /sys/class/typec/port0-partner/port0-partner.*/svid

/sys/class/typec/port2-partner/port2-partner.0/svid:8087
/sys/class/typec/port2-partner/port2-partner.1/svid:8087

> Then provide the trace output from the ucsi driver, dmesg output
> (full), and also acpidump of your system. The ucsi trace you can
> get like this (assuming you have the debugfs mounted at
> /sys/kernel/debug):
>
>          cd /sys/kernel/debug/tracing

That /sys/kernel/tracing (without /debug).

The traces with port3 (tb4) and port0 (tb5):

# entries-in-buffer/entries-written: 19/19   #P:16
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
      kworker/5:2-321     [005] .....   465.001617: 
ucsi_connector_change: port3 status: change=4000, opmode=4, connected=1, 
sourcing=1, partner_flags=1, partner_type=2, request_data_obj=00000000, 
BC status=1
      kworker/5:2-321     [005] .....   465.111779: 
ucsi_connector_change: port3 status: change=0060, opmode=3, connected=1, 
sourcing=1, partner_flags=1, partner_type=2, request_data_obj=13800000, 
BC status=1
      kworker/8:1-174     [008] .....   465.429999: 
ucsi_connector_change: port3 status: change=1000, opmode=5, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=13800000, 
BC status=1
      kworker/8:1-174     [008] .....   465.532708: 
ucsi_connector_change: port3 status: change=0060, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=42c4b12c, 
BC status=1
     kworker/10:1-178     [010] .....   465.883679: 
ucsi_connector_change: port3 status: change=0060, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=42c7a9ea, 
BC status=1
      kworker/3:0-13120   [003] .....   466.330330: 
ucsi_connector_change: port3 status: change=0060, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=82c7d1f4, 
BC status=1
    kworker/u64:2-356     [005] .....   466.890372: 
ucsi_register_altmode: partner alt mode: svid 8087, mode 1 vdo 8087a843
    kworker/u64:2-356     [005] .....   467.005141: 
ucsi_register_altmode: partner alt mode: svid 8087, mode 2 vdo 1
      kworker/2:1-177     [002] .....   471.027602: 
ucsi_connector_change: port3 status: change=0200, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=82c7d1f4, 
BC status=1
      kworker/2:1-177     [002] .....  1140.998711: 
ucsi_connector_change: port3 status: change=4000, opmode=1, connected=0, 
sourcing=0, partner_flags=0, partner_type=0, request_data_obj=82c7d1f4, 
BC status=0
      kworker/0:2-15093   [000] .....  1164.065528: 
ucsi_connector_change: port0 status: change=4000, opmode=4, connected=1, 
sourcing=1, partner_flags=1, partner_type=2, request_data_obj=00000000, 
BC status=1
      kworker/0:2-15093   [000] .....  1164.173696: 
ucsi_connector_change: port0 status: change=0060, opmode=3, connected=1, 
sourcing=1, partner_flags=1, partner_type=2, request_data_obj=13800000, 
BC status=1
      kworker/7:0-13116   [007] .....  1164.508267: 
ucsi_connector_change: port0 status: change=1000, opmode=5, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=13800000, 
BC status=1
      kworker/7:0-13116   [007] .....  1164.609765: 
ucsi_connector_change: port0 status: change=0060, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=42c4b12c, 
BC status=1
      kworker/6:3-360     [006] .....  1165.119848: 
ucsi_connector_change: port0 status: change=0060, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=82c7d1f4, 
BC status=1
      kworker/6:3-360     [006] .....  1165.208511: 
ucsi_connector_change: port0 status: change=0060, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=82c7d1f4, 
BC status=1
    kworker/u64:3-1005    [010] .....  1166.339613: 
ucsi_register_altmode: partner alt mode: svid 8087, mode 1 vdo 8087a843
    kworker/u64:3-1005    [011] .....  1166.454835: 
ucsi_register_altmode: partner alt mode: svid 8087, mode 2 vdo 1
      kworker/1:3-191     [001] .....  1170.026494: 
ucsi_connector_change: port0 status: change=0200, opmode=3, connected=1, 
sourcing=0, partner_flags=1, partner_type=2, request_data_obj=82c7d1f4, 
BC status=1

> For acpidump you need the acpica-tools installed:
>
>          acpidump -o my_acpi.dump

The file is quite large, how can I share it ? Or do you need a specific 
part ?

   -rw-r--r-- 1 fs fs 4.7M Apr  2 19:05 acpi-port3-20260402.dump


Thanks

François







