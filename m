Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845E26BED29
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 16:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbjCQPmL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 11:42:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjCQPmJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 11:42:09 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 319A03CE3B
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:42:07 -0700 (PDT)
Received: (qmail 941820 invoked by uid 1000); 17 Mar 2023 11:42:06 -0400
Date:   Fri, 17 Mar 2023 11:42:06 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     deffo@gmx.de
Cc:     linux-usb@vger.kernel.org
Subject: Re: UDC core dependent of CONFIG_MODULES?
Message-ID: <2ffe4baf-b8b6-4062-bd87-25164c0b407e@rowland.harvard.edu>
References: <trinity-b95eeb12-c36c-47ae-9981-7418e68964a2-1679054923002@3c-app-gmx-bs70>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <trinity-b95eeb12-c36c-47ae-9981-7418e68964a2-1679054923002@3c-app-gmx-bs70>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 17, 2023 at 01:08:43PM +0100, deffo@gmx.de wrote:
> Hi all,
> 
> is the UDC core meant to be used only with CONFIG_MODULES=y? Because I 
> have the problem, that I want to configure g_ether via CONFIGFS, but 
> when I do
> 
> ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/g/UDC
> 
> in order to enable the gadget, I get the error:
> 
> [ 314.569798] udc-core: couldn't find an available UDC or it's busy
> 
> Sure g_ether is already enabled via UDC and as such cannot be 
> configured anymore:
> 
> [ 9.981767] udc 49000000.usb-otg: registering UDC driver [g_ether]
> 
> Trying to disable UDC via:
> 
> echo "" > /sys/kernel/config/usb_gadget/UDC
> 
> won't help either. Am I forced to use modules here? Or am I doing 
> something wrong?

Provided your kernel version is 5.19 or later, you can unbind the UDC 
from the g_ether driver via sysfs:

	echo 49000000.usb-otg >/sys/bus/gadget/drivers/g_ether/unbind

(or something like that).  Once you do that, it should be possible to 
configure your gadget using configfs.

Alan Stern

