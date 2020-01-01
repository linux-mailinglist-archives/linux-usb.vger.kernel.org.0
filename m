Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6B1E12E0FA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 00:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgAAXRD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jan 2020 18:17:03 -0500
Received: from mail-il1-f176.google.com ([209.85.166.176]:36117 "EHLO
        mail-il1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgAAXRC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jan 2020 18:17:02 -0500
Received: by mail-il1-f176.google.com with SMTP id b15so32915017iln.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Jan 2020 15:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1DAmt3HX3pNvx6nLBYAhfDo/Nijh0UB264BEIMDqLWs=;
        b=C1KD87bUKQItLOJFUWJPpEnu2R+2RRMhLTaNpSEUuwRgHlmuWeFWQE87SdyWZjjTZs
         0Qo4XUKb1JYnLkKBzE0XHxMxVbf6kMHw1sDFGm/3A30K99Onmeu4B3GMRiY3x35VZzE1
         Q2tJ8nFGC8TbAZ17egS3OU9nRkfb404d6s/A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1DAmt3HX3pNvx6nLBYAhfDo/Nijh0UB264BEIMDqLWs=;
        b=WFq6BL131fHNa/Y+GKQnHQnGLzdhuEAo0lI4pybR03ApndmCYhLk9/rRg25L2sIF9M
         hSMCB6cakoQYEwtrHHfVfUn9qIHmMK6UxGXZltGi+IWVLRjVqKqRUPzsI55xagAaxD8r
         yyU4kNC30ex9gyupKc78if9gYXVv7zHiOZmqcITmG77T9whEedU/Ui2qBhLc6RN/202Q
         eFokqneAJ9NcgHDobCdwHUuMtZHnt+t4tY1Eh6UgktzTtCcP3dHevlsKIMzBbU2Czxg6
         krMVzAj469sujHwnbrK+LysaM6sSFxEoxabs/X2z30pIRXXxmucb6XIPJv1fngl+HIsf
         IznA==
X-Gm-Message-State: APjAAAXonZizabFrxoI7XGY/6KtG1I310Rn+yfY1EU8F7HHoS1ecC9ij
        GVf7IfxiLyDV+Y5pRnvgtbYaBw==
X-Google-Smtp-Source: APXvYqzjYoCVQOgHZpRQwd3f/JYKmo44j5lHkLv1k10X+1xR3CiT7xRhqE0gWIkRBd8N/Ol3wxsgkw==
X-Received: by 2002:a92:901:: with SMTP id y1mr65914117ilg.274.1577920622071;
        Wed, 01 Jan 2020 15:17:02 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id r10sm13517873iot.28.2020.01.01.15.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jan 2020 15:17:01 -0800 (PST)
Subject: Re: [issue] usbip: vhci-hcd: Device unable to get work after reset
To:     Zhai Zhaoxuan <kxuanobj@gmail.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <9b961779-abe7-f6a4-3f2b-f9303ef39c5b@gmail.com>
 <804f452e-e724-b508-80e7-cfd05da2ff84@linuxfoundation.org>
 <3e97b00c-ca87-0085-3f8e-6e85fd9b6c30@gmail.com>
 <6ee3a823-4359-41f1-0cd6-1b0b22d5dea3@linuxfoundation.org>
 <5333270a-e6c4-4aa1-1cbf-8f2e7ba81434@gmail.com>
 <0980a31b-8af7-02da-8780-ce8f5db36053@gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d33b105c-c398-cb13-83ec-26455b7664d9@linuxfoundation.org>
Date:   Wed, 1 Jan 2020 16:17:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0980a31b-8af7-02da-8780-ce8f5db36053@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Zhai Zhaoxuan,

On 1/1/20 4:50 AM, Zhai Zhaoxuan wrote:
> Hi Shuah,
> 
> 
> It has been almost 3 weeks since the last email.

December got away from em with holidays and vacation time.
Sorry for the delay.

> 
> Can you confirm if this is a bug or a feature?
> 
> 

The behavior you are seeing is specific to how your use-case.

> I am trying to implement a virtual USB device using usbip. But I get a trouble.
> 
> When a running port on vhci_hcd is resetted (by setting USB_PORT_FEAT_RESET), it will never be enabled again.
> 
> The kernel version is 5.5.0-rc1-00012-g6794862a16ef.
> In the source file drivers/usb/usbip/vhci_hcd.c:
> 
>  565         case USB_PORT_FEAT_RESET:
> ...
>  572             /* if it's already enabled, disable */
>  573             if (hcd->speed == HCD_USB3) {
>  574                 vhci_hcd->port_status[rhport] = 0;
>  575                 vhci_hcd->port_status[rhport] =
>  576                     (USB_SS_PORT_STAT_POWER |
>  577                      USB_PORT_STAT_CONNECTION |
>  578                      USB_PORT_STAT_RESET);
>  579             } else if (vhci_hcd->port_status[rhport] & USB_PORT_STAT_ENABLE) {
>  580                 vhci_hcd->port_status[rhport] &= ~(USB_PORT_STAT_ENABLE
>  581                     | USB_PORT_STAT_LOW_SPEED
>  582                     | USB_PORT_STAT_HIGH_SPEED);
>  583             }
>  584
> 
> The USB_PORT_STAT_ENABLE is cleard. And it should be set later.
> But, the GetPortStatus only set the USB_PORT_STAT_ENABLE for not-assigned ports.
> 
>  430     case GetPortStatus:
> ...
>  456             if (vhci_hcd->vdev[rhport].ud.status ==
>  457                 VDEV_ST_NOTASSIGNED) {
>  458                 usbip_dbg_vhci_rh(
>  459                     " enable rhport %d (status %u)\n",
>  460                     rhport,
>  461                     vhci_hcd->vdev[rhport].ud.status);
>  462                 vhci_hcd->port_status[rhport] |=
>  463                     USB_PORT_STAT_ENABLE;
>  464             }
> 
> The used port (status == VDEV_ST_USED) will be disabled after USB_PORT_FEAT_RESET, and unable to be enabled again.
> 
> Should VDEV_ST_USED be added to line 457?
> And if it shouldn't, how can I enable a port after USB_PORT_FEAT_RESET? 

Right.There is no need to clear VDEV_ST_USED because the port is still
used, and reset is sent to the usbip_host. VDEV_ST_NOTASSIGNED indicates
that the port is in used state with no usb addresses assigned.

I am not sure what is happening in your environment. It would be useful
to see dmesg from the usbip server and client in you environment.

I would be very interested to see if you can reproduce this problem
outside the USB Redirect scenario.

thanks,
-- Shuah





