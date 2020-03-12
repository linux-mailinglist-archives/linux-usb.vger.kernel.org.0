Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6221C1831E5
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 14:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgCLNpo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 09:45:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:35660 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgCLNpo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Mar 2020 09:45:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 24B83AD1E;
        Thu, 12 Mar 2020 13:45:42 +0000 (UTC)
Message-ID: <1584020739.20566.10.camel@suse.com>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonas Karlsson <jonas.karlsson@actia.se>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Peter Chen <peter.chen@nxp.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Date:   Thu, 12 Mar 2020 14:45:39 +0100
In-Reply-To: <ad6b4f2d72f84726a398b41007839f77@actia.se>
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
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 11.03.2020, 14:59 +0000 schrieb Jonas Karlsson:
> Hi Oliver,
> 
> > Hi,
> > 
> > it is good that we have something that works.
> > It would be even better if we understood exactly how it works. In fact that
> > these patches work and are needed may very well indicate that error
> > handling on at least some XHCs does not work as expected.
> > 
> > So a question and a request, if I may.
> > Did you run the test with autosuspend disabled? If so could you retest with it
> > enabled?
> 
> I have only tested with autosuspend enabled.
> 
> > Secondly could you run tests with
> > 
> > commit 7c8f7af078a4eda73f347667d12584736e613062
> > Author: Oliver Neukum <oneukum@suse.com>
> > Date:   Thu Mar 5 11:16:02 2020 +0100
> > 
> >     cdc-acm: close race betrween suspend() and acm_softint
> > 
> > not applied (respectively reverted) with and without autosuspend?
> 
> I ran a test with this commit reverted and saw no difference in behavior.
> i.e we do not get event spam with this commit reverted.
> I tested with enabled and disabled autosuspend.
> 
> > 
> > 	Regards
> > 		Oliver
> > 
> > PS: When I submit upstream, may I add your 'Tested-by'?
> 
> Sure, you can add me, but I have only tested that this specific problem
> seems to be solved. The normal functionality has not been tested  properly yet
> on our side. 

Hi,

thank you. In this case it looks like the wisest course is to wait
a few days then. Thank you for thorough testing.

	Regards
		Oliver

