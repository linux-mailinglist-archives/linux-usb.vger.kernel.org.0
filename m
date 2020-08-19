Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB2524A037
	for <lists+linux-usb@lfdr.de>; Wed, 19 Aug 2020 15:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgHSNjk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Aug 2020 09:39:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgHSNji (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Aug 2020 09:39:38 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF491C061757
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 06:39:36 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id k4so20648474ilr.12
        for <linux-usb@vger.kernel.org>; Wed, 19 Aug 2020 06:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K750lhVhvQCGJRLgK465vJm+czXmMzEaBcFDRWtgZug=;
        b=wBx0Dj8TY552WXXZXrlqOXix2xITA1QGNg6/X4+/dIYZQrzFzweSGq8AZr+8ksLI4D
         b6Z1metQv84csOAztrgWKkDr2FHgLV3ijWbdJchoQ6aNahDapEyaOJPQyxiziCxBQQ6Q
         aDwaEJwIHs7pG9omj5QDAyXsCugtn6YI3zqWzqnlu82C5H1xthsP2Yi4yXFx+DMM5agB
         6+loghg4qEoEjLn/HfgE1HLaKPhUhXYlzQ4H2T8XdTLeUsly/xdrkPE4b6g3jL8LO4uk
         +OYz60OTloDSivBnT2+UwE3yzQKbWLmABvfVin7rdN/Qe21BpUlD4w4eUi9DT2qPZMGj
         aIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K750lhVhvQCGJRLgK465vJm+czXmMzEaBcFDRWtgZug=;
        b=NYrTrXNbZEId5NZ4pzWCE2J2bGzkoPkzUAomuWfXseZLxqm4vvjXHoMFozNJCcxT6k
         gv+dEl8k/5MmWplfulVXLcJQfNA4Pc4Dev53QlSDE+JFRAfcejd69zHCERQOLAGLj4PN
         OP1YNgObIzJFaryiHlMpVxu+uXFNGd+eVYr0pDndF2+4T2BCoqW43a9bRCLj5siBdk5z
         PFfe+1AmUXdWiSCsDyTJAUJWfxjS0N0uZpC4vVz0Fk5q7FiART2IssMHfRtd2ld/0aiZ
         4qAKghBlL/QioA9DIy2O/hMQqjELxnPAqSYJ155mF8IeoPSJyfKiNxy7TEr742GuzkMY
         bx1g==
X-Gm-Message-State: AOAM5327uwCFjKarQO7LJCfswgEli+8lmher+mKcYmTeHYIJ7oDXznLO
        5W68hV7dOxmSPdz/M3V06hhyVu1pYYY/b8j6PrifLg==
X-Google-Smtp-Source: ABdhPJwS5BIyuWHOygJr8vGXgRiILhx6HW5gQgbZrzcX1uNX+XxZNH+pAR2e9Eh1aEyzVkxTX1LbqnRHerheERLYdpk=
X-Received: by 2002:a92:98c8:: with SMTP id a69mr23477634ill.0.1597844375862;
 Wed, 19 Aug 2020 06:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200818165848.4117493-1-lorenzo@google.com> <20200818165848.4117493-3-lorenzo@google.com>
 <CAHo-Oozepnrdw1ng1XvFURYZPc9L7FkmiMDJMsZ76PEyuDt8jw@mail.gmail.com>
In-Reply-To: <CAHo-Oozepnrdw1ng1XvFURYZPc9L7FkmiMDJMsZ76PEyuDt8jw@mail.gmail.com>
From:   Lorenzo Colitti <lorenzo@google.com>
Date:   Wed, 19 Aug 2020 22:39:24 +0900
Message-ID: <CAKD1Yr0bMB-4vJAHdtu5CQ6GH5UVf0zg=axc_XXN1MYVQnxqHg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: gadget: f_ncm: allow using NCM in SuperSpeed
 Plus gadgets.
To:     =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <zenczykowski@gmail.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 7:40 AM Maciej =C5=BBenczykowski
<zenczykowski@gmail.com> wrote:
> All the dongles I've looked at seem to place MaxBurst just after MaxPacke=
tSize,
> and not in a separate descriptor (and don't place burst on the
> status/config channel).

You're right, that looks wrong. In my patches, the companion
descriptor sets max burst of 15 on ss_ncm_notify_comp_desc (and
ss_ncm_notify_comp_desc), which is an interrupt IN endpoint with a max
packet size of 16. This probably doesn't make sense, and in any case
is prohibited by the spec:

=3D=3D=3D=3D=3D=3D
The only allowable maximum data payload size for interrupt endpoints
is 1024 bytes for interrupt endpoints that support a burst size
greater than one and can be any size from 1 to 1024 for an interrupt
endpoint with a burst size equal to one. The maximum allowable burst
size for interrupt endpoints is three.
=3D=3D=3D=3D=3D=3D

Will respin this series to leave ss_ncm_notify_comp_desc and
ssp_ncm_notify_comp_desc at a burst of 0.

> What does "lsusb -d ... -v" show from the host side?

Output when on a 10 Gbps link:

    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass          2 Communications
      bFunctionSubClass      13
      bFunctionProtocol       0
      iFunction               7 CDC NCM
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         2 Communications
      bInterfaceSubClass     13
      bInterfaceProtocol      0
      iInterface              4 CDC Network Control Model (NCM)
      CDC Header:
        bcdCDC               1.10
      CDC Union:
        bMasterInterface        0
        bSlaveInterface         1
      CDC Ethernet:
        iMacAddress                      5 fab33fdead72
        bmEthernetStatistics    0x00000000
        wMaxSegmentSize               1514
        wNumberMCFilters            0x0000
        bNumberPowerFilters              0
      CDC NCM:
        bcdNcmVersion        1.00
        bmNetworkCapabilities 0x11
          crc mode
          packet filter
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0010  1x 16 bytes
        bInterval               9
        bMaxBurst              15
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This looks wrong, see above.


    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0
      bInterfaceProtocol      1
      iInterface              6 CDC Network Data
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass        10 CDC Data
      bInterfaceSubClass      0
      bInterfaceProtocol      1
      iInterface              6 CDC Network Data
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This looks correct (max burst of 15 on the bulk in endpoint).

      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst              15
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This looks correct (max burst of 15 on the bulk out endpoint).
