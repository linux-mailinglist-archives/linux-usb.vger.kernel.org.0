Return-Path: <linux-usb+bounces-14674-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F2D96CC20
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 03:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C4421F278B6
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2024 01:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF5CC9450;
	Thu,  5 Sep 2024 01:14:03 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB43EAFA
	for <linux-usb@vger.kernel.org>; Thu,  5 Sep 2024 01:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725498843; cv=none; b=la4yeZaE8yB4zFL2jZyXoT1iOKohCkeoqmcsf7IYMdwsv2MovISDywckKQbNdWxVTVnTFB++TFerpaccuH1fWHoRj8oWodWFXDIkga8vxymsPLZNlyjRMvgGq2EummctzKXxEgeM96LIRQ1fUyl0yX++RbC6XLOynsakAod0CRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725498843; c=relaxed/simple;
	bh=qw2qZjvRCEZ+LclXMbZaNnI5HPRAPg4nv2w9MyZyTjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=edkqObRNZa1IP/lLc2iqeHeouEGeGssxwaVAQU5mMd1DFYa8qKzuBmpxcDZARm7Dg1IgfKny3liTi3wqbssyZOfJK55WAhIJd0vmUZ1uGIUxBuVuEdY3i1SnUfAwOwtwcdFSav8pATUielx4+bgF1dxQSVwkd0/AUiMW/5s0cYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WzhCW1y0KzfbXT;
	Thu,  5 Sep 2024 09:11:51 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id C4275140155;
	Thu,  5 Sep 2024 09:13:58 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Sep 2024 09:13:57 +0800
Message-ID: <5272b60e-37c7-4876-8e92-13c0c01dccbb@huawei.com>
Date: Thu, 5 Sep 2024 09:13:57 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usb: dwc3: Use helper function devm_clk_get_enabled()
To: Greg KH <gregkh@linuxfoundation.org>
CC: <patchwork@huawei.com>, <Thinh.Nguyen@synopsys.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<festevam@gmail.com>, <linux-usb@vger.kernel.org>, <vz@mleia.com>,
	<stern@rowland.harvard.edu>
References: <20240902123020.29267-1-zhangzekun11@huawei.com>
 <20240902123020.29267-2-zhangzekun11@huawei.com>
 <2024090400-enforced-unmarked-eea8@gregkh>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <2024090400-enforced-unmarked-eea8@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500003.china.huawei.com (7.202.181.241)



在 2024/9/4 16:49, Greg KH 写道:
> On Mon, Sep 02, 2024 at 08:30:19PM +0800, Zhang Zekun wrote:
>> devm_clk_get() and clk_prepare_enable() can be replaced by helper
>> function devm_clk_get_enabled(). Let's use devm_clk_get_enabled() to
>> simplify code and avoid calling clk_disable_unprepare().
>>
>> Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
> 
> Also, have you tested that this actually works?  using devm can have
> tricky sync issues when shutting down so I'm going to start requiring
> that any conversions like this be proven to work properly on real
> hardware.
> 
> thanks,
> 
> greg k-h

Hi, greg,

I make a compile test and have not test on a real hardware. I have read 
through the code logic but did not find a obvious problem.

Best Regards,
Zekun

