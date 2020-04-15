Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8871AAB26
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 17:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392774AbgDOO5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Apr 2020 10:57:40 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:39824 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390410AbgDOO5i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Apr 2020 10:57:38 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 492QSb1fCxz1qrfT;
        Wed, 15 Apr 2020 16:57:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 492QSb0Jnqz1qqkT;
        Wed, 15 Apr 2020 16:57:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id MkSG_bTKN8VT; Wed, 15 Apr 2020 16:57:34 +0200 (CEST)
X-Auth-Info: 1yDHnyIrmxsN7lWSGOd7MtItYg8vVCeP5GF7yj9qGTE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Wed, 15 Apr 2020 16:57:34 +0200 (CEST)
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
From:   Marek Vasut <marex@denx.de>
Message-ID: <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
Date:   Wed, 15 Apr 2020 16:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/15/20 10:37 AM, Minas Harutyunyan wrote:
> Hi,
> 
> On 4/14/2020 4:18 PM, Marek Vasut wrote:
>> On 4/14/20 9:14 AM, Minas Harutyunyan wrote:
> 
>>
>>> 2. debug log
>>
>> What kind of debug log ?
>>
> Drivers debug log starting from dwc2 loading and connector connecting to 
> device, where issue seen.

How do I enable the one you need ?
