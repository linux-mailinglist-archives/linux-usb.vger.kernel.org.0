Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54811A6860
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2020 16:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgDMOya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Apr 2020 10:54:30 -0400
Received: from mail-out.m-online.net ([212.18.0.10]:52847 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728248AbgDMOya (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Apr 2020 10:54:30 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 491BTw1Ycdz1rmgZ;
        Mon, 13 Apr 2020 16:54:28 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 491BTw0pp4z1r0cS;
        Mon, 13 Apr 2020 16:54:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id yu00EsznBJL7; Mon, 13 Apr 2020 16:54:27 +0200 (CEST)
X-Auth-Info: sMMgtq79Sa6PbzvMrRLxEKGlioGahcRo1p174ZUroJ0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon, 13 Apr 2020 16:54:27 +0200 (CEST)
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
Date:   Mon, 13 Apr 2020 16:54:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/13/20 4:45 PM, Minas Harutyunyan wrote:
> Hi,

Hi,

> On 4/13/2020 6:31 PM, Marek Vasut wrote:
>> On STM32MP1 without the STUSB1600 USB-C chip (i.e. with plain USB-OTG
> 
> Could you please provide GSNPSID, GHWCFG1-4 register values for STM32MP1.

GSNPSID = 0x4f54330a
GHWCFG1 = 0x00000000
GHWCFG2 = 0x228fe150
GHWCFG3 = 0x03b892e8
GHWCFG4 = 0xe3f00030
