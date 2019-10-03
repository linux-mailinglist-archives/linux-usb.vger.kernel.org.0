Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305CCC9F67
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 15:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbfJCN3F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Oct 2019 09:29:05 -0400
Received: from mga12.intel.com ([192.55.52.136]:52176 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729440AbfJCN3F (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Oct 2019 09:29:05 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 06:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; 
   d="scan'208";a="205621561"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 06:29:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 03 Oct 2019 16:29:01 +0300
Date:   Thu, 3 Oct 2019 16:29:01 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/7] usb: typec: Copy everything from struct
 typec_capability during registration
Message-ID: <20191003132901.GB1048@kuha.fi.intel.com>
References: <20191001094858.68643-1-heikki.krogerus@linux.intel.com>
 <20191001094858.68643-2-heikki.krogerus@linux.intel.com>
 <9173aabc-3e61-fc9b-e01e-0f1ce78429a2@roeck-us.net>
 <20191002160652.GB19836@kuha.fi.intel.com>
 <20191002191659.GA30108@kuha.fi.intel.com>
 <58ec0c7e-10b5-2a73-0629-abb2bddba469@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58ec0c7e-10b5-2a73-0629-abb2bddba469@roeck-us.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 02, 2019 at 08:51:32PM -0700, Guenter Roeck wrote:
> On 10/2/19 12:16 PM, Heikki Krogerus wrote:
> > On Wed, Oct 02, 2019 at 07:06:55PM +0300, Heikki Krogerus wrote:
> > > This is a bit off topic, but that attribute file is really horrible.
> > > Right now there is no way to know the actual capability of the
> > > port in user space. If something changes a DRP port into sink or
> > > source, there is no way to know after that that the port is actually
> > > DRP capable.
> > 
> > That statement is not correct. I'm sorry. I don't know why did I put
> > it that way.
> > 
> > I wanted to say that now the userpsace is forced to keep track of a
> > specific sysfs file in order to be sure of the currently supported
> > role, That alone is wrong, but there is no way to guarantee that
> > one day we would not need to support another capability in a similar
> > fashion, and that would mean another sysfs file, and we just forced
> > the userspace to be modified. The capabilities of the port really need
> > to be static.
> > 
> 
> I assume you refer to port_type. If I remember correctly, this is actually
> used by Android userspace code to specifically select if a port can be
> source, sink, or drp. I am not sure if it is a good idea to enforce
> port removal and re-registration in conjunction with this - the port
> can, after all, be connected to some storage device or to a monitor.
> I am not sure how we could "sell" to users the idea that if they change
> the port type, their screen will go dark for a few seconds.
> 
> Am I missing something ?

I'm not sure how can you avoid flickering screen even with the current
port_type sysfs flag? If you change the port type, you will reset the
port, which means you have to also re-enter the altmode again, no? If
so, then does unregistering and registering the ports actually make
that much difference from the users perspective?

But why do you need the supported roles to be changed when there is
already a partner device plugged to the connector? What is the
use-case/requirement here?

One note about my proposal: With my proposal the userspace can be
given the possibility to influence the port capabilities even before
the ports have been registered. I would imagine that should cover at
least some of the requirements.

The major problem here is that we can not guarantee how the ports
behave if the supported roles are changed when a device is already
plugged to the connector (don't forget, we are not always using
tcpm.c). With UCSI at least it really depends on the underlying
firmware implementation. It also creates risks for the user, like
writing "sink" to that port_type and ending up with a black screen,
and I mean permanently black screen. Un-plugging and re-plugging the
monitor back will not help. Only changing the port_type again, or
reboot work.

Ideally we should not allow the capabilities to be changed after the
partner device is already registered at all, but if we really have to
allow it, then I still think we should do it the way I proposed.

thanks,

> Thanks,
> Guenter
> 
> > We can handle the capability changes like I propose below without
> > affecting the userspace.
> > 
> > > So that ABI is "buggy", but even without the problem, I still really
> > > think that allowing the capabilities to be changed like that in
> > > general is completely wrong. I don't have a problem with changing the
> > > capabilities, but IMO it should be handled at one level higher, at the
> > > controller device level. If the capabilities of a port need to be
> > > changed, the old port should be removed, and a new with the new
> > > capabilities registered. That is the only way to handle it without
> > > making things unnecessarily difficult for the user space.
> > > 
> > > I'm pretty sure that that was my counter proposal already at the time
> > > when the attribute file was introduced, but I don't remember why
> > > wasn't it accepted at the time? My protest against adding that
> > > attribute file was in any case ignored :-(. In any case, my plan was
> > > to later propose a new sysfs group that we offer to the parent
> > > controller devices instead assigning it to the port devices, and that
> > > group is meant to allow port capability changes the way I explained
> > > above. Unless of course you are against it?
> > > 
> > > thanks,
> > > 
> > > -- 
> > > heikki
> > 

-- 
heikki
