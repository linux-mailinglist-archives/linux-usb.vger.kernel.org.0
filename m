Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B927B66AF1C
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jan 2023 03:44:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjAOCoc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Jan 2023 21:44:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjAOCob (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Jan 2023 21:44:31 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C31C759D2
        for <linux-usb@vger.kernel.org>; Sat, 14 Jan 2023 18:44:30 -0800 (PST)
Received: (qmail 81718 invoked by uid 1000); 14 Jan 2023 21:44:29 -0500
Date:   Sat, 14 Jan 2023 21:44:29 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: XHCI port shutting down on new laptop while on battery power
Message-ID: <Y8NojZ2KiW24+qGZ@rowland.harvard.edu>
References: <8276aace-c02e-ec19-aa64-d3bccb3a4966@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8276aace-c02e-ec19-aa64-d3bccb3a4966@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 12, 2023 at 05:18:29PM +0100, Oliver Neukum wrote:
> Hi,
> 
> this is my new laptop and I am fishing for ideas.

> [  417.961840] xhci_hcd 0000:06:00.3: PME# enabled
> [  417.961853] xhci_hcd 0000:06:00.3: Requested to go to 0
> 
> _That_ I do not understand
> 
> I can trigger the same effect by putting a connected mouse (usbhid) into
> autosuspend while and only while the laptop is on battery.
> The port works if I prevent a suspend.
> This looked like an ACPI issue to me, but I do not understand
> why there is a request to put the HC into D0.
> 
> Any ideas?

Have you tried asking on the linux-pci and linux-acpi mailing lists?

Alan Stern
