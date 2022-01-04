Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93BA483F45
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 10:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiADJkB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 04:40:01 -0500
Received: from mxout03.lancloud.ru ([45.84.86.113]:37222 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiADJkB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 04:40:01 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 2910420ED966
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] usb: dwc2: do not gate off the hardware if it does not
 support clock gating
To:     Dinh Nguyen <dinguyen@kernel.org>, <Minas.Harutyunyan@synopsys.com>
CC:     <Arthur.Petrosyan@synopsys.com>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
References: <20220104022238.725195-1-dinguyen@kernel.org>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <22ca636d-acf8-d59f-ecd0-99702f826faf@omp.ru>
Date:   Tue, 4 Jan 2022 12:39:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220104022238.725195-1-dinguyen@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello!

On 1/4/22 5:22 AM, Dinh Nguyen wrote:

> We should not be clearing the HCD_FLAG_HW_ACCESSIBLE bit if the hardware
> does not support clock gating.
> 
> Fixes: 50fb0c128b6e ("usb: dwc2: Add clock gating entering flow by
> system suspend")

   Don't break up this line (perhaps could be fixed while applying).

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
[...]

MBR, Sergey
