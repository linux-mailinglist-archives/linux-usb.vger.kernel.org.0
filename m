Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B574842DF
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 14:56:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbiADN4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 08:56:53 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46508 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiADN4w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 08:56:52 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FCCD6144A
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 13:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB82C36AE9;
        Tue,  4 Jan 2022 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641304612;
        bh=gszCFIseTbtxkOAiHU29UeC42/LXWvBXgWT5JvgYWRg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oQRY3DypzBLdJiWBMT6aymFdXJ9MN1djuYTyz2Kp5oPMHbpveyV+roxhvchs5MopF
         H6tWcgEvb0bZ8Jiyh4FXWWYXGceCsmHb8isWu3hsuiXda9+BJ1D1jV3Trs0OP5xfao
         EIqG/p/eASnkg1HIz/YvoBJ+j53UKQ8i98H+FxHwq84scyN8VlXeVWwTSsOWi/sYHM
         HENlXokn+ci0IIs33gtsA4AQ0LANjzCUlZ+ltzJq5YYJ3p7p7YWClbqTXjy2C8LW2p
         rkSjoWY0gJEJwSSyiREbrvKrz9mpOYc7hXH+4Fo6UqNmXXsWcXksry27E2bWSzgFVU
         lwEfLo/5fgvsg==
Subject: Re: [PATCH] usb: dwc2: do not gate off the hardware if it does not
 support clock gating
To:     Sergey Shtylyov <s.shtylyov@omp.ru>, Minas.Harutyunyan@synopsys.com
Cc:     Arthur.Petrosyan@synopsys.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <20220104022238.725195-1-dinguyen@kernel.org>
 <22ca636d-acf8-d59f-ecd0-99702f826faf@omp.ru>
From:   Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <d0ebab96-c0a7-8e16-07e8-e5b82559e5e0@kernel.org>
Date:   Tue, 4 Jan 2022 07:56:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <22ca636d-acf8-d59f-ecd0-99702f826faf@omp.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/4/22 3:39 AM, Sergey Shtylyov wrote:
> Hello!
> 
> On 1/4/22 5:22 AM, Dinh Nguyen wrote:
> 
>> We should not be clearing the HCD_FLAG_HW_ACCESSIBLE bit if the hardware
>> does not support clock gating.
>>
>> Fixes: 50fb0c128b6e ("usb: dwc2: Add clock gating entering flow by
>> system suspend")
> 
>     Don't break up this line (perhaps could be fixed while applying).
> 

My bad! Let me re-send.

Dinh
