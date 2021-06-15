Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB663A7820
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 09:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhFOHmk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 03:42:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230351AbhFOHmg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 03:42:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66BBA610CD;
        Tue, 15 Jun 2021 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623742832;
        bh=wn7o8JIjggMn0Rfi5/qQqBJylu3YviZ3WirnVcRCtRA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mDxjRHpKWMCop/mIT5zc2YizTnLWx7rJNQPinh659S6EfAW9CaJvEH3tonE/DMXlP
         /xCEReeji/aU5sr0uFsiqE86GiPUkU2bbFQax5ItP5mTEXMYqT/a1JIW1mSGVubN/4
         l9GjeZRVu7/KxnoZl07rAABnzGMCFd8CFYr5jx7o=
Date:   Tue, 15 Jun 2021 09:40:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 8/8] usb: typec: altmodes/displayport: Notify drm subsys
 of hotplug events
Message-ID: <YMhZbWvI85fk4aUy@kroah.com>
References: <20210604194840.14655-1-hdegoede@redhat.com>
 <20210604194840.14655-9-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210604194840.14655-9-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 04, 2021 at 09:48:40PM +0200, Hans de Goede wrote:
> Use the new drm_connector_oob_hotplug_event() functions to let drm/kms
> drivers know about DisplayPort over Type-C hotplug events.
> 
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Tested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
