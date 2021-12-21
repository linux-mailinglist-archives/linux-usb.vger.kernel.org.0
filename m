Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00ED247BB64
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 08:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235389AbhLUH7L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 02:59:11 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:58042 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235383AbhLUH7L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 02:59:11 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D45761050
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 07:59:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1855CC36AE2;
        Tue, 21 Dec 2021 07:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640073550;
        bh=zZYLOB9RD0K6JNSzxpYK+P/GCDi7KtFWcBzZJSWVHYQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ncG7/gj2fd/bswzI50Wm1cudJubgXFBaaoAeoik+CI+98aXe9w6k1rexHjSEx13Ok
         bsfTMXEzMmSkeSn0liU9npDXgA+lTmHXGB3nSxfuNqpDHlA5Qn5qGe/CJ9v2pomGP8
         7gR5yiA5Dj7HKb5gDFyFehv0mKDahEe5mL7ByTDg=
Date:   Tue, 21 Dec 2021 08:59:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>
Subject: Re: [PATCH v2 00/11] usb: gadget: audio: Multiple rates, dyn.
 bInterval
Message-ID: <YcGJTHA+1zBMvACy@kroah.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 20, 2021 at 10:11:19PM +0100, Pavel Hofman wrote:
> Hi all,
> 
> This series implements:
> * Support for multiple rates in the audio gadget
> * Notification of gadget-side alsa processes about playback/capture
> start/stop on the host side via Playback/Capture Rate controls.
> * Detection of the USB cable disconnection by handling SUSPEND call
> in f_uac1/2. The disconnection generates a stop notification.
> * Dynamic bInterval calculation for HS and SS
> 
> Patches for the multirate support, originally authored by Julian Scheel,
> were rebased and modified for the current code base. Julian has
> acknowledged the presented patches.
> 
> The detection of cable disconnection was discussed with dwc2 maintainer
> Minas Harutyunyan who confirmed that the suspend event can be used
> (https://lore.kernel.org/all/5aada8e3-f385-0589-8d58-187abd1a924d@synopsys.com/T/).
> Tests on dwc2 have confirmed reliable detection, the gadget correctly
> reports playback/capture stop at cable disconnection.
> 
> The start/stop/current rate notification feature is accompanied by
> example implementation of audio gadget controller
> https://github.com/pavhofman/gaudio_ctl. The controller also handles
> debouncing fast start/stop events when USB host audio driver is loaded
> and/or audio daemon re/started.
> 
> Changes:
> --------
> 
> v2: Fixed compilation of "usb: gadget: f_uac1: Support multiple sampling
> rates" - added changes for CONFIG_GADGET_UAC1

I get the following build warning and error with this series applied to
my tree:

drivers/usb/gadget/legacy/audio.c: In function ‘audio_bind’:
drivers/usb/gadget/legacy/audio.c:251:21: error: unused variable ‘i’ [-Werror=unused-variable]
  251 |         int status, i;
      |                     ^
cc1: all warnings being treated as errors

Please fix up.

thanks,

greg k-h
