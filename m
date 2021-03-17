Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5016233EE34
	for <lists+linux-usb@lfdr.de>; Wed, 17 Mar 2021 11:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhCQKTr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Mar 2021 06:19:47 -0400
Received: from mga06.intel.com ([134.134.136.31]:42837 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229721AbhCQKTd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 17 Mar 2021 06:19:33 -0400
IronPort-SDR: oNlwzgiKKczW6zty5McsyGouTQh4AWHF4t19eI3L3JBHs+nkovvSuJ9MvdBd0ctVRmZCM8QrtJ
 bP8FF2yBYmQw==
X-IronPort-AV: E=McAfee;i="6000,8403,9925"; a="250793760"
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; 
   d="scan'208";a="250793760"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 03:19:33 -0700
IronPort-SDR: K61/+vxFdS5ViagtoFSU6bgQ9CJQ/AjC9w2XDQXqovyLxzdXMqZO9plP4jt7jAKUv24yiTS+H6
 Sjf61/3FxNdQ==
X-IronPort-AV: E=Sophos;i="5.81,255,1610438400"; 
   d="scan'208";a="511677436"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2021 03:19:29 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 17 Mar 2021 12:19:27 +0200
Date:   Wed, 17 Mar 2021 12:19:27 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Message-ID: <20210317101927.GB2542@lahna.fi.intel.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309134818.63118-4-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Benson, Prashant, Diego, Christian and Mario (and others who may be
interested)

On Tue, Mar 09, 2021 at 04:48:18PM +0300, Mika Westerberg wrote:
> +What: /sys/bus/thunderbolt/devices/.../domainX/tunneling_details
> +Date:		July 2021
> +KernelVersion:	5.13
> +Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +Description:	The connection manager implementation may expose
> +		additional details about tunneling. If it supports this
> +		the attribute reads 1.
> +
>
> +What: /sys/bus/thunderbolt/devices/.../dp
> +Date:		Jul 2021
> +KernelVersion:	5.13
> +Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +Description:	Only available if the domain tunneling_details attribute
> +		reads 1. If present means that the device router has
> +		DisplayPort sink. Contents will be number how many
> +		active DisplayPort tunnels end up to this router.
> +
>  
> +What: /sys/bus/thunderbolt/devices/.../usb3
> +Date:		Jul 2021
> +KernelVersion:	5.13
> +Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
> +Description:	Only available if the domain tunneling_details attribute
> +		reads 1. If present means that the device router has
> +		USB 3.x upstream adapter. Reads 1 if there is an active
> +		USB 3.x tunnel to this router.

Do you think these attributes help the userspace at all? I mean if you
think they are not usable as is we can consider some alternatives too. I
was going to drop the KOBJ_CHANGE event (and the unnecessary locking)
from v2 but before sending a new version, I would like to get some
feedback if this is even needed.

Thanks!
