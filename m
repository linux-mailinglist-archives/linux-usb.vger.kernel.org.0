Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66D6B1D9D9C
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 19:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgESRM5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 13:12:57 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:33832 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729001AbgESRM5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 13:12:57 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04JHCtjb046522;
        Tue, 19 May 2020 12:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589908375;
        bh=KMAbIYvMyQmaEGU7emJfKnr+OEPZ54ytAw8zdAt34oE=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Lc/O6OTT6OiQhhXczZY9PhFo+i/8hFkPP+ebN6q2CXHIdli/2aucUPnZjEpImCvoj
         l1BTSXvXyd1562fscfvTcnjHKO6hbJnBJBKtsrSQkRMLMJ1OaTlBExEhf9wTB+SGsI
         htvJk/gNxym5w82534Bq5BImgpX/Em3WqpmSh3iE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04JHCt5o043539
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 May 2020 12:12:55 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 12:12:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 12:12:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JHCt4l052467;
        Tue, 19 May 2020 12:12:55 -0500
Date:   Tue, 19 May 2020 12:12:55 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200519171255.GE11463@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <20200513213620.21541-1-b-liu@ti.com>
 <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
 <20200514170023.GD11463@iaqt7>
 <20200514185549.GA22428@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200514185549.GA22428@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 02:55:49PM -0400, Alan Stern wrote:
> On Thu, May 14, 2020 at 12:00:23PM -0500, Bin Liu wrote:
> 
> > > Still, it's worth pointing out that this change abuses the API (perhaps 
> > > mentioning it in a comment).  And it still would be preferable to fix 
> > 
> > Okay, I will add those notes in comment in v2.
> > 
> > > the drivers in question, impractical though that may be.  (I have a hard 
> > > time believing there are really 500 of them getting this wrong...)
> > 
> > I am not sure about it either, but yeah it is not practical to fix the
> > issue in device drivers. So far I have seen 3 reports of this issue:
> > 
> > 1. with FTDI usb-serial adapter, the issue is in the usb serial generic
> > driver;
> 
> It shouldn't be hard to fix this.  We don't even need a delayed retry; 
> the driver can simply treat -EPROTO as an unrecoverable error, just like 
> -ESHUTDOWN.

This is just an example showing that it is not practical to fix the
problem in device drivers.

BTY, I just briefly searched the drivers/ folder, there are only three
drivers handle -EPROTO specifically in rx callback and bail out. So
seems most drivers do not care about -EPROTO.

-Bin.
