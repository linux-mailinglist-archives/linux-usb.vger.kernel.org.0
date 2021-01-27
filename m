Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA953059F1
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:37:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236724AbhA0Lgt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:36:49 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:56023 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236982AbhA0Lei (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:34:38 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id E4EEA5C01C9;
        Wed, 27 Jan 2021 06:33:11 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 27 Jan 2021 06:33:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=AeenwuKFg6WBhfcyd8t/iMi4fyZ
        gGZCL6/5e7j2DIyc=; b=fevZ3tNGsJAIP66FZnIFA/IzbEVbsGyxWc5/MXVvmFQ
        uqqJJ2ApD1U3xMfxpoZzr27gd/w+B7EVDtPoFJR8u//Zc9fLCO2pnt83JSX6fD6A
        m+yXlXAWI8vcyXQOFY9mT9MVcjjzSpCuLr4f5vc2w2RIBr9GLr38c2aBOC5fORKL
        DNZx9r7aJDlr7WyLFNMDeWeY7umuRF7tckoGDCP+jNMTfcDmVKNEe2UVakNbXvP3
        vrvH0cz+HJPzFx/cZ7xz6Onv+40hFTJfnHL9Ai/72XT1GB41ksuhTw34BxTubHX+
        Wkn2/JPgQUjGsQY2Js9q/8ghS+M5BzFtH9v0Ze8tABA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Aeenwu
        KFg6WBhfcyd8t/iMi4fyZgGZCL6/5e7j2DIyc=; b=ZNbvqYrD/P00hXqx/d9wjx
        emQlpXB/Dmz1qOWcxKOoej7UsgV3bHPB6vfynrneXgNcC4ic1/3F8LbaUdp4ni7G
        er/X2dT2WRmfbMolC2twNfWT2d2kKT1XyHB4iViVDz1ROvw4Dc0v9H49NN+yxlzy
        fpob1tEU55GYQhEkqoIxEPHPkyeztIQszN8e+DIL5KDcGxp2s0mtR2IGj/EucnDe
        z7btfj/ijVdhYiKlv3jSAWA0kAeNHpQJRf3FzGXEAOiI4eLss2yocGaII0cqeA2u
        pSjoYyiCHXxkXaMMV9rLKIxB2ic+VIWh4jKAor5oLHBKXL/8MGeyRk9qdc6h88lw
        ==
X-ME-Sender: <xms:d08RYFWMNkT3RoqrSCNBaeNowUVr-vyr_VxZ0RuYJXCy_VnR7hBxNA>
    <xme:d08RYDhm43cD8HIPNAL18g1O1P_M0eTMZbu_C5Qdlmgk2yFSE2ft43i5oRxfrAPm5
    2cqeCExzfx5iw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:d08RYDsXuhysYfWCFXJRzjiYZt7AZCiWIrb23r7aXMColFXw8a41VQ>
    <xmx:d08RYM5AQkkvEf9KDh49FrnRp3zW9ESqr8hymio3ke3-1nBpZw2BJw>
    <xmx:d08RYHMbRP15oiC2mMQYEME9sqc2JhyYUyO03yg4nXESBb2I7deZ_Q>
    <xmx:d08RYAh-4xOpsbcty3QCjOzWuuoLMXGfIJif9WjuuWlnHR-lLuAFzg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 3FA96240062;
        Wed, 27 Jan 2021 06:33:11 -0500 (EST)
Date:   Wed, 27 Jan 2021 12:33:09 +0100
From:   Greg KH <greg@kroah.com>
To:     Prike Liang <Prike.Liang@amd.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Message-ID: <YBFPdf6Mc0ZgPsuy@kroah.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 19, 2021 at 09:48:44AM +0800, Prike Liang wrote:
> During xhci suspend some AMD USB host will lose port status change events and
> need to have the registers polled during D3, so now just avoid D3cold.
> 
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  drivers/usb/host/xhci-pci.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 3feaafe..bff817a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
>  		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
> +		pdev->device == 0x1639) {
> +		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
> +	}

Why not add this check to the
xhci_compliance_mode_recovery_timer_quirk_check() function instead,
where all other systems that need this quirk are tested for?

thanks,

greg k-h
