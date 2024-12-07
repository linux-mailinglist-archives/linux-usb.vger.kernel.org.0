Return-Path: <linux-usb+bounces-18220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4AD9E7D96
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 01:43:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CA891888540
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 00:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E31F4A35;
	Sat,  7 Dec 2024 00:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dPsriZyU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E607482
	for <linux-usb@vger.kernel.org>; Sat,  7 Dec 2024 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733532229; cv=none; b=po38WUJiyBxkjxuFWWUnQrJOcZUHi+bP51iPRSJmSSVBofdLOU06bsjgSTuV5iVSX9I+3njvCYZ0meYxV8WRfzZIajQ1DR22Pv7yDA0K4EPecjQe7USAic24JR9ItrFpq13qaqrp8N+CMt9YV+BW/4lUoPYY4kWLpz6BE9Qn0a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733532229; c=relaxed/simple;
	bh=I5aPFrrZTUBk/62S5inzq4+BzJ5o1AWv5cTs6wryKXU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c6uk240pS3uLM7+JqIBaVjyGlmZXM3FSs0zRcbKLBm40eGzke0dlSDzMNp4qBQndWPcydjaZrHYGtIuOkeLTtskKzbuKG2jT6sVOVCYHEtyhDCg02ssOQs9Efxin0wy5csPzAZPXmu5+2+W5UgANDVFmSAQdKfdtYs/hUNAl8t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dPsriZyU; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cf3e36a76so23424945ad.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 16:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733532227; x=1734137027; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8NIYiYj0/6/7s0kJXH6ifIMfCVcOVZk9pSt5UkH2yQA=;
        b=dPsriZyU3053Kbc3An/5+nYthjlhC9bb46xjuKvprSy0/a1kvhYX9dE3OcbVlVLkNm
         2MVYYLnIkssNDOoAg+jDLbHtuLaQ6WV1Edxy/iFOXI+tpSuCBeijXlhXMnuDyqlEUo6f
         vNNtx4+KghY2KYGupV/BXdRitmu+O2DcuBxkVh7v2xAfy3umkK2O4KbrRJ6NVvi1Z26C
         6YbgPC4/TzoXAd8Gx7InLLXZZTDkKTmzAf0/rQSkyjxsuYKS79I7fRigpmPelOdX4W2F
         F2wj8vtgWQ8wjsfmUkP8JZG43LVKH7+tmRjkxALzqD1XNAVr2BXWZ6Wvsa//pNb8CLpr
         dqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733532227; x=1734137027;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8NIYiYj0/6/7s0kJXH6ifIMfCVcOVZk9pSt5UkH2yQA=;
        b=GWs+BTUetrGvq+LciIP7BcioycgyIeHeeRbfH2TTVBN7WgnCqG77bMc9QKjV3rX/pB
         lLpTofVSGS9oEiQ7pylbxtzduLhHQvpXbU7+TxwcpHMrVmVUjR4peLW2hAmQYezLkY/2
         059QUHQkQO7mpbvyiiMxokYWPDgfeA+u8TJAGlw8exGFJxtBEOHfq0NvwdJKPGwZLt7Y
         gze/kQeSy0NxWvRLF6WqJdwmJYClcY6DZoXbWH/qiNjGxYqbvA+u2YfTxnsZ66LkUlVd
         ds79+Up4Gl43pJuV/kQeXoecv78GdBQ7S7xQwN+OhI8gkYWxO629pX/lyiPCflK65fyH
         1y9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhEz6W/6+duOxRDtLAFR7CBF8HbiFQBgKhzZYt2rEwUjMu7lXyXtEQ3iSn1dqyk7cZ339NZAQQteY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBA5Qg7YrW3SMb4IZDjsDWWE2l4wJW+G8yW5T+meDHiXPmdSXq
	MeC4BLii0m4cP5ffvthtsj7YhCTlN+hcWH/8T9etwyRZO5YKn/Jk8TDtUoJ9XA==
X-Gm-Gg: ASbGncu4bdaBgrhTahB39mKMkvlVpNzWiFJlm4Aq1yl5AwXgxohR175z3uVy8t3GARn
	D9RZs9K+kGuKK3h0JHhY0IUCGmSEuyBCqtn9lCrGY/dHOtv1sQIHQJ7S7ilh0x804X2oq++dBz9
	6pRjtmuZ2/ttjzN1VvFSV7pCVfnalv7gjlN6LboXp+8pHlKs3vi4SkCgvMvj3YgQMKO4RtzqFEE
	jTdlwR/Lt1fOUJoRD3+SVXgYoZEI+U0FMnvyNHbzdUyQBgvUNWeFMo7ZPI3rlJl91cdHdRM05Nm
	YirxmuC+On8sppQeutqY/nCZgvBx9slAwse/LRSTcLEeX7tB
X-Google-Smtp-Source: AGHT+IEOKHnRBxgiTbuZLsDRAnvMI2qF3hSlWxPihqAZqfK7X7tsgLE1K38TVOOeBz0TthqVRuvZGg==
X-Received: by 2002:a17:902:e550:b0:215:7ce8:1363 with SMTP id d9443c01a7336-21614d54c4emr73123065ad.19.1733532227003;
        Fri, 06 Dec 2024 16:43:47 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e14:7:fe59:ca2e:5783:910c? ([2a00:79e0:2e14:7:fe59:ca2e:5783:910c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f29c2dsm34332065ad.249.2024.12.06.16.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 16:43:46 -0800 (PST)
Message-ID: <e8b2501a-0808-4e14-960b-7355fa52e8ea@google.com>
Date: Fri, 6 Dec 2024 16:43:44 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Amit Sunil Dhamne <amitsd@google.com>
Subject: Re: [PATCH 1/3] dt-bindings: connector: Add pd-revision property
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20241205-get_rev_upstream-v1-0-90158ee7d75f@google.com>
 <20241205-get_rev_upstream-v1-1-90158ee7d75f@google.com>
 <20241206-perch-elliptic-4e8a8170426e@spud>
Content-Language: en-US
In-Reply-To: <20241206-perch-elliptic-4e8a8170426e@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Conor,

On 12/6/24 8:52 AM, Conor Dooley wrote:
> On Thu, Dec 05, 2024 at 11:46:08PM -0800, Amit Sunil Dhamne via B4 Relay wrote:
>> From: Amit Sunil Dhamne<amitsd@google.com>
>>
>> Add pd-revision property definition, to specify the maximum Power
>> Delivery Revision and Version supported by the connector.
>>
>> Signed-off-by: Amit Sunil Dhamne<amitsd@google.com>
>> ---
>>   Documentation/devicetree/bindings/connector/usb-connector.yaml | 6 ++++++
>>   Documentation/devicetree/bindings/usb/maxim,max33359.yaml      | 1 +
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 67700440e23b5b7ca0db2c395c8a455bcf650864..341d2872e8d43450d219b7b72d48790051dc4e2b 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -293,6 +293,12 @@ properties:
>>         PD negotiation till BC1.2 detection completes.
>>       default: 0
>>   
>> +  pd-revision:
>> +    description: Specifies the maximum USB PD revision and version supported by
>> +      the connector. This property is specified in the following order;
>> +      <revision_major, revision_minor, version_major, version_minor>.
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +
>>   dependencies:
>>     sink-vdos-v1: [ sink-vdos ]
>>     sink-vdos: [ sink-vdos-v1 ]
>> diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> index 20b62228371bdedf2fe92767ffe443bec87babc5..350d39fbf2dcd4d99db07cb8f099467e6fc653ee 100644
>> --- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> +++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
>> @@ -70,6 +70,7 @@ examples:
>>                                          PDO_FIXED_DUAL_ROLE)
>>                                          PDO_FIXED(9000, 2000, 0)>;
>>                   sink-bc12-completion-time-ms = <500>;
>> +                pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
> Why do you need this?

This DT property helps Type-C Port Manager (TCPM, consumer of the 
connector class properties) fetch the exact Power Delivery (PD) revision 
& version information of the Type-C port controller (TCPC)'s connector. 
In turn, we require it to be able to support "Revision_Information" 
Atomic Message Sequence (AMS) in TCPM to be USB PD spec compliant for 
all revision & versions after PD3.1 v1.x.

> Doesn't the compatible already give you this
> information?

Compatible property does not give information regarding the PD revision 
& version but only gives info on the type of connector (usb a, b or c). 
Also, connector class is used by several TCPCs like maxim,max33359, 
ptn5110, etc. and each of them may be compliant to  different 
combinations of revision & version. This feature would help users set 
these values based on the revision/versions their TCPC supports.

Currently  TCPM driver hardcodes the Revision value to 3.0 and doesn't 
provide any info on version (undesirable).

It should be noted that:

1. There are multiple versions & revisions of the USB PD spec and they 
keep evolving frequently. A certain connector hardware may only be spec 
compliant for up to a certain version + version. Thus, this is the only 
way for TCPM to know what ver + rev the connector hardware supports. 
This will enable the TCPC system to present the exact rev & ver values 
when requested for revision info by the port partner.

2. I also considered incrementing the revision & version information 
values in the TCPM code. However, that won't be backward compatible for 
connectors whose hardware doesn't support features in the latest spec. 
In this case we would be presenting incorrect revision & version values 
(higher than what is actually supported by the hardware).

Regards,

Amit

>>               };
>>           };
>>       };
>>
>> -- 
>> 2.47.0.338.g60cca15819-goog
>>
>>

