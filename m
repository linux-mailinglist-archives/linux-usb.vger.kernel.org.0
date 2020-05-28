Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6448C1E6F33
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 00:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437245AbgE1WfZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 18:35:25 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:56293 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436978AbgE1WfY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 18:35:24 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 49Y2Zw4Gjgz1qs03;
        Fri, 29 May 2020 00:35:20 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 49Y2Zw3k1yz1qtwr;
        Fri, 29 May 2020 00:35:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id Wd6N57Oy21RK; Fri, 29 May 2020 00:35:19 +0200 (CEST)
X-Auth-Info: fINXjxd3LKESYOeZ38Yymx2nQ25X+hzgijRZ6uSFg60=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Fri, 29 May 2020 00:35:19 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
 <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
 <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
 <8de7047f-4d49-349b-983a-31c4ab66562f@synopsys.com>
 <c59c58e6-648c-bcb3-cbd4-9e78f9021bb7@denx.de>
 <d67d69a6-651f-f214-5119-bbbd68b4c2d5@denx.de>
 <4bfffaf9-fffd-57bc-6d45-ba43c46cd136@synopsys.com>
 <b9023085-0abb-b994-bb1c-e0b03e99e7ed@synopsys.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <abf109c3-c641-fdf0-f59a-2ba8b5a5f09c@denx.de>
Date:   Fri, 29 May 2020 00:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b9023085-0abb-b994-bb1c-e0b03e99e7ed@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/27/20 8:17 AM, Minas Harutyunyan wrote:
> Hi Marek,

Hi,

> On 5/15/2020 11:41 AM, Minas Harutyunyan wrote:
>> Hi Marek,
> 
> Any update on on this patch testing?
> 
> Thanks,
> Minas
> 
>>>
>> Could you please test with this patch.

Yes, that works, thanks.

This should likely get a Stable: tag when submitting.
