Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1272EEDE9
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 08:34:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbhAHHef (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jan 2021 02:34:35 -0500
Received: from mga18.intel.com ([134.134.136.126]:40883 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbhAHHef (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 02:34:35 -0500
IronPort-SDR: kfJcQdSw/N3HnWs31krzyqxgONJrdTOAmcNmDlnvTmx7+vaMHzasat7MjwX0lPCHhW1NTvRoB4
 AKnnxOSptZag==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="165245406"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="165245406"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 23:32:49 -0800
IronPort-SDR: pwUU7kuPbI+3QpqomRrtEq5fTnmhxAkNI/ekzyvn7AiTK8cg0rd9LAvfc3HOalHG7qNmq/hYRa
 yoyrHR4pRBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="463309786"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 07 Jan 2021 23:32:47 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 08 Jan 2021 09:32:46 +0200
Date:   Fri, 8 Jan 2021 09:32:46 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     harry.wentland@amd.com, linux-usb@vger.kernel.org,
        Sandeep Singh <Sandeep.Singh@amd.com>
Subject: Re: Display Alt mode with TPS6598x driver
Message-ID: <20210108073246.GK940479@kuha.fi.intel.com>
References: <bf85cdbb-23a1-107d-4e7b-679506810248@amd.com>
 <20201126121713.GO1008337@kuha.fi.intel.com>
 <66455900-df95-5cc9-57a1-d601a5fa1cab@amd.com>
 <56bb0475-19a7-f31a-ff2d-23227e0c94ac@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56bb0475-19a7-f31a-ff2d-23227e0c94ac@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Dec 28, 2020 at 07:37:11PM +0530, Shah, Nehal-bakulchandra wrote:
> On 11/26/2020 9:48 PM, Shah, Nehal-bakulchandra wrote:
> > On 11/26/2020 5:47 PM, Heikki Krogerus wrote:
> >> On Wed, Nov 25, 2020 at 08:51:24PM +0530, Shah, Nehal-bakulchandra wrote:
> >>> Hi Heikki,
> >>>
> >>> I am working on the project with PD controller as TPS6598x. The current
> >>> implementation of TPS6598x does not invoke display alt mode driver .
> >>>
> >>> Can you help me to understand how to achieve this?
> >> You should be able to get an idea how to achieve that for example by
> >> checking how we did it for UCSI: drivers/usb/typec/ucsi/displayport.c
> >>
> >> I think you should start by first only registering the alternate mode
> >> without any control. That way you should not need to deal with
> >> anything else except the DP SID Status register.
> >>
> >> After that we can add control as the next step.
> >>
> >> If you need more help, let me know.
> >>
> >> Br,
> > Thanks for the input. I will have a look.
> >
> > regards
> >
> > Nehal
> 
> I am not able to understand who will trigger ucsi_displayport_exit ? for enter
> mode , i understood it goes through vdm statemachine. But how exit is getting
> triggered?.

ucsi_displayport_exit() ends up being called when the displayport
altmode driver (drivers/usb/typec/altmodes/displayport.c) executes
typec_altmode_exit().

Br,

-- 
heikki
