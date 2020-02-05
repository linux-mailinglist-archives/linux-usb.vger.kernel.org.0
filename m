Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95A8B152A11
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 12:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgBELmQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 5 Feb 2020 06:42:16 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:54762 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbgBELmP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 06:42:15 -0500
Received: from mail-pg1-f199.google.com ([209.85.215.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1izIno-0003RX-Me
        for linux-usb@vger.kernel.org; Wed, 05 Feb 2020 11:25:04 +0000
Received: by mail-pg1-f199.google.com with SMTP id v30so978448pga.22
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2020 03:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=6zUnAJw/Y6vVvW2xmbH05AyrYz3QZAGIOapSC7+i3Mc=;
        b=pDHe89UfXk78onRPLdVZtHZFAOqUlGX3BgK04yUqN6Od4wqRZ1okg/f6FszHwJpPv6
         AJ/j23psKgTLee57VOLwFqMCLHt6Gxwr4Btjvm7eX4RXg16Yzfvuhudmar2oKVuy7iZA
         Y/fGPw/CgXv3VSaWx+eT0jDHBSs03eYK41fIBukRGLjEaxPcGrdl0t4+TP/7AZWXhrEK
         iBN6JG8V5mW4BpvXGZvHJC3ROXvgmSyrWRFw7Ud01S8D1LQnZ6EEDHy9LhMmjdy2cev4
         oJA6lqLffyM7mPZPmHZU1UzVKPEGomllaNLxTaMQWVDqxLpEKTlyz2k6DhTfaXd0diYp
         mzcA==
X-Gm-Message-State: APjAAAWpIzUL/s5UQY6dOyWW8DlT/L9PQyEOOEVjs9CseMWzHxDnq3I6
        E+UXkKQJs1HvxCNt/ZhuJ0bIai55mG7f/iuH/GLNjM168XZXGyYHbERNYe+5OUsRBrv6p9Kp40k
        wfnzwblN8WnRQ0a8BJ4k0ebEyaPOD3lXDaCj3EQ==
X-Received: by 2002:a17:90a:db48:: with SMTP id u8mr5081663pjx.54.1580901903209;
        Wed, 05 Feb 2020 03:25:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzs8jEUWVsPGPIqrQGiyIxOU5NsCKAV2kLJxc/sS5hZH+c4Gr+g9ys+WG+0DEuEOGh1dzscQg==
X-Received: by 2002:a17:90a:db48:: with SMTP id u8mr5081630pjx.54.1580901902766;
        Wed, 05 Feb 2020 03:25:02 -0800 (PST)
Received: from 2001-b011-380f-35a3-4cfd-361b-ac7d-6a8c.dynamic-ip6.hinet.net (2001-b011-380f-35a3-4cfd-361b-ac7d-6a8c.dynamic-ip6.hinet.net. [2001:b011:380f:35a3:4cfd:361b:ac7d:6a8c])
        by smtp.gmail.com with ESMTPSA id u12sm27695654pfm.165.2020.02.05.03.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Feb 2020 03:25:02 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2 1/3] xhci: Ensure link state is U3 after setting
 USB_SS_PORT_LS_U3
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20200205112228.25155-1-kai.heng.feng@canonical.com>
Date:   Wed, 5 Feb 2020 19:24:59 +0800
Cc:     acelan.kao@canonical.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <08A214EC-F78D-41E1-B080-2A03782E41C1@canonical.com>
References: <20200205112228.25155-1-kai.heng.feng@canonical.com>
To:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Feb 5, 2020, at 19:22, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> The xHCI spec doesn't specify the upper bound of U3 transition time. For
> some devices 20ms is not enough, so we need to make sure the link state
> is in U3 before further actions.
> 
> I've tried to use U3 Entry Capability by setting U3 Entry Enable in
> config register, however the port change event for U3 transition
> interrupts the system suspend process.
> 
> For now let's use the less ideal method by polling PLS.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Please ignore this series. Some patches are missing changelog, will resend one.

Kai-Heng

> ---
> v2:
> - Remove some redundant debug messages.
> - Use msleep loop outside if spinlock to stop pegging CPU.
> 
> drivers/usb/host/xhci-hub.c | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 7a3a29e5e9d2..d3c5bcf76755 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1313,7 +1313,16 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
> 			xhci_set_link_state(xhci, ports[wIndex], link_state);
> 
> 			spin_unlock_irqrestore(&xhci->lock, flags);
> -			msleep(20); /* wait device to enter */
> +			if (link_state == USB_SS_PORT_LS_U3) {
> +				int retries = 10;
> +
> +				while (retries--) {
> +					msleep(10); /* wait device to enter */
> +					temp = readl(ports[wIndex]->addr);
> +					if ((temp & PORT_PLS_MASK) == XDEV_U3)
> +						break;
> +				}
> +			}
> 			spin_lock_irqsave(&xhci->lock, flags);
> 
> 			temp = readl(ports[wIndex]->addr);
> -- 
> 2.17.1
> 

