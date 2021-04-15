Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8A753607F6
	for <lists+linux-usb@lfdr.de>; Thu, 15 Apr 2021 13:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhDOLGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Apr 2021 07:06:40 -0400
Received: from mga11.intel.com ([192.55.52.93]:14997 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230056AbhDOLGj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Apr 2021 07:06:39 -0400
IronPort-SDR: BD1WS23jNkpyMUxlfebLTkJ+t5DrBrJIc9L6frDRDaNLPaTW8EzZByYFtH9u0Dnd/gtSq+zXfc
 Lo9KlCquuxLg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="191644005"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="191644005"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2021 04:06:16 -0700
IronPort-SDR: /qNbQT5rzaETVSZXAywsYgnNJrZuvQi5/F3R3+eM2gMqiq+wRVWNUKoqt/AZ3gFxhwRoNQfvcO
 Urm4vdN2ErVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; 
   d="scan'208";a="522330732"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 15 Apr 2021 04:06:14 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 15 Apr 2021 14:06:13 +0300
Date:   Thu, 15 Apr 2021 14:06:13 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Cc:     linux-usb@vger.kernel.org, basavaraj.natikar@amd.com
Subject: Re: Question on typec_unregister_altmode
Message-ID: <YHgeJd8mjw87OeBS@kuha.fi.intel.com>
References: <da32299e-e516-d592-29c2-941d0604b40a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da32299e-e516-d592-29c2-941d0604b40a@amd.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Apr 15, 2021 at 04:19:06PM +0530, Shah, Nehal-bakulchandra wrote:
> Hi Heikki,
> 
> While working on one of the project i have observed one potential issue with typec_unregister_altmode.
> 
> If we unregister partners altmode then following code may fail and give the crash.

What crash?

> typec_mux_put(to_altmode(adev)->mux);
> 
> As partner does not get the mux during the register alt mode only port register alt mode has it.
> 
> so i think adev->mux should be checked for NULL/invalida pointer. Please correct my understanding.

If you check the implementation of typec_mux_put(), it already does
that. I don't understand the problem you are seeing?

If you are seeing a crash, then there should be a backtrace. Can you
please share that?

thanks,

-- 
heikki
