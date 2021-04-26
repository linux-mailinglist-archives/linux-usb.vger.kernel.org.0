Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDEF936B53D
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 16:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233501AbhDZOva (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 10:51:30 -0400
Received: from netrider.rowland.org ([192.131.102.5]:48129 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232575AbhDZOv3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Apr 2021 10:51:29 -0400
Received: (qmail 367677 invoked by uid 1000); 26 Apr 2021 10:50:47 -0400
Date:   Mon, 26 Apr 2021 10:50:47 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rahul Kumar <kurahul@cadence.com>,
        "peter.chen@kernel.org" <peter.chen@kernel.org>
Subject: Re: [PATCH v2 1/2] usb: gadget: f_uac2: Stop endpoint before
 enabling it.
Message-ID: <20210426145047.GB365717@rowland.harvard.edu>
References: <20210426044815.5393-1-pawell@gli-login.cadence.com>
 <878s55l50t.fsf@kernel.org>
 <BYAPR07MB53814E672CF41548418248C1DD429@BYAPR07MB5381.namprd07.prod.outlook.com>
 <8735vdky1t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735vdky1t.fsf@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 26, 2021 at 03:52:46PM +0300, Felipe Balbi wrote:
> yeah, this is a requirement by the spec, IIRC. A SetAlt to the same
> interface/altSetting means the host wants to reset that altSetting. From
> the peripheral point of view that means disabling the endpoints and
> reenabling them.
> 
> I'm just not entirely sure if we should do this in u_audio or
> f_uac[12].c. Arguably, composite.c could detect this and disable the
> altSetting, but that would require a huge refactor on the framework.
> 
> My gut feeling is that for the minimal bug fix, we should patch
> f_uac[12].c, but all audio function drivers have the same exact bug, so
> I don't know.
> 
> If we follow the "standard" of patching the relevant set_alt functions
> in the function drivers, the moment we decide to go for a refactoring,
> it'll be easier to see common constructs.

FWIW, f_mass_storage.c handles this in its do_set_interface() routine.  
That routine first deallocates any related request buffers and disables 
any enabled endpoints in the interface.  It then goes on to enable 
endpoints for the new alternate setting and allocate request buffers.

The audio function drivers could follow this approach.

Alan Stern
