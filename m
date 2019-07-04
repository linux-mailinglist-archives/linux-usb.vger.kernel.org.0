Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18AD85F96A
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 15:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbfGDNxu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 09:53:50 -0400
Received: from hqemgate16.nvidia.com ([216.228.121.65]:9182 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNxu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 09:53:50 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1e04eb0000>; Thu, 04 Jul 2019 06:53:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 06:53:48 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 04 Jul 2019 06:53:48 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 13:53:46 +0000
Subject: Re: [PATCH 6/8] phy: tegra: xusb: t210: support wake and sleepwalk
To:     JC Kuo <jckuo@nvidia.com>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <pdeschrijver@nvidia.com>,
        <afrid@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <nkristam@nvidia.com>,
        <skomatineni@nvidia.com>
References: <20190614074824.22023-1-jckuo@nvidia.com>
 <20190614074824.22023-2-jckuo@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <70ba0026-1e93-61ef-bec8-c10963870b4f@nvidia.com>
Date:   Thu, 4 Jul 2019 14:53:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190614074824.22023-2-jckuo@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562248427; bh=QX1/bASO94P51PT7/EjtJR+0a47ax7pts7qSYTKjBx0=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=VeJ6DJFdc/S45F16ZEbEjqR9wmt4vBw0c1p0JkW1N0JDR2FS2oBNH2bkUsmAo/I0p
         pSKwee+3ytwqI2jE2YcekbOyBhIU+il2tikYLw8WQIL8YEoLKo2e8qdu3GpRwXef62
         gzMC4CWjDzyNmX0JZSUXfe0sGzuuiVfWbXbIwyFn1nW2ohTerDG+VmxKLHTldQQ9+q
         xkJHJPZGr/Fr1m7FLCR0/ly1ZVwWdkN764DkIJExx+ETVo43FRtmngptk9VbzmsvWT
         r+cEnhNNChUJ+zccclOPKbeR11dVecYkxf6eyY2rZbh4/jxuCakXy9Nqy1ZEcUS6Ut
         k1mCHUnyOAzYA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 14/06/2019 08:48, JC Kuo wrote:
> This commit implements Tegra210 XUSB PADCTL wake and sleepwalk
> routines.

This patch does not apply cleanly. I am not sure how this was generated
but appears to come from windows (with ^M end of line character). Please
fix this.

Alot of these enable/disble functions looks very similar; programming
the same registers just with different bits. Maybe worth considering
consolidating these functions.

Cheers
Jon

-- 
nvpublic
