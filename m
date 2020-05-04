Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B791C3660
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 12:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728562AbgEDKCL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 4 May 2020 06:02:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59561 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728387AbgEDKCL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 06:02:11 -0400
Received: from mail-pl1-f198.google.com ([209.85.214.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jVXvM-0001Zn-Kt
        for linux-usb@vger.kernel.org; Mon, 04 May 2020 10:02:08 +0000
Received: by mail-pl1-f198.google.com with SMTP id b1so14225459plm.10
        for <linux-usb@vger.kernel.org>; Mon, 04 May 2020 03:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mwkkUiapeaLKnijBX2GICpmX1c9YuVtWjVfq3t3aBUE=;
        b=kczskf0BWlbN5RCOF93zgGfu2fpxglt006Mcp5ZfqCcI2+sal1n9hLV5a0luvjj+WP
         /BB4U+15Y0M+bDCzckQB7wcAUYDEa+fL2o4YcEyzeNHC2n/9c6Xbw5ZtIRaCdawiIJvn
         rbTgAnqQMzdnfS7dRfkKZu+qoEVvJc3dJXud5L5KTwmW5vEXoEnGh7wkykHr9Yyujosq
         8sfvZVi9L9cmxXNTl5i+fS55shV8qgBp+37WygDAJlGZVqrd1GCO8MusCO4tQxI3Zi6J
         uOGYbUOYuR2nO9Je92YEB3kJOeuwyJCR2w1aIEKqu96HamIyfvy6uKGhFDDBBqaIjqBY
         gOlA==
X-Gm-Message-State: AGi0PuYHsZYl6h2jNaLdEUEhmhrR/AEmG3gx+9gQO20uqOeFDM/8X1ty
        1F/BW/Z8i5mZL2GH19VYcIwMUikcfuUp/191px7UVZM3SsJEcPqoyILV6Gnn92Nnv90OrnrsyG3
        6NH7PlIgmBN7BpcUjS/+XwmDXWaOnUXRbloSU+Q==
X-Received: by 2002:a63:3c0a:: with SMTP id j10mr12952909pga.373.1588586527266;
        Mon, 04 May 2020 03:02:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIu8mDtm9MeCRzvqNEih08I9J+LtybM+hiynuAFMTv20dUUB3DYwEkSydFKCC6oqDYDzWT/yQ==
X-Received: by 2002:a63:3c0a:: with SMTP id j10mr12952870pga.373.1588586526831;
        Mon, 04 May 2020 03:02:06 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id p1sm6864214pjf.15.2020.05.04.03.02.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 03:02:06 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] xhci: Prevent runtime suspend all the time with
 XHCI_RESET_ON_RESUME quirk
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <1588585655.13662.5.camel@suse.com>
Date:   Mon, 4 May 2020 18:02:03 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <88A0FF32-C7D7-4E49-8470-FE23401371BD@canonical.com>
References: <20200504091952.15820-1-kai.heng.feng@canonical.com>
 <1588585655.13662.5.camel@suse.com>
To:     Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On May 4, 2020, at 17:47, Oliver Neukum <oneukum@suse.com> wrote:
> 
> Am Montag, den 04.05.2020, 17:19 +0800 schrieb Kai-Heng Feng:
>> Etron EJ168 USB 3.0 Host Controller stops working after S3, if it was
>> runtime suspended previously:
>> [  370.080359] pci 0000:02:00.0: can't change power state from D3cold to D0 (config space inaccessible)
> 
> Apparently this controller has issues with D3cold
> 
>> [  370.080477] xhci_hcd 0000:04:00.0: can't change power state from D3cold to D0 (config space inaccessible)
>> [  370.080532] pcieport 0000:00:1c.0: DPC: containment event, status:0x1f05 source:0x0200
>> [  370.080533] pcieport 0000:00:1c.0: DPC: ERR_FATAL detected
>> [  370.080536] xhci_hcd 0000:04:00.0: can't change power state from D3hot to D0 (config space inaccessible)
>> [  370.080552] xhci_hcd 0000:04:00.0: AER: can't recover (no error_detected callback)
>> [  370.080566] usb usb3: root hub lost power or was reset
>> [  370.080566] usb usb4: root hub lost power or was reset
>> [  370.080572] xhci_hcd 0000:04:00.0: Host halt failed, -19
>> [  370.080574] xhci_hcd 0000:04:00.0: Host not accessible, reset failed.
>> [  370.080575] xhci_hcd 0000:04:00.0: PCI post-resume error -19!
>> [  370.080586] xhci_hcd 0000:04:00.0: HC died; cleaning up
>> 
>> This can be fixed by not runtime suspend the controller at all.
>> 
>> So instead of conditionally runtime suspend the controller, always
>> prevent runtime suspend with XHCI_RESET_ON_RESUME quirk.
> 
> What does that do to other controllers that can do runtime suspend
> under the current scheme?

Ok, I'll add a new quirk specific to this controller.

Kai-Heng

> 
> 	Regards
> 		Oliver
> 

