Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5936E174823
	for <lists+linux-usb@lfdr.de>; Sat, 29 Feb 2020 17:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727194AbgB2Qt1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Feb 2020 11:49:27 -0500
Received: from mon1.sibername.com ([162.144.64.251]:53386 "EHLO
        montreal.sibername.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbgB2Qt1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Feb 2020 11:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
         s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version
        :Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=zxV31DLTEqDnPLzXUWuI9UP2Ym6+mwLi/zDIulQmJ0w=; b=dMExKoMZWO6VNNXFrCQVZQW0ww
        E/HSgORRsg0K1aJTvovaTdPr6nVjr3XapOLQ9ykjpZXHS9MZ525F8QhuzsyODnQGzn7imIvSmG+1e
        3PWATvYYc+SVL6gEp2ZLsAqn72bixwkewDMqlCSb9fBh1+6lom/8/qs4+7wc9WAkduvEGnFsrHxJ6
        LIJvbZojHhcf5DwIpG0D2UpSNIIq+zWDiX9uenNVyDmjuUECvWQLVCkwZVY3EH5+ZUNjFZqyJ7Sh+
        oXBC1YL9amh2CPiWWUMYZNLt7NR+DKmJJBKikp/CA0DXtcd+k4wNO528quWcET+Vy0ZMiRasNtJOd
        +OtknvYA==;
Received: from 216-58-17-101.cpe.distributel.net ([216.58.17.101]:44990 helo=[192.168.1.4])
        by montreal.sibername.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <bjlockie@lockie.ca>)
        id 1j85Iq-00AB6P-9n
        for linux-usb@vger.kernel.org; Sat, 29 Feb 2020 11:49:25 -0500
Subject: Re: USB2 device?
To:     linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002291103560.16560-100000@netrider.rowland.org>
From:   James <bjlockie@lockie.ca>
Message-ID: <40906feb-3f4e-860d-ed31-a6ecbf6fbc89@lockie.ca>
Date:   Sat, 29 Feb 2020 11:49:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2002291103560.16560-100000@netrider.rowland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 2020-02-29 11:12 a.m., Alan Stern wrote:
> On Fri, 28 Feb 2020, James wrote:
>
>
>> $ lsusb -t
>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>>       |__ Port 1: Dev 6, If 0, Class=Vendor Specific Class,
>> Driver=rtl88x2bu, 480M
>>
>>     bcdUSB               2.10
>> Means it's USB2,  right?
>
>> How reliable is this?
> Quite reliable.  However, on occasion something goes wrong when a
> USB-3 device is plugged in.  For some reason the USB-3 connection
> fails; when this happens the device switches over to the USB-2
> connection and then communicates at the lower speed.  It still works,
> but in a degraded manner.
>
>
If something went wrong would it still say bcdUSB 2.10?
It's marketed as USB 3 and it is important to have the bandwidth because 
it is a network device.

