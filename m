Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFEC62739E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 00:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbiKMXwj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Nov 2022 18:52:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbiKMXwi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Nov 2022 18:52:38 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6C2B1E2;
        Sun, 13 Nov 2022 15:52:37 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 0884B5C0004;
        Sun, 13 Nov 2022 18:52:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 13 Nov 2022 18:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1668383555; x=
        1668469955; bh=A1qCJOUp0QpjL2/Kd4K7cMVRGDRzG+dWyUIbUehmaoc=; b=C
        0E+yoyxLEgGO7iC18IQRFmc5933zobUI4SwVPrOccR5rmk+48VReTwEZLYUzQNRC
        Edp7OoFitE1i8agthD+psT368zAatLPgvvJKhygxQDmcxqyZWuoIPcCyVsEvFa5n
        5Ly+mzN08O4+9Ij7YFs+5FFMw0Wm4bSr2Pt2qiZ3JYWX0K3S0ISXn54tdqDgoz8a
        7D7drigvJfam3KoJw9uBmuLN2xxVJG9QukXdi+ksEtH2EnOsdItrP4U8QJlDGtuu
        KyfbLMYO0KU0EexvaTxsqX+dv6Jg1mxCdk8bkbTQ63607L6e/6VD3OHZ5Xj8tL2i
        LMvwZcXG6tWEsiXQxcRZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668383555; x=
        1668469955; bh=A1qCJOUp0QpjL2/Kd4K7cMVRGDRzG+dWyUIbUehmaoc=; b=L
        FtAOhrhaiEr1PjpPVS2l5wJmCptnNpXvrtjwu7ZIkfYmkcOBPXJL/6id7m+gFrVQ
        Qs/ODM9m2VE14s50iREpLczF3wMobC49hvqMYk0mbF8Mad0LwVINdFuIij46S4sl
        kTChOpDQlJ1+DrNN6WY+0KXqHN60TgrTnkjdk+l1rLNcFSGh534aM4L5oOzmgkyy
        HcjMCgBwLAhiMazvxBmmDcgogOHDoRB5ebuHzMlosnKwUz6H1VgB7DU+xVt8EkbA
        5qqv20cUdfox2pdkr6nOvumhYfWbtN88kQf5Re0E1GSOp1zJLbZyC46OBOxC63Kk
        zo8k9J5npQ0pXjOnsMUkA==
X-ME-Sender: <xms:QoNxYzpkSvsxW7YbvX9D4Z6AAwVBaFde7RT2EwknGDg8gFflymhFnw>
    <xme:QoNxY9rkJs6729LL4zGUZMv9YNUYaO-v1GELEJHr4RJPeTrrJnl1uMGgFvjyqi69e
    U4JdHR77TGbR0YCHg>
X-ME-Received: <xmr:QoNxYwOlg7TNqj_Kyb0vX4wxCm9j6Hgm_2QwUTcrHn_vt-H1QtGyJBuf-MK02ZSB4RTXnYcIBQZPO1CJk91SF0DW2Zv_rnhgFkf7AoVu4EQP1n6h6fSHIE5I5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepgfdtgfelffekveelvdeuteetfefgleelhfejteeiuefhheetueef
    fefgheefveefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:QoNxY25g9R9n8r4cWQpXJEu1uY2a9m_CTmcONKygxkHTYK1H1aM96Q>
    <xmx:QoNxYy6nyJUdWoQkjy9Zf82k7iIUTWShHz7TCrQ97-MWNCMjbvTdqg>
    <xmx:QoNxY-ge8Y_FJ4lx3iNVn_bVIkY4D9wGjFcUkZZYIxf3f61L_fU17w>
    <xmx:Q4NxY1JovrwwsaVar9lSOpVMx0jvRjfsZy_pOaxujJPqpaA9h9kqKA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 13 Nov 2022 18:52:33 -0500 (EST)
Message-ID: <7b2606df-3ae5-2699-66bd-12815ffc785b@sholland.org>
Date:   Sun, 13 Nov 2022 17:52:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit
 quirk flags
Content-Language: en-US
To:     Icenowy Zheng <uwu@icenowy.me>,
        Andre Przywara <andre.przywara@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-11-andre.przywara@arm.com>
 <D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>
From:   Samuel Holland <samuel@sholland.org>
In-Reply-To: <D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/6/22 09:54, Icenowy Zheng wrote:
> 
> 
> 于 2022年11月6日 GMT+08:00 下午11:48:25, Andre Przywara <andre.przywara@arm.com> 写到:
>> So far we were assigning some crude "type" (SoC name, really) to each
>> Allwinner USB PHY model, then guarding certain quirks based on this.
>> This does not only look weird, but gets more or more cumbersome to
>> maintain.
>>
>> Remove the bogus type names altogether, instead introduce flags for each
>> quirk, and explicitly check for them.
>> This improves readability, and simplifies future extensions.
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>> drivers/phy/allwinner/phy-sun4i-usb.c | 50 ++++++++-------------------
>> 1 file changed, 15 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
>> index 51fb24c6dcb3..422129c66282 100644
>> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
>> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
>> @@ -99,27 +99,17 @@
>> #define DEBOUNCE_TIME			msecs_to_jiffies(50)
>> #define POLL_TIME			msecs_to_jiffies(250)
>>
>> -enum sun4i_usb_phy_type {
>> -	sun4i_a10_phy,
>> -	sun6i_a31_phy,
>> -	sun8i_a33_phy,
>> -	sun8i_a83t_phy,
>> -	sun8i_h3_phy,
>> -	sun8i_r40_phy,
>> -	sun8i_v3s_phy,
>> -	sun50i_a64_phy,
>> -	sun50i_h6_phy,
>> -};
>> -
>> struct sun4i_usb_phy_cfg {
>> 	int num_phys;
>> 	int hsic_index;
>> -	enum sun4i_usb_phy_type type;
>> 	u32 disc_thresh;
>> 	u32 hci_phy_ctl_clear;
>> 	u8 phyctl_offset;
>> 	bool dedicated_clocks;
>> 	bool phy0_dual_route;
>> +	bool phy2_is_hsic;
> 
> Maybe use a `int hsic_phy` instead? But the problem is this practice is
> assuming USB0 could not be HSIC -- although USB0 is usually OTG.

There is already a `hsic_index` variable in the struct we can use.

Regards,
Samuel

