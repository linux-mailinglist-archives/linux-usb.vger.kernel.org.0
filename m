Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334C627BE37
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 09:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgI2Hjb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 29 Sep 2020 03:39:31 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53153 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgI2Hjb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 03:39:31 -0400
Received: from mail-pj1-f71.google.com ([209.85.216.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1kNAES-00057x-PD
        for linux-usb@vger.kernel.org; Tue, 29 Sep 2020 07:39:29 +0000
Received: by mail-pj1-f71.google.com with SMTP id f9so3580544pjp.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 00:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=FaS4Msu62B2hZhVAHv5KDuf0HZsqaYRRgWIx2cKWtok=;
        b=jOWesuawkXEewoexSdpA+zYCNXz8DdoRoUfE3i8hrzA2vNtyBJwpylSXZ4/4ttE0XG
         c1OdBtI/FAVKzvvH8tUKM+pQyqmB31dE04hxDdYttpadoZgYK8SOrSkEuSef60kQTvPY
         Klc9pK4uRJ+e4rU7p2g9WBBfDlPTgRLUXmVAqwRR2ppU54FA+PqAHkGOP8ZuRaANfB+k
         pmfKuviCnoTWzmdj+nZew/1aUNzV+fiwQ/DQIImcA+hAY5ln9fhm4SY03+LjES244QsA
         n0me5oeM1lDn7Oxw1rLv6IgRhSCuvoxHmgo2FITfLWaBM5WXrB+zUE9uvWh6kRuz1uly
         l+6w==
X-Gm-Message-State: AOAM531mMtV2Ql6xBLEMIqO3trPISZZ1OqN2U92APKfCiWgJg6g9XcfO
        iEeZ/rMXgVaApQr4Ntxs0FCCIMr4UHc33Ei33Ykm3UWg8IYrCpE5WQoJIf/nQbCfynvclSMOM37
        ZIDTWu5ADbViygkkuoM58azn42GtmAGUyMqzA6A==
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id w82-20020a627b550000b029013e73672b2emr2888498pfc.7.1601365167188;
        Tue, 29 Sep 2020 00:39:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxrRTB/PNOVXX3/RH8nEoit9OT6YQk+J4K/XU5DBnLBCyEjot2MG7XCX7isOsyJ60uvL1VTA==
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id w82-20020a627b550000b029013e73672b2emr2888469pfc.7.1601365166777;
        Tue, 29 Sep 2020 00:39:26 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id a3sm4163130pfl.213.2020.09.29.00.39.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Sep 2020 00:39:25 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v3] xhci: Prevent runtime suspend on Etron EJ168
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <8d913b15-a7e4-5e35-a137-355d222ccf1f@linux.intel.com>
Date:   Tue, 29 Sep 2020 15:39:23 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <E2501192-3B1E-4887-92CB-AD6ECDED65F9@canonical.com>
References: <20200504171642.26947-1-kai.heng.feng@canonical.com>
 <0F26EE78-D4F4-4CCB-892B-999E203BF515@canonical.com>
 <14291E1B-6580-4C69-9EF8-3B30BC78B8D0@canonical.com>
 <8d913b15-a7e4-5e35-a137-355d222ccf1f@linux.intel.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> On Sep 29, 2020, at 05:42, Mathias Nyman <mathias.nyman@linux.intel.com> wrote:
> 
> On 28.9.2020 12.10, Kai-Heng Feng wrote:
>> 
>> 
>>> On Jun 8, 2020, at 11:56, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>> 
>>> 
>>> 
>>>> On May 5, 2020, at 01:16, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
>>>> 
>>>> Etron EJ168 USB 3.0 Host Controller stops working after S3, if it was
>>>> runtime suspended previously:
>>>> [  370.080359] pci 0000:02:00.0: can't change power state from D3cold to D0 (config space inaccessible)
>>>> [  370.080477] xhci_hcd 0000:04:00.0: can't change power state from D3cold to D0 (config space inaccessible)
>>>> [  370.080532] pcieport 0000:00:1c.0: DPC: containment event, status:0x1f05 source:0x0200
>>>> [  370.080533] pcieport 0000:00:1c.0: DPC: ERR_FATAL detected
>>>> [  370.080536] xhci_hcd 0000:04:00.0: can't change power state from D3hot to D0 (config space inaccessible)
>>>> [  370.080552] xhci_hcd 0000:04:00.0: AER: can't recover (no error_detected callback)
>>>> [  370.080566] usb usb3: root hub lost power or was reset
>>>> [  370.080566] usb usb4: root hub lost power or was reset
>>>> [  370.080572] xhci_hcd 0000:04:00.0: Host halt failed, -19
>>>> [  370.080574] xhci_hcd 0000:04:00.0: Host not accessible, reset failed.
>>>> [  370.080575] xhci_hcd 0000:04:00.0: PCI post-resume error -19!
>>>> [  370.080586] xhci_hcd 0000:04:00.0: HC died; cleaning up
>>>> 
>>>> This can be fixed by not runtime suspend the controller at all.
>>>> 
>>>> So disable runtime suspend for EJ168 xHCI device.
>>>> 
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> 
>>> A gentle ping...
>> 
>> Another gentle ping...
> 
> Thanks, somehow I didn't notice this earlier.
> 
> Was the rootcause ever investigated?
> Preventing runtime suspend looks like a quick fix to get rid of the issue, but 
> possibly just hides some other underlying power management problem

I tried different angles but didn't find any useful solution.

Eventually I found out that the device stays at D0 under Windows, so this is the approach I take.

Kai-Heng

> 
> -Mathias

