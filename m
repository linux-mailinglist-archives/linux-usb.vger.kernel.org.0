Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B770D35D1B2
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 22:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237646AbhDLUE4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 16:04:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57993 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S237103AbhDLUE4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Apr 2021 16:04:56 -0400
Received: (qmail 1432058 invoked by uid 1000); 12 Apr 2021 16:04:37 -0400
Date:   Mon, 12 Apr 2021 16:04:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pratham Pratap <prathampratap@codeaurora.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB port resume can take 60 seconds in worst case scenario
Message-ID: <20210412200437.GA1428564@rowland.harvard.edu>
References: <075be7a2-eb78-f6b0-6051-a83bc70955db@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <075be7a2-eb78-f6b0-6051-a83bc70955db@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 13, 2021 at 12:29:35AM +0530, Pratham Pratap wrote:
> Hi,
> 
> The current implementation of usb_port_resume
> (usb_reset_and_verify_device()) can take up-to 60 secs in worst-case
> scenario if the device (let's say the device went bad and is unresponsive to
> any setup packets) connected went into runtime suspend and resumed back. Is
> it fine to have a configurable upper bound? Since it can induce delay in the
> overall system resume if the host is waking up from PM suspend.
> 
> [USB port resume in worst case ]
> 
> usb_port_resume()
> finish_port_resume()
> usb_get_std_status()
> usb_get_status()
> USB_CTRL_GET_TIMEOUT : 5 sec
> 
> 
> usb_reset_and_verify_device()
> SET_CONFIG_TRIES 3 (use_new_scheme: 2 /old scheme: 1)
> hub_port_init()
> GET_DESCRIPTOR_TRIES 2
> operations < 3
> 
>     2*2*3 (12) * 5(USB_CTRL_GET_TIMEOUT) = 60 sec

I'm not sure where you got that 2*2*3 from.

Is this a real problem?  How often have you observed this to happen?

If you know any particular devices that die like this when they are 
suspended, have you tried adding them to the USB quirks list with the 
USB_QUIRK_RESET_RESUME flag?

There is the usb "persist" parameter.  If you set it to false, what 
happens to this delay?

Alan Stern
