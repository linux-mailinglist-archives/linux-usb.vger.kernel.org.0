Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5787818439F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 10:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCMJ2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 05:28:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:53186 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726055AbgCMJ2D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Mar 2020 05:28:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 220BFB1A0;
        Fri, 13 Mar 2020 09:28:02 +0000 (UTC)
Message-ID: <1584091676.3357.4.camel@suse.com>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonas Karlsson <jonas.karlsson@actia.se>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Fri, 13 Mar 2020 10:27:56 +0100
In-Reply-To: <e350119c78284ab28775d2dd5b85c17e@actia.se>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
         <20200303163945.GB652754@kroah.com>
         <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
         <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
         <1583331173.12738.26.camel@suse.com>
         <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
         <VI1PR04MB532785057FD52DFE3A21ACA88BE30@VI1PR04MB5327.eurprd04.prod.outlook.com>
         <699a49f2f69e494ea6558b99fad23cc4@actia.se>
         <20200310081452.GA14625@b29397-desktop>
         <d1f68ef3316e484b9cc1360f71886719@actia.se>
         <1583838270.11582.11.camel@suse.com> <1583839306.11582.12.camel@suse.de>
         <325d5af5d4c44eafac94fc8e0e4d1a7d@actia.se>
         <c671a51d6b5642078367d681643c46af@actia.se>
         <CAOMZO5BURqWDXKXiwLzG=BRC_wJkjZ1d_HaLt_tefjk3GrabDw@mail.gmail.com>
         <fc2d27c17ebc409ea8c318c22ac1f4a7@actia.se>
         <1583922523.20566.4.camel@suse.com>
         <ad6b4f2d72f84726a398b41007839f77@actia.se>
         <1584020739.20566.10.camel@suse.com>
         <e350119c78284ab28775d2dd5b85c17e@actia.se>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 12.03.2020, 15:37 +0000 schrieb Jonas Karlsson:
> > Hi,
> > 
> > thank you. In this case it looks like the wisest course is to wait a few days then.
> > Thank you for thorough testing.
> > 
> > 	Regards
> > 		Oliver
> 
> I will make sure some more testing is done and the get back to you.
> 
> Do you intend to push the " cdc-acm: close race betrween suspend() and acm_softint"
> commit upstream as well? I wonder since you asked me to test without it.

Yes. I will submit the whole set.
And I will talk to Mathias, as the need for this patch set
means that XHCI does not work as documented.

> I want to make sure I run tests with the intended patch set.

That is optimal. Thank you.

	Regards
		Oliver

