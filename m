Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED84488759
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 03:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235067AbiAICTh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jan 2022 21:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbiAICTg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jan 2022 21:19:36 -0500
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D38C06173F
        for <linux-usb@vger.kernel.org>; Sat,  8 Jan 2022 18:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=jPl9tnvtEAe3axJlEvWwz6PCPyaRQbW1LtUfZdPKzIg=; b=F6q1nTLBBJ7Akr65vaGd+SPG3J
        hebZnpit3XLylVAoHocaw/bFKYLzXJNpKZQNVjxsJ9uk+VmQYwjF2Fc9mnYGKYImY1MGXPA2NoeCF
        VlzMRTBK3jbjI8ho7Sjt7q9r09wy7iYdaGAQpcjqR6VbJDuTiSEIAdbSzanDSRtxSRA5BBxGc69rA
        ju0UsxPQLsdlmII+HS3+2KsOl+Gqawl1Mv1hYMD6xMGnj6t2I+g6FaldcdHqZRg3KNXVq3Rd8bX3i
        55pag3YuH9MOaxQARYoUAHAve8lHSzutAkNccPTHiIP7TkbNZToZ+JiSOqofQGvdkw9inwoO3gUBc
        0VDYWr3A==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n6Nnx-00090L-BU; Sun, 09 Jan 2022 02:19:33 +0000
Message-ID: <7d9c9c91-ae1b-47e5-0b5c-de0fd8f826b4@infradead.org>
Date:   Sat, 8 Jan 2022 18:19:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: why does my keyboard have 2 interfaces?
Content-Language: en-US
To:     James <bjlockie@lockie.ca>, linux-usb <linux-usb@vger.kernel.org>
References: <01df8679-05fa-9728-c853-51576c49a7bb@lockie.ca>
 <6d26d56a-0572-f6b2-4895-c3fd7063276d@lockie.ca>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <6d26d56a-0572-f6b2-4895-c3fd7063276d@lockie.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/8/22 16:21, James wrote:
> 
> $ lsusb -tv
>  /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 1: Dev 5, If 0, Class=Human Interface Device, Driver=usbhid, 1.5M
>          ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard

Interface 0 is the control interface, for setup/config/etc commands.

>      |__ Port 1: Dev 5, If 1, Class=Human Interface Device, Driver=usbhid, 1.5M
>          ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard

Interfaces 1..N are for function data transfer.

> 
> I tried my other computer and all the devices seem to have 2 interfaces.
> 
>  lsusb -tv
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 4: Dev 9, If 1, Class=Human Interface Device, Driver=usbhid, 12M
>         ID 25a7:fa61 Areson Technology Corp Elecom Co., Ltd MR-K013 Multicard Reader
>     |__ Port 4: Dev 9, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>         ID 25a7:fa61 Areson Technology Corp Elecom Co., Ltd MR-K013 Multicard Reader
>     |__ Port 5: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
>         ID 0408:a061 Quanta Computer, Inc.
>     |__ Port 5: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
>         ID 0408:a061 Quanta Computer, Inc.
>     |__ Port 7: Dev 4, If 0, Class=Vendor Specific Class, Driver=, 12M
>         ID 04f3:0c03 Elan Microelectronics Corp.
>     |__ Port 10: Dev 5, If 0, Class=Wireless, Driver=btusb, 12M
>         ID 8087:0026 Intel Corp.
>     |__ Port 10: Dev 5, If 1, Class=Wireless, Driver=btusb, 12M
>         ID 8087:0026 Intel Corp.
> 

-- 
~Randy
