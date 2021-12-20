Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5135C47A8B8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 12:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbhLTLam (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 06:30:42 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:49944 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhLTLal (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Dec 2021 06:30:41 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8D924B80E0D
        for <linux-usb@vger.kernel.org>; Mon, 20 Dec 2021 11:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F865C36AE7;
        Mon, 20 Dec 2021 11:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639999839;
        bh=mZmnN313BM3yR1OC4eDy0+j2lR+6sF0yklWcmL1seKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R2bISzS0FQO2od1pUpVj+useXRfFBxUH+3x6Q2qyMbTa62l8oI+StBiQuO8jzrecD
         /BHdJAorcU9dDkxlSdV+uWhTwpRPC2ZovkH2Q91aNYfZReHFKudSjzf4xkbpbSNrRN
         yifBXqK4UXtI6eL1Bt7mg6R1Sfz44oY6j32Q4erfrjvo/N9UbDRNfOTq0Fr1fmbNWf
         3D34QC8W+tWj4pOb6J0fRSVl8dTm6ySTcafIa52+g3usmeHXhDFbJ4OpkcW1K8LV71
         i6fq/KtSxcVAYTUb/sZyWRINReU5EyAL49i5q3Anfgvc+OOxrPwFw3heW2C+YwzC0k
         0db9UKpfOWl1A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mzGsC-00066s-EI; Mon, 20 Dec 2021 12:30:32 +0100
Date:   Mon, 20 Dec 2021 12:30:32 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Ralf Beck <musical_snake@gmx.de>, linux-usb@vger.kernel.org
Subject: Duplicate endpoints (was: Re:)
Message-ID: <YcBpWMtrk2zQx8mw@hovoldconsulting.com>
References: <trinity-09ddec50-a8ca-4663-ba91-4331ab43c9e4-1639982794116@3c-app-gmx-bs07>
 <b1001f8a-df10-a3c7-f715-157f5be16fa4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b1001f8a-df10-a3c7-f715-157f5be16fa4@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 11:01:56AM +0100, Oliver Neukum wrote:
> 
> On 20.12.21 07:46, Ralf Beck wrote
> > One set with audio class specific interfaces for use by an audi
> > class driver.  The other set with vendor specific interfaces for use
> > by the vendor driver.  Obviously the class specific interfaces and
> > vendor specific interfaces are not intended to be use by a driver
> > simultaniously.

> Such devices are buggy. We usually define quirks for such devices.

> > There must be another solution to deal with this. It is unacceptable
> > to request a user of these devices to have to disablethe duplicate
> > endpoint check and recompile the kernel on every update in order to
> > be able to use their devices in vendor mode.

> I suggest you write a patch to introduce a quirk that disables one of the
> interfaces and disregards disabled interfaces for purposes of the check.

We already have USB_QUIRK_ENDPOINT_IGNORE (previously known as
USB_QUIRK_ENDPOINT_BLACKLIST) for this. See, for example:

	184eead057cc ("USB: core: Fix regression in Hercules audio card")

and

	bdd1b147b802 ("USB: quirks: blacklist duplicate ep on Sound Devices USBPre2")

Johan
