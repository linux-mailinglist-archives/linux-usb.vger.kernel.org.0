Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5154321718
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 13:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhBVMmb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 07:42:31 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34517 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbhBVMlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 07:41:32 -0500
Received: from [123.112.65.49] (helo=[192.168.0.106])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1lEAW8-00052k-0F; Mon, 22 Feb 2021 12:40:48 +0000
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
To:     Oliver Neukum <oneukum@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <20210221085100.4297-1-hui.wang@canonical.com>
 <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
 <ad6601a93f8fc4ec4d1451df5457e51aadf37301.camel@suse.com>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <b28b38fa-3d19-3251-e576-38bd4d828ac1@canonical.com>
Date:   Mon, 22 Feb 2021 20:40:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ad6601a93f8fc4ec4d1451df5457e51aadf37301.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/22/21 3:59 PM, Oliver Neukum wrote:
> Am Sonntag, den 21.02.2021, 11:20 +0100 schrieb Hans de Goede:
>> Hi,
> Hi,
>
>> On 2/21/21 9:51 AM, Hui Wang wrote:
>>> Once pre_reset() or post_reset() returns non-zero, the disconnect()
>>> and probe() of the usb_driver will be called. In the disconnect(),
>>> the scsi_host will be removed and be freed after scsi_host_put(), in
>>> the probe(), the new scsi_host and uas_dev_info will be created.
>>>
>>> If the usb_reset_device() is triggered by eh_device_reset_handler(),
>>> and pre_reset()/post_reset() returns non-zero, the disconnect() and
>>> probe() will be called, then returns to the eh_device_reset_handler(),
>>> it still accesses old scsi related variables and uas_dev_info, and so
>>> do its caller functions.
>>>
>>> Here change the pre_reset() and post_reset() to let them only return
>>> 0, after this change, the usb_reset_device() will only reset this
>>> usb devcie from its hub port, will not execute unbind and rebind
>>> usb_driver during reset.
>> We only return non 0 from the pre/post reset handles if we failed
>> to ensure the device is in a known state.
> correct. Technically it is a bit unfortunate that UAS devices react
> a bit different to other SCSI devices, but we definitely cannot hide
> a failure. Arguably we should go into OFFLINE state.
> But that needs a
> good reason beyond theoretical considerations.
>
> 	Regards
> 		Oliver
>
>
OK, will find a UAS device to do the test.

thanks,

Hui.

