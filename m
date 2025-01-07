Return-Path: <linux-usb+bounces-19065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F33A03E2A
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 12:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF508166037
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2025 11:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824291EE00C;
	Tue,  7 Jan 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HtgkNi01"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461231DFE3D;
	Tue,  7 Jan 2025 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250388; cv=none; b=pQSvXJ8HA81ms8fJD9rC5l5r3sG693VpBZ/lsQqPZpMOajhTLDWTTNfrD2Vi1OItMpJAxwSeo8Bv2+izPNZHqet5HzNrqCp36W2gl39VIsHGzSnFAGv7HnJDsNQZgA60EtxyrwEpNL73kPS/RAd0qHOC0cBElkswpNPi6Dg4sVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250388; c=relaxed/simple;
	bh=df0LOEnngCjfFj2PvwptpBWdY3nEK+O/wLcKL6OCdMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBf97wj+pwpMne4yvD180HeqzhBUjqRcqBcJoMJ3wI6pPgcmA2nkQv7aYZppKADduIY/2eqn7CUIX7U0TFR9tGe3w5KcEy67k1QwoCY7aK4eUI+NLuL6DBe/uJSKUUF4bJ671uYSsG4teO++WAK7/Sos7gYBDered6cSz/7wiI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HtgkNi01; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736250380;
	bh=df0LOEnngCjfFj2PvwptpBWdY3nEK+O/wLcKL6OCdMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HtgkNi01/LC2j6dqsG6SUSw9HHQbXsj7H/SdfXh0AocYFpR8qrA/CxTlluiY9Kec0
	 zEgIPvTMfcZOdAWf9o2x1VYypg/Dx9sUDiifzz524qqVYzsgHW2GMuJ3wCHwksN2zo
	 QBn6/BM/TKk2f7PRM8r3E8UkHtt1zkLajqNOiZrYHnFRcaSgIzObHNlBloafdeROly
	 SwwrqtW5nIVH2zyZJMhDMhO5xViOJhqGfkMHj5/bkSwCCM2huPfst5n+EIUbxWmugs
	 mk46A4oVQaQwJHVN/KKBmJmHqbIa6LCFY6I8DD+C2dpT92bwLgka5Cz9xHjAnSsmiW
	 k1Fa6eCcSp9IA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BDB2A17E1562;
	Tue,  7 Jan 2025 12:46:19 +0100 (CET)
Message-ID: <b23d4240-f520-4840-844f-adf712ca2aff@collabora.com>
Date: Tue, 7 Jan 2025 12:46:19 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: mtk-xhci: add support remote wakeup of mt8196
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20241126025507.29605-1-chunfeng.yun@mediatek.com>
 <20241126025507.29605-2-chunfeng.yun@mediatek.com>
 <207f9e96-3165-440d-8576-545bf2bc9dee@collabora.com>
 <0820cf224ae9022fc34fb31d97d4c6f8f6e2eec1.camel@mediatek.com>
 <CAGXv+5FUuqDbVRQdkkdM9SRV6N3H8Gx_rMpx6rw-hNu45SKVNA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FUuqDbVRQdkkdM9SRV6N3H8Gx_rMpx6rw-hNu45SKVNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 07/01/25 06:07, Chen-Yu Tsai ha scritto:
> On Mon, Jan 6, 2025 at 10:58 PM Chunfeng Yun (云春峰)
> <Chunfeng.Yun@mediatek.com> wrote:
>>
>> On Tue, 2024-11-26 at 09:50 +0100, AngeloGioacchino Del Regno wrote:
>>> External email : Please do not click links or open attachments until
>>> you have verified the sender or the content.
>>>
>>>
>>> Il 26/11/24 03:55, Chunfeng Yun ha scritto:
>>>> There are 2 USB controllers on mt8196, each controller's wakeup
>>>> control is
>>>> different, add some specific versions for them.
>>>>
>>>
>>> Is there any MTU3 controller in MT8196, like all other MediaTek SoCs?
>> Yes.
>>>
>>> If so, then please just add the wakeup control to the MTU3 driver,
>>> otherwise
>>> we are going to duplicate this for yet another SoC, like we've done
>>> for MT8192,
>>> MT8195, MT8188 and MT8186 already...
>> Even I add it in MTU3 driver, I still need add it in xhci-mtk driver,
>> some projects only use host mode;
>>
>> I can also add it in MTU3 driver and send out new patches.
>>
>> But it's not a good idea to duplicate it into MTU3 driver directly for
>> some SoC which has limitation on dual-role switch when using upstream
>> driver.
> 
> I think the idea behind Angelo's point is that MTU3 should be used for
> all projects, regardless whether they are host mode only or not.
> The hardware is there. Don't hide it.
> 

Yes, I confirm that's exactly my point.

Thanks for clarifying, Chen-Yu.

Cheers!

> ChenYu
> 
>> Thanks
>>
>>>
>>> Cheers,
>>> Angelo
>>>
>>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>> ---
>>>>    drivers/usb/host/xhci-mtk.c | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-
>>>> mtk.c
>>>> index 3252e3d2d79c..31223912b0b4 100644
>>>> --- a/drivers/usb/host/xhci-mtk.c
>>>> +++ b/drivers/usb/host/xhci-mtk.c
>>>> @@ -113,6 +113,12 @@
>>>>    #define WC1_IS_P_95         BIT(12)
>>>>    #define WC1_IS_EN_P0_95             BIT(6)
>>>>
>>>> +/* mt8196 */
>>>> +#define PERI_WK_CTRL0_8196   0x08
>>>> +#define UWK_V1_7_CTRL2_MASK  0x5
>>>> +
>>>> +#define WCP1_IS_EN           BIT(7) /* port1 en bit */
>>>> +
>>>>    /* mt2712 etc */
>>>>    #define PERI_SSUSB_SPM_CTRL 0x0
>>>>    #define SSC_IP_SLEEP_EN     BIT(4)
>>>> @@ -129,6 +135,8 @@ enum ssusb_uwk_vers {
>>>>        SSUSB_UWK_V1_4,         /* mt8195 IP1 */
>>>>        SSUSB_UWK_V1_5,         /* mt8195 IP2 */
>>>>        SSUSB_UWK_V1_6,         /* mt8195 IP3 */
>>>> +     SSUSB_UWK_V1_7,         /* mt8196 IP0 */
>>>> +     SSUSB_UWK_V1_8,         /* mt8196 IP1 */
>>>>    };
>>>>
>>>>    /*
>>>> @@ -381,6 +389,16 @@ static void usb_wakeup_ip_sleep_set(struct
>>>> xhci_hcd_mtk *mtk, bool enable)
>>>>                msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) |
>>>> WC0_IS_P_95;
>>>>                val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) :
>>>> 0;
>>>>                break;
>>>> +     case SSUSB_UWK_V1_7:
>>>> +             reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
>>>> +             msk = UWK_V1_7_CTRL2_MASK;
>>>> +             val = enable ? msk : 0;
>>>> +             break;
>>>> +     case SSUSB_UWK_V1_8:
>>>> +             reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8196;
>>>> +             msk = WCP1_IS_EN;
>>>> +             val = enable ? msk : 0;
>>>> +             break;
>>>>        case SSUSB_UWK_V2:
>>>>                reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>>>>                msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
>>>
>>>
>>>



