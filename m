Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F1C12E124
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 01:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbgABAKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 19:10:32 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:40515 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgABAKc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jan 2020 19:10:32 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Thu, 2 Jan
 2020 08:10:52 +0800
Subject: Re: [PATCH v3 3/6] phy: amlogic: Add Amlogic A1 USB2 PHY Driver
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC:     Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        <linux-usb@vger.kernel.org>, Yue Wang <yue.wang@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        <devicetree@vger.kernel.org>, Liang Yang <liang.yang@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlo Caione <carlo@caione.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jerome Brunet <jbrunet@baylibre.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-4-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCCEz-xezKatuHDPRURRWa3YNmgMObbr85GSvaT_bLFcNQ@mail.gmail.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <8defdb9d-7032-7360-0904-a63d52d16ba6@amlogic.com>
Date:   Thu, 2 Jan 2020 08:10:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCCEz-xezKatuHDPRURRWa3YNmgMObbr85GSvaT_bLFcNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2019/12/28 0:40, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> overall this looks good to me and I have one question
> 
> On Fri, Dec 27, 2019 at 7:37 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> [...]
>> +       if (priv->soc_id == MESON_SOC_A1)
>> +               value |= PHY_CTRL_R18_MPLL_DCO_CLK_SEL;
> ...here we have some CLK_SEL bit
> 
> [...]
>> -       priv->clk = devm_clk_get(dev, "xtal");
>> -       if (IS_ERR(priv->clk))
>> -               return PTR_ERR(priv->clk);
>> +       if (priv->soc_id == MESON_SOC_G12A) {
>> +               priv->clk = devm_clk_get(dev, "xtal");
>> +               if (IS_ERR(priv->clk))
>> +                       return PTR_ERR(priv->clk);
>> +       }
> but here we don't need any parent/input clock?
> does this mean that the USB2 PHY on the A1 SoC doesn't have any clock
> inputs? how does it generate the correct clock for itself then?
>

Hi Martin

Actually, there is a "xtal_usb_phy" clock in A1 ctrl driver, it seems it's
better to be in the A1 phy driver.

I will move that clock here in next version.

Thanks,

Hanjie
 
> 
> Martin
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> .
> 
