Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280B81F11EC
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 05:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgFHD4U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 7 Jun 2020 23:56:20 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37822 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728840AbgFHD4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Jun 2020 23:56:14 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1ji8tQ-0001xU-1U
        for linux-usb@vger.kernel.org; Mon, 08 Jun 2020 03:56:12 +0000
Received: by mail-pl1-f200.google.com with SMTP id w8so11441975plq.10
        for <linux-usb@vger.kernel.org>; Sun, 07 Jun 2020 20:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=tN1x3nhjnyOg544xiIQPRUJMixp6Gg/xim2dds0YQB4=;
        b=sFutIrET3avR1h2qymX+nvytzI+D2GPYZ1qaQMTFO2NeUwZwEy1NC+2vWwd3zptJ0Y
         M0jWPBUUdHJj0g2geqIApD4qYmMaaQh2N0a/nvMuy4sNnu+7HXs2aVolbQKw76AaZDyP
         ghXiObQO7mR/S51v89uSisbN0QcE+xuBfK4ezvcG/Z5fm5qDU5EU38UKHYc9KMGmu7NR
         68s9YHEQi3N97xKUUfjYHY7YPFsf6ai0a/Xq57rhkv+w7rzReDD4SrDuA7dAo7YQAUtR
         l5EDxVXGmiBBDJYUOnP3jk4fqQz/nPC429+IWHYERoLhUz4hJe01BVHDTM0YHEtJT2Kr
         FLOA==
X-Gm-Message-State: AOAM531UQeAfzmqNaiMNRDZWwT+TLyZeb/biq52jQqO9CRjuWTw3V2rM
        44/WIEWc/bRYwkg+LHXZ5gOSE29+/LLZ433XfMmhNDihcSJ9JcUT6xGnQceO9Yl31+OF9sGOjFK
        pE53S5pUO+/FMoSUouhrL2yyqe1HklCM7Obb0RQ==
X-Received: by 2002:a63:ce14:: with SMTP id y20mr18388598pgf.186.1591588570510;
        Sun, 07 Jun 2020 20:56:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN5kwcgXHnoT419oUbZ0Jj3oLjJnwJPvBzDhKB5WN2BSgsHdgUuUAhCl1xjX8l8dqMc6lt9A==
X-Received: by 2002:a63:ce14:: with SMTP id y20mr18388583pgf.186.1591588570162;
        Sun, 07 Jun 2020 20:56:10 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id q16sm5578574pfg.49.2020.06.07.20.56.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 07 Jun 2020 20:56:09 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] xhci: Prevent runtime suspend on Etron EJ168
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200504171642.26947-1-kai.heng.feng@canonical.com>
Date:   Mon, 8 Jun 2020 11:56:08 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <0F26EE78-D4F4-4CCB-892B-999E203BF515@canonical.com>
References: <20200504171642.26947-1-kai.heng.feng@canonical.com>
To:     Mathias Nyman <mathias.nyman@intel.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On May 5, 2020, at 01:16, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> Etron EJ168 USB 3.0 Host Controller stops working after S3, if it was
> runtime suspended previously:
> [  370.080359] pci 0000:02:00.0: can't change power state from D3cold to D0 (config space inaccessible)
> [  370.080477] xhci_hcd 0000:04:00.0: can't change power state from D3cold to D0 (config space inaccessible)
> [  370.080532] pcieport 0000:00:1c.0: DPC: containment event, status:0x1f05 source:0x0200
> [  370.080533] pcieport 0000:00:1c.0: DPC: ERR_FATAL detected
> [  370.080536] xhci_hcd 0000:04:00.0: can't change power state from D3hot to D0 (config space inaccessible)
> [  370.080552] xhci_hcd 0000:04:00.0: AER: can't recover (no error_detected callback)
> [  370.080566] usb usb3: root hub lost power or was reset
> [  370.080566] usb usb4: root hub lost power or was reset
> [  370.080572] xhci_hcd 0000:04:00.0: Host halt failed, -19
> [  370.080574] xhci_hcd 0000:04:00.0: Host not accessible, reset failed.
> [  370.080575] xhci_hcd 0000:04:00.0: PCI post-resume error -19!
> [  370.080586] xhci_hcd 0000:04:00.0: HC died; cleaning up
> 
> This can be fixed by not runtime suspend the controller at all.
> 
> So disable runtime suspend for EJ168 xHCI device.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

A gentle ping...

> ---
> v3:
> - Balance rpm refcount in remove callback.
> 
> v2:
> - Use a new quirk to avoid changing existing behavior.
> 
> drivers/usb/host/xhci-pci.c | 7 ++++++-
> drivers/usb/host/xhci.h     | 1 +
> 2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 766b74723e64..67b4b433a93e 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -227,6 +227,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
> 		xhci->quirks |= XHCI_RESET_ON_RESUME;
> 		xhci->quirks |= XHCI_TRUST_TX_LENGTH;
> 		xhci->quirks |= XHCI_BROKEN_STREAMS;
> +		xhci->quirks |= XHCI_DISABLE_RUNTIME_SUSPEND;
> 	}
> 	if (pdev->vendor == PCI_VENDOR_ID_RENESAS &&
> 	    pdev->device == 0x0014) {
> @@ -371,7 +372,8 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> 		xhci->shared_hcd->can_do_streams = 1;
> 
> 	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
> -	pm_runtime_put_noidle(&dev->dev);
> +	if (!(xhci->quirks & XHCI_DISABLE_RUNTIME_SUSPEND))
> +		pm_runtime_put_noidle(&dev->dev);
> 
> 	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
> 		pm_runtime_allow(&dev->dev);
> @@ -397,6 +399,9 @@ static void xhci_pci_remove(struct pci_dev *dev)
> 	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
> 		pm_runtime_forbid(&dev->dev);
> 
> +	if (!(xhci->quirks & XHCI_DISABLE_RUNTIME_SUSPEND))
> +		pm_runtime_get_noresume(&dev->dev);
> +
> 	if (xhci->shared_hcd) {
> 		usb_remove_hcd(xhci->shared_hcd);
> 		usb_put_hcd(xhci->shared_hcd);
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 86cfefdd6632..d9c209a10d3f 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1873,6 +1873,7 @@ struct xhci_hcd {
> #define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
> #define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
> #define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
> +#define XHCI_DISABLE_RUNTIME_SUSPEND    BIT_ULL(36)
> 
> 	unsigned int		num_active_eps;
> 	unsigned int		limit_active_eps;
> -- 
> 2.17.1
> 

