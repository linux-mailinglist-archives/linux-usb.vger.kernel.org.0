Return-Path: <linux-usb+bounces-34172-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePgUETPYq2kUhQEAu9opvQ
	(envelope-from <linux-usb+bounces-34172-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:48:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E298622AA44
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 08:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8D5230382BE
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 07:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD3D282F27;
	Sat,  7 Mar 2026 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe3lequ6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524EB28FFF6
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772869614; cv=none; b=Fyu3C6JHBfqyYGi6kn5BVbH8yywKI4QjlKNSy33c9LJwHEBsOjcGosgiPu4D/cnV0yEkTSupFEKQ/rlLqAA9lSAAdODsUGf8+Y/jhINq1C1bE/UQpwzPUtlzVoJ3yxNOwsQitdlxFDaiMjjjleTTY+3cztoeOUkumAQ8VlhfclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772869614; c=relaxed/simple;
	bh=2oTgVph5w+Ah3wlW7kSH6XV3kIdw0AkZH+4Q/GQuaEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPQSdeLlWPafdqlSF/sGAW2v1TznlX3mbumX7Wposwo756+2gVtliCF2L/rPKC4cRNgTpGCpy7ZaAbzMD1nLwi9r849mfiW1Fp3cEhY7m3EsaubL1kEGZHS4IwWuJMZlvO5XylOqzKYJiT4LgFJ5ElZ0DfnzmaRGsBGkT0AI6cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe3lequ6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ae3a2f6007so53231695ad.2
        for <linux-usb@vger.kernel.org>; Fri, 06 Mar 2026 23:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772869613; x=1773474413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uO/7x1mKXgItzdyCiS372PCikfzpIVhgGhN++3lTYuc=;
        b=Fe3lequ6H2o+7ZzzMOcBOxIPPqAfPyaP6RCfayFEJrFMMizP78tyy59ChZA2WbEtsn
         lm+DqkuDKUi9FTDvvZVrskGBCSItXr0IQ1TbNbQWm6Qdqxm62m0HddyjPB1p3TeqjFLL
         BwXLRjeXL4qyVvnXmZ5DpBqMJKS5QH/aAXxpfcgva0Y/KYAEFEM2MkCQPZSoyjq5czNo
         M8+QWuwixbe/lQLXDbc6+QaufihGYWG7+HTZqR3F8y9xY6dfAN5Wp9DWV3d4KUFi3Pt6
         YFTM2EopEToM4iTulfLN/lRRCUO044XwXWGhbcy53Vez6z658owNJmr1dNnMHtCR+qQE
         jxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772869613; x=1773474413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO/7x1mKXgItzdyCiS372PCikfzpIVhgGhN++3lTYuc=;
        b=Ax6PgCDmXrQczks3PVWhjGAtJSucWUqQQgQbk8wMMnW1ZgUES4dt9HbNfuKTYh/tzK
         2Bmimpl5nK2htCiiZTozAJNkei8NNw4MNqzmmxeVeLpTyrWsz6qAUQCmmihVrzwNSEBx
         u/HlBfQnc84cclOIcu5t6Gyf7FFO2+/hRKs8dAKBBilacFHuteCD1eaFzPixl40/uM9m
         px5dfzGwhJlAj9zMnix0MIcG9P84HPf0nO0L3prUFl38R1M8wagN19Gu1ysyArr7Vl+P
         zoSkVPp73p419y2brhrnwLqOek9mh7Ps2u5C9HdN4YXZqYu3nwZPHvZjrh4m/JD3G2Fi
         pbSA==
X-Forwarded-Encrypted: i=1; AJvYcCUrz4KpiLeBgw8Ttc6ZTUCqT/DYe5p3TE3Scmkb1iPsdwJ5L5hXy8EpoZA7Gp3WXwTgb3URelnrsNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKoKwCURNrqV20HDmeR1lPhO5DD5FmqzCWUiwwQnnNtN0xlKv8
	WVjh6kxOh5+L1hfD/XirQQ+Qo4F46asriHnft0ot1hzqjSlxYxlkp0Gm
X-Gm-Gg: ATEYQzz8IyqKa4c2xFN1MmpOiPWYZrzGfPistb7bJHh/aKnKM1F1/tOFb/V36U8Ebkf
	0StiLmlyFv+cXU4lMqXEm0b+Rd7k7cnevYYfqtb8svp/WBBPGQPX8VaDFIRyGo/iu5T+vlVDm9z
	Pdp3e4D5d5u2QSsE67HPu8GF9zvvQV2Q5P9bDYU6tC9D+kVTAoKnbcSTbXdMUcnI3xpaRZ9B2ML
	/C8Wh26CMvjOFPOmD+XXtJbdltVZS0HWuu3WGzHTz8iEprYC3v6bKWn71tcbZVlgKVwDd3vf8u2
	uCOi6oisHQY2nxnfiNJ2RD76wDCp+z5tallqvlQBUAlO9+KWh6X/VSd8oGqwxwfU2LxtPvJDrix
	3F95fj8rZ35Uq7yZ2pV0gw0irqcRal4eI+89RuGYiy3NlfHNis+X7k+nzc2rBfEMa2n3CzpWS3Q
	O/oxnCk/sQYWi6zLTUnlG9BEO+ly2S7gLwd8p9O075pDhn
X-Received: by 2002:a17:903:244f:b0:2a7:6aa5:68f3 with SMTP id d9443c01a7336-2ae824eb3d1mr48380995ad.34.1772869612670;
        Fri, 06 Mar 2026 23:46:52 -0800 (PST)
Received: from [192.168.1.5] ([27.7.215.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f9d4d3sm41634435ad.69.2026.03.06.23.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 23:46:52 -0800 (PST)
Message-ID: <924b7631-0b75-4ecc-bae2-162abb4bdc31@gmail.com>
Date: Sat, 7 Mar 2026 13:16:46 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] dt-bindings: usb: atmel,at91sam9rl-udc: convert to
 DT schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Herve Codina <herve.codina@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260224-atmel-usb-v2-0-6d6a615c9c47@gmail.com>
 <20260224-atmel-usb-v2-4-6d6a615c9c47@gmail.com>
 <20260306004931.GA875708-robh@kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260306004931.GA875708-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E298622AA44
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34172-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[charanpedumuru@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.942];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action



On 06-03-2026 06:19, Rob Herring wrote:
> On Tue, Feb 24, 2026 at 01:13:01PM +0000, Charan Pedumuru wrote:
>> Convert Atmel High-Speed USB Device Controller (USBA) binding to DT schema.
>> Changes during conversion:
>> - Include "#address-cells" and "#size-cells" in the properties since they
>>   are required by existing in-tree DTS definitions.
> 
> The DTS files are wrong unless there are child nodes and there aren't.

Yes, there is no child node but these properties are defined in sam9x60.dtsi for the compatible "microchip,sam9x60-udc" and the yaml fails dtbs_check if I remove them, can I send an another patch for removing these properties from sam9x60.dtsi?

> Drop those.

-- 
Best Regards,
Charan.


