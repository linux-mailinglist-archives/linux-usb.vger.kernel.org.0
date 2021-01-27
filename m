Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C1D305A40
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237208AbhA0Lrg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:47:36 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47629 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237111AbhA0Lpb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:45:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 719A45C016C;
        Wed, 27 Jan 2021 06:44:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 27 Jan 2021 06:44:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=HAeWuxzEk/nfTJp7RJzz13OWedp
        CZg4BJzHyl85uNN4=; b=GT8DnDQDwtnptxHsbKu0tM6JxjOGsHnil9MUrfzmUUx
        /FUBA4I40tLGXHYeI2ciqdEGe45ZnQ8KbuqqvS5zCz9w/+k3aIanMhZV09rzT8pb
        E3dFcRNFSibSL9j7rvDYh6Lp7rUZSz/5e3wT3s5bMFuJ05fTldZ2MBsvC99hcTKO
        +KeR33S9puTq3KLsuzupcfIoM01bK0axRx5IenKKOPWkG+amYd5lZUEiqwXpYZa6
        NFMNIjNY4GJxzGN0OAOknqVRx+GYkkdTP4ZEkRXbdKPLkAjELW5Vjx1FbYmeBt14
        +dM8Qu8rquu7u0zJR4KII8ULc48v3ecyKonOKJYzKUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HAeWux
        zEk/nfTJp7RJzz13OWedpCZg4BJzHyl85uNN4=; b=UIaUDsHI7DuZQ5r0wDuUFm
        p2pySn4/AeV8q3OgBMjGf+dUrxyM8iEcsaA+O6q1ywBKPhgfIgUxW2CEonOlrZBM
        589bmj18bB2TtrPJ9AH9TTqtmj/1Y1r46WNPxnZSjYLV2ZWlSvjYWPpac2bhzanD
        XBzlD6gxngqPWG4+RCDlIlgTA4yLCG2u6WpMaJ/60XfEO1lc+rv4nspdaesKVgKX
        N0NYNYj4BWWDvYXu9jXn4+ulfaWvrtiax2b8nF60bsbWrQxIPvk4yftoiIuSig3v
        lWHkKV0jWoVFpX01zPwXRgR4c95nmfTzRWYaD/DFgy0XNRm3v8k4kV0mVvSRx71Q
        ==
X-ME-Sender: <xms:GFIRYLBFKXc5k_hTuBLbYWBBXBB0ndNio_VmLRamKgyyA5sNn7y_Ew>
    <xme:GFIRYBjoZPdLYQJpGzFADjEJm3tAt_KI1zZm3OcoR1z7H6ROvLdl04sqjJmye_75K
    r_IZPKYhU1i9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:GFIRYGm6_Lub3CWRJPuWlmPehwlHv85iNpuBe0NpAb0hnIyP9fcscw>
    <xmx:GFIRYNwgxUXxzIMM3FslFaQKhHjFlkIx_cJj-Xuyn20pYMtSAAOuwQ>
    <xmx:GFIRYARqiB-J9aTu_26zXnEpn8mSeBEHOE7iEAPGR-nn4lWWug-BqA>
    <xmx:GVIRYJ5b1YOobsO0vVSlpwCCe4iP57V0IQe8xaYZkx3uPC_MMjfc_A>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id B62B424005D;
        Wed, 27 Jan 2021 06:44:24 -0500 (EST)
Date:   Wed, 27 Jan 2021 12:44:22 +0100
From:   Greg KH <greg@kroah.com>
To:     Prike Liang <Prike.Liang@amd.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: pci-quirks: add XHCI_COMP_MODE_QUIRK for disabling
 amd xhci D3cold
Message-ID: <YBFSFhgk+O40GYhO@kroah.com>
References: <1611020924-17178-1-git-send-email-Prike.Liang@amd.com>
 <YBFPdf6Mc0ZgPsuy@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YBFPdf6Mc0ZgPsuy@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 27, 2021 at 12:33:09PM +0100, Greg KH wrote:
> On Tue, Jan 19, 2021 at 09:48:44AM +0800, Prike Liang wrote:
> > During xhci suspend some AMD USB host will lose port status change events and
> > need to have the registers polled during D3, so now just avoid D3cold.
> > 
> > Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> > ---
> >  drivers/usb/host/xhci-pci.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index 3feaafe..bff817a 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -170,6 +170,11 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
> >  		(pdev->device == PCI_DEVICE_ID_AMD_PROMONTORYA_1)))
> >  		xhci->quirks |= XHCI_U2_DISABLE_WAKE;
> >  
> > +	if (pdev->vendor == PCI_VENDOR_ID_AMD &&
> > +		pdev->device == 0x1639) {
> > +		xhci->quirks |= XHCI_COMP_MODE_QUIRK;
> > +	}
> 
> Why not add this check to the
> xhci_compliance_mode_recovery_timer_quirk_check() function instead,
> where all other systems that need this quirk are tested for?

Ah, you don't have a pci device at that point in time.  But, why aren't
you making the same calls that the caller of that function does when
setting this quirk here?  Isn't that also required?

thanks,

greg k-h
