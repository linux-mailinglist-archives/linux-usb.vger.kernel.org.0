Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8FB334725
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 19:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhCJSuV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 13:50:21 -0500
Received: from bmailout3.hostsharing.net ([176.9.242.62]:57611 "EHLO
        bmailout3.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233250AbhCJSuE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 13:50:04 -0500
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 79645100D9417;
        Wed, 10 Mar 2021 19:49:56 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id 2BDBB24817C; Wed, 10 Mar 2021 19:49:56 +0100 (CET)
Date:   Wed, 10 Mar 2021 19:49:56 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: Re: [PATCH 3/3] thunderbolt: Expose more details about USB 3.x and
 DisplayPort tunnels
Message-ID: <20210310184956.GA1438@wunner.de>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-4-mika.westerberg@linux.intel.com>
 <YEeBt+fHt1MdyEBz@kroah.com>
 <20210310075444.GB2542@lahna.fi.intel.com>
 <YEiJC/oZ2ZasVtvf@kroah.com>
 <20210310092155.GC2542@lahna.fi.intel.com>
 <YEiSrgziexV4SNdf@kroah.com>
 <20210310093942.GD2542@lahna.fi.intel.com>
 <SA1PR19MB492655CA54780348D70BB863FA919@SA1PR19MB4926.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA1PR19MB492655CA54780348D70BB863FA919@SA1PR19MB4926.namprd19.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 04:24:20PM +0000, Limonciello, Mario wrote:
> In practice software based connection manager isn't in any production
> system in the field today

... except everything Apple.
