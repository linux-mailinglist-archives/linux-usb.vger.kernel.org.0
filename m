Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 553B326A7F
	for <lists+linux-usb@lfdr.de>; Wed, 22 May 2019 21:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729734AbfEVTFJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 22 May 2019 15:05:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58920 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729702AbfEVTFI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 May 2019 15:05:08 -0400
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hTWXz-0001vs-D8
        for linux-usb@vger.kernel.org; Wed, 22 May 2019 19:05:07 +0000
Received: by mail-pg1-f197.google.com with SMTP id 63so2181225pga.18
        for <linux-usb@vger.kernel.org>; Wed, 22 May 2019 12:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=czfXF4X+WzadjYZP7hUsAFz3lA9BYtuDgy22wPY8BdM=;
        b=tmON9S8u2qFidwFncWLpaV+P7SYdjIJiQc5gG2q4XLhKg86rBYQRrc2Ax0Br1VOOvj
         YVjNkO4eE4+oHxhZZf2od0Hun/YNV/CQBPq/MuIq4aCyxLuUBDG/CVu2zWtQO94OK3Xi
         +KiBFGAHbFHkzpMDShk/A9PjYZC34lPXfjVi2AFbMLs093oF//NMFmRi1KY/2wXA7+9r
         6p3kV1441zuMxJOm3rGJzm7t5h8e784UqSok6wOZKbOlXIDkErms6x0llcRZsTyaRrp1
         yfjHX1F1yF2MklzL21ps2mvNastE9d/oJ6Ww2NIJ1DLPFXxcqDqqm7kBAaPY10J8CDXn
         HJ3g==
X-Gm-Message-State: APjAAAWotAFxP1K0tF+9ITGfkJGjVD01XudEvP31aVl7Tpc+/bYPPaPj
        xIW0o5JB41L0sYEWNeHNEeSAwDKFvU4y63CeHdFodS8j4vpYZ9BvQATrfTsOCcVh1lNbsEw+sPH
        ei++XMOOvYInregmkscbA5Jljg6rXa8R+uhfw4A==
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr21885945plv.298.1558551906122;
        Wed, 22 May 2019 12:05:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwICiuaHiG2EomDuE5aveWHHAOjp0PRky8IYbMLukmRtN+STI+JHnlJPa1KkQOBxiMrcxBL6Q==
X-Received: by 2002:a17:902:9a4c:: with SMTP id x12mr21885926plv.298.1558551905870;
        Wed, 22 May 2019 12:05:05 -0700 (PDT)
Received: from [192.168.1.220] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id i27sm53077607pfk.162.2019.05.22.12.05.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 12:05:05 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] PCI / PM: Don't runtime suspend when device only supports
 wakeup from D0
From:   Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20190522185339.pfo5xeopyz2i5iem@wunner.de>
Date:   Thu, 23 May 2019 03:05:08 +0800
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Rafael Wysocki <rafael.j.wysocki@intel.com>,
        linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <850CC1CD-2043-4C32-8BB1-5F5BAC1DDF55@canonical.com>
References: <20190522181157.GC79339@google.com>
 <Pine.LNX.4.44L0.1905221433310.1410-100000@iolanthe.rowland.org>
 <20190522185339.pfo5xeopyz2i5iem@wunner.de>
To:     Lukas Wunner <lukas@wunner.de>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On May 23, 2019, at 2:53 AM, Lukas Wunner <lukas@wunner.de> wrote:
> 
> On Wed, May 22, 2019 at 02:39:56PM -0400, Alan Stern wrote:
>> According to Kai, PME signalling doesn't work in D0 -- or at least, it
>> is _documented_ not to work in D0 -- even though it is enabled and the
>> device claims to support it.
>> 
>> In any case, I don't really see any point in "runtime suspending" a 
>> device while leaving it in D0.  We might as well just leave it alone.
> 
> There may be devices whose drivers are able to reduce power consumption
> through some device-specific means when runtime suspending, even though
> the device remains in PCI_D0.  The patch would cause a power regression
> for those.
> 
> In particular, pci_target_state() returns PCI_D0 if the device lacks the
> PM capability.

So an explicit device_can_wakeup() check before calling pci_target_state()
is needed to avoid the case you described.

I’ll add this in patch v2.

Kai-Heng

> 
> Thanks,
> 
> Lukas

