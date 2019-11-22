Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D881075E0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2019 17:36:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfKVQgL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 22 Nov 2019 11:36:11 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:35602 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbfKVQgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Nov 2019 11:36:11 -0500
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iYBuj-0005bd-6V
        for linux-usb@vger.kernel.org; Fri, 22 Nov 2019 16:36:09 +0000
Received: by mail-pg1-f200.google.com with SMTP id h18so4158381pgj.6
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2019 08:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=8FJYPgYSY4gesD2/sebLKRkt9MrvJa8jfnyknbp4l4o=;
        b=QV4ezimJybSkA7vxMasvuslz2QSpK/jjhxSoKSEfcnJKQ8zXKJYLiYAR7Wb6Na5pr8
         1+lCnC4kv72Dy0q1voO4lma16xv7AoSUm9WPgLqTKsr9J+Hraywx5l0DoZa45MyqcRfw
         /Pn2GCmftJt7U9l76o5Y/AHRcD3XWqU0KhfqQBLWsYCIWr7Xux8DrlABnZASSgx2sPWo
         n4kSVc7+s50//OexACDPNWq+3mS7K83YxiZhSO0zAQYT3c0TbNajC2MtXOZXTLyYFQlr
         aA7HwWE1X1IzJmgKVZrngFYU2F9nPxdt6OU8VvLVHPnNnxbj1OH/xRyIqdhnYzQ4y8he
         acKg==
X-Gm-Message-State: APjAAAWVf+dAu3rkErH8/iYjQEeAQz462n3WyAeyYfNt9OQCINy1qHlC
        +GoV/WmRfkFL8K927HPOECc7p3T0zFmZ6iM6Ma2F+x4aAqLzNes1AHU2hNpzz/xcqeOl02XJfWa
        4YfoZVufSQGIxozh+t7UWF8JlfMr5x43GCNUazw==
X-Received: by 2002:a63:ed4d:: with SMTP id m13mr15765259pgk.442.1574440567651;
        Fri, 22 Nov 2019 08:36:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPCSJNm7f9C9Cm8oj2X5Siho/+R/1BE7DfVp2adnTxETMsq3HbtcEMHMknZnvC2OTMjo7p2g==
X-Received: by 2002:a63:ed4d:: with SMTP id m13mr15765242pgk.442.1574440567316;
        Fri, 22 Nov 2019 08:36:07 -0800 (PST)
Received: from 2001-b011-380f-3c42-689b-ad0d-de88-c579.dynamic-ip6.hinet.net (2001-b011-380f-3c42-689b-ad0d-de88-c579.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:689b:ad0d:de88:c579])
        by smtp.gmail.com with ESMTPSA id z7sm8502076pfr.165.2019.11.22.08.36.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 08:36:06 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH] xhci: Increase STS_HALT timeout in xhci_suspend()
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191104055217.10475-1-kai.heng.feng@canonical.com>
Date:   Sat, 23 Nov 2019 00:36:04 +0800
Cc:     "Atroshko, Yevhen" <Yevhen.Atroshko@amd.com>,
        USB list <linux-usb@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <34F5BCC9-18EE-466D-BBAF-B3D3C1CD525B@canonical.com>
References: <20191104055217.10475-1-kai.heng.feng@canonical.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Matthias,

> On Nov 4, 2019, at 13:52, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:
> 
> I've recently observed failed xHCI suspend attempt on AMD Raven Ridge
> system:
> kernel: xhci_hcd 0000:04:00.4: WARN: xHC CMD_RUN timeout
> kernel: PM: suspend_common(): xhci_pci_suspend+0x0/0xd0 returns -110
> kernel: PM: pci_pm_suspend(): hcd_pci_suspend+0x0/0x30 returns -110
> kernel: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x150 returns -110
> kernel: PM: Device 0000:04:00.4 failed to suspend async: error -110
> 
> Similar to commit ac343366846a ("xhci: Increase STS_SAVE timeout in
> xhci_suspend()") we also need to increase the HALT timeout to make it be
> able to suspend again.

Seems like there are more broken AMD xHCI in the wild, so please merge this patch if there's no further concerns.

Kai-Heng

> 
> Fixes: f7fac17ca925 ("xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()")
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> drivers/usb/host/xhci.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 6c17e3fe181a..53720c41891a 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -973,7 +973,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
> int xhci_suspend(struct xhci_hcd *xhci, bool do_wakeup)
> {
> 	int			rc = 0;
> -	unsigned int		delay = XHCI_MAX_HALT_USEC;
> +	unsigned int		delay = XHCI_MAX_HALT_USEC * 2;
> 	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
> 	u32			command;
> 	u32			res;
> -- 
> 2.17.1
> 

