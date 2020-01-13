Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBCA138EBA
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 11:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgAMKNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 05:13:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:48928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728773AbgAMKNn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 05:13:43 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 236CD2084D;
        Mon, 13 Jan 2020 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578910422;
        bh=uFVvOfTSqG+rsypdfj9xZjIq0r+NZD/k64sOVrC5lvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=da33PIkO5edY5tYH+24EfqvfdiektiBj4GRXoJAJMvvIaEayDV+Q8cZ+U5tdPq3Ls
         EZDy96YybNumV3nxZGwK8/mJeuv8kUtRFUrahp5UZMh7Bspv4SX4RboW2B6BHWuj9u
         XbboWVI1xbt85z2Fp2WdC7wTYEwp2rKCPUCSkHE4=
Date:   Mon, 13 Jan 2020 11:13:38 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 1/1] usb: cdns3: add NXP imx8qm glue layer
Message-ID: <20200113101338.GA2116805@kroah.com>
References: <1578562558-32462-1-git-send-email-peter.chen@nxp.com>
 <CAOMZO5CTB_TdW8G8RW41_t-sLhQyZ1Xy9rQW1Pu_BbOcJwe-Kg@mail.gmail.com>
 <20200113092525.GL17599@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113092525.GL17599@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 13, 2020 at 09:25:28AM +0000, Peter Chen wrote:
> On 20-01-11 17:56:06, Fabio Estevam wrote:
> > Hi Peter,
> > 
> > On Thu, Jan 9, 2020 at 7:55 AM Peter Chen <peter.chen@nxp.com> wrote:
> > 
> > > +static const struct of_device_id cdns_imx_of_match[] = {
> > > +       { .compatible = "fsl,imx8qm-usb3", },
> > 
> > Please also send a separate patch for documenting this compatible string.
> 
> I had wanted to add it, but the working version is based on some
> other basic dts patches, eg clock changes, which has still not
> in mainline, so some properties in the example at this dt binding 
> file may not be found at mainline kernel, is it ok?

No, sorry, that does not work, please get the dts patch in as well.

thanks,

greg k-h
