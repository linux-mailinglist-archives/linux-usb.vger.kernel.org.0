Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB6C0FC897
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 15:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbfKNOOb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Nov 2019 09:14:31 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:36228 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfKNOOb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Nov 2019 09:14:31 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEEETNE111248;
        Thu, 14 Nov 2019 08:14:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573740869;
        bh=FfrMIO/6+nKB1SAki+6rB3q2peAlKUicar9ZnEY2xvk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=j6pehdzJgmdogSMbqRRuwfIck1Jts4Rg0bwMRcgmE+uGXcm9XTayI5xKeM01VdOhz
         pLv/M6mxt66ElVQ75MlW2G7powtKOahJVBdPfpuWZWtF1s5J+Jxt2pU6vXtPYBtf8L
         S9Sisac3/F5C8HiKMsqXZvfuW8wjObxgzR5TPV10=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEEET8d080186
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 08:14:29 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 08:14:29 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 08:14:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEEET0n115961;
        Thu, 14 Nov 2019 08:14:29 -0600
Date:   Thu, 14 Nov 2019 08:16:46 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Roger Quadros <rogerq@ti.com>
CC:     <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: dwc3: turn off VBUS when leaving host mode
Message-ID: <20191114141646.GA12511@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>, Roger Quadros <rogerq@ti.com>,
        linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <20191113141521.1696-1-b-liu@ti.com>
 <b354e1bf-6824-ccb1-9b8b-7b54b0e8fc2b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b354e1bf-6824-ccb1-9b8b-7b54b0e8fc2b@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Roger,

On Thu, Nov 14, 2019 at 10:48:36AM +0200, Roger Quadros wrote:
> Bin,
> 
> On 13/11/2019 16:15, Bin Liu wrote:
> > VBUS should be turned off when leaving the host mode.
> > Set GCTL_PRTCAP to device mode in teardown to de-assert DRVVBUS pin to
> > turn off VBUS power.
> 
> Doesn't DRVVBUS pin de-assert when root hub driver turns off port power?
> Which should happen when XHCI host driver is unregistered as part of
> dwc3_host_exit()?

No, DRVVBUS is still 3.3v after 'modprbe -r dwc3-omap' on TI AM57x
platform if this patch is not applied.

-Bin.
