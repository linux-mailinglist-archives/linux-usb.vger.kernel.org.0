Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EDF204DF9
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 11:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732005AbgFWJa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jun 2020 05:30:59 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:49076 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731945AbgFWJa6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Jun 2020 05:30:58 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05N9UqJt040508;
        Tue, 23 Jun 2020 04:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592904652;
        bh=Pk0DuxK3/1XMG6JA33jsb+jIMNZHLuLuccwdLvzuZW4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=H3MlFX0kPuKAlm16r09OepczVUxFkjv8HiPVBBjnlPUfMI2W+/OQpOUxSDTFklRuY
         jSkW2MLxD4WXLnW0XEiFzz/ryNlFK+7Zlj4xYcD9vB7X2vwpiOnI8OPup2d8/1u/cm
         MFJDaPvUBRKHK06un4djyuiIQWL6Zt4bnWxt3QvU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05N9UqDa021305
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 23 Jun 2020 04:30:52 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 23
 Jun 2020 04:30:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 23 Jun 2020 04:30:52 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05N9UnRV129010;
        Tue, 23 Jun 2020 04:30:50 -0500
Subject: Re: [PATCH 0/3] usb: cdns3: improvement for usb-next
To:     Peter Chen <peter.chen@nxp.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-imx@nxp.com>,
        <pawell@cadence.com>, <jun.li@nxp.com>
References: <20200623031001.8469-1-peter.chen@nxp.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <36f06881-12a1-5219-5b8a-dea8c7df479a@ti.com>
Date:   Tue, 23 Jun 2020 12:30:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200623031001.8469-1-peter.chen@nxp.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 23/06/2020 06:09, Peter Chen wrote:
> Peter Chen (3):
>    usb: cdns3: ep0: delete the duplicate code
>    usb: cdns3: gadget: unsigned int is dereferenced as a wider unsigned
>      long
>    usb: cdns3: gadget: use unsigned int for 32-bit number

For this series.

Acked-by: Roger Quadros <rogerq@ti.com>

> 
>   drivers/usb/cdns3/ep0.c    | 2 +-
>   drivers/usb/cdns3/gadget.c | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 

-- 
cheers,
-roger

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
