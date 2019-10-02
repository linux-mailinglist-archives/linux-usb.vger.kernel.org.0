Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4ABC922A
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 21:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729287AbfJBTRC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 15:17:02 -0400
Received: from mga01.intel.com ([192.55.52.88]:5798 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729193AbfJBTRC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Oct 2019 15:17:02 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Oct 2019 12:17:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; 
   d="scan'208";a="205409062"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 02 Oct 2019 12:16:59 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 02 Oct 2019 22:16:59 +0300
Date:   Wed, 2 Oct 2019 22:16:59 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191002191659.GA30108@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
 <20191002160652.GB19836@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002160652.GB19836@kuha.fi.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 07:06:55PM +0300, Heikki Krogerus wrote:
> This is a bit off topic, but that attribute file is really horrible.
> Right now there is no way to know the actual capability of the
> port in user space. If something changes a DRP port into sink or
> source, there is no way to know after that that the port is actually
> DRP capable.

That statement is not correct. I'm sorry. I don't know why did I put
it that way.

I wanted to say that now the userpsace is forced to keep track of a
specific sysfs file in order to be sure of the currently supported
role, That alone is wrong, but there is no way to guarantee that
one day we would not need to support another capability in a similar
fashion, and that would mean another sysfs file, and we just forced
the userspace to be modified. The capabilities of the port really need
to be static.

We can handle the capability changes like I propose below without
affecting the userspace.

> So that ABI is "buggy", but even without the problem, I still really
> think that allowing the capabilities to be changed like that in
> general is completely wrong. I don't have a problem with changing the
> capabilities, but IMO it should be handled at one level higher, at the
> controller device level. If the capabilities of a port need to be
> changed, the old port should be removed, and a new with the new
> capabilities registered. That is the only way to handle it without
> making things unnecessarily difficult for the user space.
> 
> I'm pretty sure that that was my counter proposal already at the time
> when the attribute file was introduced, but I don't remember why
> wasn't it accepted at the time? My protest against adding that
> attribute file was in any case ignored :-(. In any case, my plan was
> to later propose a new sysfs group that we offer to the parent
> controller devices instead assigning it to the port devices, and that
> group is meant to allow port capability changes the way I explained
> above. Unless of course you are against it?
> 
> thanks,
> 
> -- 
> heikki

-- 
heikki
