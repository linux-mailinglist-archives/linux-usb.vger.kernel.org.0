Return-Path: <linux-usb+bounces-8174-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D4886F13
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 15:53:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96BB11C22131
	for <lists+linux-usb@lfdr.de>; Fri, 22 Mar 2024 14:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AEA4AEFA;
	Fri, 22 Mar 2024 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W70kSFpO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDB4481D0
	for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711119175; cv=none; b=VFuvFd+dBqjLHmq6v7ww5zLslfv/lQ8IQRsFDx7OTw5EmNVQRWqwILtVpjMYYBRSpOQ4a5o5qWchVToE6Iu8VvDpSrZKeMrb54iBIcBR9DBtv4e0o/PsnjJ+4zLaLGD6UDzncMbhF0OVJwUd9/B01Npq3M/61wmRfo+UQCpT8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711119175; c=relaxed/simple;
	bh=Wy7u/UExrSNdM8DBECLbLG3iX7xChOfdO1n056C1SMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFStANSNCgpDNe8xfxECLyeCvh0zECWLEf5XhxpB1XzcB8sUEN8+ZTtNgFuAaHvjv5ZUxWoZz37Uc/PHLOVe61lyHugu5PcfXIpxjwf3zVAd33Vnq9NNFE9XrCnOhN9mElnPRj4gu/52kao+GNZITQL8OaRiYi+U6Pns1xNg7Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W70kSFpO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4140aadfe2eso16479175e9.1
        for <linux-usb@vger.kernel.org>; Fri, 22 Mar 2024 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711119172; x=1711723972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NxYoftnRDFE6gTrj78TOy0Q0Mg6/KBJ0u3ctErMPVMk=;
        b=W70kSFpOCsp9/knT3U1FUY9rUixZL225aYTqVxmTA7lkIB2Gk6yiQXGR7zmS9POqMN
         PpBk6yxOeKq89jKvY82j/7ZAUVJGK0RRc9/K5XWbW0oy4P/mp3FEX3CRws88uiH4rqrb
         nrzfth7iXa+G5YeJzNRWxSUYwcGfFIm1ENHBo92G4m44Ph/I/C2uTK8OoFXwNtwtQAPF
         mykBEW57lki7XbCGfx1xmKBUxoKd0xJDtkkT7q51UA5B3MS4gmkOb/2xIAQjH+Gcq9DT
         7QqUdqFyHLZ8C0qcN9yG9rrkJ+errbpAZUBAsVZpIfsKP7bdQHnenfToZtvOsPfSOaKv
         XAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711119172; x=1711723972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NxYoftnRDFE6gTrj78TOy0Q0Mg6/KBJ0u3ctErMPVMk=;
        b=AV8954VgrIXzVQGXn7poUe4XIRbftLZZ4/fQc+Lq9+YIDywhuxOE9QUPiOoegtyMTq
         SAYnUfUAd1T0MCg2ERNHNiP9WBqlAEZ8/hAlXqP+mIJuHuYRqBbnZCC5DgRMRKMMii3G
         5f9o74nTCed16uPpVkY8Hjg9hzgCk1CA8h638YNNYRyPizhnQrAnwbvoRNyCAA0AkoCK
         Yu6gTKeqlunXnUHHwDYCIyLY+XGzoZjrXVEYqZJ0iftgNr9SUKv3RHPNjU+49TmkGzba
         LMJX+t+9bTFSk4ujYDmVvW3RXWDX85SkDDg2N23mcrzBl2Eu62ozEvvZM3DYZHVzGinO
         Wjdw==
X-Forwarded-Encrypted: i=1; AJvYcCV/RPTSdQYFczi/fh5UVILnSKMog/uSd5Zs5qI2A9LK0NtKGrWyTDOHZ5Xq+imwa1sjCeT6tLQd+Z24KC2SKalOBDegzwZcDgSN
X-Gm-Message-State: AOJu0YwsHgZ+oTwJnzhZiPlvCaIHTzim8iYHOCmxebD3PgwBBEMMI7ip
	o5j2gC0ApkjdIKf60DgopJOU82y6fGX7xiflT/qfCDYBJcQgMsnwOYKqIoVWomc=
X-Google-Smtp-Source: AGHT+IFxGF6a7cVY4zIfv6KP+a0pcGczkGlaxs+Nv38GKhDPzB6rlJo8uYkhQFfgyZLqrD4OoCjNsg==
X-Received: by 2002:a05:600c:1d1f:b0:413:fe9d:eaa5 with SMTP id l31-20020a05600c1d1f00b00413fe9deaa5mr1761041wms.26.1711119172531;
        Fri, 22 Mar 2024 07:52:52 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b00414038b4d64sm3288782wmq.27.2024.03.22.07.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 07:52:52 -0700 (PDT)
Message-ID: <5ea4a187-1971-4970-a289-826d96c0351a@linaro.org>
Date: Fri, 22 Mar 2024 14:52:51 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: qcom,pmic-typec: drop port
 description
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
 <20240322-typec-fix-example-v1-1-6b01c347419e@linaro.org>
 <230eab52-9751-43fd-8e47-fbfe12410e44@linaro.org>
 <CAA8EJprD3fM966pLV4QXPUu=bFTn24fvPMKOaGqtqkAbdz7sOQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJprD3fM966pLV4QXPUu=bFTn24fvPMKOaGqtqkAbdz7sOQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 13:28, Dmitry Baryshkov wrote:
> Then the actual usage doesn't match the schema. usb-c-connector
> clearly defines HS, SS and SBU ports

Its a bit restrictive IMO, data-role and power-role switching is not 
limited to HS and in fact can be done with a GPIO for example.

/Looks in Documentation/devicetree/bindings/connector/usb-connector.yaml

Yeah I mean this just doesn't cover all use-cases ..

ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: OF graph bindings modeling any data bus to the connector
       unless the bus is between parent node and the connector. Since a 
single
       connector can have multiple data buses every bus has an assigned 
OF graph
       port number as described below.

     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description: High Speed (HS), present in all connectors.

       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: Super Speed (SS), present in SS capable connectors.

       port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description: Sideband Use (SBU), present in USB-C. This 
describes the
           alternate mode connection of which SBU is a part.

TBH I think we should drop this HS, SS stuff from the connector 
definition - there's nothing to say in a h/w definition anywhere HS must 
be a port or indeed SS - not all hardware knows or cares about different 
HS/SS signalling.

Documentation bit-rot

---
bod

