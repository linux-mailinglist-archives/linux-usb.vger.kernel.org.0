Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A617C1F580B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jun 2020 17:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730279AbgFJPn4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 10 Jun 2020 11:43:56 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43315 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbgFJPnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Jun 2020 11:43:53 -0400
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jj2tL-0003XO-Lu
        for linux-usb@vger.kernel.org; Wed, 10 Jun 2020 15:43:51 +0000
Received: by mail-pg1-f197.google.com with SMTP id m15so1711320pgl.15
        for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2020 08:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=pIEJ2ejVSoH3NHNxiiH0JO+dQepzCs9hxzeYyLsKYnE=;
        b=kHh7S+l/VVArwStr20zovCCnmsy+BBcEYq3xXNc+voR850DKesd/L82Z4sYrzeXuP/
         0He7wWA/uFgi2avp5RmKCjJ3CSg5L1fhfIQRNZXl0Yaiz7WpOAEY0DmXAIktE7Scq07p
         N56SsJ0fVS182XjwzbcVpuc12MpN/VCZTpUnOmJJ9OY6VFaiyYnFNrDB1Qi2P4v4clli
         AIHFX8pvAAFrm5JN6xZK5sHhPoeDL4okqqix2p0K7PhE5Kxaplw1LrgasVQyj4zz18Nh
         HqEIIzbuZn1oQ+nFuz5+bD+E678H5sTemt17mxi+OEjeXykPTmYT3XM30kMbazfsGSAG
         8GoQ==
X-Gm-Message-State: AOAM532g+jro7GDWCpPi65/Kg2OdlsMZS3p6gVgUzXFtNcwy0jCE7rcW
        6dcejCutXfV0mYAw23Ptb/zPDlfsoFYOgesiOOPMTGEfzOAXUrFt3MFLjDRMAeaCAh1byc2ZjXy
        viQ82/UOLvhqC4F3DMKd5n4TUehUVIkLTUhfR0Q==
X-Received: by 2002:a65:6446:: with SMTP id s6mr3249825pgv.59.1591803830124;
        Wed, 10 Jun 2020 08:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsEfzhKGoIHjpkOEW5GETqwgNMAaWSKvOESWqkOMSTCehmvPiglPaqM0tVbdoshUenRPFCjw==
X-Received: by 2002:a65:6446:: with SMTP id s6mr3249805pgv.59.1591803829731;
        Wed, 10 Jun 2020 08:43:49 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id y23sm230676pgc.78.2020.06.10.08.43.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jun 2020 08:43:49 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] xhci: Suspend ports to U3 directly from U1 or U2
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200610143220.GC11727@rowland.harvard.edu>
Date:   Wed, 10 Jun 2020 23:43:46 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <591D2A1F-9645-4B0B-896C-99544F06DFAA@canonical.com>
References: <20200610064231.9454-1-kai.heng.feng@canonical.com>
 <20200610143220.GC11727@rowland.harvard.edu>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Jun 10, 2020, at 22:32, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> On Wed, Jun 10, 2020 at 02:42:30PM +0800, Kai-Heng Feng wrote:
>> xHCI spec "4.15.1 Port Suspend" states that port can be put to U3 as long
>> as Enabled bit is set and from U0, U1 or U2 state.
>> 
>> Currently only USB_PORT_FEAT_LINK_STATE puts port to U3 directly, let's
>> do the same for USB_PORT_FEAT_SUSPEND and bus suspend case.
>> 
>> This is particularly useful for USB2 devices, which may take a very long
>> time to switch USB2 LPM on and off.
> 
> Have these two patches been tested with a variety of USB-2.0 and USB-2.1 
> devices?

I tested some laptops around and they work fine.
Only internally connected USB devices like USB Bluetooth and USB Camera have USB2 LPM enabled, so this patch won't affect external connected devices.

Kai-Heng

> 
> Alan Stern

