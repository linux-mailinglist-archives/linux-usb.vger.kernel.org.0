Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDDC488748
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 02:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233631AbiAIBcr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 8 Jan 2022 20:32:47 -0500
Received: from titan58.planetwebservers.net ([51.79.1.102]:50317 "EHLO
        titan58.planetwebservers.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229991AbiAIBcq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 8 Jan 2022 20:32:46 -0500
X-Greylist: delayed 4303 seconds by postgrey-1.27 at vger.kernel.org; Sat, 08 Jan 2022 20:32:46 EST
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lockie.ca;
        s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:To:References
        :From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=b1wOFzcX+eRDnRsDZGq5cOYgLvyXw11ilts0O+jOh3s=; b=f2pugsZT14U6dkruo+cNGpKgv3
        5Fo00HOY1nJOqeLWp/Lq0dPfUgYAPy9wzmONFlWEIUm/Drg6Sig/+hu7d9f/s2fruJiLegwl5QHt2
        cy75YIV5OT68bbh+izFRseu8bgSEej4Ej7DBN3XevHkscPGHLRTFdll/ql0cwypqiTxJXw9nF/xI9
        4UXo2N3V7r256R7Csux2uwjCNkBetemTMXJ5fOhx4eP6xSjIykVoDrvIR7xDqBwZ1QnZuhxxrJWUq
        ulwJP5jTfP09hQgfv/McopYXM3B2aR8znf01md355gkt5elllK9/DMC5vsuX0WmLUED1ZSWv4Hge0
        Xng1vmCA==;
Received: from [37.19.213.158] (port=38626 helo=[10.5.0.2])
        by titan.planetwebservers.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <bjlockie@lockie.ca>)
        id 1n6LxG-000701-4f
        for linux-usb@vger.kernel.org; Sun, 09 Jan 2022 11:21:02 +1100
Message-ID: <6d26d56a-0572-f6b2-4895-c3fd7063276d@lockie.ca>
Date:   Sat, 8 Jan 2022 19:21:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: why does my keyboard have 2 interfaces?
Content-Language: en-US
From:   James <bjlockie@lockie.ca>
References: <01df8679-05fa-9728-c853-51576c49a7bb@lockie.ca>
To:     linux-usb <linux-usb@vger.kernel.org>
In-Reply-To: <01df8679-05fa-9728-c853-51576c49a7bb@lockie.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - titan.planetwebservers.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lockie.ca
X-Get-Message-Sender-Via: titan.planetwebservers.net: authenticated_id: bjlockie@lockie.ca
X-Authenticated-Sender: titan.planetwebservers.net: bjlockie@lockie.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


$ lsusb -tv
  /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
      ID 1d6b:0002 Linux Foundation 2.0 root hub
      |__ Port 1: Dev 5, If 0, Class=Human Interface Device, 
Driver=usbhid, 1.5M
          ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
      |__ Port 1: Dev 5, If 1, Class=Human Interface Device, 
Driver=usbhid, 1.5M
          ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard

I tried my other computer and all the devices seem to have 2 interfaces.

  lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/6p, 10000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 4: Dev 9, If 1, Class=Human Interface Device, 
Driver=usbhid, 12M
         ID 25a7:fa61 Areson Technology Corp Elecom Co., Ltd MR-K013 
Multicard Reader
     |__ Port 4: Dev 9, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M
         ID 25a7:fa61 Areson Technology Corp Elecom Co., Ltd MR-K013 
Multicard Reader
     |__ Port 5: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
         ID 0408:a061 Quanta Computer, Inc.
     |__ Port 5: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
         ID 0408:a061 Quanta Computer, Inc.
     |__ Port 7: Dev 4, If 0, Class=Vendor Specific Class, Driver=, 12M
         ID 04f3:0c03 Elan Microelectronics Corp.
     |__ Port 10: Dev 5, If 0, Class=Wireless, Driver=btusb, 12M
         ID 8087:0026 Intel Corp.
     |__ Port 10: Dev 5, If 1, Class=Wireless, Driver=btusb, 12M
         ID 8087:0026 Intel Corp.

