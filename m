Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0252620189
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 10:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbfEPIrr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 04:47:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:32870 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726352AbfEPIrr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 May 2019 04:47:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 05982AEDB;
        Thu, 16 May 2019 08:47:46 +0000 (UTC)
Message-ID: <1557995692.14649.2.camel@suse.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
 AMD boards.
From:   Oliver Neukum <oneukum@suse.com>
To:     "StarostaCZ@gmail.com" <starostacz@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org
Date:   Thu, 16 May 2019 10:34:52 +0200
In-Reply-To: <b4c3eba7-758d-7951-afd0-d90a261346e8@gmail.com>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
         <20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
         <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
         <4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
         <1557911856.2950.10.camel@suse.com>
         <3e7ec2f2-ac47-a031-96ba-fa2b9f21ed2e@gmail.com>
         <1557913582.2950.15.camel@suse.com>
         <c57ccafd-7ad4-63e4-54c1-e1fb136ebeed@gmail.com>
         <1557928483.2950.18.camel@suse.com>
         <4a48a017-fbcb-619f-f2d5-4d627a673021@gmail.com>
         <1557993530.14649.0.camel@suse.com>
         <b4c3eba7-758d-7951-afd0-d90a261346e8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Do, 2019-05-16 at 10:20 +0200,  StarostaCZ@gmail.com  wrote:
> Dne 16.5.2019 v 9:58 Oliver Neukum napsal(a):
> > > > 2.Send a new report to the corresponding mailing list
> > > 
> > > Which mailing list is correct?
> > 
> > In that case linux-usb@vger.kernel.org
> > 
> > 	HTH
> > 		Oliver
> > 
> 
> Is there some rules how to send bug report? Or I can send report with 
> "my amateur description"?

Mention

1. kernel version
2. whether this is known to be a regression
3. include the log with iommu disabled and mention that you disabled
the IOMMU
4. Include the output of lsusb

	HTH
		Oliver

