Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3302820A75D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 23:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405907AbgFYVWB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 17:22:01 -0400
Received: from mon2.sibername.com ([162.144.51.228]:53522 "EHLO
        mon1.sibername.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2403817AbgFYVWB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 17:22:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=gtJWDa0//FvU4bGdFASbsat/G6DD17PP8SzkbGLfxVg=; b=WBD9RWBoSdmymsafa4G9U3iPMS
        pv1PCh/nZd2B38vX3weeMPF5rAByOUk/qrcN2szcNbgZqV5rxqs2DHY/IdbWmmd5IPV+Tt+AvZkDV
        H+k6vanqFJRDWBPRf2VYTCXFqy3jMSchf9ol3qjP9+4xAFW1xOhUuHSwcDA4U2/VbfMfp8fV2sWYx
        wy/C/NqSrZtqpOP2eqbjiwCvEsfSB3sgLeb+BvN1wXPQx+o3u1672QktG20bxWZNSdt20r4xAKHu4
        YFPefYIbdRmynu5IhSY5L2HAP8RWGvlK/kcC+a9u5Kjo7FGAdWgf8UDj1YHb1tA/pIwNYFMu08kNF
        zfRiY55Q==;
Received: from [216.58.17.101] (port=55018 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <bjlockie@lockie.ca>)
        id 1joYxe-006hIS-JW
        for linux-usb@vger.kernel.org; Thu, 25 Jun 2020 16:59:08 -0400
Subject: Re: Alfa AWUS036ACM (Mediatek MT7612U) problem
To:     linux-usb <linux-usb@vger.kernel.org>
References: <59c96b05-2bdb-44d3-7371-6e5e05c20927@lockie.ca>
 <20200625183151.GA266690@rowland.harvard.edu>
From:   James <bjlockie@lockie.ca>
Message-ID: <f9f7e6ba-5d37-a42a-3de9-c97c76f8641c@lockie.ca>
Date:   Thu, 25 Jun 2020 16:58:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625183151.GA266690@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - montreal.sibername.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: montreal.sibername.com: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: montreal.sibername.com: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2020-06-25 2:31 p.m., Alan Stern wrote:
> On Thu, Jun 25, 2020 at 01:08:34PM -0400, James wrote:
>> I have an Alfa AWUS036ACM (Mediatek MT7612U) on a Raspberry Pi 4. with:
>> OpenWrt SNAPSHOT r13626-751e6ab8e6 / LuCI Master git-20.175.45303-bb95e67
>> Kernel Version: 5.4.48
>>
>> # lsusb
>> Bus 002 Device 002: ID 0e8d:7612 MediaTek Inc.
>>
>> |My AP keeps dieing (I suspect when it's under load and some other condition
>> :-(). mt76x2u 2-1:1.0: error: mt76x02u_mcu_wait_resp failed with -110| I
>> tried:
>>
>> https://superuser.com/questions/176319/hard-reset-usb-in-ubuntu-10-04
> Did you try running the usbreset program described in that web page?
I don't have that program and I can't compile on that platform.
I tried the script instead of trying to cross compile.
>
>> cd /sys/bus/usb/drivers/usb
>>
>> echo 2-2 > unbind ; sleep 3 ; echo 2-2 > bind I think it should be 2-1 so I
>> tried that:
>>
>> echo 2-1 > unbind ; sleep 3 ; echo 2-1 > bind
>>
>> |[ 3539.309730] mt76x2u 2-1:1.0: firmware upload failed: -110
>> [ 3540.828260] mt76x2u: probe of 2-1:1.0 failed with error -5|
>> That didn't work.
>> Physically removing reinserting works (if I also "reset" the wifi in OpenWrt
>> (I don't know what this does)).
>>
>> There must be a way to remove/reinsert in software instead of rebooting.
> Well no, actually there isn't.  Removing a cable breaks the power
> connection; if the device gets its power from the USB cable then it goes
> through a complete shutdown (and restart when you plug it back in).  On
> most computers and USB hubs, there is no way to turn off power to the USB
> ports in software -- the hardware simply won't do it.  _Some_ hubs can
> turn off port power, but most can't.
>
> It is possible to do various sorts of reset in software, such as by using
> the usbreset program mentioned above.  But none of them do exactly the
> same thing as unplugging and replugging the USB cable.
>
> Alan Stern
I guess I'll have to reboot if it loses the AP.
I can automate that. :-)
