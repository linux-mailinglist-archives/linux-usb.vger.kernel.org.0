Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC43388C8C
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 13:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349253AbhESLTt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 07:19:49 -0400
Received: from mleia.com ([178.79.152.223]:40736 "EHLO mail.mleia.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349353AbhESLT3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 07:19:29 -0400
X-Greylist: delayed 523 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 May 2021 07:19:28 EDT
Received: from mail.mleia.com (localhost [127.0.0.1])
        by mail.mleia.com (Postfix) with ESMTP id 68A912E8D;
        Wed, 19 May 2021 11:09:23 +0000 (UTC)
Received: from [192.168.1.120] (unknown [82.208.107.222])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.mleia.com (Postfix) with ESMTPSA id 061A22D9D;
        Wed, 19 May 2021 11:09:22 +0000 (UTC)
Subject: Re: [PATCH] USB: gadget: lpc32xx_udc: remove debugfs dentry variable
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
From:   Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <4353dd50-1b41-65f8-815a-ae3fbafb387b@mleia.com>
Date:   Wed, 19 May 2021 14:09:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210518162035.3697860-1-gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210519_110923_453052_BC8789F3 
X-CRM114-Status: GOOD (  12.95  )
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 5/18/21 7:20 PM, Greg Kroah-Hartman wrote:
> There is no need to store the dentry for a fixed filename that we have
> the string for.  So just have debugfs look it up when we need it to
> remove the file, no need to store it anywhere locally.
> 
> Note, this driver is broken in that debugfs will not work for more than
> one instance of the device it supports.  But given that this patch does
> not change that, and no one has ever seemed to notice, it must not be an
> issue...

Yep, there is only one SoC with this device, and it has only one instance
of this UDC. Bad excuse, I know it.

> Cc: Felipe Balbi <balbi@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you.

--
Best wishes,
Vladimir
