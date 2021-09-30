Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127B841DD44
	for <lists+linux-usb@lfdr.de>; Thu, 30 Sep 2021 17:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245733AbhI3PWs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 11:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43308 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245695AbhI3PWs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 11:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633015265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0abga0D1u/IdQg9y3krLjrNSALXarJfiwXawsFlevdE=;
        b=P9u/mtIDeo1XaBp1AFgFj2v340X8PLLLWHXoDhbxvd7egCWpH3+N7SH62WH6Punbt+RBtv
        DZzVDeiUWgNCgAI66EnJ5KdOM4D8+zYWRIQwsf7i5Itwb7hpPYrNlg4hXp3J7vZaartmlS
        GfSjjBaEPxs455bS9WDrV3tWCQ2eebA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-LQzqtBT8OJqIJCUqu5HKAA-1; Thu, 30 Sep 2021 11:21:03 -0400
X-MC-Unique: LQzqtBT8OJqIJCUqu5HKAA-1
Received: by mail-wm1-f71.google.com with SMTP id f10-20020a7bcd0a000000b0030d2def848dso890227wmj.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 08:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0abga0D1u/IdQg9y3krLjrNSALXarJfiwXawsFlevdE=;
        b=6c4ZUSX5HORPE/IUC0/vTxFA4QVGBT+rsUQKphN5dNqKkFQDC3E+BC0zMnL+0XJe7M
         WuSA02jCDYcLccCc/KXBh6t6Jfqw/b5YlTrHbStSOh6qDuCJxhsr/vtVa20grqSRkZP0
         F/2OYs0vwP9K8JiUc5IQhAllJ5dHPiH+jicvo+SuBhMgYl2CrHXlx/o0VvT2Ybv7CjkL
         lnkOFxf7sIm7WhUlLijmCicuVtj9THvf1kLBAPKtDuIbLroynQGvOWv0BSx8b1LaNZp7
         mJfEPGN3+UkLtrukqS1akD1JDp1tqqYJjKbi7wZsfiqIrrqf6TMTVBvRaC2j9pkrcj5/
         Knhg==
X-Gm-Message-State: AOAM531aW5F69ycL/rmaUAw+XCVrNWns0wsyglpLjzv7oR9my/D8rVVF
        +qhtTbcdJgZfM9RVwYfvkkKtQ30M5wvD24RhtNa9FakMQURvLV0RUFd70OWZGlFal67HFcgUaXc
        Mlo/G0fM+/2WnqXO27euN
X-Received: by 2002:adf:8b47:: with SMTP id v7mr6750094wra.321.1633015261142;
        Thu, 30 Sep 2021 08:21:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyixcUuc+JnWbDfw8P1vGJjmgwF6F7FsHdgfu/4LhDBVO7PYY7/qogrpldeQ6XDAuFJuHmFBA==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr6749726wra.321.1633015257068;
        Thu, 30 Sep 2021 08:20:57 -0700 (PDT)
Received: from redhat.com ([2.55.134.220])
        by smtp.gmail.com with ESMTPSA id z79sm3332530wmc.17.2021.09.30.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 08:20:56 -0700 (PDT)
Date:   Thu, 30 Sep 2021 11:20:52 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jason Wang <jasowang@redhat.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PCI <linux-pci@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 4/6] virtio: Initialize authorized attribute for
 confidential guest
Message-ID: <20210930112029-mutt-send-email-mst@kernel.org>
References: <20210930010511.3387967-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930010511.3387967-5-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210930065953-mutt-send-email-mst@kernel.org>
 <CAPcyv4hP6mtzKS-CVb-aKf-kYuiLM771PMxN2zeBEfoj6NbctA@mail.gmail.com>
 <6d1e2701-5095-d110-3b0a-2697abd0c489@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d1e2701-5095-d110-3b0a-2697abd0c489@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 30, 2021 at 08:18:18AM -0700, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 9/30/21 6:36 AM, Dan Williams wrote:
> > > And in particular, not all virtio drivers are hardened -
> > > I think at this point blk and scsi drivers have been hardened - so
> > > treating them all the same looks wrong.
> > My understanding was that they have been audited, Sathya?
> 
> Yes, AFAIK, it has been audited. Andi also submitted some patches
> related to it. Andi, can you confirm.
> 
> We also authorize the virtio at PCI ID level. And currently we allow
> console, block and net virtio PCI devices.
> 
> { PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_NET) },
> { PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_BLOCK) },
> { PCI_DEVICE(PCI_VENDOR_ID_REDHAT_QUMRANET, VIRTIO_TRANS_ID_CONSOLE) },

Presumably modern IDs should be allowed too?

-- 
MST

