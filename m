Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2814132475F
	for <lists+linux-usb@lfdr.de>; Thu, 25 Feb 2021 00:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235541AbhBXXJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Feb 2021 18:09:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbhBXXJV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Feb 2021 18:09:21 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EA1C06174A
        for <linux-usb@vger.kernel.org>; Wed, 24 Feb 2021 15:08:41 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id l64so4201687oig.9
        for <linux-usb@vger.kernel.org>; Wed, 24 Feb 2021 15:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rollanet.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wpj+a9V2DGnr0WTvH1xhbbreuTOrd8eGzy9YprlAGH4=;
        b=XZI8d2HAG+PXl7FXfcDlt5TQpLFgtPQetHTJfI6IpBsL/c8Rf8jUVT/rNIWvpSw/aJ
         zd7LIOJIxH1GQTasUEOQHY+vaPowcb3zW67jkoHUr0/s1LBNkT/pGyuDKXqTLPtR7ZUq
         QH115lVITHW2rNwKBRRvd+IbbPhAOu+Rprud4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wpj+a9V2DGnr0WTvH1xhbbreuTOrd8eGzy9YprlAGH4=;
        b=pECLjlrC5ecDZWr7wZ505M8dnzN+d3qwSo+KXTyl/qtaHi1szKxNFGzTBUn5K0Wamn
         XWtras0iypkUX6EjZ/z+6nHkxmOYYOKU37eouavJOiMPi4Ng6crV6RKE6nxaDMHH1Tex
         xQ6nk3rg9kB2Em8zm/HdJ9VhYTfhs2YlQrxzADfAwcrCAm996+gElsrOXUYVP9qaRsNg
         O2cZXkYQKkdEufwO0G5ybpyO5NBfjROHZ3RnHSDWmGilnR14YlwnSMS3M4BQlZNoP1Hv
         owvXK2RNLpAtPcNAWT4nhbBbVnljtG5na/VAHnkDXYsVxxMYL7MD0uLdRxvXbcM6xiWn
         pe0g==
X-Gm-Message-State: AOAM532g4s49DnUWfaxysHl/DeM9ottmuDR5x9hTQTWHXek+ok84SgFz
        Rz/A3+Z2DNCdKD/0faPBWR6IjbgYxNLaD3QaSG0/mQ==
X-Google-Smtp-Source: ABdhPJya/F7ZAHjdEhuzxI9gop64Kvg2YCTi/GZAPPQH+qO1s6iohv/sozlJb/Tenm6AHlcLKegsn5QwvcjJehxIrvg=
X-Received: by 2002:aca:1113:: with SMTP id 19mr4277792oir.32.1614208120498;
 Wed, 24 Feb 2021 15:08:40 -0800 (PST)
MIME-Version: 1.0
References: <3aee5708-7961-f464-8c5f-6685d96920d6@IEEE.org>
 <dc3458f1-830b-284b-3464-20124dc3900a@IEEE.org> <YDNwxtDxd7JntAXt@hovoldconsulting.com>
 <e2dcc839-3b43-2c80-6ad1-2d97e639b46a@IEEE.org> <YDOvLseYXaUHs0lS@hovoldconsulting.com>
 <fb1489c2-b972-619b-b7ce-4ae8e1d2cc0f@IEEE.org> <YDPO/JprcDTaPmR4@hovoldconsulting.com>
 <0f9caf26-af58-13a9-9947-47bb646f505e@IEEE.org> <YDPS3AP63/PwmwJU@hovoldconsulting.com>
 <cd92ea17-4e0a-2b6c-1032-9a81727841c9@IEEE.org> <YDPgVZ4GbNq6cGDP@hovoldconsulting.com>
In-Reply-To: <YDPgVZ4GbNq6cGDP@hovoldconsulting.com>
From:   Joe Abbott <jabbott@rollanet.org>
Date:   Wed, 24 Feb 2021 17:08:28 -0600
Message-ID: <CADuz4ON8Jj5unz_eeD--7n5kp2uQmqeyM_2-DTrTFKFwFtoudw@mail.gmail.com>
Subject: Re: non-standard baud rates with Prolific 2303 USB-serial
To:     Johan Hovold <johan@kernel.org>
Cc:     "Michael G. Katzmann" <michaelk@ieee.org>,
        charles-yeh@prolific.com.tw, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, Charles Yeh <charlesyeh522@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 22, 2021 at 10:48 AM Johan Hovold <johan@kernel.org> wrote:

>
> Joe, would you mind posting the output of "lsusb -v" for your device as
> well?
>
Bus 007 Device 002: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x2303 PL2303 Serial Port
  bcdDevice            3.00
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           39
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x000a  1x 10 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               0
Device Status:     0x0000
  (Bus Powered)

Also, here's the 110b windows wireshark capture
https://drive.google.com/file/d/1HP5RMRtP11zm4uQNzqlcbILGwebDJaOz/view?usp=sharing

Joe
