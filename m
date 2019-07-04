Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5EC5F7CA
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 14:16:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727657AbfGDMQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 08:16:39 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14524 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727615AbfGDMQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 08:16:39 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1dee210000>; Thu, 04 Jul 2019 05:16:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 05:16:38 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 04 Jul 2019 05:16:38 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 12:16:34 +0000
Subject: Re: [PATCH 1/8] clk: tegra: Add PLLE HW power sequencer control
To:     JC Kuo <jckuo@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074652.21960-1-jckuo@nvidia.com>
 <20190614074652.21960-2-jckuo@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1d215b49-73f7-8f5c-c8cb-81bf73553b19@nvidia.com>
Date:   Thu, 4 Jul 2019 13:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190614074652.21960-2-jckuo@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562242595; bh=kPBN7I4yROEjJs3EsoKD53ipFuBC+PQNhAmybDbzyQ8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=dcxAftlcML140IFi2MrvmJ3yRzYaty7I8GHEPLr56VoJptkdh20XDwKJdSADRFZLR
         MWIB7OPtW79iG6YSdWwRTW1E2aeh2mJJLWp93wx9nDg9EnFYiElXsukhfFXcrH3YT4
         tTqDF2YeQ22NqIOdu4E62mHM5HRHqB3Jc2G5JrLDsMzrtcppOGRF8/qY9y1esF7LsM
         IX5tePmSuMucHJ0/ZjFUEKDDIHzrEPzm7EqvYvHZLN4AJj5XGKv0GnZkzJrlQkUIa5
         dIeMMNczYWYRusRnqOMb/0iv9MGzklj3KXdsguPr+rbLLFM+0pBjXUr4TCgpkyVlDU
         rZxHv1AjhFxCQ==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 14/06/2019 08:46, JC Kuo wrote:
> PLLE hardware power sequencer has to be enabled after PEX/SATA
> UPHY PLL's sequencers are enabled.
> 
> tegra210_plle_hw_sequence_start() for XUSB PADCTL driver to enable
> PLLE hardware sequencer at proper time.
> 
> tegra210_plle_hw_sequence_is_enabled() for XUSB PADCTL driver to
> check whether PLLE hardware sequencer has been enabled or not.

I think that here to be clear about what is going on you should state
that you are "adding the function tegra210_plle_hw_sequence_start() ..."

Are these functions dependent upon clk_plle_tegra210_enable() already
being called? I assume that there must be some dependency between the
above functions and the existing plle enable function. If there is a
dependency, how do you ensure the existing enable is already called?

Cheers
Jon

-- 
nvpublic
