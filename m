Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE6C222A37
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 19:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729412AbgGPRnq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 13:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgGPRnp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 13:43:45 -0400
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D89C061755
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nfUXCwgJ3xLhzLLyn9n5x7zqk1f2w9l5Rutjwzm+PeY=; b=IbXNmHMeiHGlizyfko5nDt+fTM
        8PDL5FOsqLGCsEnO3kCInuz3XvH9uOM5/AMyCpqSRVnvoMefOPCHHjA6YcJXU4M8SjXhZeEgv2PiA
        3rtPNOUyb3f3Bw83K/ivB73pPxu7rDQBeu6B7Fr5aShujbHr6moxuloDLO7FZY+Y0XJyPVH6ZVS+C
        SRf48LFLWWgjQFh8xxYLQ1prmvB5CsO8Y4Ft+zAnvEZEVaPDi0Uaglxmw6ouMBjANOxJLaL5MD9iz
        QPBxOssXbUhkRwZGcW0mAOkOdaBtdXSBLcSAxTLZoiYV3kJji1n1UQMvz3R43tV1Xm5RT47kYWTkV
        rjt6y0PQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50035 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jw7v4-0000Wx-8D; Thu, 16 Jul 2020 19:43:42 +0200
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
To:     Peter Stuge <peter@stuge.se>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org,
        sam@ravnborg.org, dri-devel@lists.freedesktop.org, balbi@kernel.org
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
 <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
 <20200714193841.18494.qmail@stuge.se>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <915b4e6b-2d54-800c-0bbf-099504c70c69@tronnes.org>
Date:   Thu, 16 Jul 2020 19:43:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200714193841.18494.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 14.07.2020 21.38, skrev Peter Stuge:
> Noralf Trønnes wrote:
>>> In all cases, the driver on the host knows/has available how many bytes
>>> were successfully transfered.
>>
>> I was thinking about the device, that it could get out of sync. Let's
>> say the host sends a 1k framebuffer and half of it gets transferred and
>> the rest fails for some reason. Lubomir's MCU implementation has an
>> endpoint max size of 64 bytes and a callback is called for each packet.
>> If the 1k transfer fails at some point, will the device be able to
>> detect this and know that the next time the rx callback is called that
>> this is the start of a new framebuffer update?
> 
> Ah! No, a device can not detect that the host intended to send more (bulk)
> packets but e.g. timed out.
> 
> I can't immediately think of other reasons for a larger transfer to fail,
> which still allow communication to continue.
> 
> When the host recognizes a timeout with partial data transfer it could
> simply send the remaining data in a new transfer.
> 
> 
> While the device can not detect host intent, the protocol could allow
> devices to specify requirements, e.g. that the host always sends full frames.
> 
> In any case, please avoid making a control request mandatory for frame
> transfer.
> 
> Because control requests are scheduled differently onto the wire and
> because they consist of more packets than bulk data, a control request
> will interrupt a bulk data stream and likely introduce unneccessary latency.
> 
> If synchronization is always required then I'd suggest to place it inline
> with frame data, e.g. in the first packet byte.
> 
> If synchronization is only required in rare cases then a control transfer
> is probably the better choice, to not waste any inline bytes.
> 
> But the optimum would be that the device can describe its needs to the host
> and the host driver ensures that the device always receives the data it needs.
> 
> Do you think this is possible?
> 

Looking at the host driver I see that I need to fix it so that it
requeues the update if it fails (on SET_BUFFER or bulk out). Currently
it just goes back to sleep waiting for userspace to announce a new change.

I would like to avoid having a special case for retrying the failing
part of a bulk transfer for devices that only want full updates, I would
prefer to use the common error path of retrying the whole update.

This is my suggestion for the new flag:

/*
 * Always send the entire framebuffer when flushing changes.
 * The GUD_DRM_USB_REQ_SET_BUFFER request will not be sent before each
bulk transfer,
 * it will only be sent if the previous bulk transfer had failed. This
is done to
 * inform the device that the previous update failed and that a new one
is started.
 *
 * This flag can not be used in combination with compression.
 */
#define GUD_DRM_DISPLAY_FLAG_FULL_UPDATE	BIT(1)


Noralf.
