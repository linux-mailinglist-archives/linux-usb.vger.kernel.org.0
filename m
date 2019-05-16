Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A805220803
	for <lists+linux-usb@lfdr.de>; Thu, 16 May 2019 15:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbfEPNYt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 May 2019 09:24:49 -0400
Received: from mx2.suse.de ([195.135.220.15]:58054 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726742AbfEPNYt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 May 2019 09:24:49 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 77D8DAD72;
        Thu, 16 May 2019 13:24:48 +0000 (UTC)
Message-ID: <1558012314.3309.2.camel@suse.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
 AMD boards.
From:   Oliver Neukum <oneukum@suse.com>
To:     "StarostaCZ@gmail.com" <starostacz@gmail.com>,
        Joerg Roedel <joro@8bytes.org>, Johan Hovold <johan@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org
Date:   Thu, 16 May 2019 15:11:54 +0200
In-Reply-To: <e1f84b32-fb1f-8a47-612b-aa556981959f@gmail.com>
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
         <1557995692.14649.2.camel@suse.com>
         <e1f84b32-fb1f-8a47-612b-aa556981959f@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Do, 2019-05-16 at 14:29 +0200,  StarostaCZ@gmail.com  wrote:
> Dne 16.5.2019 v 10:34 Oliver Neukum napsal(a):
> > Mention
> > 
> > 1. kernel version
> > 2. whether this is known to be a regression
> 
> Sorry for question, can you more specify what you mean?

You will be asked whether this worked in earlier version of the
kernel. The answer would be: yes, no, unknown (why)

	HTH
		Oliver

