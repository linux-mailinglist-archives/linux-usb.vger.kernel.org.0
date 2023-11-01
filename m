Return-Path: <linux-usb+bounces-2417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4847DDBEB
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 05:36:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F7D281A09
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 04:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564C715C8;
	Wed,  1 Nov 2023 04:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNivXMfD"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88033186D
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 04:36:51 +0000 (UTC)
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE17FC
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 21:36:48 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7b9ba0c07f9so1960937241.3
        for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 21:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698813407; x=1699418207; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ID+S04pHkx9aSKdp+ucIhh2PVs3MifW7Ts+8UbZjHPQ=;
        b=SNivXMfD1r2UTkiVgFup6bvLT4FDiCVNeHZzBncHYLwxQ+nUWWnKk67ysW0pKA5PDd
         W+uQ9GAsFJ9KMJPRF9oukF/ymb9GbxjHwWzBuuzNG0p5T9ez7sOwlih7OR1BJsslSAT4
         1uG9ZuZbKMQGgiB9W5kZFctdYgcXSprni/YKNy7w20lABGwEVWMkwzSFtdUkcMcuT26P
         h1JQs5Ypr+gbDzmubh8ei4Y0xbbhd/UQgUTFcZaFAMGmglSS5GqCF20cZYBnz9mG/48G
         9fDsQu/Y2BEE5/PApQ09YHyw8ay8tYiQ/J4R37e09mKGsYCq0NSSPRl+zG4DGoBUOnyU
         QSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698813407; x=1699418207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ID+S04pHkx9aSKdp+ucIhh2PVs3MifW7Ts+8UbZjHPQ=;
        b=UjgNSLyLvCfE5mAXx4nZ9wIKhKuDxVVZUB/MD4IWxoo/d8SFiCJxtFsJg4tf6bCFGV
         N3RKE0dBQuYHYz4AHnQa6HE5ewy+hQbi3yv0A9GiXXWd26QUebdWeVyTxWAiHQLjjAY3
         VFPVKa26w4GWnnI9mJO3rULmDBqxD8iKY4RPDWuM0jorxHTQodlMqGMRWn3RT1BASyTk
         MXvTN3EYC415y4KauBpL4ZQAmj+lKkWYLJWrCYB6KJFORvl6+tKNUPmeQU1dPnuEV6CP
         9oPI8IFG7/my/WqmuHOAlbsCXcUbpjukAzOnauT2zJLT8XTGzltDshWjpyB1wZG2ho57
         AOZg==
X-Gm-Message-State: AOJu0YzzAvVMzI4gfMVXjtDqN2sQWr2PPj6wGe9VuYZwvjCb89ZKNjMH
	A34AIyIriZhUm3J6ueHvl+M/Qf8VuHSW0LPl7K9NUQ==
X-Google-Smtp-Source: AGHT+IGGPNy92jDHvzo6JCYso3G1dtSpwuYY7OA/tZfjM1GsDrY498EUJvuQNbMJaRXlcFCh5cGPYqjJsOt5s/jDg6k=
X-Received: by 2002:a67:e0d8:0:b0:45b:ede:fbcf with SMTP id
 m24-20020a67e0d8000000b0045b0edefbcfmr9395038vsl.8.1698813407287; Tue, 31 Oct
 2023 21:36:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231031044021.1162403-1-mnkumar@google.com> <20231031044021.1162403-3-mnkumar@google.com>
 <CA+Hc5+4Gh6gDuD_NORmJR0zHx3qK6oTagx=wQ_EWf=_NJ0qy6A@mail.gmail.com>
In-Reply-To: <CA+Hc5+4Gh6gDuD_NORmJR0zHx3qK6oTagx=wQ_EWf=_NJ0qy6A@mail.gmail.com>
From: Naveen Kumar M <mnkumar@google.com>
Date: Wed, 1 Nov 2023 10:06:36 +0530
Message-ID: <CA+Hc5+72DurrRMNtMyzg9EDwJjDJx4iR1isU=L+6DG06Gx4iMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: add no-64-bit-support property
To: Mathias Nyman <mathias.nyman@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, royluo@google.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for sending without plain text mode in the previous mail.
Adding the reviewers/maintainers I missed in the initial mail to this
patch

On Wed, Nov 1, 2023 at 9:50=E2=80=AFAM Naveen Kumar M <mnkumar@google.com> =
wrote:
>
> Adding the reviewers/maintainers I missed in the previous mail to this pa=
tch
>
> On Tue, Oct 31, 2023 at 10:11=E2=80=AFAM Naveen Kumar <mnkumar@google.com=
> wrote:
>>
>> From: Naveen Kumar M <mnkumar@google.com>
>>
>> Add a new DT option to specify whether a host controller is able to
>> support 64-bit DMA memory pointers
>>
>> Signed-off-by: Naveen Kumar M <mnkumar@google.com>
>> ---
>>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Docum=
entation/devicetree/bindings/usb/usb-xhci.yaml
>> index 180a261c3e8f..20dc134004f3 100644
>> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
>> @@ -25,6 +25,10 @@ properties:
>>      description: Set if the controller has broken port disable mechanis=
m
>>      type: boolean
>>
>> +  quirk-no-64-bit-support:
>> +    description: Set if the xHC doesn't support 64-bit DMA memory point=
ers
>> +    type: boolean
>> +
>>    imod-interval-ns:
>>      description: Interrupt moderation interval
>>      default: 5000
>> --
>> 2.42.0.820.g83a721a137-goog
>>

