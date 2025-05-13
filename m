Return-Path: <linux-usb+bounces-23883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE8AB4AC3
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 07:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 958EA3A75A5
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 05:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634288BE8;
	Tue, 13 May 2025 05:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ksygQgw1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493451E1DF8
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 05:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747113013; cv=none; b=NJRePZ5PfU9evhvg9lH1myHGlMP4x831Yrxuj/q+eDk/ANLSi8wLvcJknxA/0zyaeRE2UR5OnNT2XClyyG/KvJ/29Xc1deau0VUxRJdx+1pUkVz2CGJp/bo3nIcOiT0JV2UEwT1mgQEfVYbHdPQu7cDgkBjyXtnzedBAC5qdK+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747113013; c=relaxed/simple;
	bh=cxqjrBx3kTpOHbacDXp/Fe0LkjauDwSUf53IzM3RIHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJhrq+VAE+j4DsJ6pe4XFOoNuzWHqDZgpOPyfzpsuxO+V5koaw7MK4PXWpjBU/1KPVkomAAgTN5f1uhgKWZTrzsVOtIkNaBYxFU9vEIJMQZXGuFH8EHa8heVPqAIRBoHc0gXV23KTkVyvKe84spScDwmTXoMsLZzA41vPbF9aaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ksygQgw1; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so4663712a12.2
        for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 22:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747113010; x=1747717810; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81hnT5JYAGOLBlSsNMic7sDzKs20VH/V/TIv7YvaGSs=;
        b=ksygQgw1+2CEWLR/9hyvr9MEND03eeP5drRyK6cN0tk5ciG5MwJ9RU52hp1h+lCllW
         jhQ2c65wQa20sTroWLD6y0YhdvO2m0IkHKX0VJbL6T6A0w6p8sV47F4PHWRcO78BNBrw
         KHxrs6FjToatxWxhLgiluitqj4ExQo8hzpCcyAG0o7WaWFh1pGkITKAdYvIV2iX+BGhb
         2oGxtjA4KLDe3jwD05vED9s1AR8Yg9YFfRcqQZPhehzpcHNDPQNTJQi5Snw+1hJjgXYH
         oAqUduZYE5D1/ZqMgqIxPSV5ZCVC7FZeDUIkU7P9zyqq0rms9/210rzFf7TjlFR70LaW
         DOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747113010; x=1747717810;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81hnT5JYAGOLBlSsNMic7sDzKs20VH/V/TIv7YvaGSs=;
        b=kfzq4PQySEmEQPZjvW1q0CqSekRo1acfSgIiFerckB62TLaZNwfmMMnvd2ihDpyYuk
         JhNTxtw9DvqoMY4XlpgPwyGNZS3yNBiK0tIy6Fm9nuG9Bw0HISQhotxqyVe1uA/CrUhE
         BNRlPdTB4pCw4bjyonWzhl6hBSBzEg30jR21+c3vkgn+UBEnIkAc6pGMTy2iv+75CzNJ
         ziAlySdHeMX4P8H2iIFEzTgw+bozsMwz/l0zJd/w431nAUXWmafBVeXTnUtdSymrrVGG
         OmI1T4HTVb0so2yZjwhBIXpd417+u5Uh/jV8WvdCNxE8CSZiM6Xf/tKgY3wU4E/NzSY6
         OyHg==
X-Forwarded-Encrypted: i=1; AJvYcCW+sDG0J5bYGnVT2t5m9Nnimo5S7XNRf5tS85rbD/nPhFU1SpB/lvs/m5r6fGuLKuZO+nwT23IbEJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwctqTVxzHEXD1V4fN/wTFrgM8lcG4lidd2lift71SSVYMmbMoX
	UnOk/pOjuFDKbacTH7nCtuBjYzbqtXL8VgVeWHpNdxlV9XqPhpCewa9EoQ52OQ==
X-Gm-Gg: ASbGncv1kab6Z6HvkBGiOVsWe6TPsEcH91zJsS02jH97ntzVjImaOE10pdjNA7sJf5o
	dN+21BvzlIuiFiU0Tk7jEpShzX+vkJvzIUJKJ/aTt2bemlwCDFKqN9XtMyeoKBS27amkKOv6kvl
	SdmCV85ZXQnKExPMIOk+zl3z1RG+XhCn9nwivhHHPVN7BLlTjtHkGBCgGoMkNQudIq2um9cXN5d
	9tPDGS4DsXkyftqZKpdFkmWMhrtg2IttEHh3IlC0Kvd1zjste1Wtvh4P2HiTsHAyEpuByM5nThx
	0+/w3rc3Uo5prO84LiuaaJpOGaDYVqDtL+RPrvMpV/2XQdQdJN/gIHVZGwxgzNbFCSE9xRf474L
	LcuUBn7+ea8MFvD9Eb2lx
X-Google-Smtp-Source: AGHT+IGfy5kPpmg1u05cDB23GMn6/iiBBg2PQjgjfT2slhmZBcXNsZ9nNvlTSHiycu8Z5JpPXl9tnw==
X-Received: by 2002:a17:903:3bc7:b0:22f:a5ff:ec67 with SMTP id d9443c01a7336-22fc8b3399cmr209564955ad.17.1747113010228;
        Mon, 12 May 2025 22:10:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:4570:89a0:d077:eefe:6c8:eb65? ([2600:1700:4570:89a0:d077:eefe:6c8:eb65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7549200sm71543555ad.10.2025.05.12.22.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 22:10:09 -0700 (PDT)
Message-ID: <bae35813-74fc-4a7f-bbad-a4744826bcdf@google.com>
Date: Mon, 12 May 2025 22:10:07 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: connector: extend ports property to
 model power connections
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Len Brown <len.brown@intel.com>, Kyle Tso <kyletso@google.com>,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 devicetree@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>, Pavel Machek <pavel@kernel.org>
References: <20250507-batt_ops-v2-0-8d06130bffe6@google.com>
 <20250507-batt_ops-v2-1-8d06130bffe6@google.com>
 <174667008518.3134866.16860556665392127379.robh@kernel.org>
From: Amit Sunil Dhamne <amitsd@google.com>
Content-Language: en-US
In-Reply-To: <174667008518.3134866.16860556665392127379.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rob,

On 5/7/25 7:08 PM, Rob Herring (Arm) wrote:
> On Wed, 07 May 2025 18:00:22 -0700, Amit Sunil Dhamne wrote:
>> Extend ports property to model power lines going between connector to
>> charger or battery/batteries. As an example, connector VBUS can supply
>> power in & out of the battery for a DRP.
>>
>> Additionally, add ports property to maxim,max33359 controller example.
>>
>> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
>> ---
>>  .../bindings/connector/usb-connector.yaml          | 20 +++++++++++------
>>  .../devicetree/bindings/usb/maxim,max33359.yaml    | 25 ++++++++++++++++++++++
>>  2 files changed, 38 insertions(+), 7 deletions(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
I ran this and didn't see any errors on my side.
> dtschema/dtc warnings/errors:
>
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507-batt_ops-v2-1-8d06130bffe6@google.com
Even the build logs don't show any error log.
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.

My patchset is based on v6.14-rc6 and I tested it on that.

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
I did all of the above but make dt_binding_check still passes.

(.venv) amitsd@amitsd-gti:~/linaro-p6-image/src/linux$ make
dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/connector/usb-connector.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
/usr/local/google/home/amitsd/linaro-p6-image/src/linux/Documentation/devicetree/bindings/net/snps,dwmac.yaml:
mac-mode: missing type definition

^ This is not newly introduced jfyi.

  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX   
Documentation/devicetree/bindings/connector/usb-connector.example.dts
  DTC [C]
Documentation/devicetree/bindings/connector/usb-connector.example.dtb

(.venv) amitsd@amitsd-gti:~/linaro-p6-image/src/linux$ make
dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/usb/maxim,max33359.yaml
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/usb/maxim,max33359.example.dts
  DTC [C] Documentation/devicetree/bindings/usb/maxim,max33359.example.dtb

Please can you advise on what I may be missing?

Thanks,

Amit


