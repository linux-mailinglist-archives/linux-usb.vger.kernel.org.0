Return-Path: <linux-usb+bounces-4109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453C810FA0
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 12:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB175B20CA9
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 11:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435E02376B;
	Wed, 13 Dec 2023 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="vNl9EfAH"
X-Original-To: linux-usb@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [IPv6:2a00:1098:ed:100::25])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A997D0
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 03:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702466238;
	bh=96//esADRJOplqr88mspWyhOTMtK0mDFOs2Lc3N4+AY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vNl9EfAH7fdF7bv33WObj93Bnua/VyYYCEXrpSDln3sYpvj4A54iZAsB8mykb1KeN
	 qsuGpBxCteADgWJAfmzH6KiB9BpqLJ/7QGSmQpYoEm32bN4mpOMgCr2QlqGI0K5DF1
	 O49m5L82yWVhwcgFcQ4GelNCJ1k/Ud94FWbSUaC+1kKSo7RBDm5RuDE1kyh2Ny/uPV
	 iqpbG1cBDmS5vXiC161CfBFtYywhR9jz0zdw/BL2vwmPxEKRPxkL4bqHlrXhjvFA8T
	 dQemoSTN3Yh5GBWTTDRCqFYsDWsPok3cjCijVV2Dc3SDyJez5ohr0n0zd99qGg+pU8
	 F7oRQ68kF62ig==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2B8637813F2;
	Wed, 13 Dec 2023 11:17:17 +0000 (UTC)
Message-ID: <5327b2fd-94c6-46fe-b987-52cfff042033@collabora.com>
Date: Wed, 13 Dec 2023 12:17:17 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: usb: mtk-xhci: add a property for Gen1
 isoc-in transfer issue
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20231213063543.12435-1-chunfeng.yun@mediatek.com>
 <c1bc144d-07d6-422c-8294-42be47f83e59@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c1bc144d-07d6-422c-8294-42be47f83e59@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 13/12/23 09:05, Krzysztof Kozlowski ha scritto:
> On 13/12/2023 07:35, Chunfeng Yun wrote:
>> For Gen1 isoc-in endpoint on controller before about SSUSB IPM v1.6.0, it
>> still send out unexpected ACK after receiving a short packet in burst
>> transfer, this will cause an exception on connected device, specially for
>> a 4k camera.
>> Add a quirk property "mediatek,rxfifo-depth" to work around this hardware
>> issue;
>> The side-effect is that may cause performance drop about 10%, including
>> bulk transfer.
>>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
>>   .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> index e9644e333d78..b8ed68574ba4 100644
>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
>> @@ -124,6 +124,16 @@ properties:
>>         defined in the xHCI spec on MTK's controller.
>>       default: 5000
>>   
>> +  mediatek,rxfifo-depth:
>> +    description:
> 
> The property description and driver patch suggest you configure the
> depth of FIFO, so this should be not bool, but some uint32. And then,
> use generic "fifo-depth" property to set desired depth.

Did you mean "rx-fifo-depth" instead, as used in net?
This FIFO depth parameter is for RX only.

Cheers,
Angelo



