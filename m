Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CADB3C7821
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jul 2021 22:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234394AbhGMUrq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Jul 2021 16:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53072 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229944AbhGMUrq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Jul 2021 16:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626209095;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lntyUTygOGnbnjdg18Z7gaRjIwBX6zBZGU9LDxdAXas=;
        b=E1OmRGbKgA+99hjc/XTPwtgxV9ggpaSVIro8ga3xewdMVg+Ug1AkPFvxr8mMMQGEUi0sBK
        jvVxlJTLAQQSzzDtOVy+7Fmtyqc2rEqNsrcQ0VSx9Yn2+9cgXIU2G4QpzPPfZDQjGN89cF
        Y1nU7yoqvG9nz38TsAlU4oHn2rmlYP4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-CDr-CtnZPvKiwk3E85_I_g-1; Tue, 13 Jul 2021 16:44:54 -0400
X-MC-Unique: CDr-CtnZPvKiwk3E85_I_g-1
Received: by mail-qk1-f199.google.com with SMTP id c3-20020a37b3030000b02903ad0001a2e8so18303651qkf.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Jul 2021 13:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lntyUTygOGnbnjdg18Z7gaRjIwBX6zBZGU9LDxdAXas=;
        b=BpHaBDiA91BH/x1ZaFBLEgl7u1qI+nfYBeI+VC67FpGjgpqhAgKkJEiN/OdMx2uApJ
         y66gtZsuhGKhG5zhbGo7imfrfgvfUcVu7QTglgFsmFSVEuwuj3+sRwJu7xnxXrR7G04J
         u/yjP/vU2pfXeIeTsfr07z+/pORtDeRsHX76kLe+uz3c/MDdwOrnl4vSJY+tBr8q3Q7k
         eJmqMM71N4QXZnxGqhnbC91g/gSkqm13fjHOcv2RIj99FpfZGd5vr2MhHudLq68qKqN/
         bwFwwWSMafXQ8/MLKr4sZfg5xGwtSorfrUn4SEgQcT6W8Vb+SVU+WL3DSIOGqZz/wU1o
         JJyw==
X-Gm-Message-State: AOAM53101SWH5sP7LA577CD4P9IUXibGTuLkdY2R9wTQY7qtEePwCPM4
        hJ6nKQ6Jvi9qbs+T92WLLW77/Mk3y4AivcuRPpuCcLAZHg/t3tcjTRkvk7hREarJjbc4Ov6kLEE
        Bzr/FtBT5DRJjs5HWJeM8
X-Received: by 2002:ac8:4241:: with SMTP id r1mr5825065qtm.121.1626209093839;
        Tue, 13 Jul 2021 13:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9XwEuW6b5YZFbAhMXQcF+NoYx8POBBqiVhqeg26Cs+3HijYgS6q4ahXOapfRPDInPn8PICg==
X-Received: by 2002:ac8:4241:: with SMTP id r1mr5825039qtm.121.1626209093505;
        Tue, 13 Jul 2021 13:44:53 -0700 (PDT)
Received: from loberhel ([2600:6c64:4e7f:cee0:729d:61b6:700c:6b56])
        by smtp.gmail.com with ESMTPSA id d2sm401974qte.46.2021.07.13.13.44.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Jul 2021 13:44:53 -0700 (PDT)
Message-ID: <aee88d23a4139aaf377ffb97ffabd08ce196db5f.camel@redhat.com>
Subject: Re: [PATCH] usb: hcd: Revert
 306c54d0edb6ba94d39877524dddebaad7770cf2: Try MSI interrupts on PCI devices
From:   Laurence Oberman <loberman@redhat.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, stable@vger.kernel.org,
        emilne@redhat.com, djeffery@redhat.com, apanagio@redhat.com,
        torez@redhat.com
Date:   Tue, 13 Jul 2021 16:44:52 -0400
In-Reply-To: <YO34tyvp/hkO+24F@smile.fi.intel.com>
References: <1626202242-14984-1-git-send-email-loberman@redhat.com>
         <YO34tyvp/hkO+24F@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2021-07-13 at 23:33 +0300, Andy Shevchenko wrote:
> On Tue, Jul 13, 2021 at 02:50:42PM -0400, Laurence Oberman wrote:
> > Customers have been reporting that the I/O is radically being
> > slowed down to HPE virtual USB ILO served DVD images during
> > installation.
> 
> Side note:
> 
> Simple changing
> 
> -		retval = pci_alloc_irq_vectors(dev, 1, 1,
> PCI_IRQ_LEGACY | PCI_IRQ_MSI);
> +		retval = pci_alloc_irq_vectors(dev, 1, 1,
> PCI_IRQ_LEGACY);
> 
> should have the same effect without touching tons of a good code.
> 

Hi Andy, I am fine with that, and actually its one of the suggestions
David Jeffery had as well.

I will etst it today.

I can follow up with a new patch once everybody agrees.
We probbaly should get this initially fixed while we wait for a final
complete fix for other devices.

Regards
Laurence

