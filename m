Return-Path: <linux-usb+bounces-32997-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNT5CnCEgGnE8wIAu9opvQ
	(envelope-from <linux-usb+bounces-32997-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 12:03:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA8CB6B3
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 12:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3AFE3002908
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 11:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8E4229BDA5;
	Mon,  2 Feb 2026 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrGkKRxx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1359E35DD02
	for <linux-usb@vger.kernel.org>; Mon,  2 Feb 2026 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770030183; cv=none; b=efq80F5rRqBptojN1bPBTznISfRKgxnPXaBEno/YcPWME1/mrQcjVngCUfOxcnUwlgdCfMiXq9fNswbV+TzMAb9hbaabFZ9wu/sWXsvoc889+KAgv/okM5xyqQlc2BhD+OLy8CMHGLc7yF6vYkGWaCVzryYJq3vlnHBIhFpbh1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770030183; c=relaxed/simple;
	bh=tmCdY+062riUvvzl7Xs4sCeTnT045XiXZmjso2IZW5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btf9jOYjEjysQsnN8VX/9XV47dH2V313BHafNbn9kD5qNr+jtd0wXCYf1CxFL6Tbnl3eILAxh0JoCw3TamScfIZw+RJE8YYn0T8uDu36aLhDE6Dv2S0uUfbzCqirYxf3jiEOMHg/6UgKFB/8vc2ZsLNMbnhsmf3ddT4okzJcvdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrGkKRxx; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f4c0e2b42so2420637b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Feb 2026 03:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770030181; x=1770634981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXhH8zrVylWsesycxP40bSnYIiTHShVUT+eNMfYxJ/I=;
        b=mrGkKRxxLB2C2cazcR+WFkJhzNGLg7bSLNhhXwH+cPIfZ2egx97vaKEycNnW2JhVXg
         OJQvnbZt7JWYP/OE4N6U04+p8mMRHiDNFR6or9PeDa5Cb6TDhKoKyptT8JSnlsYSZws8
         OUZr6gj2qiUP2VZ7hDO9vYOSswotE0XZPzSt68dncWxxg8gug0ZIapvrlCVUjfTeKFyl
         C5WbNq08kogqpr47k1B+e53Ij10XA7g2dHrL8WgCnwDAVIHgrfFTasCa7sDoUi1RfG9R
         CPMIu8QJofA6L++EMBg31aE6CJ+VcDRU2eanTZsVFFeVZNQNM2wPIftIZfpgykJUnLoH
         cYCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770030181; x=1770634981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXhH8zrVylWsesycxP40bSnYIiTHShVUT+eNMfYxJ/I=;
        b=eEXFaRRLWiJdof6KbwQP1s5vS4WWhsHXPvDogHH9pbh9ClZ6HOjtKzYg7Hsom8qcIF
         XR9MVGRuwxH8DM9gyGLicYSgwSkFV/lw7kJAziDR2VzaEdu7R5PGPVBbX6ajEYQRIwhF
         1+sNowPffgwoCtEF6GryXu4mfidxkm7Q/2fd4yTI6O3ZATIwLQ2lDTstzlMTWnKhpf4V
         C379uRLjEXlYWpwBeApp/4hf/FodbLezehp6XcHKntA6CguuMczR1hDf6yxVJiFAOnBw
         YcRxhFifvjOK058afCmhTk3HXygu9KHQ/GlN12tHEJ5l1UpyPUzeYTLmO1LsqjmQqK4q
         k50g==
X-Forwarded-Encrypted: i=1; AJvYcCWnByPVkIzlUa8yoLMnud3ilD7myaQm6nd7zP539yRcwxc0Zew1mjBEedcgRQplcvUBiB/RkhNkDzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtijlJWRyEZ6OPMLXZMIw0IknVcDAPbPiALVMixjAWOpqGiyT
	YiHdzcdHGBYG3ljF3T+1Qeu951a+N2yBCkkj4hPZJOCEWMPgoBbkHzfq
X-Gm-Gg: AZuq6aJeb3RGNuCUqdeYuPR3RN9ve2qbAlCtlMFrhik4uW9IROJfyAxHtpoNEGe9d9e
	y7nnUx3ONIWBZM8VrtYmWg19imMDAH7/2enpotO8o6Z89QI5S/QKZZG1+8yzyr+sei4C3GpYDGZ
	OOGA2VrA8DY2CnrUw5NyJtbuKmZ/PXXXwAdRs4IVsLrvgovzFSwIOXr+j1G0EgqzTSTHzD8s9dE
	TILG/RbvV1dpxlQmSW9phO70WKkBfZnZbMxeeYpyrUyzEL5q8SFHA+J/dUK+otPygRo7oKNFSTC
	Yo5W9NnWfTz+lSrReFDC7lWoIW11qhuBBkdRrEPRUP8CdxT7AFJjgD4CTbAlcW/e3iVe4TJ5stM
	BcxB7TodZsfRs6ZUlwLJQxFbX04K5sCXdkA1e+uq348IRlNJ6o1RyT2Qy68WXKX2Eh1zzOKaXUr
	1SH2038F5HxEMZP8FXzPSj1oacL1yy7++KLYw=
X-Received: by 2002:a05:6a20:2d13:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-392e001cbc7mr10045124637.18.1770030181079;
        Mon, 02 Feb 2026 03:03:01 -0800 (PST)
Received: from [192.168.1.7] ([115.99.252.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4154fcsm141359955ad.36.2026.02.02.03.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 03:03:00 -0800 (PST)
Message-ID: <c7468b03-9acf-41e9-a441-96ed5d891e96@gmail.com>
Date: Mon, 2 Feb 2026 16:32:54 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: usb: atmel,at91sam9g45-ehci: convert to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-arm-kernel@lists.infradead.org, Herve Codina
 <herve.codina@bootlin.com>, linux-usb@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>
References: <20260201-atmel-usb-v1-0-d1a3e93003f1@gmail.com>
 <20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com>
 <176994942956.410099.10343293169382130437.robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <176994942956.410099.10343293169382130437.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32997-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 61FA8CB6B3
X-Rspamd-Action: no action



On 01-02-2026 18:07, Rob Herring (Arm) wrote:
> 
> On Sun, 01 Feb 2026 11:34:21 +0000, Charan Pedumuru wrote:
>> Convert Atmel AT91SAM9G45 EHCI USB Host Controller
>> binding to DT schema.
>> Changes during conversion:
>> - Include "usb-ehci" as a fallback compatible to allow atmel EHCI
>>   driver matching.
>>
>> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
>> ---
>>  .../bindings/usb/atmel,at91sam9g45-ehci.yaml       | 71 ++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Warning: Duplicate compatible "usb-ehci" found in schemas matching "$id":
> 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> Warning: Duplicate compatible "atmel,at91sam9g45-ehci" found in schemas matching "$id":
> 	http://devicetree.org/schemas/usb/atmel,at91sam9g45-ehci.yaml
> 	http://devicetree.org/schemas/usb/generic-ehci.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/atmel,at91sam9g45-ehci.example.dtb: usb@500000 (atmel,at91sam9g45-ehci): Unevaluated properties are not allowed ('clock-names' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/usb/generic-ehci.yaml

Hi Rob,
Isn't it pointing to the other schema ID which was not defined by me? Can I have your suggestion on changing the compatible name to other name to resolve this error? I ran dt_check in my machine on the latest version and I don't see any error there.

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260201-atmel-usb-v1-2-d1a3e93003f1@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

-- 
Best Regards,
Charan.


