Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF261B462A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Apr 2020 15:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgDVNXc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 22 Apr 2020 09:23:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45981 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726141AbgDVNXa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Apr 2020 09:23:30 -0400
Received: from mail-pl1-f199.google.com ([209.85.214.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jRFJK-0003jR-VV
        for linux-usb@vger.kernel.org; Wed, 22 Apr 2020 13:21:07 +0000
Received: by mail-pl1-f199.google.com with SMTP id w3so1837402plz.15
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 06:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=T0LMZyTXWoFEf1aVh2cXDeose+ywIML9Nz9WjlzDhZo=;
        b=n8F/n4D1SH0CtutxsB6GJDLGA06gOQAw71dnxeqlglciB2rYZes4gz/n+XEcOjBblo
         UTMd6Y+koFkCaYNwRIa7nn39L9K8AFSfl8U6wBvYeqys0ZttVoymgj82PZBcgyWAH+33
         HVv8m3xtSIPC3h+ylFYFv/IRZIlYc5YzSAKf5SxjDywlCZ6Q27ET2EqQovMvtxabh9oE
         xHw7qB82foUd6jCOg0AUwTFI2Q0cz7Y2s2eFxVGz8Za0kv7s2YrHyuzawTnsrQFJkoTB
         qgLMwEk8U8PixHvE5t6MC+2QV/zeAUHtgMFexM60QT5UTWVoiDRn3a4tzxSpSSwunIau
         qZXg==
X-Gm-Message-State: AGi0PuZ+/cp+TgYeoqfcaG5HilHQNM5JOfm3scw5tkHhyOtFlLQVfOyF
        KNMXfzcAA/Rk20rfeG7IGDrNvZYDguSxxlFw+0XWzkql/BNMcMPbZnVEE5BkSesM9ZvIOmBRDfL
        fNNCi0itX3zvlfbOdOnqO2VuWSQR10W6RGriB4g==
X-Received: by 2002:a17:902:8a89:: with SMTP id p9mr26137226plo.286.1587561665310;
        Wed, 22 Apr 2020 06:21:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypLfA2O6VBk6BTeueKPVTORTPr78NbnZL7Zb6Nrl273jlScDPEo8rwuxAVxViRLC6q6jC2RXNA==
X-Received: by 2002:a17:902:8a89:: with SMTP id p9mr26137195plo.286.1587561664959;
        Wed, 22 Apr 2020 06:21:04 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id w66sm5456578pfw.50.2020.04.22.06.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 06:21:04 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v2] xhci: Set port link to RxDetect if port is not enabled
 after resume
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <B4E44BDC-5AFE-4F8A-8498-0EEE9CDAC0E1@canonical.com>
Date:   Wed, 22 Apr 2020 21:21:01 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <635B3350-F064-4B45-B194-40F793423049@canonical.com>
References: <20200311040456.25851-1-kai.heng.feng@canonical.com>
 <B4E44BDC-5AFE-4F8A-8498-0EEE9CDAC0E1@canonical.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Mar 26, 2020, at 19:33, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> Hi Mathias,
> 
>> On Mar 11, 2020, at 12:04, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>> 
>> On Dell TB16, Realtek USB ethernet (r8152) connects to an SMSC hub which
>> then connects to ASMedia xHCI's root hub:
>> 
>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
>>   |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
>>           |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
>> 
>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp. USB5537B
>> Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
>> 
>> The port is disabled after resume:
>> xhci_hcd 0000:3f:00.0: Get port status 4-1 read: 0x280, return 0x280
>> 
>> According to xHCI 4.19.1.2.1, we should set link to RxDetect to transit
>> it from disabled state to disconnected state, which allows the port to
>> be set to U0 and completes the resume process.
>> 
>> My own test shows port can still resume when it's not enabled, as long
>> as its link is in U states. So constrain the new logic only when link is
>> not in any U state.
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> 
> Do you think this is a proper fix?

Another gentle ping...

> 
> Kai-Heng
> 
>> ---
>> drivers/usb/host/xhci-hub.c | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>> index a9c87eb8951e..263f9a9237a1 100644
>> --- a/drivers/usb/host/xhci-hub.c
>> +++ b/drivers/usb/host/xhci-hub.c
>> @@ -1776,6 +1776,14 @@ int xhci_bus_resume(struct usb_hcd *hcd)
>> 			clear_bit(port_index, &bus_state->bus_suspended);
>> 			continue;
>> 		}
>> +
>> +		/* 4.19.1.2.1 */
>> +		if (!(portsc & PORT_PE) && (portsc & PORT_PLS_MASK) > XDEV_U3) {
>> +			portsc = xhci_port_state_to_neutral(portsc);
>> +			portsc &= ~PORT_PLS_MASK;
>> +			portsc |= PORT_LINK_STROBE | XDEV_RXDETECT;
>> +		}
>> +
>> 		/* resume if we suspended the link, and it is still suspended */
>> 		if (test_bit(port_index, &bus_state->bus_suspended))
>> 			switch (portsc & PORT_PLS_MASK) {
>> -- 
>> 2.17.1
>> 
> 

