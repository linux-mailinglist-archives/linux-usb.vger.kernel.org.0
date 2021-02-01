Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F2930A965
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 15:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhBAOMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 09:12:52 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:50999 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231284AbhBAOMv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 09:12:51 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 74A725C012F;
        Mon,  1 Feb 2021 09:12:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 01 Feb 2021 09:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=38VzU9qSpbtZpsPMNckJ5SeT4bz
        KmfdwVjMdvlNGjqo=; b=K/3lsba13pmaIKBkRVJ5glfdE4Xf3SEVZ7pwQ2Yh/pZ
        tX0mxMR3Z2EHTdyVZddISp/gcilG+7m4CDp7R61CjgCrNpxkWBCIq8RU52g6OGPr
        I8i0RLjmZy8mwh+pPvr7w80TssvD4f2ybEosWyOj7Z4mPsdTKHR+al6ByszgpxC7
        JSHHX/mafU54qhQ18PBEz+6jTI6vgoTI0sdXdWDsJuWPZQMJRmT3jdqemWzuLT7S
        6/f96UoZYCVbgcILKWrcSGgAv2+Zzc1SZQPEcfDb6TmIgevnKkjo9ZM9/D6HrFg9
        Fc9Mv/U/BXyYX7LqAWj1uBB6tE/EdK9Tp1booihq0Tg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=38VzU9
        qSpbtZpsPMNckJ5SeT4bzKmfdwVjMdvlNGjqo=; b=mbV2ef0CvGkM2qATJufllg
        EiH8Ff+T7udgHwgMVxuNlIQ/GS8gwaBDMmYwKCisnfvx41acgQEgQuBnzlVcMmu9
        /9NNCUxXMtobRHIJnMlKvFyL5oXU6DAh01sPTuTx2bq+chEUArkwFcgLazUjdjX4
        AVBFsgC/etzoNKUuojUUcQ3++WKcGoJQYg1LSpb/yj7vavDUYWvuX3dfNp9RkmJ5
        kI/8sd2subJdAPNL2pHZoQxhfxgKtxNN6A83BRFmtDYRjbMgbJ402Ap8xR7YZGOS
        i6RhQCR4fDbSgYNyZ4/iP3AT5nmFE32izLVX3w3zPFswYYWHYF+ky6xRdzCK4KPg
        ==
X-ME-Sender: <xms:NAwYYKCswrOOppp6SsfJTOgi-tfTJnd4wyre6tEUNGfOxSHIuk-FWw>
    <xme:NAwYYOLyDzAXaTpogYBSmNrwNkSbnJRTfGsp70TEneTZZk6u92fzwXM_svcYW4nDe
    Eb_q-X6DpRnhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:NAwYYNltK2Hz982mkm7hwGmBOcckI78uZ5t6sawLzwqtuR9-XPwNoA>
    <xmx:NAwYYMHDuAr-02APmkn73TF_NWwsye7lPiVoCaFqv63yf1kgMICbOA>
    <xmx:NAwYYNFCQU3UeR045enRhtVuDMDfBdoiQIaM496TpqOypzkOM2E0sA>
    <xmx:NAwYYHnh9IfCSZ5kacJlK1yPNwHT8-36xdEcNwi5TB1FlKYamHMc8Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id C4EBA1080059;
        Mon,  1 Feb 2021 09:12:03 -0500 (EST)
Date:   Mon, 1 Feb 2021 15:12:02 +0100
From:   Greg KH <greg@kroah.com>
To:     "Liang, Prike" <Prike.Liang@amd.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Subject: Re: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Message-ID: <YBgMMh7KfBD1Govb@kroah.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
 <YBFPdf6Mc0ZgPsuy@kroah.com>
 <YBFSFhgk+O40GYhO@kroah.com>
 <BYAPR12MB3238626A32C6E62DA008B72CFBB69@BYAPR12MB3238.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB3238626A32C6E62DA008B72CFBB69@BYAPR12MB3238.namprd12.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 01, 2021 at 02:08:08PM +0000, Liang, Prike wrote:
> [AMD Official Use Only - Internal Distribution Only]

Not very internal :)

> > On Wed, Jan 27, 2021 at 12:33:09PM +0100, Greg KH wrote:
> > > On Tue, Jan 19, 2021 at 09:48:44AM +0800, Prike Liang wrote:
> > > > During xhci suspend some AMD USB host will lose port status change
> > > > events and need to have the registers polled during D3, so now just avoid
> > D3cold.
> > > >
> > > > Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> > > > ---
> > > >  drivers/usb/host/xhci-pci.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/usb/host/xhci-pci.c
> > > > b/drivers/usb/host/xhci-pci.c index 3feaafe..bff817a 100644
> > > > --- a/drivers/usb/host/xhci-pci.c
> > > > +++ b/drivers/usb/host/xhci-pci.c
> > > > @@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev,
> > struct xhci_hcd *xhci)
> > > >  (pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
> > > >  xhci->quirks |= XHCI_U2_DISABLE_WAKE;
> > > >
> > > > +if (pdev->vendor == PCI_VENDOR_ID_AMD &&
> > > > +pdev->device == 0x1639) {
> > > > +xhci->quirks |= XHCI_COMP_MODE_QUIRK;
> > > > +}
> > >
> > > Why not add this check to the
> > > xhci_compliance_mode_recovery_timer_quirk_check() function instead,
> > > where all other systems that need this quirk are tested for?
> >
> > Ah, you don't have a pci device at that point in time.  But, why aren't you
> > making the same calls that the caller of that function does when setting this
> > quirk here?  Isn't that also required?
> >
> [Prike]  Thanks comment. This XHCI host port status lost issue was seen on the s2idle wake up period and poll the CNR bit failed in xhci_resume() that eventually result in the XHCI device resume failed. However, this issue may not totally caused by the entry of XHCI compliance mode and seems only partially enable the COMP flag with disable XHCI D3cold can work around this failed case. Regards to this issue maybe we needn't the COMP quirk and only need disable the D3cold for some specific XHCI device during processing xhci_pci_suspend().

Ok, so what does this mean for us exactly?

Can you please properly test the hardware and let us know what needs to
be done?

thanks,

greg k-h
